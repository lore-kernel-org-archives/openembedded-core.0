Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SrVo3-0006yc-3r
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 17:04:51 +0200
Received: by yenl13 with SMTP id l13so1525594yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Avyj1F59VSdpjkl0LoaR9YcVvsY0O31fGjGzfFZF5t8=;
	b=dY+HFAwUiCOBOnifEePwKedtJeiB5bF3DIw+LMrPPKADfHp3EBVO3Xf74S6rfNY7aY
	F4hsxYCpxUo8T/ffvsGl62kYVDQqGV249LHaRrmo2Qq9SbyBftCCOjMibK17xNNLkK/E
	+/Gw3ZBSHwQip7lfv8P/R9J+2q8dXw3OhxBJLSwc1FgK8/ObNodJfXpkngTKUs2HYSsm
	G6fNiuIddsIHlL5n++jY6BzrjrxVF/Jf/bO4MuE05nxaiKj12R8MWPro8xZSWMFWzsA2
	SHey8st3mlf7dDOI5SvvLFEC2LIJQL+6aQXWdp0BS/MNZlH3IosUWi/1QARyyGtIfN5+
	zTig==
MIME-Version: 1.0
Received: by 10.50.192.170 with SMTP id hh10mr2341598igc.36.1342623209796;
	Wed, 18 Jul 2012 07:53:29 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Wed, 18 Jul 2012 07:53:29 -0700 (PDT)
Date: Wed, 18 Jul 2012 16:53:29 +0200
Message-ID: <CALbNGRSSusDKWfdEMVH5hY1fA2gpxhLrJ2dTE7SEHx1o7QU+3Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: build crashes immediately at build clean sstate/tmp dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 15:04:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I just updated all repos / deleted all tmp / sstate and get

ERROR: Only one copy of bitbake should be run against a build directory

Any ideas?

Andreas


