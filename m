Return-Path: <lans.zhang2008@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 199A078208
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 03:23:13 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id j99so730580ioo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 20:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=n4JoNmIQfuM5e8AJAmp3uCaG/GWUBgPGUgBhzpiQEK0=;
	b=vXGgChGiWh1VKttgtCg8pkFidYxdm0Ze1nfL73RS4AJ4r3tH95jaGxsbpi+2hashT6
	cBgEAeGkCwfKcLy/UMQqcYyNRX94B3VXxHRn83fEDLcih7Y/mEQ9pd+F7bO2d5Ax/Xvb
	BGOM4DGUvVlrKSKC/IVtccsQte6QWNTdxshmrn3tIidScebsiOGvcDt3ziieSapO7uYE
	z6TgWxpoQcxs1L2dH5wg9CYQ4WwRW0dbgYvueRtBDCgXshC6H9LubxzzRrNBU+eXSIHg
	bhyoNZkvVskVaVMSnfBYX8GgbsRF9UvnoBt14vAH13Moan+6o0QVqjN7GntzT8aYz5uQ
	kHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=n4JoNmIQfuM5e8AJAmp3uCaG/GWUBgPGUgBhzpiQEK0=;
	b=Ru398Zd/5dv2k+4n0FpWrICaS/8o+k4CdpB5I1P+YOYxg5srfIhUDrPgt6lOVxcSF5
	BUs5YSVSIBM75zPhZwPsy0JUfMazGNhB4Idh+HrJOpIXzpaPv7M6qcwqNlP/fnIoMfuW
	mWJf4hOuAG9r+/qUVO/NritXq9Mb4kXTH9JQ3hC62i67qC6RrkDe7raaPBJnj2aOhARD
	7S+5J4Z9E8UkD2n2TMxtQ1VWFcZH0hBn9b50SAouiXgPRzeq5C0m/BiDHvZLF7+bw+6+
	fLcQ2jzqVf9JHQPDTwNAtBKsXElXD9JvpZuaM/xqJ98xilIZnKDFREybTaaTh3bevAsl
	BVHw==
X-Gm-Message-State: AHYfb5inp37y8r7ExZFJhS62odsIPrNddRmXqy0B4gvLMQg0HkUoicGq
	sf4u0ZLKNfW7Z3dRkq0=
X-Received: by 10.107.55.66 with SMTP id e63mr3788858ioa.118.1503544995060;
	Wed, 23 Aug 2017 20:23:15 -0700 (PDT)
Received: from [0.0.0.0] (unknown-224-169.windriver.com. [147.11.224.169])
	by smtp.gmail.com with ESMTPSA id 3sm1662245itk.13.2017.08.23.20.23.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Aug 2017 20:23:14 -0700 (PDT)
To: liezhi.yang@windriver.com
References: <20170824031937.7874-1-lans.zhang2008@gmail.com>
From: Jia Zhang <lans.zhang2008@gmail.com>
Message-ID: <8ea83e78-a421-49d8-b739-cf3c5feb6499@gmail.com>
Date: Thu, 24 Aug 2017 11:23:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170824031937.7874-1-lans.zhang2008@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gpg_sign: depress the owership warnings on homedir
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
X-List-Received-Date: Thu, 24 Aug 2017 03:23:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sorry plz ignore this patch. I will send a new one.

Jia


On 08/24/2017 11:19 AM, Jia Zhang wrote:
> A gpg command, e.g, called by get_gpg_version(), may trigger such a warning:
> gpg: WARNING: unsafe ownership on homedir '/home/user/.gnupg'
>
> This sort of warning is harmless so it can be depressed through specifying
> --no-permission-warning.
>
> Signed-off-by: Jia Zhang <lans.zhang2008@gmail.com>
> ---
>   meta/lib/oe/gpg_sign.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 008478dfeb..7d58f93888 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -98,7 +98,7 @@ class LocalSigner(object):
>           """Return the gpg version as a tuple of ints"""
>           import subprocess
>           try:
> -            ver_str = subprocess.check_output((self.gpg_bin, "--version")).split()[2].decode("utf-8")
> +            ver_str = subprocess.check_output((self.gpg_bin, "--version", "--homedir", self.gpg_path)).split()[2].decode("utf-8")
>               return tuple([int(i) for i in ver_str.split('.')])
>           except subprocess.CalledProcessError as e:
>               raise bb.build.FuncFailed("Could not get gpg version: %s" % e)


