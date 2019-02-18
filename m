Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3357C87D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:44:23 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i20so28374525otl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=kpFFyxuCIJ+EUJS/TvbWXVqE7YhVF/pWGpGhZZ58WuY=;
	b=X9Q+RGF19peCVvWA9vRf0S9g3Y57cq9EMJWAvHKEsAKhiefS6jhJPeid92sIex+WB9
	t9GCwKnWI9gj5L3aYiL+vJ4Ai++bhMCEmVqO2FFbDBDkHre7dCipNFHz0ZPBL0RDQHAV
	nggWO9YiRje86VFEjhYzlOxQwt0lAY6DSMAXBPRtGT7a0LgyV2+6QAgqAHRh4+r//Qi7
	uOUVXGyYLPHrVKfPI3fL+fiU3i/Xh7Xk6FVmPHGABOcnIp2EtQVLPlSWcf9VTyEjUyhG
	fteC9xwQEbMlY1dSCzhQSkNC2bMYMkKx9EWWkmVdSb6XvgYXXl3iXzFhYZnetZSJxctX
	L0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=kpFFyxuCIJ+EUJS/TvbWXVqE7YhVF/pWGpGhZZ58WuY=;
	b=sVAZMu2rajzjNSeml2AsEQb2BJ9NRxdYqzRKcLqYK5M5/PLYSdSRSwA6gLHaqb6Z6A
	dHCz7vne8HTMSpO81S7AUjjKXHStybyzyjQoTqL1iP9FqGu3zWI6DyCNG/ZxqVIfSdCd
	sy4+/D89oN+OP5yDVGicakn+tjpv00jZk9fi5SH8WwF7GAjcDaHl5w9MZlHnIkKNRlwx
	82Sap9yOQt1QtJnkCCna2HyM1DYzriNEVfPrLFwLUP/2oQn4MvGqJwz5w6gJoeQsnKny
	gt2QUVmkD3aeMsr9Is1UG1r/dpPtPWMWb7CnmPpcKk6PA2Tm3+TCUxazHHXB+c1Ilon4
	hfIw==
X-Gm-Message-State: AHQUAubno8joIlW59CHDIEBWqsLM5rV/OPaKBoiF9pk2m/Pr2URWrS/G
	S9IkndQMdMuvcBhXRpYtUHs0RDS1hRMCgQ==
X-Google-Smtp-Source: AHgI3IamOXVuEiohlGJ2KON3r14kLtjSlOZr2AS4haF5NhBMOqLlCZK58myJiaLftbpUNGHOQjl1Pg==
X-Received: by 2002:aca:e0c6:: with SMTP id x189mr13695401oig.78.1550497463465;
	Mon, 18 Feb 2019 05:44:23 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
	[209.85.210.54]) by smtp.gmail.com with ESMTPSA id
	187sm6024518oid.22.2019.02.18.05.44.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 05:44:22 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f54.google.com with SMTP id z19so28360639otm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:44:22 -0800 (PST)
X-Received: by 2002:a05:6830:16c3:: with SMTP id
	l3mr9149920otr.145.1550497462062; 
	Mon, 18 Feb 2019 05:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20190218133231.27989-1-fabio.berton@ossystems.com.br>
	<CANNYZj8Ec+uNYjDedY4yZNw6CSNWUcE4wdxYKz4n5yFJx5DtUw@mail.gmail.com>
In-Reply-To: <CANNYZj8Ec+uNYjDedY4yZNw6CSNWUcE4wdxYKz4n5yFJx5DtUw@mail.gmail.com>
Date: Mon, 18 Feb 2019 10:44:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr_XfE4uFUaO0oGKr-ct84cN1m6X6TP-h--yoFtyh27aw@mail.gmail.com>
Message-ID: <CAP9ODKr_XfE4uFUaO0oGKr-ct84cN1m6X6TP-h--yoFtyh27aw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Mon, 18 Feb 2019 13:44:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 18, 2019 at 10:37 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The commits look good, the only comment I have is that in meson
> conversion you remove the patches from SRC_URI, but not delete the
> actual files.

Good catch, also I'd like to not merge this now. I'd prefer to wait
for 19.0.1 release to do the switch for meson but if desired, this
could be tested on AB in meanwhile.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

