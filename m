Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id 0D45170A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 09:00:04 +0000 (UTC)
Received: from ad.chargestorm.se (83.252.255.124) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 27 Oct 2014 10:00:02 +0100
Date: Mon, 27 Oct 2014 09:59:31 +0100
From: Anders Darander <anders@chargestorm.se>
To: Chong Lu <Chong.Lu@windriver.com>
Message-ID: <20141027085931.GA27393@ad.chargestorm.se>
Mail-Followup-To: Chong Lu <Chong.Lu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1414394124.git.Chong.Lu@windriver.com>
	<1c4ed8e4a604bcd7c7fd2609024f8fbfca43d1a4.1414394124.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1c4ed8e4a604bcd7c7fd2609024f8fbfca43d1a4.1414394124.git.Chong.Lu@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: add bash to RDEPENDS
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
X-List-Received-Date: Mon, 27 Oct 2014 09:00:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Chong Lu <Chong.Lu@windriver.com> [141027 08:19]:
> systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bash,
> but no providers in its RDEPENDS [file-rdeps]

How much bashisms are it in the files in systemd-kernel-install?
Would it be possible to to patch the scripts to use standard posixh sh
instead of bash?

It's always good/nice to not force bash to be installed.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

