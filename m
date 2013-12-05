Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 045526DF96;
	Thu,  5 Dec 2013 22:23:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5MNSa5031120; Thu, 5 Dec 2013 22:23:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3U9T27aR_DTx; Thu,  5 Dec 2013 22:23:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5MNQKr031116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Dec 2013 22:23:27 GMT
Message-ID: <1386282201.25847.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>
Date: Thu, 05 Dec 2013 22:23:21 +0000
In-Reply-To: <52A0FBC5.6090009@balister.org>
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
	<1386203938-13338-2-git-send-email-ross.burton@intel.com>
	<52A0FBC5.6090009@balister.org>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cmake: respect ${S} and ${B}
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
X-List-Received-Date: Thu, 05 Dec 2013 22:23:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-12-05 at 17:18 -0500, Philip Balister wrote:
> On 12/04/2013 07:38 PM, Ross Burton wrote:
> > Instead of the class-specific variables OECMAKE_BUILDPATH and
> > OECMAKE_SOURCEPATH, just use ${B} and ${S}.
> > 
> > If these two paths are different, delete any existing ${B} before running a
> > build so that previous builds don't taint the current build.
> > 
> > Note that OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH are not respected at all, so
> > recipes that manually set these in the past will need to be updated to either
> > use something along the lines of separatebuilddir.inc or set B themselves.
> 
> I'm carrying EXTRA_OEMAKE = "-C $(OECMAKE_BUILDPATH)" in recipes. It
> looks like this removes the need for this also? My cmake invocation is
> rusty :)

do_compile runs by default in ${B} so in most cases that shouldn't be
needed. The new equivalent would be "-C ${B}" but that shouldn't be
needed in most cases.

Cheers,

Richard


