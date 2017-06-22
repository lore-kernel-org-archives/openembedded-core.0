Return-Path: <prvs=339894f69=Mikko.Rapeli@bmw.de>
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 50E3371B86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1498135741; x=1529671741;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=ADo0IFYgjD2/z/Qyvc/llR/gM5jM/d0RzTWfw8yDo8k=;
	b=ZOnG3Sju2YQkvoSfK9RipROH4s5KTppBJHZ10snkPv27xRFUyEHyfoHH
	awvet9JKaaLJy+/fKYwmzIajeSy4yThv/uaoap5+kfH6kMMpZrzqO+wmh
	Xrv+wp+xdJ3jqeIILzfQXECl1dqPvAv6MF0Xs/0cmuLmETQGn0sUaCzBp o=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 22 Jun 2017 14:48:58 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw5.muc with ESMTP/TLS;
	22 Jun 2017 14:48:57 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb4.muc with ESMTP/TLS; 22 Jun 2017 14:48:57 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Thu, 22 Jun 2017 14:48:57 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1263.000;
	Thu, 22 Jun 2017 14:48:57 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [poky] [PATCH 3/3 v2] meta: Fix return value checks from
	subprocess.call()'s
Thread-Index: AQHS2u8+zfBp/dq+j0+MybW5e6K6EKItr5wAgAMh1ICAAAL9gA==
Date: Thu, 22 Jun 2017 12:48:57 +0000
Message-ID: <20170622124857.jygx7aot2xm2kvll@hiutale>
References: <20170601125029.wli6reydiovo7xjk@hiutale>
	<1496332394-6615-1-git-send-email-mikko.rapeli@bmw.de>
	<20170620124824.ndyxisbbwhqt6fn5@hiutale>
	<CAJTo0LZDtOq9_s=+NjGzZ6Y_V=1WQZK9V=fgqCx3pJmF6WXiiw@mail.gmail.com>
In-Reply-To: <CAJTo0LZDtOq9_s=+NjGzZ6Y_V=1WQZK9V=fgqCx3pJmF6WXiiw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 3/3 v2] meta: Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Thu, 22 Jun 2017 12:48:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C3866D3510DE5646912C784901484313@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2017 at 01:38:15PM +0100, Burton, Ross wrote:
> On 20 June 2017 at 13:48, <Mikko.Rapeli@bmw.de> wrote:
>=20
> > The bitbake and scripts parts from this patch series were merged alread=
y,
> > but
> > this not.
> >
> > Are there problems with this patch?
> >
>=20
> Sorry, didn't get around to replying.  It doesn't apply to master, can yo=
u
> rebase please?

Sure, no problem. I'll rebase and send again.

-Mikko=

