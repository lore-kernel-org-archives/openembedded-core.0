Return-Path: <dvorkin@tibbo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA90CEB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 13:20:33 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.19065.1689340824708086862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 06:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tibbo.com header.s=google header.b=geeUijCE;
 spf=pass (domain: tibbo.com, ip: 209.85.208.175, mailfrom: dvorkin@tibbo.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b703c900e3so28924491fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 06:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibbo.com; s=google; t=1689340822; x=1691932822;
        h=in-reply-to:organization:from:content-language:references:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2vPGHUyvIP4JPL9xqbdAvQwsEXNqZxNI90kyajJFoPc=;
        b=geeUijCErz2j69YjsHhyM+xB77n94rnReeUHfQ1VZ2Q7G1Ce1yHmiTiNxXmPhd+/sn
         Vjdt6xqzwcx8Sbfp7MZeS+ZMCi1fV/vUDFYwUDBiye/EqDukZQVWsu36u6Qu5DyPCVBm
         1PRoWY7BpRT5udsy7VlRwh2hHqa90FVj3Oz2Sse/vvuOKa0WHDxUCmPfgCZLuwVmMcVU
         CoHMmajEqnWgIyn3ZTUHzjToVK8kZLbviKLwS/dpYMKNsLW4w/hIT67Gf23HjOK1lEc2
         t+lJQpZvZvvcQv+jAyPGVdRZK3rZoNmuSjCaDGWzQgi1qmg3ojRTvZLv4JEKGI8iU/eA
         FzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689340822; x=1691932822;
        h=in-reply-to:organization:from:content-language:references:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vPGHUyvIP4JPL9xqbdAvQwsEXNqZxNI90kyajJFoPc=;
        b=bWAoqyY878WGxwhC92ZDY7ZHAm8+10CnS7qRdYsVsfJooRBYqA5mEhJrzTiOHcndKe
         kGSDTDXnlyMje/4y6DKAnSizgERUZV06z8xU5L3fa+XGK7yWe1wpJNNJllWsXzGqU8ZN
         Y1katUESlhygulX0ZP0gt6ZxhzcNrzH+/3jJ674NIzPk6qdxOs6tRzgguSdYX7wSUqMd
         8cyxg8swSsMt8T2ox/JMvOz3UsTr1ViCN8QP6MVW0obzqJk5EC7473Pu5ip1CUzuzUfw
         Ioovw8xPDh/I/qky6zN5RAL7R2JTO6UhAoOjQWqV9e9mhAEoPckH6sk3QDheb+XI2ZIw
         Bizg==
X-Gm-Message-State: ABy/qLZSB3fPW5d+Tes1HDszEXzhf5NA+a7svPBlcGM9Jf3CxabTmfea
	oojWEGXQ5mxpcDyN+Ym5qUfYlGA8tTFNgEGoQLY=
X-Google-Smtp-Source: APBJJlFZa7AK375q2gvUKG3RFbuqu/6jS/Dc7W1knJAV33fM5HhVXi2KPcDoWbQtcEU6ZD0iLaVXXw==
X-Received: by 2002:a2e:9815:0:b0:2b8:4026:1f54 with SMTP id a21-20020a2e9815000000b002b840261f54mr1095524ljj.49.1689340821882;
        Fri, 14 Jul 2023 06:20:21 -0700 (PDT)
Received: from [10.1.1.10] ([5.167.98.73])
        by smtp.gmail.com with ESMTPSA id w11-20020a2e958b000000b002b69febf515sm1990934ljh.125.2023.07.14.06.20.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:20:21 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------5jmrLk6bZ2CwiUqkWf5KVWwq"
Message-ID: <791e67e7-4b78-6fbc-f063-8009d9f326c2@tibbo.com>
Date: Fri, 14 Jul 2023 16:20:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [OE-core] systemd service@ bug
To: openembedded-core@lists.openembedded.org
References: <20230714104148.3608888-1-enrico.scholz@sigma-chemnitz.de>
Content-Language: en-US
From: Dvorkin Dmitry <dvorkin@tibbo.com>
Organization: Tibbo Technology Inc.
In-Reply-To: <20230714104148.3608888-1-enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184260

This is a multi-part message in MIME format.
--------------5jmrLk6bZ2CwiUqkWf5KVWwq
Content-Type: multipart/alternative;
 boundary="------------A6RsHWThK0u7jj4LtEYO7XdZ"

--------------A6RsHWThK0u7jj4LtEYO7XdZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

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
--------------A6RsHWThK0u7jj4LtEYO7XdZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">Hello!<br>
        </span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">starting from
          2aa82324d43467e7c8bfbbb59570ee3306264b75 commit (dunfell and
          probably other branches)</span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;"><a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?h=dunfell&amp;id=2aa82324d43467e7c8bfbbb59570ee3306264b75">https://git.openembedded.org/openembedded-core/commit/?h=dunfell&amp;id=2aa82324d43467e7c8bfbbb59570ee3306264b75</a><br>
        </span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">the <br>
        </span></span></p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">SYSTEMD_SERVICE:${PN}
          = <a class="moz-txt-link-rfc2396E" href="mailto:php-fpm@9000.service">"php-fpm@9000.service"</a></span></span></p>
    <p><span style="font-family:monospace"></span></p>
    <p><span style="font-family:monospace">
        syntax in the recipe brings OE to error at do_rootfs step:</span></p>
    <p><span style="font-family:monospace"><a class="moz-txt-link-freetext" href="https://pastebin.com/WbDCPy4V">https://pastebin.com/WbDCPy4V</a></span></p>
    <br>
    <div class="de1">+ for service in <a class="moz-txt-link-abbreviated" href="mailto:php-fpm@9000.service">php-fpm@9000.service</a>
    </div>
    <div class="de1">+ systemctl
      --root=/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac
    </div>
    <div class="de1">-anpr/1.0-r0/rootfs enable <a class="moz-txt-link-abbreviated" href="mailto:php-fpm@9000.service">php-fpm@9000.service</a>
    </div>
    <div class="de1">Traceback (most recent call last):
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/bin/systemctl", line
      331, in &lt;module&gt;
    </div>
    <div class="de1"> main()
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/bin/systemctl", line
      319, in main
    </div>
    <div class="de1"> SystemdUnit(root, service).enable()
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/bin/systemctl", line
      232, in enable
    </div>
    <div class="de1"> self._process_deps(config, service, path,
      'WantedBy', 'wants', instance)
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/bin/systemctl", line
      192, in _process_deps
    </div>
    <div class="de1"> dependent = re.sub("([^%](%%)*)%i",
      "\\1{}".format(instance), dependent)
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/re.py",
      line 210, in sub
    </div>
    <div class="de1"> return _compile(pattern, flags).sub(repl, string,
      count)
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/re.py",
      line 327, in _subx
    </div>
    <div class="de1"> template = _compile_repl(template, pattern)
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/re.py",
      line 318, in _compile_repl
    </div>
    <div class="de1"> return sre_parse.parse_template(repl, pattern)
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py",
      line 1036, in parse_tem
    </div>
    <div class="de1">plate
    </div>
    <div class="de1"> addgroup(int(this[1:]), len(this) - 1)
    </div>
    <div class="de1"> File
"/workdir/build.tppg2/tmp/work/tppg2-tps-linux-gnueabi/img-oac-anpr/1.0-r</div>
    <div class="de1">0/recipe-sysroot-native/usr/lib/python3.8/sre_parse.py",
      line 980, in addgroup
    </div>
    <div class="de1"> raise s.error("invalid group reference %d" %
      index, pos)
    </div>
    <div class="de1">re.error: invalid group reference 19 at position 1
    </div>
    <div class="de1">%post(oac-php-1.0-r0.noarch): waitpid(3549888) rc
      3549888 status 100
    </div>
    <div class="de1">warning: %post(oac-php-1.0-r0.noarch) scriptlet
      failed, exit status 1
    </div>
    <div class="de1"> </div>
    <div class="de1">Error in POSTIN scriptlet in rpm package oac-php
    </div>
    Installing : curl-7.69.1-r0.cortexa9hf_neon 849/863<span
      style="font-family:monospace"></span><span
      style="font-family:monospace"></span>
  </body>
</html>

--------------A6RsHWThK0u7jj4LtEYO7XdZ--

--------------5jmrLk6bZ2CwiUqkWf5KVWwq
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

--------------5jmrLk6bZ2CwiUqkWf5KVWwq--

