Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com [67.219.250.116])
 by mx.groups.io with SMTP id smtpd.web12.7728.1595491603062635280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 01:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@opengear.com header.s=selector1 header.b=ETvPmXJ/;
 spf=pass (domain: digi.com, ip: 67.219.250.116, mailfrom: dan.callaghan@digi.com)
Return-Path: <Dan.Callaghan@digi.com>
Received: from [100.112.135.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.us-west-2.aws.symcld.net id 4B/61-23885-015491F5; Thu, 23 Jul 2020 08:06:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRWlGSWpSXmKPExsWSoW+eqSvgKhl
  vcO6IqMWdn+/YLdquz2J0YPLYOesuu8e5jSsYA5iiWDPzkvIrElgzZl/ULtjMXvHgdH4D4wy2
  LkYuDkaBpcwS/zteMEI4x1gk7jYuY4dwNjFKnPu5BCzDIrCDRWLPpR8sEJkeRol5K9+ygjhCA
  guYJHa9ucsO4dxnlDj8+gtzFyMHB7OAusT6eUJdjJwcbAIGEuvmTmUDsUUEFCWaW34zg9jMAg
  4Sy598YgUpFxbwkzjxQwUkzClgK7G78Q3YFCGBIonji9VBwiwCqhIPP91mAbF5gTo3rdnBCmK
  LCghLPDnSDDVRXqJ562xmkGskBKYwSixY0McEkhACumb16qdsEM2CEidnPgEbJCGgI/F3USPU
  L7uYJFYfbWKBWFwvMemRHESNtcTh7kXsELasxNGzc6B6fSWeLt7DDGFrSdxd/o8Rws6RmPjvG
  RvIGAmgvffX+0OE5SRO9Z5jgrBlJCbuucAygVF3FiKsZiH5YBaSQxcwMq9itEgqykzPKMlNzM
  zRNTQw0DU0NNI1NDbSNTIx0kus0k3SKy3WLU8tLtEFcsuL9Yorc5NzUvTyUks2MQJTSkpBy6c
  djA1vPugdYpTkYFIS5b1oLhkvxJeUn1KZkVicEV9UmpNafIhRhoNDSYLX0gUoJ1iUmp5akZaZ
  A0xvMGkJDh4lEV4DJ6A0b3FBYm5xZjpE6hSjJceEl3MXMXO8+7kYSG6eu3QRsxBLXn5eqpQ47
  yRnoAYBkIaM0jy4cbAUfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK86yFU8mXklcFtfAR
  3EBHSQ8l1RkINKEhFSUg1M6/VbMraHlk6/PV3atyFw/2r/NakPL7v95J7Vpv/DatuOKz6/1E4
  1bDvsVTpZTyo7g+HAhM/HK2WuCQvXMrd7GE7ZsuGdxYdVQeYPG103yZoWTygVWfl96cY5942m
  u5+QPl+Yyige4K1v7lVauljjV0Kf79MvL3USL53ZKK37p0YyZ/2xM3vjlwe/VFv7979bc1ehj
  2LY8wffP/B+TV381rAg5/5Bbc43wpoqpjw6xyI/cEw3SqjcXrbdcmr+ROtsxb+d6/bkzT4/4W
  z+/ZmTnqZN4bC5y+aleH+Nfx2nWbVHEn+qjtymNIfeGnvFKdG5254cOvf/deq3ndqrRb6d8D1
  48s2LU5Me8NopWm1SVWIpzkg01GIuKk4EAH8BGEo8BAAA
X-Env-Sender: Dan.Callaghan@digi.com
X-Msg-Ref: server-24.tower-345.messagelabs.com!1595491599!1245338!1
X-Originating-IP: [104.47.55.105]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10498 invoked from network); 23 Jul 2020 08:06:40 -0000
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) (104.47.55.105)
  by server-24.tower-345.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2020 08:06:40 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg0oe3dpiSWJdE6vco1k1yVCT+ogQOn8aoA13vRt0NeTHTo5Rxoy2hdtRSiDXhyqqSVhXkCsWAX3Ml81dS2ZY9cq5MraHDgPzp+ZolqMjiOcOPNulFNlHRMN8ZpJByfoTb9OV4lEWn47qFGiAtLsieb5LwwsZvC5wrajCbWDCZ072soDPv6tzTKjnkeisddjABOv8frmAMNuDqtjc6/r+4haU9yzMfVpZjGiblsRYdjlRXyrBrOo8icCMrPJWNsQU4VqXmfxP5iZQnU9JyLONmlDdWho8FrRjyrUzsZ3Dho47GMPMhvdJGnilb17eOQfmOgudIQp6y9+geWVMeonpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSyBmlDc5eODqQCHquQLDIvKD9Knsz2wF4Fl8R23K8M=;
 b=ki3AgMTqW8QcJCxTZPBU/bz97OkhQ+mq6rA3boAmYsLMZ5KEaCCvXaYe2jlpyn6b79DJ7bnankSfL47qta2niyjChBSj7lyIq+xCpgmeYZd3VqkjBnqAyqur/C8pDk+70lkn4nkAdQ6/Tgc780CJXOzTWQh6Z2/AZRbOP/SRx5EHUG53ZmXzC6G1epnQsmPxSPJnrnpV3ec6kFxLs+/UBsM8fb7bL9AqtFfcImcwniHv62rp49H6k1HR4aVuV/uYK3J8bqdIM7al/QFe2MmANxdilZt2Bva7g1deIZA2VyEk5bfarF6jIFxEBDr8fwAa2aP0F7mU1GYyHJ/FTzXAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSyBmlDc5eODqQCHquQLDIvKD9Knsz2wF4Fl8R23K8M=;
 b=ETvPmXJ/d9KZtZ+nRwgTqAVOWcDvKbwW1se/idwFTQLdbC4FVGwnwl5NlVY1WPR857U9y1QL9UnKzjF4CnMIJrAD6btyG3eXSIj/4JaH3KPfELEPU/Yw7SXx2qrIuiYISkJ62Br+B/sBH2R2wJdoRDYuH2K8kjPyPXkd+UhoWyKCoHIqPzApWvO9X5kw1yikVzOEj8Pb12z/2+kDyRBpn8q4RwNarB0txYHZbx1J6Vtq81VJ2lZ0nVfRAjlL9ebn0BYiLKgZOFB8GBOpW5Qc8SNTEyxIL6A3WqIjQY5DKKP7xaHXY1uolob0Qola1ej8VDbWQhKIF9roN1ObdOIMnQ==
