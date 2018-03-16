Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 92D407885D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 19:48:48 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id i28-v6so6831853otf.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 12:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=jmRXCYNvWlt6XLSwL+1dYPaaQ1kLKXBLWcL49Qeo/Kc=;
	b=YG5yzIvxHTxNEYW/WxMbBRiBIrEKhAbJjtgaXpxcSsPED7h82yKNVLeH6UDuBS5FE9
	+eljyofkSiRlhSwN8h6HlAyWWhdLSarbQEc3weZZSWMvoOIkgXr/Wfc4hsGX1Bra/eq+
	fwH9omMZepmVQ4pCRwXnBwsBXhUBzso+eQdyU0WkOTX8zMdk5mFxOF8bc7dF64Ukv4mE
	SIymbEzi+NmFfExkJkMrlrTefIlED6OEUHeyxz3DRAdWwAsrIDfT0Sr4NoY4T52l1p97
	6U2U0U+mC6l5l8RWuEMUFr7urbmt/O8k3DPa+CJmDFuUb5PQbY6n063yVYM5KQHfno9E
	RIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=jmRXCYNvWlt6XLSwL+1dYPaaQ1kLKXBLWcL49Qeo/Kc=;
	b=Cm4Zw72VQEZNCBPf++uOmmhBzaAWMURHbM7gRF6dIal2SSYKT8T1kk5YzpSxNNaOby
	U/bZ6DPGZ9Mte7oXYmWIPN/QIblk6UxMPrg65r290ySx9/dHBYA+KNo5F78wBdeWFxbP
	8pT+CRgPRnBCK1P5LUF6aNFwOOprPhSW0tfhbpS2kkoDJcJOBvlSXZ04UnPHr2u1K/il
	m/KZhIQJQm3pZPo8NK0eC9/ozpbE76Qu0D1DaJ4uI09PFaoZsKrIVp9AOU2nKHqSQzsV
	J5WlPqKVuokf+/p9WWtFAmzbxEZ7MJKV+0uNUVUvNk0SmymxDKDj4anAlMGXd6bJD44b
	CqvA==
X-Gm-Message-State: AElRT7EHXBi+Rg/pCCv405NYJuhetr+ANPAss7VdBWC4K7i5buRlcEbH
	dMAZZLu8uNt+JMKovsGq78a2WI5r
X-Google-Smtp-Source: AG47ELuWoALR54zrGywuxK67y9mx1oYHbxHl6cz1ovFHw1b5duACDypbVZh0bpbu2023vQwtfJ6a2w==
X-Received: by 2002:a9d:154c:: with SMTP id
	z12-v6mr1008116otz.65.1521229729090; 
	Fri, 16 Mar 2018 12:48:49 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	n132sm4365407oia.1.2018.03.16.12.48.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 12:48:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id y27so5375673oix.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 12:48:47 -0700 (PDT)
X-Received: by 10.202.1.199 with SMTP id 190mr1982064oib.80.1521229727419;
	Fri, 16 Mar 2018 12:48:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5081:0:0:0:0:0 with HTTP; Fri, 16 Mar 2018 12:48:46
	-0700 (PDT)
In-Reply-To: <CAGgRHJqNGPw1HLTtP88mzzX7kbwqX5J=E19iP=D0WNXR-4ybLQ@mail.gmail.com>
References: <20180316125725.25370-1-otavio@ossystems.com.br>
	<CAGgRHJqNGPw1HLTtP88mzzX7kbwqX5J=E19iP=D0WNXR-4ybLQ@mail.gmail.com>
Date: Fri, 16 Mar 2018 16:48:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq810JRVdE2yNq_yXFduEtfxzx5+ckFfsOm5iWiwuBTeA@mail.gmail.com>
Message-ID: <CAP9ODKq810JRVdE2yNq_yXFduEtfxzx5+ckFfsOm5iWiwuBTeA@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] glide.bbclass: Add class to easy Glide use
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
X-List-Received-Date: Fri, 16 Mar 2018 19:48:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 16, 2018 at 11:08 AM, Matt Madison <matt@madison.systems> wrote:
...
>> +do_compile_prepend() {
>> +    ( cd ${WORKDIR}/build/src/${GO_IMPORT} && glide install )
>                  ^^^^^^^^^^^^^^^^^
> Any reason why you aren't just using ${B} here instead?

My mistake! Thanks for catching it! I am sending a v2 with this improved :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

