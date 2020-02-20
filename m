Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56C2E611CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:24:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so1773702wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 04:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9YbBeSg9BnXVmMpX8iavvX9PPzlO4gMoNdEn6Hjcyrc=;
	b=E9eCNjdMArjM33NBgoknwfX7tc4nTKdLy3W2vUm3OHXdQ0sflp5ojk2IQbhTL3N2BZ
	qouNW6JnxhfxQDjCG6EqfYxN2nhfOW6FZ3owDBlTRGBIcS2j4FTvFPJzN+TTzmd08qoR
	VLDpQeEPmfauyBQYlgbtuDwgnMETEgaxEgf00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9YbBeSg9BnXVmMpX8iavvX9PPzlO4gMoNdEn6Hjcyrc=;
	b=ECykzu37d5A7dQK+JuRNkhAXUX8Az9/NDPAzyHTS5IptqG4/glhmUcltCnG2HdaIiA
	ivpx4s3ATXXuJMRqm6P718932rlGTwtin7DhXUwhRJOpZVbLMQMimA0ilvXYaIDCsmvL
	UuQ4d2AeR5GjrIDmB5Npe/cZsMqQYqY3r0lJ9NCsh5tf3aHMH2RhzoTGytr86rJWh5IO
	raUZFFiKL0VfKRJTk740UiF7Z/wmK6WwGtSx6C29lC76T6t0R+uogW6jnT7Zfs3rC7sV
	mtBmWupaQATkBODbVOAjOQlNgi87k3QX+RMiA/j+NpcF3d4I/1A0EUh1jc+Evnbcjm6e
	W+AA==
X-Gm-Message-State: APjAAAVuWrFWD6j5HPDCh3ZnJZeQaZy607Kajq/KQRFU5FWpwzsFHFbv
	EguIK668p+lmuUrGqMhg1h+kvA==
X-Google-Smtp-Source: APXvYqzLp7oN0TsEgCNDoCabl4QAHcZ4sjV07sOHEaBd/kSag13dBdqXdMx7hHyex43gQiovS1lJDA==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr4171278wma.187.1582201451719;
	Thu, 20 Feb 2020 04:24:11 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z6sm4231384wrw.36.2020.02.20.04.24.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 04:24:10 -0800 (PST)
