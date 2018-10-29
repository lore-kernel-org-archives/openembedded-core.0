Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 81C7960043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 10:22:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r10-v6so8017149wrv.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nfAsgTWxiEQMPkOKvOkOPwuJYzZlTIojpNy2yFBJy+8=;
	b=hCEA/iZD79ex9jqmAVyVBfRF2HY1UgbD7YZtkrlIS64w9Ve+Fm3/zLQCd8RU52zX+B
	lxRpgUJxO/SP/n+y6iUX1V8UwfoG0j/o5JelQBjJ2fRLGe0s4a/hAagQ/eokhGMOY33K
	xMYalESOvxzX7g3oFkmlgWcHgrjZh/qqwutJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nfAsgTWxiEQMPkOKvOkOPwuJYzZlTIojpNy2yFBJy+8=;
	b=Jhq1MBTx1tQ9dE/e+G8AJ5GMWqTbBQ9k2ByYZgaOVObBGiEMT/90D0y6qxshPA8v+X
	Gxsc/UM83R8N0rzRQhYpcJBD4drHnGzRbD4pec9xZDismUgtP30hC8JYswg6Jdyb4A3e
	bP0j7dmZhsmJgasfEn9unaCZ1ML8TA9gRI6xTfmP/dqYcw9zExtTdiUZvM6z/odfavZo
	zzUlFxoJjeGP2ZyimvrHzw2iTPjWg2oWA+Gar40u0e/mreBzGG6r6ubZBCy2b/jS+h+u
	z0JvM0tWhEKEkNH2rt2QhSWzbdLR3XV6oV5rXYAOHekRKmFdpS86vKH7jsrcBRsf2bms
	/RSQ==
X-Gm-Message-State: AGRZ1gJlLmKf5r1mZ91oUDnW8g9txPX9khWmJGhu3+js5ZdBMc42tlkL
	dkg8NejIQ5+og1qc7jbX6/ZP/ERiPX0=
X-Google-Smtp-Source: AJdET5fcJH8jfmLvikmnZF8RkvXgaHUGYHsa5vrOCoeGEn1FphVfexCcyBxUZO03CgdV6pXoKS8S9w==
X-Received: by 2002:adf:e50f:: with SMTP id
	j15-v6mr14146754wrm.94.1540808576939; 
	Mon, 29 Oct 2018 03:22:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x186-v6sm8487713wmx.24.2018.10.29.03.22.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Oct 2018 03:22:55 -0700 (PDT)
Message-ID: <dcf4bd416c92da74a5cf0a9401e5561126073ac2.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 29 Oct 2018 10:22:54 +0000
In-Reply-To: <333361a0-5622-46df-780f-bac18315fa01@siemens.com>
References: <20180917134158.4614-1-andrej.valek@siemens.com>
	<9c4d3cc718703e04e6b9890862c288f046915c61.camel@linuxfoundation.org>
	<333361a0-5622-46df-780f-bac18315fa01@siemens.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] staging: remove hard-coded values from _FIXMEs
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
X-List-Received-Date: Mon, 29 Oct 2018 10:22:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-19 at 15:08 +0200, Andrej Valek wrote:
> Hi Richard,
> 
> I have sent this patch, because of modification this replacement.
> What
> about adding TMPDIR into this hard-coded array? I think, even if it
> isn't added into EXTRA_STAGING_FIXMES it shouldn't influence default
> behavior.

The reason I wasn't keen on the patch is exactly because people will
add TMPDIR into it and that can hide a number of problems which should
really be better solved in other ways. I didn't want this to become a
workaround for fixing things in the recipes.

So yes, I understand why you might want to do this, I'm still not
convinced its a good idea. There was a good reason this was hard coded
but I still haven't had the time to look more into exactly why that was
:(.

Cheers,

Richard



