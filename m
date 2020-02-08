Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id C93FA6073C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 07:09:39 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id x7so1686038ljc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 23:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=v0hlb7zN+WqadCwUUcXwR3c/lPSvio/ALcj7bPKElaQ=;
	b=I+umsDOIKF5Xi9xBGXD/7f/3Hf12gNQlwJG3+3jlQEobZprHsnCc6lyoyIpjLyy8jq
	ehtC70icFWaSpPbTHh0Fgo5RXqq7M/6Zhob1kcNwmi/kOytRqSWZVf1DbKGIWJ+nUsrj
	YpyQKgKH9bSNMG9SludItEPgJwDCcwo3oCQoFfocmyiu8flSC3bjOK5AclRPR6YdqEkh
	FgZhsSdcl+MQDt4lAaLNm8IfZ5Ts+5R/gj0tPO2BkFufs8Yzja5v20dk8EIqcKxJ7swe
	5wc/cRn7F11syKM9llijwofEJfZ8awkE36TJDct9lOyr2v/EmI0ESf1r1wG43m5DOS/u
	eFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=v0hlb7zN+WqadCwUUcXwR3c/lPSvio/ALcj7bPKElaQ=;
	b=kTAqZg3W11tRc01ug8aT1e6tx+Gj9Bw2drdKCQAxKVd7kVCPrvkEu/cMrU/YjQp/QQ
	CTa0YN213itERDhkBlQ09aFBZFMoUtHzHXCD1VdyxGADEToW5d01Ae9e/nwAn6mq6RXo
	h4Cv9vypVjS4+SJ2oWXmnIp9f9WkQ59Odx+X/qqFZvEdb6rWxXl1E5/3cIx/qPvsWuSo
	P8OvbwBGSWsz0XlFWOP3ggkAZGrHTrfUueB6ginMQLy2ZAol1GbwEFSNa8tSbQxkIo3N
	iUTejd3Yq3P0LL15YhKovQBxNzx/AbkNDyOpSPRYBJiCQwd7z049fBAh78qWBlFJIe9I
	TKFQ==
X-Gm-Message-State: APjAAAX1asLkmRa07KWJAdA0XItnxqPoUIg8hJCPTsy8gtVoDyoP84va
	almhERqRSHguoiJQL8juFNnqiV0J
X-Google-Smtp-Source: APXvYqwmhT5MpHjDvITtoWec79RN+qaWAu1Wmh1i5AknKMd980RuoKrTHjn8xlkVGHVHQHmgZo71Qw==
X-Received: by 2002:a2e:85ce:: with SMTP id h14mr1865056ljj.41.1581145779845; 
	Fri, 07 Feb 2020 23:09:39 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	u16sm2498409lfi.36.2020.02.07.23.09.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 07 Feb 2020 23:09:39 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200208021236.1857972-1-raj.khem@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <6d159cf3-9b32-7ed8-bdce-15cfee22314a@gmail.com>
Date: Sat, 8 Feb 2020 08:09:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200208021236.1857972-1-raj.khem@gmail.com>
Subject: Re: [PATCH v3] oeqa: Use --disable-maintainer-mode configure option
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
X-List-Received-Date: Sat, 08 Feb 2020 07:09:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/8/20 3:12 AM, Khem Raj wrote:
> since the versions of autotools might differ, and difference in
> timestamps for configure and system can result in reconfigure lets avoid
> that by touching the configure script to match system time
>

Maybe align commit message with patch, and mention 
--disable-maintainer-mode ?

Jacob

> Avoids
> error: newly created file is older than distributed files!
> 
> [YOCTO #13779]
> 
> Suggested-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Touch configure to match timestamps with system
>      Move the touch cmd to configure step itself
> v3: Use --disable-maintainer-mode
> 
>   meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
>   meta/lib/oeqa/sdk/cases/buildcpio.py     | 2 +-
>   meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
> index 4bd72dd37e..d0f91668b2 100644
> --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> @@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
>       @OEHasPackage(['autoconf'])
>       def test_cpio(self):
>           self.project.download_archive()
> -        self.project.run_configure()
> +        self.project.run_configure('--disable-maintainer-mode','')
>           self.project.run_make()
>           self.project.run_install()
> diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
> index b0beafb38f..902e93f623 100644
> --- a/meta/lib/oeqa/sdk/cases/buildcpio.py
> +++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
> @@ -28,7 +28,7 @@ class BuildCpioTest(OESDKTestCase):
>               self.assertTrue(os.path.isdir(dirs["source"]))
>               os.makedirs(dirs["build"])
>   
> -            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
> +            self._run("cd {build} && {source}/configure --disable-maintainer-mode $CONFIGURE_FLAGS".format(**dirs))
>               self._run("cd {build} && make -j".format(**dirs))
>               self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
>   
> diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
> index 809142559a..87cc2844a8 100644
> --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> @@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
>                           "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
>                           self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
>           self.project.download_archive()
> -        self.assertEqual(self.project.run_configure(), 0,
> +        self.assertEqual(self.project.run_configure('--disable-maintainer-mode',''), 0,
>                           msg="Running configure failed")
>           self.assertEqual(self.project.run_make(), 0,
>                           msg="Running make failed")
> 

