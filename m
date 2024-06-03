Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344B6C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 15:39:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.86900.1717429156343359407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 08:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wc2NbEHH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4751320008;
	Mon,  3 Jun 2024 15:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717429154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=trOrgNzE/Dpdn95oOL2iU/o15jMlAW66fKEtzuQxsSI=;
	b=Wc2NbEHHVAHl6dALw0uIVbdNxtp6YqJktYQn9WejFhO1OsIM/8R8HO1foAav+OYSymRLv/
	z313CR+eg7M/KTu3Nc2cEQ9E6FJfLChs3wLFv1Y/9sEqItPJ4ycfof/qH1Xm69wc2H//qb
	fzGFFIrO2dba4AphJTMv96Z7ZjLjdRSCCy9Q8P7dnwJEgMjeLYlOICGjE9Ph4ISHz8Ouqb
	Oh8ycAzNEeEVLER4eKnqNFKX1sAxZLYFkl5YFL2TuXZGT2uuFYFsqVNxcH9d7DJEGNa5SD
	kdGPakBZfzEMu1rbnAJhmSwaAT07ch8dCc0UEGm+FN5ZGrs5z4tdGBA17MTliA==
Content-Type: multipart/alternative;
 boundary="------------w6lTJWivXB4Qe62Qlp6vGaZA"
Message-ID: <aa532133-c872-4bde-8479-dba12de225c7@bootlin.com>
Date: Mon, 3 Jun 2024 17:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [OE-core] mesa: build failure in CI, dependency not found
Organization: Bootlin
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 15:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200267

This is a multi-part message in MIME format.
--------------w6lTJWivXB4Qe62Qlp6vGaZA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

The following error was raised in Swat's CI:

| Run-time dependency libclc found: NO (tried pkgconfig)
|
| ../mesa-24.1.0/meson.build:852:12: ERROR: Dependency "libclc" not 
found, tried pkgconfig
|
| A full log can be found at 
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: 
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874:171 
exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
|     #1: bbfatal_log, 
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, 
line 171
|     #2: meson_do_configure, 
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, 
line 160
|     #3: do_configure, 
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, 
line 149
|     #4: main, 
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, 
line 184
NOTE: recipe mesa-2_24.1.0-r0: task do_configure: Failed

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6680/steps/12/logs/stdio

Mesa was upgraded a few days ago. Could it be related to this error?


-- 
Best regards,
João Marcos Costa

--------------w6lTJWivXB4Qe62Qlp6vGaZA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello,</font></p>
    <p><font face="monospace">The following error was raised in Swat's
        CI:</font></p>
    <p><font face="monospace">| Run-time dependency libclc found: NO
        (tried pkgconfig)<br>
        | <br>
        | ../mesa-24.1.0/meson.build:852:12: ERROR: Dependency "libclc"
        not found, tried pkgconfig<br>
        | <br>
        | A full log can be found at
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/build/meson-logs/meson-log.txt<br>
        | ERROR: meson failed<br>
        | WARNING:
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874:171
        exit 1 from 'exit 1'<br>
        | WARNING: Backtrace (BB generated script):<br>
        |     #1: bbfatal_log,
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874,
        line 171<br>
        |     #2: meson_do_configure,
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874,
        line 160<br>
        |     #3: do_configure,
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874,
        line 149<br>
        |     #4: main,
/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874,
        line 184<br>
        NOTE: recipe mesa-2_24.1.0-r0: task do_configure: Failed</font></p>
    <p><font face="monospace"><a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6680/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6680/steps/12/logs/stdio</a></font></p>
    <p><font face="monospace">Mesa was upgraded a few days ago. Could it
        be related to this error?<br>
      </font></p>
    <p><font face="monospace"><br>
      </font></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------w6lTJWivXB4Qe62Qlp6vGaZA--

