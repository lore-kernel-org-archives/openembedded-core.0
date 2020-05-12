Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.7931.1589296577584522637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qNbkiJKF;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id u22so5493625plq.12
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WzvWh2+Xq3DI1wNSEJAYv1+OZKql2Rta/2Sj1u1opR8=;
        b=qNbkiJKFwN6NL/zSRS8gvdI/bDDGyRGygu2yTVELPLAGwu63QI6WxeFwIwdUE+ayBp
         BVWjKv8d8TdKNfr4j07cZpIOwmNoSU6WVEdSBrEMweQwRRYaLIH35CEyN/uHkc2f4XV0
         ozeFNyA2BNTTY2pJRPXwKrYNthmwpYXy5aOLfe3AZenoCKgJfEWXFzV2ZTUHz38aYeF6
         QuRf6e+v774NvMnpkEpv2EgGlZUhbcs910lIwjwpsWkdiebF7209Y/mNrGH3LskK3DmX
         qK2dyeyiUspbtFs5KQrk3dOjZZ1TOBnrLaFozmdCNhwjF+u/JVBFEnVB34aCqLuxJ4+l
         NdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WzvWh2+Xq3DI1wNSEJAYv1+OZKql2Rta/2Sj1u1opR8=;
        b=hVzdKH5cMlIPKhSg0SDLMn+zw8v1Fd/YGcAGJZ3EdpnWFhwFGx0GZ3G2GscsdPfYoa
         ytEK/zjH31sw9BsLPSULygJwyLXwBQrCrRwbRYvJexk3cNsDxUq0xk4agPPQq3HMLFb6
         8E+Jh5WsmmfP/zpQS5Ozot/JvsgcXLgVpWyLzBRRfJVAlf3RLgvahHUvqv+uCfqDoxLQ
         7WjkOaSrvlERvLmpS6ylreXDMd0f0lvkBA/IuaVRnH56Tyo6wya39z5ORNsyYoMYwi+c
         vlfigIU0ABIIECjrIvxRDno3rOnEKLCwgEfJ9tlek/xeSUXITvocSptaMCnXaiz8fUoK
         X+HA==
X-Gm-Message-State: AGi0PuYg6CQl/bYNA0TakLZIINjQGeyUV72rQ5oLv+JOsg6Kvlu2aumQ
	sSVg9MjO5hJpyOrEVlYptfHC6iUZX3A=
X-Google-Smtp-Source: APiQypLezxgCtYph+po/jZBlGqCoOl1ktAAEvS/Yi6DYFIizm51LZD4Yyqkx8W9ldZdQz7hh0Ir8Lw==
X-Received: by 2002:a17:90a:be09:: with SMTP id a9mr24119019pjs.28.1589296575985;
        Tue, 12 May 2020 08:16:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e967:869:15dc:c2fd? ([2601:646:9200:4e0:e967:869:15dc:c2fd])
        by smtp.gmail.com with ESMTPSA id z15sm13132525pjt.20.2020.05.12.08.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2020 08:16:15 -0700 (PDT)
Subject: Re: [OE-core] [PATCH V3 2/3] gcc10: Default back to -fcommon
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-2-raj.khem@gmail.com>
 <20200512134442.GA11943@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <cd4b38c5-391f-5915-1246-4f04897f7341@gmail.com>
Date: Tue, 12 May 2020 08:16:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512134442.GA11943@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/12/20 6:44 AM, Adrian Bunk wrote:
> On Mon, May 11, 2020 at 11:28:11AM -0700, Khem Raj wrote:
>> For time being change back to -fcommon as default, helps us iron
>> out other issues, eventually this should be removed as we fix the
>> packages to work with -fno-common
>> ...
>   
> What packages are still unfixed?
> 

There were ateast 100 failures when meta-openembedded is considered too
errors server has unfortunately dropped the build where it was reported 
but here is list if you are interested

Summary: 125 tasks failed:
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb:do_compile
 
/mnt/b/yoe/sources/meta-atmel/recipes-kernel/dtc/dtc_1.4.6_84e414b0.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-devtools/libcomps/libcomps_git.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-support/libunwind/libunwind_1.3.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-devtools/libubox/libubox_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-core/ndctl/ndctl_v65.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-extended/logrotate/logrotate_3.15.1.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-graphics/waffle/waffle_1.6.0.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.7.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/gpm/gpm_git.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/htop/htop_2.2.0.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-benchmark/fio/fio_3.16.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-core/systemd/systemd-boot_243.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-support/gnupg/gnupg_2.2.17.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-extended/cpio/cpio_2.13.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/libnih/libnih_1.0.3.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-benchmark/memtester/memtester_4.3.0.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-devtools/ltrace/ltrace_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.10.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-benchmark/iozone3/iozone3_487.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-extended/byacc/byacc_20191103.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-extended/minicom/minicom_2.7.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-extended/ltp/ltp_20190517.bb:do_compile
qemux86-64_yoe-glibc-systemd-wayland_world.log

 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-devtools/distcc/distcc_3.3.3.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/mg/mg_20170401.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-extended/mc/mc_4.8.23.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-bsp/grub/grub_2.04.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb:do_install
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/gsoap/gsoap_2.8.95.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile
   /mnt/b/yoe/sources/meta-yoe/recipes-core/canboat/canboat.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb:do_compile
 
/mnt/b/yoe/sources/meta-qt5/recipes-qt/qt5/qtremoteobjects_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb:do_compile
   /mnt/b/yoe/sources/meta-ti/recipes-bsp/rwmem/rwmem_1.2.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-devtools/llvm/llvm_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-support/fping/fping_4.2.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb:do_compile
 
/mnt/b/yoe/sources/meta-freescale/recipes-kernel/dtc/dtc-145_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-atmel/recipes-utils/mxt-app/mxt-app_git.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.2.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.7.bb:do_compile
 
/mnt/b/yoe/sources/meta-freescale/recipes-devtools/cst/cst_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb:do_compile
 
/mnt/b/yoe/sources/meta-ti/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-support/memcached/memcached_1.5.10.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-bsp/libacpi/libacpi_0.2.bb:do_compile
 
/mnt/b/yoe/sources/meta-riscv/recipes-devtools/openocd/openocd_riscv.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-support/netperf/netperf_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-shells/tcsh/tcsh_6.21.00.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-support/uftp/uftp_4.10.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-daemons/vblade/vblade_22.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.878.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-extended/acpica/acpica_20191018.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-webserver/recipes-webadmin/netdata/netdata_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.6.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3.4.7.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft_1.19.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2.9.15.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-connectivity/dibbler/dibbler_git.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.7.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-graphics/spir/spirv-tools_git.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-support/vim/vim-tiny_8.1.1518.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.8.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-support/vim/vim_8.1.1518.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb:do_compile
 
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-kernel/cpupower/cpupower.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-devtools/gcc/gcc_10.0.bb:do_package
   /mnt/b/yoe/sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
 
/mnt/b/yoe/sources/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb:do_compile
   /mnt/b/yoe/sources/meta-qt5/recipes-qt/qt5/qt5-creator_git.bb:do_compile

> AFAIK the only remaining big issue is the host gcc in stable series,
> but that cannot be fixed this way.
> 
> cu
> Adrian
> 
