Return-Path: <prvs=2220433f8=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B00D7FA10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1574412884; x=1605948884;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=tJp6vONJoNFgTjOOK8/UchtEF5x0MtGUoR3TrGZXNpk=;
	b=TCh4qDeWxHQCClTioP3WOmlMc6i3GskdQbcKE4nMSYt6XWOwZscKO91Y
	P2SI6xxEk8Y+TNPsY5f3i6N7nzqYWFHUCeJ0Jwk+CXecn9YqICdeqflIX
	emFZPTXxQGdLk+zXMxBFGCWn2TSqeKfR/zdvf0OWSoLRv+sXBvs8IUvCc w=;
IronPort-SDR: VJhPNb6HmEwXCMi3xh29bKTHxHWM0MOkpMAXMMJjvTuxzAqfjKGy8nHIH8t32iT6KyS4HVG6ca
	fm9sA5npwvkrJY8Q1/pUnr/y0Fj38gvD5Cc15NbECgo13l5LqxouxDWDsgJhAbTcODOKEi35Xo
	SB3kywXFodrZy31lGbiCI7ARvwwC9TAgCaqjsuG5LlR5YHGmsCITWhXfxSv8WYT050COstR/jC
	WLN+K7B+0V58xBvyCjbortcib6AXRdugafcW0YpB2ux3+PzHCoTjsmxVjkjvEi0bAdMimLTLoj
	GAQ=
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 22 Nov 2019 09:54:42 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw2.muc with ESMTP/TLS;
	22 Nov 2019 09:54:41 +0100
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb2.muc with ESMTP/TLS; 22 Nov 2019 09:54:41 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Fri, 22 Nov 2019 09:54:41 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Fri, 22 Nov 2019 09:54:41 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/5] opkg: Add upstream fixes for empty packages
Thread-Index: AQHVoLHSa8nfP5qMwU66MevIWq8I3qeW0swA
Date: Fri, 22 Nov 2019 08:54:41 +0000
Message-ID: <20191122085440.GU3527@hiutale>
References: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] opkg: Add upstream fixes for empty packages
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
X-List-Received-Date: Fri, 22 Nov 2019 08:54:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <35651AAD8B1B9647916246962E3C50D4@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

This fixes the crash I was seeing too.

While debugging it, I noticed that host valgrind was not able to work with
yocto host tools and I had to build native valgrind which needed
some patches and workarounds. Will try to submit them...

Thanks for fixing this!

-Mikko=

