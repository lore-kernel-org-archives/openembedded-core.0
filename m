Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id E4E5760CE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 07:56:38 +0000 (UTC)
Received: from ad.chargestorm.se (83.252.255.124) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 13 Sep 2013 09:54:49 +0200
Date: Fri, 13 Sep 2013 09:56:36 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20130913075635.GA3573@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: u-boot-fw-utils -> u-boot-fw-utils-cross
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
X-List-Received-Date: Fri, 13 Sep 2013 07:56:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

As I've started to bring our internal distro and machines up to the
lates oe-core, I've got some issues with the u-boot-fw-utils to
u-boot-fw-utils-cross transition.

In my old branch, I used u-boot-fw-utils_2011.06. This used to compile
and package fw_printenv(setenv) just fine.

In the new, u-boot-fw-utils-cross_2013.07.bb, fw_printenv is now built
using HOSTCC instead of the cross-compiler. The old recipe used to
include:
EXTRA_OEMAKE = 'HOSTCC="${CC}"'
as u-boot defaults to build everything under tools/ using HOSTC.

What's the reason for this change? Currently fw_printenv is being built
for my host system, and not the target...

Further more, fw_printenv does not get packaged. I can see that
fw_printenv is installed in ${WORKDIR}/image, but never moved to
${WORKDIR}/package. I guess that this is caused by inheriting
cross.bbclass?

Am I missing something in my distro config, or have I overlooked
something else? fw_printenv doesn't really make sense for me to run on
the host, and is (in my case) rather essential on the target.

I guess that I'm doing something wrong; can anyone give me some hint on
where to look? Or do we have an issue with the u-boot-fw-utils-cross
recipe?

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

