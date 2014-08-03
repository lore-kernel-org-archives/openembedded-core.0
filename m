Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0514F6FD62
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Aug 2014 11:42:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s73BfVUd016306; Sun, 3 Aug 2014 12:42:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ke0U3jkTNbxV; Sun,  3 Aug 2014 12:42:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s73Bg3Nn017882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 3 Aug 2014 12:42:05 +0100
Message-ID: <1407066123.6981.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 03 Aug 2014 12:42:03 +0100
In-Reply-To: <CAMKF1spACB-2W=pAuqRSngx2+S0f3Q8a3LhEV3FcwVmGWkC3GQ@mail.gmail.com>
References: <1406969253.6981.14.camel@ted>
	<CAMKF1spACB-2W=pAuqRSngx2+S0f3Q8a3LhEV3FcwVmGWkC3GQ@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools: Fix warning for odctools-crosssdk
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
X-List-Received-Date: Sun, 03 Aug 2014 11:42:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-08-02 at 10:51 -0700, Khem Raj wrote:
> On Sat, Aug 2, 2014 at 1:47 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > odcctools-crosssdk doesn't use the suffixed naming the rest of crosssdk does
> > and this results in a annoying build warning. Avoid this.
> 
> why does odcctools behave like that.

This is the way crosssdk used to behave, it doesn't have some of the
changes we made to cross(sdk) in the core. Given the way its used, there
isn't much point in updating it though.

Cheers,

Richard


