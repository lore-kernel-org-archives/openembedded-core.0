Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7BF36E7E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:07:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0NC7mrB005372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jan 2014 04:07:49 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 04:07:48 -0800
Message-ID: <52E10612.4010607@windriver.com>
Date: Thu, 23 Jan 2014 20:07:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	<openembedded-core@lists.openembedded.org>
References: <52E10247.8050700@pseudoterminal.org>
In-Reply-To: <52E10247.8050700@pseudoterminal.org>
Subject: Re: Berkeley DB fails to build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2014 12:07:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Carlos,

Would you please check the log.do_compile ? The CFLAGS or -I
may contain /usr/include, or LDFLAGS contain -L/usr/lib.

// Robert

On 01/23/2014 07:51 PM, Carlos Rafael Giani wrote:
> Hello,
>
> I noticed that since the C++ bindings for the berkeley DB were included in
> commit 23f29027db73d5759889b48fabdea7f6173217a7 , I cannot build db anymore.
> The error is:
>
>      /usr/lib/libstdc++.so: file not recognized: File format not recognized
>
> this is the offending part in the log.do_compile file:
>
> | libtool: link: arm-poky-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork
> -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9
> --sysroot=/home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd
> -fPIC -DPIC -shared -nostdlib
> /home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd/usr/lib/crti.o
> /home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd/usr/lib/arm-poky-linux-gnueabi/4.8.2/crtbeginS.o
> .libs/cxx_channel.o .libs/cxx_db.o .libs/cxx_dbc.o .libs/cxx_dbt.o
> .libs/cxx_env.o .libs/cxx_except.o .libs/cxx_lock.o .libs/cxx_logc.o
> .libs/cxx_mpool.o .libs/cxx_multi.o .libs/cxx_rid.o .libs/cxx_seq.o
> .libs/cxx_site.o .libs/cxx_txn.o .libs/mut_tas.o .libs/bt_compare.o
> .libs/bt_compress.o .libs/bt_conv.o .libs/bt_curadj.o .libs/bt_cursor.o
> .libs/bt_delete.o .libs/bt_method.o .libs/bt_open.o .libs/bt_put.o
> .libs/bt_rec.o .libs/bt_reclaim.o .libs/bt_recno.o .libs/bt_rsearch.o
> .libs/bt_search.o .libs/bt_split.o .libs/bt_stat.o .libs/bt_compact.o
> .libs/bt_upgrade.o .libs/btree_auto.o .libs/hash.o .libs/hash_auto.o
> .libs/hash_compact.o .libs/hash_conv.o .libs/hash_dup.o .libs/hash_meta.o
> .libs/hash_method.o .libs/hash_open.o .libs/hash_page.o .libs/hash_rec.o
> .libs/hash_reclaim.o .libs/hash_stat.o .libs/hash_upgrade.o .libs/heap.o
> .libs/heap_auto.o .libs/heap_backup.o .libs/heap_conv.o .libs/heap_method.o
> .libs/heap_open.o .libs/heap_rec.o .libs/heap_reclaim.o .libs/heap_stat.o
> .libs/qam_stub.o .libs/rep_stub.o .libs/repmgr_stub.o .libs/db_vrfy_stub.o
> .libs/log_verify_stub.o .libs/lock.o .libs/lock_deadlock.o .libs/lock_failchk.o
> .libs/lock_id.o .libs/lock_list.o .libs/lock_method.o .libs/lock_region.o
> .libs/lock_stat.o .libs/lock_timer.o .libs/lock_util.o .libs/mut_alloc.o
> .libs/mut_failchk.o .libs/mut_method.o .libs/mut_region.o .libs/mut_stat.o
> .libs/crypto_stub.o .libs/clock.o .libs/crdel_auto.o .libs/crdel_rec.o
> .libs/db.o .libs/db_am.o .libs/db_auto.o .libs/db_backup.o .libs/db_byteorder.o
> .libs/db_cam.o .libs/db_cds.o .libs/db_compact.o .libs/db_compint.o
> .libs/db_conv.o .libs/db_copy.o .libs/db_dispatch.o .libs/db_dup.o
> .libs/db_err.o .libs/db_getlong.o .libs/db_idspace.o .libs/db_iface.o
> .libs/db_join.o .libs/db_log2.o .libs/db_meta.o .libs/db_method.o
> .libs/db_open.o .libs/db_overflow.o .libs/db_pr.o .libs/db_rec.o
> .libs/db_reclaim.o .libs/db_remove.o .libs/db_rename.o .libs/db_ret.o
> .libs/db_setid.o .libs/db_setlsn.o .libs/db_shash.o .libs/db_sort_multiple.o
> .libs/db_stati.o .libs/db_truncate.o .libs/db_upg.o .libs/db_upg_opd.o
> .libs/dbreg.o .libs/dbreg_stat.o .libs/dbreg_auto.o .libs/dbreg_rec.o
> .libs/dbreg_util.o .libs/dbt.o .libs/env_alloc.o .libs/env_config.o
> .libs/env_backup.o .libs/env_failchk.o .libs/env_file.o .libs/env_globals.o
> .libs/env_open.o .libs/env_method.o .libs/env_name.o .libs/env_recover.o
> .libs/env_region.o .libs/env_register.o .libs/env_sig.o .libs/env_stat.o
> .libs/fileops_auto.o .libs/fop_basic.o .libs/fop_rec.o .libs/fop_util.o
> .libs/hash_func.o .libs/hmac.o .libs/log.o .libs/log_archive.o
> .libs/log_compare.o .libs/log_debug.o .libs/log_get.o .libs/log_method.o
> .libs/log_print.o .libs/log_put.o .libs/log_stat.o .libs/mkpath.o
> .libs/mp_alloc.o .libs/mp_backup.o .libs/mp_bh.o .libs/mp_fget.o
> .libs/mp_fmethod.o .libs/mp_fopen.o .libs/mp_fput.o .libs/mp_fset.o
> .libs/mp_method.o .libs/mp_mvcc.o .libs/mp_region.o .libs/mp_register.o
> .libs/mp_resize.o .libs/mp_stat.o .libs/mp_sync.o .libs/mp_trickle.o
> .libs/openflags.o .libs/os_abort.o .libs/os_abs.o .libs/os_alloc.o
> .libs/os_clock.o .libs/os_cpu.o .libs/os_ctime.o .libs/os_config.o
> .libs/os_dir.o .libs/os_errno.o .libs/os_fid.o .libs/os_flock.o .libs/os_fsync.o
> .libs/os_getenv.o .libs/os_handle.o .libs/os_map.o .libs/os_method.o
> .libs/os_mkdir.o .libs/os_open.o .libs/os_path.o .libs/os_pid.o
> .libs/os_rename.o .libs/os_root.o .libs/os_rpath.o .libs/os_rw.o .libs/os_seek.o
> .libs/os_stack.o .libs/os_stat.o .libs/os_tmpdir.o .libs/os_truncate.o
> .libs/os_uid.o .libs/os_unlink.o .libs/os_yield.o .libs/partition.o
> .libs/seq_stat.o .libs/sequence.o .libs/sha1.o .libs/snprintf.o .libs/txn.o
> .libs/txn_auto.o .libs/txn_chkpt.o .libs/txn_failchk.o .libs/txn_method.o
> .libs/txn_rec.o .libs/txn_recover.o .libs/txn_region.o .libs/txn_stat.o
> .libs/txn_util.o .libs/xa.o .libs/xa_map.o .libs/zerofill.o   -lpthread
> -L/home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/x86_64-linux/usr/lib/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2
> -L/home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd/lib
> -L/home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd/usr/lib/arm-poky-linux-gnueabi/4.8.2
> -L/home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd/usr/lib
> /usr/lib/libstdc++.so -lm -lc -lgcc_s
> /home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd/usr/lib/arm-poky-linux-gnueabi/4.8.2/crtendS.o
> /home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd/usr/lib/crtn.o
> -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9
> --sysroot=/home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd
> -O2 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname
> -Wl,libdb_cxx-5.3.so -o .libs/libdb_cxx-5.3.so
>
> Note this part:
> -L/home/dv/misc/yocto-setup-dora-c1/yocto/.build-yocto/tmp/sysroots/imx6dlsabresd/usr/lib
> /usr/lib/libstdc++.so -lm -lc
>
> I do not know where this stray "/usr/lib/libstdc++.so" comes from. Perhaps it is
> caused by the fact that db is already installed on the host.
>
> Reverting the commit fixes the problem for me.
>
> Cheers
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

