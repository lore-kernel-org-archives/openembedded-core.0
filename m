Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF446AC28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 10:03:44 +0000 (UTC)
Received: by wgez8 with SMTP id z8so31715069wge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=WGzfBlxRQ9cilkN47ROYewFD8QEu1GRozkwjK+jd3+U=;
	b=uTeo6ARz6tiWnBQILpOsOSjxFIanEnnI1jx07dqfZ4iPfZGc1944Ug58KHVOGsMNsk
	I5+jZotf9VPyOeTT+zlz8DCDlnT3nlHs7S8AeqSuAp7rhkv4iAxcAgDwNL0fzQr3ENsj
	2Ql1LNB1C7UBtI9Jlkhc/rKh+m4DOtGmkJ9YGIHhrTCzBxEAhzBBKpX3oSiHWB5z3mEK
	QVhs+EV7fwD4V785MgMWH71oFRiKVdDFjylvssuRpb5u8DlfErtUJJo7spxWcfpAxOx8
	AXLESh1GfyAAQD0ZTZ55t7yeoK1hXAa+M4skabPdSJQ06lHRpsCAffgduqBmGBl4+fBm
	+IdQ==
X-Received: by 10.180.76.8 with SMTP id g8mr17071203wiw.79.1433930624855;
	Wed, 10 Jun 2015 03:03:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id r6sm7134095wiy.13.2015.06.10.03.03.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jun 2015 03:03:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Jun 2015 12:03:53 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150610100353.GA2400@jama>
References: <CAJTo0LY2C3d6ewKs7f1V0U9k7vqMQ47kCnANetzGz1OhMtfTFg@mail.gmail.com>
	<1554329.HKQRZb0eD9@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1554329.HKQRZb0eD9@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] remove neon from oe-core
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
X-List-Received-Date: Wed, 10 Jun 2015 10:03:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2015 at 10:17:53AM +0100, Paul Eggleton wrote:
> Hi Ross,
>=20
> On Tuesday 09 June 2015 20:14:15 Burton, Ross wrote:
> > Since Subversion moved away from neon it appears the only user of it in
> > oe-core is GStreamer as a HTTP client plugin.  By virtue of being
> > maintained I suspect the libsoup plugin is generally the better choice
> > there, so as neon is now unmaintained upstream (last release September
> > 2014, doesn't work with latest GnuTLS release) I propose moving it to
> > meta-oe.
> >=20
> > Any comments?
>=20
> I have to be honest and say I don't like meta-oe continuing to be a dumpi=
ng=20
> ground for old things that only a few (or no) people are using - if we mu=
st=20
> keep these recipes around, I'd rather they go into a different layer even=
 if=20
> that layer's only grouping factor is "legacy items", at least then they a=
re=20
> labelled appropriately. GStreamer 0.10 and BlueZ 4 were recent examples,=
=20
> perhaps I should have spoken up earlier, although I don't necessarily thi=
nk=20
> it's too late.
>=20
> Martin - what do you think?

Yes, meta-legacy not included in my world builds looks much better than
dumping untested changes to meta-oe (both gstreamer-0.10 and bluez-4
dumps didn't even parse in form how they were sent to oe-devel ML).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

