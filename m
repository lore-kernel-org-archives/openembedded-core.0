Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 36E9E7E28F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 19:21:47 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id e7so989903pln.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=tYrD396tdHuyJFnb2hHRxRANK5+FsaErHS35Nf/v/gc=;
	b=O6BOs+Uaq7yLt7/5bdg6hc1xZJ1w2Nca5Vl8iWkr9uklF9tE3Vk2fVsqZsqww/Wf0M
	r7MkDEG0DADXv9x5xmo/mRLXvYWWYIvro6mnOahkqotozF88wbuJFaBR9sKkCHjo8jbY
	kWOS+tqs55UVOKQNRke59X+/WJqp519E2SX9GwZzomedlx4KOwOiG9jUS22E1797vtJH
	zdEUSsWSp9nBbK3kTVwQgzGy/+vJnU9XXodNBQVA8fKQfXmTtCTVWW9iCS94qPvsJ/do
	YvjwAfs4uyOrZH8/x3wj93uPuBX+uhlnY3/TlcYbl2d8w/3YHnsZ+Jr+/UeAUB7tDhgp
	4gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=tYrD396tdHuyJFnb2hHRxRANK5+FsaErHS35Nf/v/gc=;
	b=dmc2jLiKc1tqp4ioEk+z1tOQRCaMlIFSlYtUhshzdg2iGR1ho03tUx1j3P5vchDUzT
	OS0WUzTemFHToMMKc2wJayUpQ7OEedzQ+lgsc3kGpRcL/6lm/NX3QASaJSW2Yx8LYm/D
	QtllthRisXDxwwdOdmmt2OoLVnB+w86QCICOAod7NpIIKCK2eOU5Hkhf/qVAZJ4GgEjG
	zhLttLJXJgP/7QYRc9KDIOn4EX+4ZEqfhGWIeVLEeXsHuE3lTjXhtLNWS2ZdrDu/h0IJ
	juwuWn9BRSHaTIzSrWslMX0PSHOru9vTm+a5ce6CxZsZev0yVaObMPPfXRpDBNwse6EP
	VFHw==
X-Gm-Message-State: APjAAAWy7GwtO3BOOMuFCfmEod9qu8LcCDfFeLChdJKoGo3AFVRTUTb6
	kNmDOcDYxkWWQmx6StsiLS0QKxOZ
X-Google-Smtp-Source: APXvYqzDQ515kXohAB4QoL/eupguJtFlCKt4aDjpIX0SELjXEOd9q76wr6MwwOQibcj6cGo47gWkAg==
X-Received: by 2002:a17:902:ac8b:: with SMTP id
	h11mr28839052plr.31.1559157707845; 
	Wed, 29 May 2019 12:21:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4865:9151:ec2:e220?
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id g8sm318832pjs.23.2019.05.29.12.21.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 12:21:47 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
Date: Wed, 29 May 2019 12:21:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529184328.28470-2-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 29 May 2019 19:21:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/29/19 11:43 AM, Richard Purdie wrote:
> (From OE-Core rev: 29fc9210b973be68de474e75068e4c72371afe5a)
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

With back port to warrior and Thud too?

- armin
> ---
>  meta/classes/uninative.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
> index ba99fb6e8fd..3326c0db3da 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -2,7 +2,7 @@ UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/
>  UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
>  
>  UNINATIVE_URL ?= "unset"
> -UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
> +UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.xz"
>  # Example checksums
>  #UNINATIVE_CHECKSUM[aarch64] = "dead"
>  #UNINATIVE_CHECKSUM[i686] = "dead"
> @@ -89,7 +89,7 @@ python uninative_event_fetchloader() {
>          cmd = d.expand("\
>  mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
>  cd ${UNINATIVE_STAGING_DIR}-uninative; \
> -tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
> +tar -xJf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
>  ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
>    ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux \
>    ${UNINATIVE_LOADER} \


