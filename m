Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 029E071A60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 15:57:26 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id c15-v6so6403175otl.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QMp6o/EXHEPoEKf+62+26VWOKsJWlgQleI2L9rNgK6A=;
	b=KNOmUd1FEOiq3br9J15M11wHDt9q3XpYosk+e2zWgnF0hZlbi0foUQ42r/L5YP0ESs
	sVK4EdMSvmNxFZT5KmswoeP7tcQ0kcTPBGGVOI302l+BeyzP/WaFrAFRTyQ+h1xXtLQ9
	HKPgDnlJgv64nZBhO0EbY6K6gn5jdBYBmYQ6K3c7bXdy9f05mbM3chpUMlRspma+WgnV
	ERvmuxbOd97Pt2xdaUTnNbg9EGsnpENTlaXwv/2gkC5nbJbXqmrGYoWEnM7DXMb2n/Ts
	OVyswqQD7uAZAhNGRb8cxaHzK+CpOP6XtRjKuVDqIoBUWdiqozSvzVdPIDazAd0Al8bG
	v1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QMp6o/EXHEPoEKf+62+26VWOKsJWlgQleI2L9rNgK6A=;
	b=A+eWcQbMfFfEl+0mfDKcq3xFAiduBN76RKT9LVUBtX+hSNfaTXlMdx1YfgUbBu8cE9
	BHPXZT28FOt3hus0WTznCnOW7BvdRU8hJuIJJEEv6rlPHPJEvdKDwA3lmzd2B3zZf27j
	TB5CyxdKPDGOvo91F6xXANBwgcBbEatNX5Es9J+MYyyxR0R0Nh3sx7X7Nh8HwiUD4lS8
	GalP1fiesP0a7E1IkVx93F1He6GZOsxDfgaWcRK7uycxyEt3tljSAaoJ8iQaLYx7ZIwn
	18w/aEibXJtmSiV+gIf/LotimWv/Fp2QN2l/zfrHrGjEDTqNXH2V+U1A6v4QC2+qQg+T
	jDqw==
X-Gm-Message-State: APt69E3g6FMLlDxwzIDpzS2DaEJezQmdMMWbxS165blgN+OvolQPsWP/
	lLlDieHLJXJNCEVTbYlOlyTVtolliY8AKWZd5ZM=
X-Google-Smtp-Source: ADUXVKKbjnuvH7OGYbM4QlRSmOKTD/u6RnCyUbJA3GOTK/MHOnbIvaAjyh2vV2we8kViFIJJrdXicohykDD0lzb9g/A=
X-Received: by 2002:a9d:4609:: with SMTP id
	y9-v6mr3666429ote.259.1528473448097; 
	Fri, 08 Jun 2018 08:57:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 08:57:27 -0700 (PDT)
In-Reply-To: <20180608140403.27855-1-andrej.valek@siemens.com>
References: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
	<20180608140403.27855-1-andrej.valek@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Jun 2018 18:57:27 +0300
Message-ID: <CANNYZj9ecWrsg61KiAirO5YnkATOtEihRgym0iD5o1c0po5KNA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] openssl-1.1: rework packaging
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
X-List-Received-Date: Fri, 08 Jun 2018 15:57:27 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-08 17:04 GMT+03:00 Andrej Valek <andrej.valek@siemens.com>:
> The main idea is to have libssl and libcrypto in separate packages.
> This saves space if only single library is needed and also some recipes
> (in other layers) depend on these library packages.
> Together with this other packages like in 1.0.x were created.
> The only difference is that openssl 1.1 has additional package openssl-bin.
>
> Patch original c_rehash instead of overriding it with our own.
> After applying patch from Debian c_rehash is working.

Can you split this in two different commits please?

Alex

