Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id B25CE745A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 14:19:33 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id w19-v6so7292149plq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 07:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=soXQAguVQZvgJuWfqN9DwTv4mJmNipYI3hrYGLzmM/k=;
	b=gpK5PAwsTD0xJrBGyswqTjGUmqAlYycTsKGHdCksupUKodYPlt/SMVUBZBH/Sjf9wq
	TSK1eZLlaSc3QiMpmhwlsg30ZSV9OFinemeGQBcYY2i8zKWsdKe5TXjLqcq8hrVNS/Ks
	DspRVMENBbOYNzMeKcrf7OFrr6t3CiB3XUCLfiNlna9ZEGH+wTdHJh+40dYQ5BivcuUG
	9D0lfXKLDLIpR04WEUi9aYOpUKqW7RExm7BzfNHNLG7pz569a5I6yg0sqOfALF+rn9NI
	LZAtX3zcXk9Wxm3S4NowCEC8kp2cnuqUaBFxQoL1dBJQPhSA/yKJzsHK6UalZ2jOfNpf
	mv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=soXQAguVQZvgJuWfqN9DwTv4mJmNipYI3hrYGLzmM/k=;
	b=TO3r5GbKc8sLSppf/4cWwUrSeUldLEernsQl3k2ybKW2yi+Qgossk2dwPyotVtHGYB
	pR7/h5Jz2VKfQLFmV3p+cnKYlJkVj597Ws8c+THL/PPJYSEA87Jjb5quhdKJMl5VStSb
	Rbq0hkNGldRvODztgZl122sI+lWrwVLC3daheCC/hpsNlfjcJuoE3SFSFSPrUgmtPzRD
	OBabLfbyo0DBZv2ST835CWGeI0OcdyaeBfTIkMODIAOh7sOWGBUHxVlWTwgVDN6O4l3A
	p41ZliMSUAH+lry6lSwy6W0kU9WRyl+CHCQqX6FT/6AdbCTcYmhH837M4oPa1zSZIwfy
	FI1w==
X-Gm-Message-State: ALKqPwf576UTqVjdN+7K1yq7NxkXvvgArmyZDnJN0m6hfLMCwytlHipe
	f/dQsJF4AW8tpvvvNCf+xIvYgQ==
X-Google-Smtp-Source: ADUXVKI8XtG+oensUD8/wMyyLD24OLosgAN+czdOcmTeWA68F+nMP7HqXwAj1mN65tu8yqxokA1WHQ==
X-Received: by 2002:a17:902:bd8f:: with SMTP id
	q15-v6mr4214798pls.161.1527517174258; 
	Mon, 28 May 2018 07:19:34 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184::5a1c? ([2601:202:4000:1184::5a1c])
	by smtp.gmail.com with ESMTPSA id
	i72-v6sm60465686pfe.22.2018.05.28.07.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 07:19:33 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1527275816-6705-1-git-send-email-armccurdy@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e56b6c09-39c5-0e8f-b28b-b5fde79f47d1@gmail.com>
Date: Mon, 28 May 2018 07:19:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527275816-6705-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [morty][PATCH 1/3] package.bbclass: use single quotes for path passed to file in isELF()
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
X-List-Received-Date: Mon, 28 May 2018 14:19:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/25/2018 12:16 PM, Andre McCurdy wrote:
> Apparently there are recipes in the wild which generate files with
> filenames containing '$' characters - which cause errors during
> packaging.
>
> Instead of adding another special case to escape '$' characters when
> constructing the command passed to oe.utils.getstatusoutput(), switch
> to using single quotes to quote the path - and therefore make isELF()
> consistent with the way filenames and paths are quoted by every other
> caller of oe.utils.getstatusoutput() in oe-core.
this series in stable/pyro-mnut

- armin
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry picked from commit 7877761534b0c2492da6289e9f2269d41b6ed464)
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/package.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a6f0a7a..531ca4a 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -892,7 +892,7 @@ python split_and_strip_files () {
>      # 16 - kernel module
>      def isELF(path):
>          type = 0
> -        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
> +        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
>  
>          if ret:
>              msg = "split_and_strip_files: 'file %s' failed" % path


