Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A49266FFEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 19:41:43 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j16so2984288pga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=MmML9JEGfpmjSLPJCVcuwvn5DOtsRaJGLlnRTwp/HsQ=;
	b=RDb2kJaHx2TA5Vlv4KfsamDia37kuffLR3oLzMO3n/T/nrSccXZbGwkAQS+S/i2d49
	gM50F3AGpHWPcYOZ6fX84dL0Z7vSKu6SBF7h/Y7drErx+d5hyGRNRPXwQ8W2sv1ys50w
	FKCoy16vhqyG4hmqki995pWymFBbDC8eJ78jrnKDgyDGikFv8nB00bwdwRr0Vp6KZNDe
	O7YqzSAF0gd39pl2iMyMTQvjUBhxSr66tTB6497pB9o6fYywyWQRorou/6w4pZyQIPR5
	i+MR2M8ttVu7Uw3JDILLg9bMLR0ag+Zh4vK5i0BYyyDIwFtJuFYKoHk1eaGxMAGmKa9M
	GdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=MmML9JEGfpmjSLPJCVcuwvn5DOtsRaJGLlnRTwp/HsQ=;
	b=HgBIm6O/Tb7VAWRXvlCYK4ZpXsyyPRk/ENl2qwCl/TIfaR8j1RyCV6CHxSS7+IDPfT
	1yxE1xCFIGCJpygHwysmFMdWp5FMGL4y5e9KVROf7/TVsVSb2XAeCFDbkzaqIf6q/aGT
	QSMfZ0YaOkJjOTvLyZyj1mOwoi8Vd+Z0Co7alS+Ihn9z0XlbdZTlXKA6GrejW0wUdY9Z
	ZYdtTtkVcR0RBIdPwsufR4Wb81VtH84LQkLHDieYBV/Dy8vbqbAgsOlm1oNSeaa6sxFq
	BUS3VeFIFj6cY5cgJim2pmBfN7EMO3L7DyDJJnU4+C8T880wVFlGvdn3DwllKlwuGZ9N
	0slQ==
X-Gm-Message-State: AHPjjUhxnePjj1fj9vicxlGAeDNmrakkdpo90NaQvzrxdBXXJ6q18Rop
	sbUDXlGHF3A563eSwCBIjNnVUA==
X-Google-Smtp-Source: AOwi7QAelAQf9IeYbpgETDli0Fj4mDa2UUyKYgspLTerZLcLfl1g8h3rrWRBV4vVL5HNsmuIp0VeUA==
X-Received: by 10.98.65.152 with SMTP id g24mr5174243pfd.1.1506627704073;
	Thu, 28 Sep 2017 12:41:44 -0700 (PDT)
Received: from [10.22.11.244] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	l12sm3878775pgr.10.2017.09.28.12.41.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 12:41:43 -0700 (PDT)
To: leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <20170926193604.194047-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <71179cbd-a232-9bbd-6f4b-5ee7f183f1a0@gmail.com>
Date: Thu, 28 Sep 2017 12:41:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170926193604.194047-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [morty][PATCH 1/2] selftest/cases/signing: ignore removal errors when cleaning temporary gpg directory
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
X-List-Received-Date: Thu, 28 Sep 2017 19:41:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/26/2017 12:36 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> The high-level method tempfile.TemporaryDirectory give us no way to
> ignore erros on removal thus use tempfile.mkdtemp instead. Ignoring possible issues
> on removal is neccesary because it contains gpg sockets that are automatically removed
> by the system once the process terminates, otherwise the following log is observed:
>
>   ..
>   ..
>   File "/usr/lib/python3.5/shutil.py", line 436, in _rmtree_safe_fd
>     os.unlink(name, dir_fd=topfd)
>   FileNotFoundError: [Errno 2] No such file or directory: 'S.gpg-agent.browser'
>
> [YOCTO #11821]
merged into stagging.
Thanks,
Armin
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/signing.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
> index 606bfd3e99..3b5c2da0e0 100644
> --- a/meta/lib/oeqa/selftest/signing.py
> +++ b/meta/lib/oeqa/selftest/signing.py
> @@ -21,14 +21,17 @@ class Signing(oeSelfTest):
>          if not shutil.which("gpg"):
>              raise AssertionError("This test needs GnuPG")
>  
> -        cls.gpg_home_dir = tempfile.TemporaryDirectory(prefix="oeqa-signing-")
> -        cls.gpg_dir = cls.gpg_home_dir.name
> +        cls.gpg_dir = tempfile.mkdtemp(prefix="oeqa-signing-")
>  
>          cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
>          cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
>  
>          runCmd('gpg --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
>  
> +    @classmethod
> +    def tearDownClass(cls):
> +        shutil.rmtree(cls.gpg_dir, ignore_errors=True)
> +
>      @testcase(1362)
>      def test_signing_packages(self):
>          """


