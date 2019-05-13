Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 08AF8607E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:16:47 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 145so7328231pgg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=vftAf44dYIMTR6aeDhzDGi2WHM3PiSedDoPnCECsDt0=;
	b=NVD7EYI8oMgcJwRtqazH6SXO8CBHETwqnDsBpd9aVD0WLlgE1af9OhkncIYBjduW35
	Q2EGwT2Q5rtWWZ9OkMjU54QP7UrrpzVgDzyi50YktIq5eo9FAd1w6Id6JAqmM/TwlhlN
	/Mdk3bhu1vcpKJKViRqiyW/JNRas8208Jwvdg8wowHAlAnu36j6UVa6u0/eZX8ePjlIV
	23QOXtQEUZa3eV7I8UacwxF7TaTWe6zq6fmaw2o8kFN1u/GE/c3L0mX09RDy6iyP87Lw
	ljkaxVvxtMsLr8RhE2MjeFR5IyRRixFstOqN6zl3vK32FRHGk6OnrNxI9OH/TCfdFOpS
	mM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=vftAf44dYIMTR6aeDhzDGi2WHM3PiSedDoPnCECsDt0=;
	b=ucUJW19xNOfm+kMRP9OR+l+fRqV2RLqdmN+Ib5vav6zOJF0ZLBMRb8UucrwYOqOR6Z
	iyW1MtPCxwGYypgmDasBq+tipes0q8S2O+Jf93W/TBkcAxlYEqc9mhqOly9pqXkQG495
	VOJ0k6zgdvcjGi1mhdJ1DBpo5Y30IPgdWnarNSi3Vr3zn7LRFCus2/1AOzWhFRalmVHx
	rlVgHP2Jl2cZIUh+adGMaNcluc+Zs3Po+MJpG6TjQQWDNgN98842qd/pxPJ09yt2MmOF
	xDz8T3Vp/vzN+ZX+pDz6S4G/25zvioa3vDxpdrGMDP6W54cLNt+oFd3QHUz4ytEDPYR5
	sMEg==
X-Gm-Message-State: APjAAAWOSoLQVCMHrYY3gd7zMtt6ODe3/bv1DiQamAfJuwZyRSvbrHqD
	70j6803oI36amJEU1tZ7qee5C01G
X-Google-Smtp-Source: APXvYqxqfvgnDQB/MQL+9G+rrT1zYFslPC/BrLDogt9LHmsQGdOOEdWgrqghiT+m+Ol7yBM93pYUNQ==
X-Received: by 2002:a62:e201:: with SMTP id a1mr36114673pfi.67.1557778608336; 
	Mon, 13 May 2019 13:16:48 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8cb1:b0d9:9f31:ba50?
	([2601:202:4180:c33:8cb1:b0d9:9f31:ba50])
	by smtp.gmail.com with ESMTPSA id
	37sm14635597pgn.21.2019.05.13.13.16.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 13:16:47 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190513112942.14103-1-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d53f683f-84c5-e6a5-3030-09762663b785@gmail.com>
Date: Mon, 13 May 2019 13:16:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513112942.14103-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] oeqa/target/ssh: Replace suggogatepass with latin-1 codec
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
X-List-Received-Date: Mon, 13 May 2019 20:16:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/13/19 4:29 AM, Richard Purdie wrote:
> We continued to see encoding problems with ssh commands run in oeqa. After much
> research the conclusion was we should use the latin-1 coding which would avoid
> the problems.
There are hard coded encodings in may places. Would a variable be
applicable in this case?

- armin

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/core/target/ssh.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> index cf3d44d12d5..3dee03385d2 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -210,7 +210,7 @@ def SSHCall(command, logger, timeout=None, **opts):
>                  logger.debug('time: %s, endtime: %s' % (time.time(), endtime))
>                  try:
>                      if select.select([process.stdout], [], [], 5)[0] != []:
> -                        reader = codecs.getreader('utf-8')(process.stdout, 'surrogatepass')
> +                        reader = codecs.getreader('latin-1')(process.stdout)
>                          data = reader.read(1024, 4096)
>                          if not data:
>                              process.stdout.close()
> @@ -237,7 +237,7 @@ def SSHCall(command, logger, timeout=None, **opts):
>                  output += lastline
>  
>          else:
> -            output = process.communicate()[0].decode("utf-8", errors='surrogatepass')
> +            output = process.communicate()[0].decode('latin-1')
>              logger.debug('Data from SSH call: %s' % output.rstrip())
>  
>      options = {


