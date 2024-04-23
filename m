Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E84AC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 12:31:42 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.17119.1713875497181963969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 05:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e00MJNTy;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: fbberton@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2da08b06e0dso66502751fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713875495; x=1714480295; darn=lists.openembedded.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pLyOTyUFvuCPBC9gpzRKItdTho58IPIuE7+q2o+8YRU=;
        b=e00MJNTyd/8qRV2QEQKY0NqfoYovzqDXCQUsawmVkZdJ521GJekl5cq4ZhpufMIFYU
         0fFWh9Ae5FfFjTeFujXQ/bJayyLDd8rl+2BeXsMdkauKXW4++vUFGmAIuQIR6i5v5BYf
         GyqYjLpz6oxkueDXl7k9wJhexSB9HAEZjBjX2aw26Rn96CsOyYyopGctlbNYtSMSyH3Z
         gLdWXITKpq8FWWTdwZnwqE0z/Os0aa5vjVp5TifoyfmUKGNdv6iZMntSfMMIvWBi0jVN
         cuE5u7saDF4Bb3sNOtE18r4MFOnPgbTrstpYbfif4cetjJ93yq3Bn5KBwt/zxxANGbe4
         NgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713875495; x=1714480295;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLyOTyUFvuCPBC9gpzRKItdTho58IPIuE7+q2o+8YRU=;
        b=mFTEzfnNIKZKQ2F5wDo+p5a0dlarN6V3rcvwE30+l/dut+y+qxlIFd4Ce1mLrax4N/
         ZdMyBk84SMDt6xTlOjyjJR96BaxpRUWfpHJLmm81vDzjJV9QqQtpI+wSKEaXgYSAHVrb
         0L1nhOvEukvOflnMDIauuk0HrLcxcWQkCG0CZKUfcYmcEWyib/7Upy9DsECJsPVXj+eV
         m1nO49tqH+81w368MmVrQ+scLxF+E6IHJxL0VuvYAAuMfAEx5PBPjyiwlpHU/FW3C601
         PZIeqdV4QxZAyEUnHofGNFJEFGCur5/txIIFbforYfYPCuSZIrP8gqO1+kOZSXvqPcsi
         yr2A==
X-Gm-Message-State: AOJu0YxYdtvExApqWdFQ5TwxQlsDgW1vGrzuBOFva7s93FtIcx5QWaP9
	0denVRmFmEh2BSbAeOTsyfdX3fWqo8Uog5Im5MW2eIq3uBl+JsgYkkPu5w==
X-Google-Smtp-Source: AGHT+IGvwLebAlMCG2rc6DT4zflGapClScpRHD3KEFOU0YSK0XBOxkk8rMwV7Ffu+X+QOeReub03ew==
X-Received: by 2002:a2e:8186:0:b0:2de:33cd:b46e with SMTP id e6-20020a2e8186000000b002de33cdb46emr680901ljg.48.1713875494654;
        Tue, 23 Apr 2024 05:31:34 -0700 (PDT)
Received: from [10.190.5.38] ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b0041496734318sm23892330wms.24.2024.04.23.05.31.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:31:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------kjNUAvgCEnwBZ9yP13BPOwAi"
Message-ID: <e574884f-d13f-4e57-b55f-4ffdd9fe3103@gmail.com>
Date: Tue, 23 Apr 2024 13:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Fabio Berton <fbberton@gmail.com>
Subject: Set the CMake BUILD_TESTING option to OFF as the default setting
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 12:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198621

This is a multi-part message in MIME format.
--------------kjNUAvgCEnwBZ9yP13BPOwAi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I've noticed that some recipes, like json-c [1], which use the cmake 
bbclass, are generating files that aren't being used. This is because 
CMake sets the BUILD_TESTING option to ON by default. According to the 
CMake documentation [2], when CTest is included, as json-c does here 
[3], the module automatically creates a |BUILD_TESTING| option. This 
option determines whether to enable testing support, and it is ON by 
default.

