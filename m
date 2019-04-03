Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 40C557D2D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 11:48:11 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id t81so13264198oig.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SdjkaF3YQJXoJnY5lqbUqLnO02tcEg6l85ESqU2G73I=;
	b=d6fBPA/ithH3gi4SgAexthJonZjIC/z/03vj0oIcJpcm18dLdI1wAEcouNRnpYFkD+
	fdiWYYXZG8qCLjumci0oXIzT3Pq5lLaoZr3+pzvBBQTRfYd1Wnl6UhwiLSLKZNw1Gfh7
	cl40JatzdXfaHkIV/6+LZ4+M16hjhcFJedjLsz/yFe+yT8VVnKeMARrbKcd2Myrvc2Ia
	GiocxC2lD5PS2qq/PtpXL56Fe9iVVQrXebQnpQ3jxWO0VlCzrKdK249x/2ESX+Z0G+fx
	eKQJ6n/bzmcHsQk4SBtZdZb7Q4el0jYWa20SRjeGdsFJ8fjZkwTYGDkNnMbHQPStLv5L
	fdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SdjkaF3YQJXoJnY5lqbUqLnO02tcEg6l85ESqU2G73I=;
	b=kYs+xDGJvFexOMZIf37VmQTFdFIrD5snOU9eIXQYwniIkJNbpQINS6TombdyY0AFsh
	/tqYJpkGbnz3HZrUD+5yV3QD5g5U16EiboL+gz6/cVk8zNEbdiijQdXedo+4wDLAjDeL
	R4Aiea358eSZ5K2gMOyj37Heepb6N6Y3VJgtzrWCbhp+rAPqIhVoUIjIB2iF02G+mTsr
	F1Eap9OQPqA+7EAO2F3EmRNKmDxGlDmFTvFBCr2z/Cfk5fHz7eCxYFtPsdzqZsi2AiIx
	poUzc6fvT8MLJKdvZ0wMjcsWIHsE5q9WIrMkRxdEOnGR6zmGUhBxR8hE0lLU+UU4+2np
	Nlcw==
X-Gm-Message-State: APjAAAWsmNWqvkNEx+v5a+6684emr2P/3P6o70Xlrfzeb7esDIupOyay
	BKs5AHYWMtaV0rzeIQcqsQeZjOT5gl2zel54sDc=
X-Google-Smtp-Source: APXvYqxxt9MlBVkFlcuRQ0ubQ0ZHurtQfiGatTu9lyjo3oKQ+lt935OXvkmfqYepek4QSbRYuzWzxB7ZapJPRwPaI4I=
X-Received: by 2002:aca:cc86:: with SMTP id c128mr1257893oig.119.1554292092275;
	Wed, 03 Apr 2019 04:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
	<CANNYZj8cJV07jb5k=KxyLpfyR3WTt=EDDe4gVPUaQDc1O=y-Ww@mail.gmail.com>
	<CALbNGRSnNrNdTiM3rUGq5nXZ-G96B=AfXk2fXS2Ysz0Zj4n5Pw@mail.gmail.com>
In-Reply-To: <CALbNGRSnNrNdTiM3rUGq5nXZ-G96B=AfXk2fXS2Ysz0Zj4n5Pw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Apr 2019 13:48:00 +0200
Message-ID: <CANNYZj_RMWWVzK=jShftrB0L04kzjR2B7P5cNAttix+Owq2YzA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Wed, 03 Apr 2019 11:48:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Apr 2019 at 12:55, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:
t builds I get:
> * gstreamer1.0-plugins-good complains for unrecognised
> 'enable-introspection' and 'disable-introspection'. This is odd for
> two reasons: Both options enable/disable? gstreamer1.0-plugins-good
> complains but has introspection.m4 what is the problem?

It seems as though gst-plugins-good does not support introspection,
and never did! So you can simply add the option whitelisting to that
recipe specifically.

Alex

