Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2059CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 13:04:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.281083.1697634255132380146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 06:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IN+zNIlJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9c603e235d1so291534566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697634253; x=1698239053; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4i7ORz/z6d1RQxg+INh7fk+iyQ4vqrwj1ez3u227p90=;
        b=IN+zNIlJsG9PtXbVTydkvOCr9iBwvPZt/0mzOBLl89UVu2Eq0V2PVVn/Yzx4pxG/FB
         CLHFuHOPADgaIEksyoDpq9vCYuRTg5k9FLOx6yYVQ3zSp9SqRdJ7P3PayX50p9jjivEK
         Lrz/dHCXvcK8vgVj+EYfFI9gUlzoAEoDACg9ce/seDuymMpSW8TPt5UbvZY83Nt75R8z
         sp/NuQSfFxmdp6URH4n9inSsa4FVRBKyHFUKMhHkfZUa+RejCzw9YV0Q2/3HtfgDn9j3
         ncPeBtvCla4Y+WkjwF0arkJIC4rndqePC6rn9LIBLq3n8LNhzp1TxkY8kScIheSh3Eqo
         OMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634253; x=1698239053;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4i7ORz/z6d1RQxg+INh7fk+iyQ4vqrwj1ez3u227p90=;
        b=XSfSrkvhz3XOAHbOHvnkUHAR+j+eXDflM/CKHHwlt9+zpku87q29+vJU501ugF4XVn
         yb9XeHOo/+hDYs0SVGzf/ZrRvuLG58qVlJEVfF6eKpIgRhqzIb9NmQ2rm4mF2F5GQcz/
         VojG613GhMcPDjFw2uenC2wAIZU3a1CRt8q8WeVDiJJhWEwjVoCs+wW8dLEs8wgj9HwU
         Sia4TyMFcnEODTjyUrkCCOmvfdTNP4QVlV3a4fVxj38IBMpJJTjTbPsT5XVtdwfzB3xq
         krl5gHGDQyQl/sca3q5cA2uxdgYUq8P1Hi32b2a+lBu/U/UcN9Y+aPeKJpLt3uHe3AtK
         iOsQ==
X-Gm-Message-State: AOJu0YzClKsMHGzwNLaeNqtse0XWobyEjYcO9iq1IJLnkqlMIl6r9PPH
	nT+sRzaNmUSYwg/awwVtNvyZkcEWIfc=
X-Google-Smtp-Source: AGHT+IH2bwrG2X8Y+VDTp0sATeVaPsiZtjruDNREPMkzQi7In+YDVqUKTNj3MzBzQ0OuK9U7VHL8oQ==
X-Received: by 2002:a17:907:7291:b0:9c4:54c6:8030 with SMTP id dt17-20020a170907729100b009c454c68030mr3776934ejc.6.1697634252969;
        Wed, 18 Oct 2023 06:04:12 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id u7-20020a1709060b0700b009b64987e1absm1634555ejg.139.2023.10.18.06.04.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 06:04:12 -0700 (PDT)
Message-ID: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
Date: Wed, 18 Oct 2023 15:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: gitsm:// question
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 13:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189388

Hi,

I have a working python3-pytorch recipe which originally used this:

=======================================================
addtask do_git_submodules after do_unpack before do_patch

do_git_submodules[network] = "1"

do_git_submodules () {
         cd ${S}
         git submodule update --init --recursive
}
=======================================================

I would like to replace the above with a series of gitsm:// SRC_URI lines.
Here's a subset of submodules that shows the problem I am seeing:

SRC_URI = " \
git://github.com/pytorch/pytorch.git;protocol=https;branch=release/2.1 \
...
gitsm://github.com/pytorch/FBGEMM.git;protocol=https;name=fbgemm;nobranch=1;destsuffix=third_party/fbgemm 
\
gitsm://github.com/asmjit/asmjit.git;protocol=https;name=fbgemmasmjit;destsuffix=third_party/fbgemm/third_party/asmjit 
\
gitsm://github.com/pytorch/cpuinfo.git;protocol=https;name=fbgemmcpuinfo;destsuffix=third_party/fbgemm/third_party/cpuinfo 
\
gitsm://github.com/NVIDIA/cutlass.git;protocol=https;name=fbgemmcutlass;destsuffix=third_party/fbgemm/third_party/cutlass 
\
gitsm://github.com/google/googletest.git;protocol=https;name=fbgemmgtest;destsuffix=third_party/fbgemm/third_party/googletest 
\
gitsm://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=https;name=fbgemmhiptorch;destsuffix=third_party/fbgemm/third_party/hipify_torch 
\
...
"

As you can see, there are recursively placed git submodules
and do_fetch fails with an error message about SRCREV_FORMAT
having to be set.

The above is a limited subset of the complete list and
some of the repositories (like googletest, gloo, glog and pybind11)
occurs multiple times as child submodules of upper ones,
with different SRCREV values in different leaf submodules.

I have not found a conclusive example to use SRCREV_FORMAT
with git:// + gitsm://

Can someone enlighten me how to use SRCREV_FORMAT properly
for this case? Should I stick to the proven working nonstandard way
and just run git submodule update --init --recursive?

As an easy way out, is there a flag to git:// to process its
submodules automatically?

Thanks in advance,
Zoltán Böszörményi


