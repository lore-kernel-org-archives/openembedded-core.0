Return-Path: <dvorkin@tibbo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07854C001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 20:16:05 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.45478.1691439357010418432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 13:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tibbo.com header.s=google header.b=eGe6qTID;
 spf=pass (domain: tibbo.com, ip: 209.85.167.52, mailfrom: dvorkin@tibbo.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe1344b707so7710133e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibbo.com; s=google; t=1691439355; x=1692044155;
        h=organization:subject:from:content-language:to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3ZMuaOtmZTmY2NGc7ycqCykoQcvXlrY0xNSpe28FE8=;
        b=eGe6qTIDYO8anq/WA3NR5UIlS99rIfqLonb6AzL5UcQwRUqX2T5aapl+t0JzGloZel
         OFMSHS53RM+HKBM95QKh1rGQ758VyEea1tpSW6F715CPYpmYtx0+Fexg/zVj2s4nB3rx
         B1A/JYH90THyEsyttoJNM+E2Arj/AqSWwk8e8xKEhaazPgtALSDaFkyvr56QEqXqT+r+
         4OWBo1biYGPDt5c4V7A1PtyXNLbBRjZhC9E6taQHuiOClJb4aYgGNcrV0o54IYbD9G0I
         z2RQUuVp545Z2DsZEWx6Zr5Ep+alzXeW1mVl3yXh7BRzW+Sjbi3VTKG4gPBLRZUtvdJD
         FkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691439355; x=1692044155;
        h=organization:subject:from:content-language:to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c3ZMuaOtmZTmY2NGc7ycqCykoQcvXlrY0xNSpe28FE8=;
        b=H9RzKGxCZzAes7ct8GYNMHGodt6wDsJOlv0jkJcXJJ015wrnLSkV5ccjQ/ZC+ZKURT
         JVqBnLmGtm1geNH1HKpo14mijXyN2V5FuesiCjCXVVJ1VBDt/CP0W8TImxhVWskRzBCM
         E+GaJ776oSLzg8XDML860OIPtX0UWS2s/JKn60yOPmGEQqEwKwDAvezxS0coDTTNMQYa
         7NS2mYNt8r86K/wnnCYYm/6Pdm8pS7o5h3+DFzePplg1eWHBPZFXRTV9Zy1Kh5Aey2HB
         wr/9iZHj0vgdmsL3Fib/2auA0ichin+Nb/pDG79tSsJQCVWw448Mu8QxihCpFqmHoCSY
         fGfQ==
X-Gm-Message-State: AOJu0YxcjYoaAPNXlxGEcerQ26i12jEB6OhxUsM85RILD8BHIjPwwrKH
	yFysl+TmBMIWpi0NlM/D9Y4ZTSzzNAOu/Amod68=
X-Google-Smtp-Source: AGHT+IEa27uKLGT1NCboY4lsMs35P2IQrJv3hcXVOAVjMIag/36FI5PKLNkAKK4440RenD5SUCbRFg==
X-Received: by 2002:ac2:5f03:0:b0:4f8:5cde:a44f with SMTP id 3-20020ac25f03000000b004f85cdea44fmr5990642lfq.10.1691439354279;
        Mon, 07 Aug 2023 13:15:54 -0700 (PDT)
Received: from [10.1.1.10] ([5.167.98.73])
        by smtp.gmail.com with ESMTPSA id q10-20020ac246ea000000b004fbad682ffesm1597920lfo.88.2023.08.07.13.15.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 13:15:53 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------2izVnBBMrbMxxAUUL3Ge264M"
Message-ID: <7bfffd4d-76d8-c409-869a-e4dcd2b821a5@tibbo.com>
Date: Mon, 7 Aug 2023 23:15:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: Dvorkin Dmitry <dvorkin@tibbo.com>
Subject: [OE-core] systemd service with @ postinstall bug
Organization: Tibbo Technology Inc.
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185622

This is a multi-part message in MIME format.
--------------2izVnBBMrbMxxAUUL3Ge264M
Content-Type: multipart/alternative;
 boundary="------------mMn7FN7GK0xc5hDXhYZ1JcUr"

--------------mMn7FN7GK0xc5hDXhYZ1JcUr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Starting from this commit

https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=2751472807edc6d2ccc93b6339e6dc57d4abb2da

I'm not able to install templated service in my recipes, like

SYSTEMD_SERVICE:${PN} = "php-fpm@9000.service"

At the rootfs creation state Yocto/OE says, the postinstall scriptlet 
failed:

post(oac-php-1.0-r0.noarch): execv(/bin/sh) pid 2053364
+ set -e
+ type systemctl
+ OPTS=
+ [ -n 
/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/rootfs 
]
+ 
OPTS=--root=/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/rootfs
+ [ enable = enable ]
+ systemctl 
--root=/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/rootfs 
enable php-fpm@9000.service
Traceback (most recent call last):
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/bin/systemctl", 
line 331, in <module>
     main()
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/bin/systemctl", 
line 319, in main
     SystemdUnit(root, service).enable()
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/bin/systemctl", 
line 232, in enable
     self._process_deps(config, service, path, 'WantedBy', 'wants', 
instance)
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/bin/systemctl", 
line 192, in _process_deps
     dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), 
