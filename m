Return-Path: <clemens.lang@bmw-carit.de>
Received: from cit-hm8-gw01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 109C9758DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 14:27:30 +0000 (UTC)
Received: from [10.40.100.14] (port=47485 helo=cit-hm8-mail01.bmw-carit.de)
	by cit-hm8-gw01.bmw-carit.de with esmtps (TLSv1.2:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1bbqCC-0008TC-1B; Mon, 22 Aug 2016 16:27:24 +0200
Received: from clang-buildbox.bmw-carit.intra (172.20.20.251) by
	CIT-HM8-EX02.bmw-carit.intra (10.40.100.14) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Mon, 22 Aug 2016 16:27:23 +0200
X-CTCH-RefID: str=0001.0A0C0201.57BB0BCC.00C6, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 16:27:10 +0200
Message-ID: <20160822142711.26042-1-clemens.lang@bmw-carit.de>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <2e948106-ac15-2c16-5bb6-f234079be725@embed.me.uk>
References: <20160822130516.5719-1-ml@embed.me.uk>
	<84941321-4129-4a17-7eea-2fbea6513369@embed.me.uk>
	<CAJTo0Lb6fi9Xa1oeEb4KjsBNM0Hh9nfaWpp4L1ap+Z1_j6aUvQ@mail.gmail.com>
	<2e948106-ac15-2c16-5bb6-f234079be725@embed.me.uk>
MIME-Version: 1.0
X-Originating-IP: [172.20.20.251]
X-ClientProxiedBy: CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) To
	CIT-HM8-EX02.bmw-carit.intra (10.40.100.14)
Subject: Re: [PATCH] cmake: install path variables should be relative to the prefix path
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
X-List-Received-Date: Mon, 22 Aug 2016 14:27:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

here's a patch to call CMake with relative paths for some variables.
We're using this in production since Nov 2015 without issues. We also
reported this upstream and confirmed that CMake expects relative paths.

HTH,
-- 
Clemens Lang • Development Specialist
BMW Car IT GmbH • Lise-Meitner-Str. 14 • 89081 Ulm • http://bmw-carit.com
-------------------------------------------------------------------------
BMW Car IT GmbH
Geschäftsführer: Michael Würtenberger und Alexis Trolin
Sitz und Registergericht: München HRB 134810
-------------------------------------------------------------------------

