Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 490CE7E0DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 16:45:40 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c14so4079307qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 09:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5ap8UkfNjltoCgM8MEbHq6KaGWsJpZONssOxAnn2lXc=;
	b=CCeKfF4nmWRJxo2lHeqqiwR3/PLohm3AU/T4dXkfsah4GkibbZ4Uo/X7KM0eF+t7N/
	fQMG6eVssCI5LnNTDHza55cRz4CNtsLZj2a1nrtXSbfM2PclklbjXyA2Ow3TxNmtH8Kg
	pZhn5skphP86vknCpZlnDOblHputqetwnCf0Le5/txlmfGp2QVP1UhtJxkpWoVrxW6pc
	yJUL9p0MpQp10FXIlemOKi0TKgU9Tbry3ukW3gEJWd4gsRftYWmnNYWqkiWljXhX6QKz
	IxAkYENEnVZBYsVXKfs4o/qkSccQEDwGYWNig7sYKV92Q0VlH0C5TWkHVmV1YD1dw9Um
	5f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5ap8UkfNjltoCgM8MEbHq6KaGWsJpZONssOxAnn2lXc=;
	b=CLyzgeuY6ngPMQmTks8hp1Q9YCFO3APeZ1iAAevEviF3n7g0/oizpyGvd31WqvOiIV
	Y84NWzLctDVTtzKY2dPTjHI31nxdJneBgg8z+bc+iepvc02t4vjFh3U3dAJtk8FkCcA+
	dMoZyiqo0bjdtQ1Zi/KR6eZLNO/aCDN6TwtaxM0SlcIczPCwObFCkqaoae5UaWt1WigU
	FOb4gudb5HjCT9tAClMyAonynywq4ih8+Akqu7fhVNdE8hyGapRQ3HPR7wvXfiy04WN3
	fNfdUfudqYEJfmNm/zoP7O1jWKqajbIJQa5ALW+lcGYFm331BWXGy2A6+qjpHQo62+Pc
	qTzA==
X-Gm-Message-State: APjAAAVhpyy02OZojhQWjC0io+GegO/sU/UsGm4aLAOWcNk5P1pc4q8H
	SH3bje3ChSSJ40Uy8oNHxaVz0FqBD47q93t7tAo=
X-Google-Smtp-Source: APXvYqzcQIu4wJVOnj/qrXUFXlB3D07YCqMOu25ZKYlJ5irG2/wYPr+PNmddlppDiwhBg9oW2UEZPPka9eRUvyX3wp4=
X-Received: by 2002:ae9:ee0a:: with SMTP id i10mr10224354qkg.2.1557506740993; 
	Fri, 10 May 2019 09:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
	<20190510120932.29765-1-luca.boccassi@gmail.com>
In-Reply-To: <20190510120932.29765-1-luca.boccassi@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 May 2019 09:45:15 -0700
Message-ID: <CAMKF1spVZzywgp8PE3OuZ+x60tkyXgHCD3QpDfMfkVFefEMZrw@mail.gmail.com>
To: luca.boccassi@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: enable portabled by default
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
X-List-Received-Date: Fri, 10 May 2019 16:45:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 10, 2019 at 5:10 AM <luca.boccassi@gmail.com> wrote:
>
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> portable services have been declared production ready with v241, so enable
> by default and install the files in the main package.
>

what is the rationale to enable it by default ?

> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: Just enable by default, and let the files be installed in the main package
>     as requested by reviewers.
>
>  meta/recipes-core/systemd/systemd_242.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
> index 73e03c7a77..f15d125bf8 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
>      nss \
>      nss-mymachines \
>      nss-resolve \
> +    portabled \
>      quotacheck \
>      randomseed \
>      resolved \
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