dependent)
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/re.py", 
line 210, in sub
     return _compile(pattern, flags).sub(repl, string, count)
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/re.py", 
line 327, in _subx
     template = _compile_repl(template, pattern)
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/re.py", 
line 318, in _compile_repl
     return sre_parse.parse_template(repl, pattern)
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py", 
line 1036, in parse_template
     addgroup(int(this[1:]), len(this) - 1)
   File 
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py", 
line 980, in addgroup
     raise s.error("invalid group reference %d" % index, pos)
re.error: invalid group reference 19 at position 1
%post(oac-php-1.0-r0.noarch): waitpid(2053364) rc 2053364 status 100
warning: %post(oac-php-1.0-r0.noarch) scriptlet failed, exit status 1

--------------mMn7FN7GK0xc5hDXhYZ1JcUr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Starting from this commit<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?h=dunfell&amp;id=2751472807edc6d2ccc93b6339e6dc57d4abb2da">https://git.openembedded.org/openembedded-core/commit/?h=dunfell&amp;id=2751472807edc6d2ccc93b6339e6dc57d4abb2da</a></p>
    <p>I'm not able to install templated service in my recipes, like</p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">SYSTEMD_SERVICE:${PN}
          = <a class="moz-txt-link-rfc2396E" href="mailto:php-fpm@9000.service">"php-fpm@9000.service"</a></span></span></p>
    <p><span style="font-family:monospace">At the rootfs creation state
        Yocto/OE says, the postinstall scriptlet failed:<br>
      </span></p>
    <p><span style="font-family:monospace">post(oac-php-1.0-r0.noarch):
        execv(/bin/sh) pid 2053364<br>
        + set -e<br>
        + type systemctl<br>
        + OPTS=<br>
        + [ -n
/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/rootfs
        ]<br>
        +
OPTS=--root=/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/rootfs<br>
        + [ enable = enable ]<br>
        + systemctl
--root=/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/rootfs
        enable <a class="moz-txt-link-abbreviated" href="mailto:php-fpm@9000.service">php-fpm@9000.service</a><br>
        Traceback (most recent call last):<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/bin/systemctl",
        line 331, in &lt;module&gt;<br>
            main()<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/bin/systemctl",
        line 319, in main<br>
            SystemdUnit(root, service).enable()<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/bin/systemctl",
        line 232, in enable<br>
            self._process_deps(config, service, path, 'WantedBy',
        'wants', instance)<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/bin/systemctl",
        line 192, in _process_deps<br>
            dependent = re.sub("([^%](%%)*)%i",
        "\\1{}".format(instance), dependent)<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/re.py",
        line 210, in sub<br>
            return _compile(pattern, flags).sub(repl, string, count)<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/re.py",
        line 327, in _subx<br>
            template = _compile_repl(template, pattern)<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/re.py",
        line 318, in _compile_repl<br>
            return sre_parse.parse_template(repl, pattern)<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py",
        line 1036, in parse_template<br>
            addgroup(int(this[1:]), len(this) - 1)<br>
          File
"/disk2/build.dunfell.0/tmp/work/tppg2-tps-linux-gnueabi/img-anpr/1.0-r0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py",
        line 980, in addgroup<br>
            raise s.error("invalid group reference %d" % index, pos)<br>
        re.error: invalid group reference 19 at position 1<br>
        %post(oac-php-1.0-r0.noarch): waitpid(2053364) rc 2053364 status
        100<br>
        warning: %post(oac-php-1.0-r0.noarch) scriptlet failed, exit
        status 1<br>
      </span></p>
  </body>
</html>

--------------mMn7FN7GK0xc5hDXhYZ1JcUr--

--------------2izVnBBMrbMxxAUUL3Ge264M
Content-Type: text/vcard; charset=UTF-8; name="dvorkin.vcf"
Content-Disposition: attachment; filename="dvorkin.vcf"
Content-Transfer-Encoding: base64

QkVHSU46VkNBUkQNClZFUlNJT046NC4wDQpFTUFJTDtQUkVGPTE6ZHZvcmtpbkB0aWJiby5j
b20NCkVNQUlMOmR2b3JraW5kbWl0cnlAZ21haWwuY29tDQpGTjpEbWl0cnkgRHZvcmtpbg0K
TklDS05BTUU6ZHYNCk9SRzpUaWJibyBUZWNobm9sb2d5IEluYy47DQpUSVRMRTpFbWJlZGRl
ZCBMaW51eCBBcmNoaXRlY3QNCk46RHZvcmtpbjtEbWl0cnk7OzsNCkFEUjo7OzlGLTNcLCBO
by4zMSwgTGFuZSAxNjksIEthbmctTmluZyBTdC4sIEhzaS1DaGloO05ldyBUYWlwZWkgQ2l0
eTs7MjIxOA0KIDA7VGFpd2FuDQpURUw7VkFMVUU9VEVYVDorNzkxOTA1NDYzODgNClVSTDtW
QUxVRT1VUkw6aHR0cHM6Ly90aWJiby5jb20vDQpVSUQ6MWM1ODIxMGYtYWM4Yy00MzM3LWIz
OTEtMGJkZTE0NmQyZDgzDQpFTkQ6VkNBUkQNCg==

--------------2izVnBBMrbMxxAUUL3Ge264M--