In the json-c example, the tests used by the do_install_ptest task are 
always generated. Thus, ${B}/tests/ exists even when ptests are not 
included in DISTRO_FEATURES.

As the behavior of CTest/CMake to build tests by default is rather 
surprising, we are wondering whether disabling this option by default is 
feasible in the OpenEmbedded context. Recipes expecting tests to be 
built (e.g. because of ptest support) would then turn on the flag 
explicitly.

For example, adding this to cmake.bbclass:

|OECMAKE_BUILD_TESTING ??= "false" EXTRA_OECMAKE:append = "\\ 
${@bb.utils.contains('OECMAKE_BUILD_TESTING', 'false', 
'-DBUILD_TESTING=OFF', '', d)} \\ " |

and then set the OECMAKE_BUILD_TESTING in the recipe that requires 
BUILD_TESTING=ON

Do you have any suggestions on which steps we should take to verify that 
this does not introduce any regressions?


1 - 
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/json-c/json-c_0.17.bb?h=master

2 - https://cmake.org/cmake/help/latest/module/CTest.html

3 - https://github.com/json-c/json-c/blob/master/CMakeLists.txt#L19


Regards,

Fabio Berton

--------------kjNUAvgCEnwBZ9yP13BPOwAi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><font face="monospace">I've noticed that some recipes, like
        json-c [1], which use the cmake bbclass, are generating files
        that aren't being used. This is because CMake sets the
        BUILD_TESTING option to ON by default. According to the CMake
        documentation [2], when CTest is included, as json-c does here
        [3], the module automatically creates a <code>BUILD_TESTING</code>
        option. This option determines whether to enable testing
        support, and it is ON by default.</font></p>
    <p><font face="monospace">In the json-c example, the tests used by
        the do_install_ptest task are always generated. Thus,
        ${B}/tests/ exists even when ptests are not included in
        DISTRO_FEATURES.</font></p>
    <p><font face="monospace">As the behavior of CTest/CMake to build
        tests by default is rather surprising, we are wondering whether
        disabling this option by default is feasible in the OpenEmbedded
        context. Recipes expecting tests to be built (e.g. because of
        ptest support) would then turn on the flag explicitly.</font></p>
    <p><font face="monospace">For example, adding this to cmake.bbclass:</font></p>
    <pre><code class="language-bash">OECMAKE_BUILD_TESTING ??= "false"

EXTRA_OECMAKE:append = "\\
    ${@bb.utils.contains('OECMAKE_BUILD_TESTING', 'false', '-DBUILD_TESTING=OFF', '', d)} \\
"
</code></pre>
    <p><font face="monospace">and then set the OECMAKE_BUILD_TESTING in
        the recipe that requires BUILD_TESTING=ON</font></p>
    <p><font face="monospace">Do you have any suggestions on which steps
        we should take to verify that this does not introduce any
        regressions?</font></p>
    <p><font face="monospace"><br>
      </font></p>
    <p><font face="monospace">1 - <a
href="https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/json-c/json-c_0.17.bb?h=master"
          class="moz-txt-link-freetext">https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/json-c/json-c_0.17.bb?h=master</a></font></p>
    <p><font face="monospace">2 - <a
          href="https://cmake.org/cmake/help/latest/module/CTest.html"
          class="moz-txt-link-freetext">https://cmake.org/cmake/help/latest/module/CTest.html</a></font></p>
    <p><font face="monospace">3 - <a
href="https://github.com/json-c/json-c/blob/master/CMakeLists.txt#L19"
          class="moz-txt-link-freetext">https://github.com/json-c/json-c/blob/master/CMakeLists.txt#L19</a><br>
      </font></p>
    <p><font face="monospace"><br>
      </font></p>
    <p><font face="monospace">Regards,</font></p>
    <p><font face="monospace">Fabio Berton<br>
      </font></p>
    <p></p>
    <p></p>
  </body>
  <lt-container></lt-container>
</html>

--------------kjNUAvgCEnwBZ9yP13BPOwAi--