Message-ID: <b16480e4847735d28dcea553d6f8e14d24c0e2d0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 12:24:09 +0000
In-Reply-To: <1582191660-130760-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582191660-130760-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] libsolv: upgrade 0.7.10 -> 0.7.11
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
X-List-Received-Date: Thu, 20 Feb 2020 12:24:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-20 at 01:40 -0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../libsolv/{libsolv_0.7.10.bb => libsolv_0.7.11.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/libsolv/{libsolv_0.7.10.bb => libsolv_0.7.11.bb} (93%)
> 
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.11.bb
> similarity index 93%
> rename from meta/recipes-extended/libsolv/libsolv_0.7.10.bb
> rename to meta/recipes-extended/libsolv/libsolv_0.7.11.bb
> index 502f4e0e85..84349606f1 100644
> --- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
> +++ b/meta/recipes-extended/libsolv/libsolv_0.7.11.bb
> @@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
>  SRC_URI = "git://github.com/openSUSE/libsolv.git \
>  "
>  
> -SRCREV = "605dd2645ef899e2b7c95709476fb51e28d7e378"
> +SRCREV = "102ac552669181d3e43731aa275bdbbc7ddcb94c"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>  
I think this causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/1591

ERROR: core-image-sato-1.0-r0 do_testimage: core-image-sato - FAILED - check the task log and the ssh log
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0-r0/temp/log.do_testimage.5108
NOTE: recipe core-image-sato-1.0-r0: task do_testimage: Failed
ERROR: Task (/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/recipes-sato/images/core-image-sato.bb:do_testimage) failed with exit code '1'
Test requires gtk+3 to be installed
Started HTTPService on 0.0.0.0:35043
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/dnf.py", line 181, in test_dnf_exclude
    self.dnf_with_repo('install -y curl*')
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/dnf.py", line 69, in dnf_with_repo
    output = self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/dnf.py", line 21, in dnf
    self.assertEqual(status, expected, message)
AssertionError: 1 != 0 : dnf --repofrompath=oe-testimage-repo-qemux86,http://192.168.7.3:35043/qemux86 --repofrompath=oe-testimage-repo-noarch,http://192.168.7.3:35043/noarch --repofrompath=oe-testimage-repo-core2_32,http://192.168.7.3:35043/core2_32 --nogpgcheck install -y curl*
Added oe-testimage-repo-qemux86 repo from http://192.168.7.3:35043/qemux86
Added oe-testimage-repo-noarch repo from http://192.168.7.3:35043/noarch
Added oe-testimage-repo-core2_32 repo from http://192.168.7.3:35043/core2_32
Last metadata expiration check: 0:00:01 ago on Thu Feb 20 12:13:09 2020.
Package curl-7.68.0-r0.core2_32 is already installed.
Package curl-dev-7.68.0-r0.core2_32 is already installed.
Dependencies resolved.
================================================================================
 Package      Architecture Version         Repository                      Size
================================================================================
Installing:
 curl-dbg     core2_32     7.68.0-r0       oe-testimage-repo-core2_32      36 k
 curl-doc     core2_32     7.68.0-r0       oe-testimage-repo-core2_32     269 k
Transaction Summary
================================================================================
Install  2 Packages
/usr/lib/python3.8/site-packages/dnf/package.py:57: DeprecationWarning: PY_SSIZE_T_CLEAN will be required for '#' formats
  return super(Package, self).chksum
Total download size: 305 k
Installed size: 1.6 M
Downloading Packages:
(1/2): curl-dbg-7.68.0-r0.core2_32.rpm          2.6 MB/s |  36 kB     00:00    
(2/2): curl-doc-7.68.0-r0.core2_32.rpm           16 MB/s | 269 kB     00:00    
--------------------------------------------------------------------------------
Total                                            14 MB/s | 305 kB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
Failed to obtain the transaction lock (logged in as: root).
The downloaded packages were saved in cache until the next successful transaction.
You can remove cached packages by executing 'dnf clean packages'.
Error: Could not run transaction.
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/dnf.py", line 90, in test_dnf_install
    self.dnf_with_repo('remove -y run-postinsts-dev')
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/dnf.py", line 69, in dnf_with_repo
    output = self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/dnf.py", line 21, in dnf
    self.assertEqual(status, expected, message)
AssertionError: 1 != 0 : dnf --repofrompath=oe-testimage-repo-qemux86,http://192.168.7.3:35043/qemux86 --repofrompath=oe-testimage-repo-noarch,http://192.168.7.3:35043/noarch --repofrompath=oe-testimage-repo-core2_32,http://192.168.7.3:35043/core2_32 --nogpgcheck remove -y run-postinsts-dev
Added oe-testimage-repo-qemux86 repo from http://192.168.7.3:35043/qemux86
Added oe-testimage-repo-noarch repo from http://192.168.7.3:35043/noarch
Added oe-testimage-repo-core2_32 repo from http://192.168.7.3:35043/core2_32
Dependencies resolved.
================================================================================
 Package                  Architecture  Version           Repository       Size
================================================================================
Removing:
 run-postinsts-dev        noarch        1.0-r10           @oe-repo          0  
Transaction Summary
================================================================================
Remove  1 Package
Freed space: 0  
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
Failed to obtain the transaction lock (logged in as: root).
Error: Could not run transaction.
Test case dnf.DnfRepoTest.test_dnf_install_dependency depends on dnf.DnfRepoTest.test_dnf_install but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_install_from_disk depends on dnf.DnfRepoTest.test_dnf_install_dependency but it didn't pass/run.
Test case dnf.DnfRepoTest.test_dnf_install_from_http depends on dnf.DnfRepoTest.test_dnf_install_from_disk but it didn't pass/run.
Test run when enable usrmege
Test case dnf.DnfRepoTest.test_dnf_reinstall depends on dnf.DnfRepoTest.test_dnf_install but it didn't pass/run.
Stopped HTTPService on 0.0.0.0:35043
Test requires opkg to be installed
Test requires pam to be in DISTRO_FEATURES
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 370, in test_parselogs
    self.assertEqual(errcount, 0, msg=self.msg)
AssertionError: 6 != 0 : Log: /home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/build/tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0-r0/target_logs/dnf.log
-----------------------
Central error: 2020-02-20T12:13:10Z CRITICAL Failed to obtain the transaction lock (logged in as: root).
***********************
2020-02-20T12:13:10Z INFO Total                                            14 MB/s | 305 kB     00:00     
2020-02-20T12:13:10Z INFO Running transaction check
2020-02-20T12:13:10Z INFO Transaction check succeeded.
2020-02-20T12:13:10Z INFO Running transaction test
2020-02-20T12:13:10Z INFO Transaction test succeeded.
2020-02-20T12:13:10Z DDEBUG timer: transaction test: 145 ms
2020-02-20T12:13:10Z INFO Running transaction
2020-02-20T12:13:10Z DEBUG RPMDB altered outside of DNF.
2020-02-20T12:13:10Z DDEBUG RPM transaction start.
2020-02-20T12:13:10Z DDEBUG RPM transaction over.
2020-02-20T12:13:10Z CRITICAL Failed to obtain the transaction lock (logged in as: root).
2020-02-20T12:13:10Z DDEBUG Cleaning up.
2020-02-20T12:13:10Z INFO The downloaded packages were saved in cache until the next successful transaction.
2020-02-20T12:13:10Z INFO You can remove cached packages by executing 'dnf clean packages'.
2020-02-20T12:13:10Z SUBDEBUG 
Traceback (most recent call last):
  File "/usr/lib/python3.8/site-packages/dnf/cli/main.py", line 64, in main
    return _main(base, args, cli_class, option_parser_class)
  File "/usr/lib/python3.8/site-packages/dnf/cli/main.py", line 99, in _main
    return cli_run(cli, base)
  File "/usr/lib/python3.8/site-packages/dnf/cli/main.py", line 123, in cli_run
***********************
Central error:     raise dnf.exceptions.Error(msg)
***********************
    return cli_run(cli, base)
  File "/usr/lib/python3.8/site-packages/dnf/cli/main.py", line 123, in cli_run
    ret = resolving(cli, base)
  File "/usr/lib/python3.8/site-packages/dnf/cli/main.py", line 167, in resolving
    base.do_transaction(display=displays)
  File "/usr/lib/python3.8/site-packages/dnf/cli/cli.py", line 225, in do_transaction
    tid = super(BaseCli, self).do_transaction(display)
  File "/usr/lib/python3.8/site-packages/dnf/base.py", line 882, in do_transaction
    tid = self._run_transaction(cb=cb)
  File "/usr/lib/python3.8/site-packages/dnf/base.py", line 1005, in _run_transaction
    raise dnf.exceptions.Error(msg)
dnf.exceptions.Error: Could not run transaction.
2020-02-20T12:13:10Z CRITICAL Error: Could not run transaction.
2020-02-20T12:13:10Z INFO --- logging initialized ---
2020-02-20T12:13:10Z DDEBUG timer: config: 3 msa
2020-02-20T12:13:10Z DEBUG DNF version: 4.2.2
2020-02-20T12:13:10Z DDEBUG Command: dnf --repofrompath=oe-testimage-repo-qemux86,http://192.168.7.3:35043/qemux86 --repofrompath=oe-testimage-repo-noarch,http://192.168.7.3:35043/noarch --repofrompath=oe-testimage-repo-core2_32,http://192.168.7.3:35043/core2_32 --nogpgcheck list run-postinsts-dev 
2020-02-20T12:13:10Z DDEBUG Installroot: /
2020-02-20T12:13:10Z DDEBUG Releasever: master
2020-02-20T12:13:10Z DEBUG cachedir: /var/cache/dnf
2020-02-20T12:13:10Z DDEBUG Base command: list

est requires ptest-runner to be installed
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/rpm.py", line 100, in test_rpm_install
    self.assertEqual(status, 0, msg=msg)
AssertionError: 1 != 0 : Failed to install base-passwd-doc package: error: db5 error(-30969) from dbenv->open: BDB0091 DB_VERSION_MISMATCH: Database environment version mismatch
error: cannot open Packages index using db5 -  (-30969)
error: cannot open Packages database in /var/lib/rpm




