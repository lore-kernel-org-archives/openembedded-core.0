Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2BC77690
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 22:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2GMDhhD025378; Thu, 16 Mar 2017 22:13:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mT02WbzDAeXZ; Thu, 16 Mar 2017 22:13:43 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2GMDebw025373
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Mar 2017 22:13:41 GMT
Message-ID: <1489702420.13980.130.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 22:13:40 +0000
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF2971C7@ALA-MBC.corp.ad.wrs.com>
References: <1489684755-27165-1-git-send-email-jslater@windriver.com>
	<007BD92917A2324FA403BCF9A464CF84CF2971C7@ALA-MBC.corp.ad.wrs.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [v2][PATCH 1/1] build-compare: add date to PV
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
X-List-Received-Date: Thu, 16 Mar 2017 22:13:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-16 at 17:28 +0000, Slater, Joseph wrote:
> Given that PV for *_git recipes should now be specified and
> start with a version, it would be nice to shorten (or eliminate)
> SRCPV.  At least get rid of the AUTOINC.  Perhaps shorten the
> amount of SRCREV included.  The point is that as currently
> computed, PV will be far longer than the useful information
> it provides.

I thought we already did?

e.g. for the kernel you see packages like:

kernel-module-xt-u32-4.10.0-yocto-standard_4.10+git0+805ea440c7_b259a5d744-r0.30_qemux86_64.ipk

which has several shortened hashes in it.

Cheers,

Richard

