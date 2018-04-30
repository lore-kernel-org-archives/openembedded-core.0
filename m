Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id A3ECD60049
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 20:30:09 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id a6-v6so8564640oia.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=Magjjw23L0TCSuorJNcRFjavjrUplpMPHZTR+/tguxg=;
	b=wsKRtfUYxLToz/6fvr3zNNxyuqgfTvXlfgir7FUIZSzCdbS3XLUVuGcN+EMrobVexV
	utv1WqYZXY2/35i14CdVgEkZvVwBmvuetil3fEqf25KLquBA3cgRRojDP/02KhkGSnUS
	Owz2KmnHgR9AEqJJWwvRmeZIcNccnGO+J6b5wdTsL1f20XukxHT4rhoNBYCQjot3ImLx
	ATZaNuR1R5rsszXYncqd6yLAZz14Mf+e+gOiiF5YRH+7ecjbTb05kRqJVegeluTGuEm1
	9Vo0S5mGoSmoSDoLTNC5qzzBSk7poF6cmJebjf1vSDaFI3+1kzrlRLbGmNBBlv82TNJC
	aq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=Magjjw23L0TCSuorJNcRFjavjrUplpMPHZTR+/tguxg=;
	b=j6eQ/DSQLu5tMun7SdJtewLzMJNKaS42/InztKVt2UPCFBOfdFsCzAeYhCEOoZcpcs
	T4+h34jCj1pqvi7SBkUhbSeRsCN0Do0FKZkOiFwY+iXWbF5htyLsyAXMmu1fWuUjqWOH
	H2BDyhRpdsFfbZ1UmBlomf1hzd/tZkicG1/vGnmUqgpTtj7BtCixEvwJsO5xQzxYAEbX
	q1bvT6bZEChx/LEEaVW/jS8AwC25I76KdAxea7KUOLxcCGA7JlquBHHt8Fyx3C9Pf+0O
	2wkss0GkmfF+NaJhybN7tDS1/cFDWbcYG+jviPqEHvybFLBDF55o4geeyW+BZQBiV0rh
	FK1Q==
X-Gm-Message-State: ALQs6tAl5IN6zs+AXyVDk/zH/qE+ntrHl59XpnVAGI4OLDFyllplbqZA
	qEZ2mCJnXQij4O/qTzA4YJ+L8U38
X-Google-Smtp-Source: AB8JxZpHxHY8/W3i7y9BS1LhcjqNmuwKUFX4Nm+PhCcagIa6aW5wSf2z3Uc8n+VmrMaXy7srZ5Rdvg==
X-Received: by 2002:aca:ab8d:: with SMTP id
	u135-v6mr7697444oie.338.1525120209824; 
	Mon, 30 Apr 2018 13:30:09 -0700 (PDT)
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com.
	[74.125.82.171]) by smtp.gmail.com with ESMTPSA id
	y13-v6sm5330564otj.68.2018.04.30.13.30.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 13:30:08 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f171.google.com with SMTP id l22-v6so10960947otj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:30:08 -0700 (PDT)
X-Received: by 2002:a9d:3387:: with SMTP id
	u7-v6mr10005666otc.103.1525120208138; 
	Mon, 30 Apr 2018 13:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
	<627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
	<0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
	<f6d2cd6a-4206-3a2c-1854-4ff12bd35df7@linux.intel.com>
	<CAP9ODKqTV4g2ze+zw9KPqkiQ_LUQ7NTfWUzN-xvKvwE64Qkisg@mail.gmail.com>
	<20180430202522.GK31362@bill-the-cat.ec.rr.com>
In-Reply-To: <20180430202522.GK31362@bill-the-cat.ec.rr.com>
Date: Mon, 30 Apr 2018 20:29:56 +0000
X-Gmail-Original-Message-ID: <CAP9ODKrSENfuyMmvuyFMaAXfsr-Dd8dzM1X1pRp5m_5ys_3x2Q@mail.gmail.com>
Message-ID: <CAP9ODKrSENfuyMmvuyFMaAXfsr-Dd8dzM1X1pRp5m_5ys_3x2Q@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Mon, 30 Apr 2018 20:30:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 5:25 PM Tom Rini <trini@konsulko.com> wrote:

> On Mon, Apr 30, 2018 at 07:57:18PM +0000, Otavio Salvador wrote:
> > On Mon, Apr 30, 2018 at 4:53 PM Alexander Kanavin <
> > alexander.kanavin@linux.intel.com> wrote:
> >
> > > On 04/30/2018 08:25 PM, Marek Vasut wrote:
> > > >>>> Isn't it possible to solve your issue in the OE side?
> > > >>>>
> > > >>>
> > > >>> Can we NOT compile DTC alongside U-Boot somehow ? :)
> > > >>> That'd be the most desired solution IMO.
> > > >>
> > > >> Yes please. Can you adjust the recipes and classes in oe-core, and
> > > >> remove the dtc recipe altogether?
> > > >
> > > > Remove dtc recipe ? Not sure I understand what you're implying.
> >
> > > If u-boot bundles dtc in its source tree, can we use that, and remove
> > > the external dtc recipe?
> >
> > We shouldn't. The point in use the recipes inside OE-Core is because our
> > bugfixes, patches and etc are used everywhere. If we use the bundled
copy
> > how we'd fix a host issue for example? Duplicate patches?

> What do you do for the kernel here?

We use our dtc-native. As we do for all other recipes (but few exceptions)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

