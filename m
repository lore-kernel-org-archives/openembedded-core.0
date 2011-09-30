Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9lbT-0005cO-4F for openembedded-core@lists.openembedded.org;
	Sat, 01 Oct 2011 00:30:47 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UMVbf8013385; Fri, 30 Sep 2011 23:31:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hJf65fFqfPcu; Fri, 30 Sep 2011 23:31:37 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UMVVVx013358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 30 Sep 2011 23:31:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 23:25:04 +0100
In-Reply-To: <CAEsOVNcEkg_=xSWg2Z-k+NM7F21NqT_j2gLnjkQys1_RZU-jmg@mail.gmail.com>
References: <1317347777-10288-1-git-send-email-msm@freescale.com>
	<1317374475.12332.134.camel@ted>
	<CAEsOVNdKPk833GDMYrjGgjOMhmOxGWPzevEWUy3CzUsa2LCHSw@mail.gmail.com>
	<CAEsOVNcEkg_=xSWg2Z-k+NM7F21NqT_j2gLnjkQys1_RZU-jmg@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317421512.4454.5.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] Add bash as RDEPENDS for gstreamer
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
X-List-Received-Date: Fri, 30 Sep 2011 22:30:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 16:30 +0000, McClintock Matthew-B29882 wrote:
> On Fri, Sep 30, 2011 at 10:47 AM, Matthew McClintock <msm@freescale.com> wrote:
> > On Fri, Sep 30, 2011 at 4:20 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> What image target are you building? I'm having trouble visualising an
> >> image that doesn't include bash or busybox and if either of these are
> >> present, that dependency should be met...
> >>
> >> If this is a toolchain/SDK, there were some recent tweaks which address
> >> this problem.
> >
> > It was meta-toolchain-sdk, please drop this patch if that is the case.
> 
> FYI, I've been testing this on the 'edison' branch. Seems like this
> should be addressed - assuming someone else can reproduce this
> issue...
> 
> Any comments?

I think we were missing a fix, I've sent out a patch which I think
should resolve this once and for all.

Cheers,

Richard



