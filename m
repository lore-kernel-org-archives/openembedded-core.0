Return-Path: <prvs=31051da96=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 433 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Feb 2020 09:06:53 UTC
Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com
	[68.232.133.201])
	by mail.openembedded.org (Postfix) with ESMTP id 0995961575
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1582016821; x=1613552821;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=3Ayfs2M3funW/ETatGMaTBaphchp7iqKEdXG9ehYhpQ=;
	b=HqlizTAXapeckpdX3Bk8iACa5JakK+kD3p8BMPMzyu4Tsss7xfuSJ0Vt
	HWSbeKnRhNSvTykLhaqAOA6rZWun96MCXu4v8nrxpDmnY4RoisPAJ5Bka
	4LQPyDD48X1p2fzYv2fzQpcYocWVTCt+vUigl457cSMd9+VgXgICnObtD U=;
IronPort-SDR: C9xbFdXkZV8sq/tK5OAXz6x74hHZpNlOe9uX3f+fMa2gHGctpgxgOrEhTdKLz1gyigrAfD4MYf
	FARxaFbgHps8oOoqeQ0ohKVkqOj5+ILFmKOKIgqubBZvvv5U+3B34xOMWVnhIROwSRrcvFz0Ta
	M/+FoWXWTSmEXJJ/lfmIn796bTFdeWKMRBqWJAWVA2834v84r+Jy5yCk3oFH9a6OaYlxa9KDHZ
	B5LkI7NsgqNwAm35pr/DYwkz2qxsw8CESDDAnVbuIBifBjE75I/WR7zT8lylkIZ2PfIpa4KASb
	hGI=
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 18 Feb 2020 09:59:22 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw6.muc with ESMTP/TLS;
	18 Feb 2020 09:58:51 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb6.muc with ESMTP/TLS; 18 Feb 2020 09:58:49 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Tue, 18 Feb 2020 09:58:49 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Tue, 18 Feb 2020 09:58:48 +0100
From: <Mikko.Rapeli@bmw.de>
To: <jupiter.hce@gmail.com>
Thread-Topic: [OE-core] [yocto] Change RO rootfs failed RF Kill Switch Status
	and Failed to start Run pending postinsts
Thread-Index: AQHV5fbdCy49MNKwaEWF8CPLotJEUqggbySAgAAL/gCAABtwAA==
Date: Tue, 18 Feb 2020 08:58:48 +0000
Message-ID: <20200218085848.GA104502@korppu>
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
	<CAAfyv34yO7bSR9GBod1bXpD0sFnsSETsJQAzcmSgyY0orGtfcg@mail.gmail.com>
	<CAA=hcWQFcdUJKGTOitOAx1URD7r=9PPxsdd=hQO-Yb77=QHTDg@mail.gmail.com>
In-Reply-To: <CAA=hcWQFcdUJKGTOitOAx1URD7r=9PPxsdd=hQO-Yb77=QHTDg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Subject: Re: [yocto] Change RO rootfs failed RF Kill Switch Status and Failed to start Run pending postinsts
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
X-List-Received-Date: Tue, 18 Feb 2020 09:06:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AEDBB78B53461B488B108270AC5D8CA1@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

(trimming lists to yocto only)

Hi,

I think you may be missing volatile-binds package and service from your ima=
ge.
See poky/meta/recipes-core/volatile-binds/volatile-binds.bb

It may be missing /var/log but with systemd there should not be needs to wr=
ite
to that location after image builds...

-Mikko=