Received: from CY4PR10MB1944.namprd10.prod.outlook.com (2603:10b6:903:124::10)
 by CY4PR10MB1560.namprd10.prod.outlook.com (2603:10b6:903:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Thu, 23 Jul
 2020 08:06:38 +0000
Received: from CY4PR10MB1944.namprd10.prod.outlook.com
 ([fe80::c052:ad1d:f718:ee45]) by CY4PR10MB1944.namprd10.prod.outlook.com
 ([fe80::c052:ad1d:f718:ee45%7]) with mapi id 15.20.3216.021; Thu, 23 Jul 2020
 08:06:38 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] stress-ng: create a symlink for /usr/bin/stress
In-reply-to: <ab49af9a-8aa4-9767-e6b9-daa18682b34f@gmail.com>
References: <20200723043127.2821063-1-dan.callaghan@opengear.com> <ab49af9a-8aa4-9767-e6b9-daa18682b34f@gmail.com>
Date: Thu, 23 Jul 2020 18:06:29 +1000
Message-Id: <1595491143-sup-2728@galangal.danc.bne.opengear.com>
User-Agent: Sup/git
X-ClientProxiedBy: SYBPR01CA0137.ausprd01.prod.outlook.com
 (2603:10c6:10:5::29) To CY4PR10MB1944.namprd10.prod.outlook.com
 (2603:10b6:903:124::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (2001:44b8:21b0:d600:329c:23ff:fef3:d4d4) by SYBPR01CA0137.ausprd01.prod.outlook.com (2603:10c6:10:5::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Thu, 23 Jul 2020 08:06:37 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id A82834219D48; Thu, 23 Jul 2020 18:06:29 +1000 (AEST)
X-Originating-IP: [2001:44b8:21b0:d600:329c:23ff:fef3:d4d4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a45c6c73-dc17-46bf-a864-08d82edf52fc
X-MS-TrafficTypeDiagnostic: CY4PR10MB1560:
X-Microsoft-Antispam-PRVS: 
	<CY4PR10MB15608E169B8299CE76596D4790760@CY4PR10MB1560.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6K1X4sVJ4JpJIcBSgZ41M76OrRbxdhrhCYDH+X5lc/Ux8jhhhGPhILZqJVrYPcP5PL0Or9ZAGJhD1D0l/hB4NOIgXAQkfij5a/DjH9C3k4sGsNv7xfZgMaj9V/uY99cOhyXcEiMyBie4QzuXSEQ7NHg06HxIcThOCbi84UOCfh1mXgYX9chFDhOcrGSuZIVRsvjw8l/Qyd3w6X0YltJu1ZRdIfS2kyn7kMf/VOHDqLSiLXV8385BPT84t/JeoXeSXOyJ9M9I550LZHZ3mpyA4TyC4/EF5jGURm5YFoiYxnj35C6Fb4tCt2rIbJHQgJ/l+alZdPsbDMa3i3RmjeEY6Cj7CEu+nJj8mZER0qvoC/IHHBIxZaGnQRh9P1pQzNGWgt17nyfi5cl24bfXsJFnGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR10MB1944.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39830400003)(376002)(396003)(136003)(346002)(366004)(66946007)(44832011)(66556008)(6266002)(83170400001)(66476007)(478600001)(83380400001)(8676002)(5660300002)(4326008)(8936002)(52116002)(426003)(4744005)(42186006)(6916009)(186003)(316002)(42882007)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	BZ6Q11LN6tTasgRhqbgxlWfauLE8+EYCAKnPKvlQbwOL/kMT8ICS7zcJZVIU+9ElVI0d3BP92ne6PU18zOll4JQ4nPHHuVnKsBUdz4+GGU9N470Z7wWa9iyMw0TBh8uvhBkPMeoMJn1B7sDDolM0dNG+XvZWm7hZHDAnojr6cfzxxgfb1EKePTIgWS3qXocjuWHwEaBXMp1MxRsyOzkYpeqoRRgx3wJFhAqi6BZ/GHJllEkIRkk9U9EAVyqntGHcztRebXYEAplZVc6C2bapExKahMS2oo/9NSy0CLBtfnu7/kEYKIW1LxPJe/1osgBt2b3+lhH4zm3s6tL8ue4OWNRb8z2vRXUoS2mQ5r2MJVFIUQ/zpIYaTfPhr+0jP9FAqPWL4/Xrnb+/FvT3bAqK2zfFsn1kKdjhFTwVOGgJeChQS2nDmiusJCbimpLeU6/puZi5Brw1e1aAQumuJ6uOm8sHocugzy7hHqkeLNHBDaunoQYbZAjA7KsOjDudiq6QjXXffg29+zXNQVsPZZK/VCDOiO0xR2KOBHhkficT6uw=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45c6c73-dc17-46bf-a864-08d82edf52fc
X-MS-Exchange-CrossTenant-AuthSource: CY4PR10MB1944.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 08:06:38.0358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibM9ahimY33BGgS+0rZLbeT1XHF9g3qJx1TOe4QZMOBe+r3+yCEHXpJunS45rqhLOrvXnfl7MSQp8wag5n0sZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1560
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Excerpts from Khem Raj's message of 2020-07-22 23:09:23 -07:00:
> there is stress recipe in some layers which could provide stress 
> utility as well, therefore it should be using update-alternatives 
> mechanism so it fills in when stress is not provided by say stress 
> recipe.

Hmm... The stress-ng recipe already RPROVIDES stress though. Doesn't 
that make it incompatible with any other existing stress recipe and 
update-alternatives?

Personally I think alternatives is overkill here, and stress-ng should 
not RPROVIDES stress at all (that is, revert commit 72641004). In that 
case, we would have noticed that the stress recipe had been removed from 
oe-core and we could have just updated our image accordingly to depend 
on stress-ng instead.

> secondly please use ${D}${bindir}/stress instead of hardcoding the path

Oops, yes of course.

-- 
Dan Callaghan <dan.callaghan@digi.com>
Software Engineer
Opengear <https://opengear.com/>
