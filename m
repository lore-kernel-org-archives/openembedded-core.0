Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0703AC10F16
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 13:51:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.20900.1715003469034362791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 06:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G9vGcH29;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 324BB1BF210;
	Mon,  6 May 2024 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715003467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=xCN1oCKBvhOWpez6ic0oLXrJMe46BivzE7krEv7+o48=;
	b=G9vGcH29PK8nD2uVP+y0m+NdQh8PAB1qAy3/dir5u/RHq4APqcp5oDA2cWmhaO2TCG9RzS
	ypl/3ym1J1j0W6+nQ9HxvkFKBcr2ciWgeZPURZuWBz4OgHyRMRebAdSRhBTqA+HbIXlTAz
	G58Nqc+ZWFUdv67LiI5jw9Qh6Hw/1phEgUX+v8JcS2SkboudM/HkXt09LXPGWZY8xUuDAw
	lnLuRXwF6/tY6iV5MXwTC3x1RQBsvvnZVLJ3k1dQOtzaso1RDAKHDD39vQgSeQIy59BTxq
	Yj4gKYgBfTCPFy85dxjAn+Jbf0NG14+nIfD+FZMdC19oqiBbtInkkleS8pbH8w==
Content-Type: multipart/alternative;
 boundary="------------ejuHvq0E20f0TKsuvYLHc5vv"
Message-ID: <58234ff1-421e-4907-b303-5f733397a363@bootlin.com>
Date: Mon, 6 May 2024 15:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [OE-core] python3: ptest failure
Organization: Bootlin
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 richard.purdie@linuxfoundation.org
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 13:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199043

This is a multi-part message in MIME format.
--------------ejuHvq0E20f0TKsuvYLHc5vv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I noticed the ptest failure below, in a recent build: 
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6570/steps/12/logs/stdio

WARNING: core-image-ptest-python3-1.0-r0 do_testimage: There were 
failing ptests.
Traceback (most recent call last):
   File 
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py", 
line 35, in wrapped_f
     return func(*args, **kwargs)
   File 
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py", 
line 35, in wrapped_f
     return func(*args, **kwargs)
   File 
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py", 
line 35, in wrapped_f
     return func(*args, **kwargs)
   File 
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtime/cases/ptest.py", 
line 27, in test_ptestrunner_expectfail
     self.do_ptestrunner()
   File 
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtime/cases/ptest.py", 
line 120, in do_ptestrunner
     self.fail(failmsg)
AssertionError:
Failed ptests:
{'python3': ['python3']}

As for the builder/worker: qemux86-64-ptest debian11-ty-3


-- 
Best regards,
João Marcos Costa

--------------ejuHvq0E20f0TKsuvYLHc5vv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hello,</font></p>
    <p><font face="monospace">I noticed the ptest failure below, in a
        recent build:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6570/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6570/steps/12/logs/stdio</a></font></p>
    <p><font face="monospace">WARNING: core-image-ptest-python3-1.0-r0
        do_testimage: There were failing ptests.<br>
        Traceback (most recent call last):<br>
          File
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py",
        line 35, in wrapped_f<br>
            return func(*args, **kwargs)<br>
          File
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py",
        line 35, in wrapped_f<br>
            return func(*args, **kwargs)<br>
          File
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py",
        line 35, in wrapped_f<br>
            return func(*args, **kwargs)<br>
          File
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtime/cases/ptest.py",
        line 27, in test_ptestrunner_expectfail<br>
            self.do_ptestrunner()<br>
          File
"/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtime/cases/ptest.py",
        line 120, in do_ptestrunner<br>
            self.fail(failmsg)<br>
        AssertionError: <br>
        Failed ptests:<br>
        {'python3': ['python3']}</font></p>
    <p><font face="monospace">As for the builder/worker:
        qemux86-64-ptest debian11-ty-3<br>
      </font></p>
    <p><font face="monospace"><br>
      </font></p>
    <pre class="moz-signature" cols="72">-- 
Best regards,
João Marcos Costa</pre>
  </body>
</html>

--------------ejuHvq0E20f0TKsuvYLHc5vv--

