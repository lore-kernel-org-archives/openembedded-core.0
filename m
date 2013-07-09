Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 882786AFB6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 13:41:54 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 4so5199488pdd.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=FmOgtL84Xkwu9cO8pFBQcYj0FkUl7EkAJawXRRaELZY=;
	b=yv+9OxfILIU9xq12OF+ZhJJjbnDxXFk0Jm6OJ1weFK9jsiyJZzeOLWpp7bYTREaV3D
	6u8t4OIIFEk88YYARX80rUoaaMBubCwMnpKHOHNOT1jWEdp7Je9kMqYwM441McaI0EBo
	AOhI8P4moLy/4PmJU8oZuorS5DVfZLFSjmt3WKjn5JixDpMwy5JVUKzULYOUH8wXqXUJ
	8VqNG7ylxhaLV40kkVwnCirNn5Z1d+/QJlJvcMZyalurQ7usVYZlfl4e9FA07CWO8cxh
	adAB4k9lsGPEUuf4KS8NXgixxsOYaKaDBTG0SeiRfGwP87s1ok8kn6IOC/3cAoEoOOir
	TMIw==
X-Received: by 10.66.144.199 with SMTP id so7mr27745352pab.99.1373377315314;
	Tue, 09 Jul 2013 06:41:55 -0700 (PDT)
Received: from sa-nc-spg-194.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	wi6sm28358500pbc.22.2013.07.09.06.41.53 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Jul 2013 06:41:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1402577.4PhkADxV84@helios>
Date: Tue, 9 Jul 2013 06:41:52 -0700
Message-Id: <BA60025F-25B9-4A09-A54E-9419C57B427E@gmail.com>
References: <cover.1373372649.git.hongxu.jia@windriver.com>
	<4535187.OqzhIf4Y4R@helios> <51DC1027.9030801@windriver.com>
	<1402577.4PhkADxV84@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Tue, 09 Jul 2013 13:41:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 9, 2013, at 6:38 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Tuesday 09 July 2013 21:29:11 Hongxu Jia wrote:
>> 1, 3.15.1 is the newest version, and file structure has more change =
than
>> previous version.
>>=20
>> 2, 3.13.3 just skip signing, and cheksum file doesn't be generated.
>>=20
>> 3, 3.13.3 doesn't completely fix incorrect shebang of perl (PATCH =
5/5)
>>=20
>> 4, 3.13.3's package doesn't contain ${D}${bindir}/  and =
${D}${sysconfdir}
>>=20
>> I think 3.15.1 is better.
>=20
> The reason I ask is that if merged this will effectively replace the =
one in=20
> meta-browser, so as long as it handles everything that the =
meta-browser recipe=20
> does it should be OK.

meta-browser has deleted the dependency on mss-native since the recipes =
needing it meta-browser(chromium) got updated
and does not need it. So for meta-browser it doesn't matter anymore.

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


