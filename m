Return-Path: <dvorkin@tibbo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1216EB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 13:42:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.19484.1689342147212362549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 06:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tibbo.com header.s=google header.b=K7R/KHPK;
 spf=pass (domain: tibbo.com, ip: 209.85.167.42, mailfrom: dvorkin@tibbo.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fbf09a9139so3193601e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibbo.com; s=google; t=1689342145; x=1691934145;
        h=organization:subject:from:to:content-language:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QC1YUy1YluIJBgvSgzoLb77SYTgLVB/dCr0IRFqNL4=;
        b=K7R/KHPKJ6Il9Fbilt/EYt1elQHy1AJyg7YaghB3b5FI+dn/6zrWWQOuYB92zyVK8i
         1AM2xGvPNK81fsRkVZcurGN/yF2MjhbDqIsaaGGflbMHZLf9kAlS+VXbfR3Dq+JIP8ty
         H6BJbO/VEyXmlZpGvqjmXItcE7vHd3mncABHlPWiDzSgCMWXIDhZ3SmcpxiOnuYtjHiC
         rlJHId7Cx/ropaXjkzqVvYHAQl69D5PZN6oQTzTalp06Wy7MA2zsaNy7NdjbX9ALLuLd
         L3Rfc9gvoJO9LgWx1mWHRTujcm893xKWdq8GFchwmKXVAN5k1pSyr3ZbJ1pwX9C9y9P8
         0kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342145; x=1691934145;
        h=organization:subject:from:to:content-language:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0QC1YUy1YluIJBgvSgzoLb77SYTgLVB/dCr0IRFqNL4=;
        b=fG393EZDXQ6mkdmxDqgjYpuyDxftzD+Oe+tK3Epb2MZQNQzbi9qyYP6gS3P+698Rm5
         RHZxkOjhL2k63DtwhrOSAm0Lo6MNFHGrfKUXqRJ9K8QV0ls3t4GUmIPXEQt5kakEBCxP
         pVcTYL+AgbwsT1MdLB2SFEypPmlbuvJPxg32ePcNFGKgc4i0oB36sM9WQqcR6KJEB17D
         PnUquVQelNR/EBapWd95biTcX0SlRxQfNHB18qUwnc5YNWsVNyQYpFWDdNXtdKVOnndg
         6kmbFB2rekMcDD52s6oNhqfLOdHzn2/KJV6qjgLyiraj7gEfenDa7/R+SCg3uWse8bUD
         UXvw==
X-Gm-Message-State: ABy/qLYLdNabzuJrw7+b/xj9N3spM6ueC0Ub2DG1nrnHnxIo/6F4D1CC
	uk4Phf/ToJPKD2xpkfnVvg5bykxu9wZpFtOQKw8=
X-Google-Smtp-Source: APBJJlHGNJSN2c83Ap3KEjeeyOTVS76dDHbsO0kLFDG1MRhM2ARZ/FZblj3q4KTc5EjUnjcX9cJ4aA==
X-Received: by 2002:a19:8c04:0:b0:4f8:6a29:b59b with SMTP id o4-20020a198c04000000b004f86a29b59bmr3272989lfd.64.1689342144787;
        Fri, 14 Jul 2023 06:42:24 -0700 (PDT)
Received: from [10.1.1.10] ([5.167.98.73])
        by smtp.gmail.com with ESMTPSA id f15-20020ac2532f000000b004fb745fd232sm1493105lfh.30.2023.07.14.06.42.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:42:24 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------VvdoaC1SvE6YwaZhggJDdsfI"
Message-ID: <3d682b83-f0e8-7add-3dcd-3e850e30f7c6@tibbo.com>
Date: Fri, 14 Jul 2023 16:42:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Dvorkin Dmitry <dvorkin@tibbo.com>
Subject: [OE-core] systemd service@ bug
Organization: Tibbo Technology Inc.
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 13:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184264

This is a multi-part message in MIME format.
--------------VvdoaC1SvE6YwaZhggJDdsfI
Content-Type: multipart/alternative;
 boundary="------------bgKGhTdmfGbUtJ0aJaCcVCTc"

--------------bgKGhTdmfGbUtJ0aJaCcVCTc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

(sorry, previously posted as the reply to wrong message)

starting from 2aa82324d43467e7c8bfbbb59570ee3306264b75 commit (dunfell 
and probably other branches)

https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=2aa82324d43467e7c8bfbbb59570ee3306264b75

the

SYSTEMD_SERVICE:${PN} = "php-fpm@9000.service"

syntax in the recipe brings OE to error at do_rootfs step:

https://pastebin.com/WbDCPy4V


+ for service in php-fpm@9000.service
+ systemctl 
--root=/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac
-anpr/1.0-r0/rootfs enable php-fpm@9000.service
Traceback (most recent call last):
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/bin/systemctl", line 331, in <module>
main()
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/bin/systemctl", line 319, in main
SystemdUnit(root, service).enable()
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/bin/systemctl", line 232, in enable
self._process_deps(config, service, path, 'WantedBy', 'wants', instance)
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/bin/systemctl", line 192, in _process_deps
dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/lib/python3.8/re.py", line 210, in sub
return _compile(pattern, flags).sub(repl, string, count)
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/lib/python3.8/re.py", line 327, in _subx
template = _compile_repl(template, pattern)
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/lib/python3.8/re.py", line 318, in 
_compile_repl
return sre_parse.parse_template(repl, pattern)
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py", line 1036, in 
parse_tem
plate
addgroup(int(this[1:]), len(this) - 1)
File 
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r
0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py", line 980, in 
addgroup
raise s.error("invalid group reference %d" % index, pos)
re.error: invalid group reference 19 at position 1
%post(oac-php-1.0-r0.noarch): waitpid(3549888) rc 3549888 status 100
warning: %post(oac-php-1.0-r0.noarch) scriptlet failed, exit status 1
Error in POSTIN scriptlet in rpm package oac-php
Installing : curl-7.69.1-r0.cortexa9hf_neon 849/863

--------------bgKGhTdmfGbUtJ0aJaCcVCTc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">Hello!</span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">(sorry,
          previously posted as the reply to wrong message)<br>
        </span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">starting from
          2aa82324d43467e7c8bfbbb59570ee3306264b75 commit (dunfell and
          probably other branches)</span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;"><a
            class="moz-txt-link-freetext"
href="https://git.openembedded.org/openembedded-core/commit/?h=dunfell&amp;id=2aa82324d43467e7c8bfbbb59570ee3306264b75">https://git.openembedded.org/openembedded-core/commit/?h=dunfell&amp;id=2aa82324d43467e7c8bfbbb59570ee3306264b75</a><br>
        </span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">the <br>
        </span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">SYSTEMD_SERVICE:${PN}
          = <a class="moz-txt-link-rfc2396E"
            href="mailto:php-fpm@9000.service">"php-fpm@9000.service"</a></span></span></p>
    <p><span style="font-family:monospace"></span></p>
    <p><span style="font-family:monospace"> syntax in the recipe brings
        OE to error at do_rootfs step:</span></p>
    <p><span style="font-family:monospace"><a
          class="moz-txt-link-freetext"
          href="https://pastebin.com/WbDCPy4V">https://pastebin.com/WbDCPy4V</a></span></p>
    <br>
    <div class="de1">+ for service in <a
        class="moz-txt-link-abbreviated moz-txt-link-freetext"
        href="mailto:php-fpm@9000.service">php-fpm@9000.service</a> </div>
    <div class="de1">+ systemctl
      --root=/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac
    </div>
    <div class="de1">-anpr/1.0-r0/rootfs enable <a
        class="moz-txt-link-abbreviated moz-txt-link-freetext"
        href="mailto:php-fpm@9000.service">php-fpm@9000.service</a> </div>
    <div class="de1">Traceback (most recent call last): </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/bin/systemctl", line
      331, in &lt;module&gt; </div>
    <div class="de1"> main() </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/bin/systemctl", line
      319, in main </div>
    <div class="de1"> SystemdUnit(root, service).enable() </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/bin/systemctl", line
      232, in enable </div>
    <div class="de1"> self._process_deps(config, service, path,
      'WantedBy', 'wants', instance) </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/bin/systemctl", line
      192, in _process_deps </div>
    <div class="de1"> dependent = re.sub("([^%](%%)*)%i",
      "\\1{}".format(instance), dependent) </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/re.py",
      line 210, in sub </div>
    <div class="de1"> return _compile(pattern, flags).sub(repl, string,
      count) </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/re.py",
      line 327, in _subx </div>
    <div class="de1"> template = _compile_repl(template, pattern) </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/re.py",
      line 318, in _compile_repl </div>
    <div class="de1"> return sre_parse.parse_template(repl, pattern) </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py",
      line 1036, in parse_tem </div>
    <div class="de1">plate </div>
    <div class="de1"> addgroup(int(this[1:]), len(this) - 1) </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py",
      line 980, in addgroup </div>
    <div class="de1"> raise s.error("invalid group reference %d" %
      index, pos) </div>
    <div class="de1">re.error: invalid group reference 19 at position 1
    </div>
    <div class="de1">%post(oac-php-1.0-r0.noarch): waitpid(3549888) rc
      3549888 status 100 </div>
    <div class="de1">warning: %post(oac-php-1.0-r0.noarch) scriptlet
      failed, exit status 1 </div>
    <div class="de1"> </div>
    <div class="de1">Error in POSTIN scriptlet in rpm package oac-php </div>
    Installing : curl-7.69.1-r0.cortexa9hf_neon 849/863
    <p></p>
  </body>
</html>

--------------bgKGhTdmfGbUtJ0aJaCcVCTc--

--------------VvdoaC1SvE6YwaZhggJDdsfI
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

--------------VvdoaC1SvE6YwaZhggJDdsfI--

