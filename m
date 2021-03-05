Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web09.13848.1614959452911869754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 07:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=aTqnZAg0;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id C9AED2A30;
	Fri,  5 Mar 2021 10:50:51 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Fri, 05 Mar 2021 10:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=E1qRQnvkPtCiFtAwr+JkFSfoFoe0ZI5
	D+/bXySWpWVw=; b=aTqnZAg0+zLabUucA8Fomwse1aHRoLLXlnYCl87WmbQcfbk
	gvxAl8h5kQZPo2u04G/v35o+bi0KgjPeYIcF9fn9wVgt06Ni9dtX4EOKFJXnHeTV
	KgYaF7XkWNDm1bqXgeIRBlvcsr5gSbDvREVbujoYbx4gkUss42qgQDvhZNHE7tRK
	7zFZKybAKJsBU9R8q7s2x+QmjNJsjT5ko9yfs6foXRLcIrUTfuVvO2nxNHJedATE
	pKf8NuZotBaudEsGMyTXjOgKefirSZo1xfcQPMi9Miepy/SvSqjZnx0Gr+s64hIo
	R1A8XI/2dkMWhFyMaii/LFRFO+66sn16wGntIzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=E1qRQn
	vkPtCiFtAwr+JkFSfoFoe0ZI5D+/bXySWpWVw=; b=lWaw5lRJyuzUnPmJgU26mK
	Mta/xjrxaZJV6kkEVxlodoN85FHwHTeh8Q2U8TtvHbV1vq1oybQCXwL5eGgiCZ6r
	nQldynLBgbf7r4/tKUpsszoZ4w8JffjQeMonzrbSuHMjy/LUrGSh8BLiBLGE7t/4
	TeVruHLGNxQEcVdnNNSuVlMvaLxhmgZaJoGD4GEuTJjsZ9bKmwWlFbZExXMPzjmB
	+JKTv1RLbNoF2PfoDJaPFW8aydhRoontXt+LBwJ7+sbpAPU3JmJQR8tXZ5lGY7Vu
	3a2LkDslSz9MmE2LetQeG1v/ABOxPTqaOMxVHbUNnKvF6B0E4al8IcmfAOULgeIA
	==
X-ME-Sender: <xms:WlNCYGisKU1PIqgLp4elm4MVQMD-fJpiSz69mf3NT6V9yzOLa_Mpdg>
    <xme:WlNCYHD0ebOQUxfXnXFDspzR10wotrQaIvz204Y-QHB0zF9Lbd51VMJCyCGNqTvzt
    v607C1RuA_w9t4lHaU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeelgfffvddtjeeivdehleefleejfffgleeffeeguefhvdevkeef
    ueeuleefveeutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:WlNCYOELKmtJpUvjBz7XUy6s7zxIlSdon8-N5blpBfmvPC98YM9Q4A>
    <xmx:WlNCYPSg4r31-LRnyLGB8cWH_l90jrDBX0i2B3lEMvPMDKyXmjpbBg>
    <xmx:WlNCYDyETavugttbW8hGaCbDk3HLY-xvQfOzF0JbbAgncxeV5OFzWw>
    <xmx:W1NCYBZknoyrdrJO7bjEYVs_OoCTsfvAd4Jc3rUPdjnYseHb7BzW_g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EAC0F160060; Fri,  5 Mar 2021 10:50:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <4a522c36-a33b-4932-a438-5dccd553e270@www.fastmail.com>
In-Reply-To: 
 <CAMKF1spAuYuGXKxps1MzP3cEPZAFKSnnaRDbc1UPbtswEXh5uw@mail.gmail.com>
References: <20210304233526.3373832-1-andrei@gherzan.com>
 <20210304233526.3373832-2-andrei@gherzan.com>
 <CAMKF1spAuYuGXKxps1MzP3cEPZAFKSnnaRDbc1UPbtswEXh5uw@mail.gmail.com>
Date: Fri, 05 Mar 2021 15:50:31 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [OE-core] [PATCH 2/2] epiphany: Add package configuration for building in developer mode
Content-Type: text/plain

Hi,

On Fri, 5 Mar 2021, at 08:00, Khem Raj wrote:
> On Thu, Mar 4, 2021 at 3:36 PM Andrei Gherzan <andrei@gherzan.com> wrote:
> >
> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >
> > Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> > ---
> >  meta/recipes-gnome/epiphany/epiphany_3.38.2.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
> > index 7fedc43a99..8e697b4a44 100644
> > --- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
> > +++ b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
> > @@ -21,5 +21,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
> >             "
> >  SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
> >
> > +# Developer mode enables debugging
> > +PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true"
> 
> add else case to define it to false as well.

Thanks. Sent v2.

---
Andrei
