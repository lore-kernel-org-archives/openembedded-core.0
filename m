Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2467C63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:30 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.145844.1673805745418669851
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ml8Cw/zs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185b698ca5f-eb28c9d2-c44f-4177-b9c9-db7d14518630-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O7Y5DD/YsmBpaSU0mbo/vDoFirMIEz4xob4Zywsxy18=;
	b=ml8Cw/zsSDL95te7wMWF6VVdvOjd0FFmXuKKB5oOgMdZWTJL5FKLSTHjWOkQNNHk
	uNbaopIJP5KmiBUXNltSdp7Br/Wz1fy6pVEb8BwU7QRiRtwfzklmxeZ9XLa5P1fcaX3
	UC2+oTEJCREUmTGttCd+8u0adS0/sTrejgcEkpmA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O7Y5DD/YsmBpaSU0mbo/vDoFirMIEz4xob4Zywsxy18=;
	b=Yx9vt8cRCxQ8WZGi0a+9ke1GBFzQMqG5kpQpKKwL0zTMADPTzgngTsUwiy61F0Np
	v0lzcJ6nZM/D+B7RKGklh9RkP6wa8nujo2bMXyZY+vt/5gvbUlpP0ZHa/nhWSaAVb9c
	N68HTWxni4mLPRHVV+eJLA432wP/+k9MtVVE5RW0=
Content-Type: multipart/mixed; boundary="===============3012584260888600662=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rng-tools: upgrading to 6.16 FAILED
Message-ID: <01010185b698ca5f-eb28c9d2-c44f-4177-b9c9-db7d14518630-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175944

--===============3012584260888600662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rng-tools* to *6.16* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f rng-tools /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/rng-tools
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: ExpansionError during parsing /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rng-tools/rng-tools_6.16.bb
Traceback (most recent call last):
  File "Var <do_compile[file-checksums]>", line 1, in <module>
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/externalsrc.bbclass", line 234, in srctree_hash_files(d=<bb.data_smart.DataSmart object at 0x7fcd36602590>, srcdir=None):
                 if os.path.exists(os.path.join(s_dir, ".gitmodules")):
    >                submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                     for line in submodule_helper.splitlines():
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/subprocess.py", line 420, in check_output(timeout=None, *popenargs=(['git', 'config', '--file', '.gitmodules', '--get-regexp', 'path'],), **kwargs={'cwd': '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rng-tools', 'env': {'LC_ALL': 'en_US.UTF-8', 'BB_ENV_PASSTHROUGH_ADDITIONS': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'USER': 'pokybuild', 'PYTHONNOUSERSITE': '1', 'FTP_PROXY': 'http://proxy.yocto.io:5187/', 'PWD': '/home/pokybuild/yocto-worker/auh/build/build/build', 'HOME': '/home/pokybuild', 'BBPATH': '/home/pokybuild/yocto-worker
 /auh/build/build/build', 'TERMINFO_DIRS': '/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/../../etc/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo', 'SHELL': '/bin/bash', 'SHLVL': '0', 'LOGNAME': 'pokybuild', 'PATH': '/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/sbin:/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/bin:/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/sbin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin', 'ftp_proxy': 'http://proxy.yocto.io:5187/', 'BB_LOGCONFIG': '/home/pokybuild/yocto-worker/auh/build/build/../bitbake/contrib/autobuilderlog.json', 'GIT_INDEX_FILE': '/
 tmp/oe-devtool-indexck4ts5j0'}}):
     
    >    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
                    **kwargs).stdout
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/subprocess.py", line 524, in run(input=None, capture_output=False, timeout=None, check=True, *popenargs=(['git', 'config', '--file', '.gitmodules', '--get-regexp', 'path'],), **kwargs={'stdout': -1, 'cwd': '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rng-tools', 'env': {'LC_ALL': 'en_US.UTF-8', 'BB_ENV_PASSTHROUGH_ADDITIONS': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'USER': 'pokybuild', 'PYTHONNOUSERSITE': '1', 'FTP_PROXY': 'http://proxy.yocto.io:5187/', 'PWD': '/home/pokybuild/yocto-worker/auh/build/build/build', 'HOME': '/home/
 pokybuild', 'BBPATH': '/home/pokybuild/yocto-worker/auh/build/build/build', 'TERMINFO_DIRS': '/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/../../etc/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo', 'SHELL': '/bin/bash', 'SHLVL': '0', 'LOGNAME': 'pokybuild', 'PATH': '/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/sbin:/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/bin:/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/sbin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin', 'ftp_proxy': 'http://proxy.yocto.io:5187/', 'BB_LOGCONFIG': '/home/pokybuild/yocto-worker/auh/build/build/../bitbake
 /contrib/autobuilderlog.json', 'GIT_INDEX_FILE': '/tmp/oe-devtool-indexck4ts5j0'}}):
             if check and retcode:
    >            raise CalledProcessError(retcode, process.args,
                                          output=stdout, stderr=stderr)
bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-checksums], expression was ${@srctree_hash_files(d)} which triggered exception CalledProcessError: Command '['git', 'config', '--file', '.gitmodules', '--get-regexp', 'path']' returned non-zero exit status 1.
The variable dependency chain for the failure is: do_compile[file-checksums]

ERROR: Parsing halted due to errors, see error messages above
ERROR: Failed to start bitbake environment


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3012584260888600662==--

