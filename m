Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDC37F37D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 18:57:30 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so6622794pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=o2SAHCTYFZ9gh7E4HC/92nexrB58WEilfKEWKCPMZ+4=;
	b=LCIGHY+7lDEyR0AFyIqaWs3AkQEDdiPhiCgHTr3O3YvneIiA5RxkbjEqwR+sZzdFui
	38f4czK9fykl05SCSc9iZZuUuVJUqanMakOXMo1CiVukcbGdQi08cObblY+TJIJo8fRK
	2IXmphImiLgnX/xQOKgOlhy0+x+SP00Z0cbYm8vDmjphdDsjEjtEAjnxxzk5tlfM9SbQ
	sI0WR8zyJoOuyjKdfWO1N/vq2HvIkXQaIwRSSafeNbxnh0gsMg5LxGYMzEXHWiRkZspt
	mbt07OSGRH3A+wdMQROHbpNHYQgur8tS8JnYfe5wx59Im2SdFVwsz6kLDqv0dB+CJIQn
	BN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=o2SAHCTYFZ9gh7E4HC/92nexrB58WEilfKEWKCPMZ+4=;
	b=fXCnNVHKvwRVQQcd8a21n9/AfeKq/tMOE48jOPtSv7USVN4Pw0Y9J4pKCRxOao/nP0
	yxavcOIemRx0EH05MC2eSLRBFfZZ/3ClPYigvCzXicNwh64vi+Sf+MmiFumwGHmpBRvw
	Y7dqPNRPUqOdnIi+D//j9GW+ecetVJO3JG1KkDaLrFUFxGTgbgqiq/cRKFZMe01In3L8
	kaBYMmDgbvwMLPl18iIyTn8UQJIkVPAuYk9/zfcR69h6DOXzevF7FZKvvwzZZuYI82MM
	JpqOwb2tYfi0Y+O21OcxzSUmqZoO9xS+i5sLvgNWO4TcC9B4NAsJhFr2KzZfRfHzx4lT
	FExg==
X-Gm-Message-State: APjAAAXtOVaQe0UnrGT6eDK/GXgYcGXLqeqZf+3/Y8NUKHjOpvYw6KyP
	57406rhzoQaZczfL0cce0Sk=
X-Google-Smtp-Source: APXvYqwOwaZX0EHSzLGv4JNKycVsWaUjh9KE4mTf2l1eqpBFlVXW6Og730L9IKoptUdNBKzuEINR4A==
X-Received: by 2002:a63:200e:: with SMTP id g14mr18752041pgg.210.1570820251169;
	Fri, 11 Oct 2019 11:57:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:103e:a562:b75f:8d63?
	([2601:202:4180:a5c0:103e:a562:b75f:8d63])
	by smtp.gmail.com with ESMTPSA id k6sm845115pfg.162.2019.10.11.11.57.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2019 11:57:30 -0700 (PDT)
To: Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org
References: <20191011090659.34036-1-stefan@agner.ch>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3c3f29ad-49a2-6738-276b-b33da09de9d6@gmail.com>
Date: Fri, 11 Oct 2019 11:57:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011090659.34036-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>, liu.ming50@gmail.com
Subject: Re: [PATCH] uninative: check .done file instead of tarball
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
X-List-Received-Date: Fri, 11 Oct 2019 18:57:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/11/19 2:06 AM, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> In case multiple builds share UNINATIVE_DLDIR's location, one build
> might be in the process of downloading the tarball while another is
> just checking whether the tarball exists. Check for the done file
> instead and rely on the fetchers lockfile mechanism in case two
> builds are running.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

With backports I assume if this goes in.

- armin
> ---
>  meta/classes/uninative.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
> index 3326c0db3d..9f8645a36a 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -45,7 +45,7 @@ python uninative_event_fetchloader() {
>          tarballdir = os.path.join(d.getVar("UNINATIVE_DLDIR"), chksum)
>          tarballpath = os.path.join(tarballdir, tarball)
>  
> -        if not os.path.exists(tarballpath):
> +        if not os.path.exists(tarballpath + ".done"):
>              bb.utils.mkdirhier(tarballdir)
>              if d.getVar("UNINATIVE_URL") == "unset":
>                  bb.fatal("Uninative selected but not configured, please set UNINATIVE_URL")


