Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4967B6A8EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 20:35:13 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so6979430eak.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 13:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=Zlk87sPF1iPp5o1LmkomCxS2IC2J/I8zGeB3cqwtQz4=;
	b=nVLRLz19xe6Af8OGxEnqDjh7GlVFllT/UgTymQiOr34xh6lL2j9B01o+c7NRyT0xLa
	1EtJqwtTZJv+/k/Tjz515Oz9VkrkPybF4cT24q0fE9kpePuXUXdCjB0ITQ9gygCeB2/R
	FK/8gkuJCYiZNHCnQBd0YuxG5ncQWxTmDakKw/q9I+a9U/NpD4qYiYMqMdq26+dOJt7M
	4XR9KM1yLRosJNdXtlQkKUSk2fQgnbyTLcGWlninR/M6TYO3nvdm5HOvYlf3TrPzcvXc
	50lLVLYkLmF4NuNDMbE6UMPcog+Pg1fCZGaU5RkKN/C/DYBlo3kU3kiggchnSDjIC2Je
	IFVA==
MIME-Version: 1.0
X-Received: by 10.15.111.135 with SMTP id cj7mr618210eeb.144.1372192513070;
	Tue, 25 Jun 2013 13:35:13 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Tue, 25 Jun 2013 13:35:13 -0700 (PDT)
In-Reply-To: <1372084023.9930.30.camel@ted>
References: <1372084023.9930.30.camel@ted>
Date: Tue, 25 Jun 2013 16:35:13 -0400
Message-ID: <CALmOhgn3KnvPe2EqZ04vPrWuM7tYkK1xTKbD4ZEUxaubDRAGhA@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkIeu7jnv2uVX45cGmQEmtel3PExO4qSveHZtMZzHXMV4D1uIIS/qKHPdmiMfQPUaryMhMg
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: Package some iwlwifi firmware separately
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
X-List-Received-Date: Tue, 25 Jun 2013 20:35:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 June 2013 10:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>  PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx ${PN}-vt6656 \
>               ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
>               ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
> -             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k"
> +             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
> +             ${PN}-iwlwifi-licence ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2b-6"


Does it matter whether you use "licence" or "license"?

