Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5A975552
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 15:44:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5JFiAe2023600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 19 Jun 2018 16:44:11 +0100
Message-ID: <354e0183f7a4555735bce4302699c0238cba220e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Devarsh Thakkar <DEVARSHT@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Tue, 19 Jun 2018 16:44:10 +0100
In-Reply-To: <CO1PR02MB094A87B564E37542202D983BC7D0@CO1PR02MB094.namprd02.prod.outlook.com>
References: <CO1PR02MB094A87B564E37542202D983BC7D0@CO1PR02MB094.namprd02.prod.outlook.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] matchbox-terminal: Update commitID
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
X-List-Received-Date: Tue, 19 Jun 2018 15:44:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-06-14 at 07:40 +0000, Devarsh Thakkar wrote:
> Hi Richard, Ross
> 
> > Message: 2
> > Date: Mon, 11 Jun 2018 14:39:53 +0100
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > To: Devarsh Thakkar <DEVARSHT@xilinx.com>,
> > 	"openembedded-core@lists.openembedded.org"
> > 	<openembedded-core@lists.openembedded.org>
> > Cc: Maulik Desai <maulikd@xilinx.com>,	Varunkumar Allagadapa
> > 	<VARUNKUM@xilinx.com>
> > Subject: Re: [OE-core] [PATCH] matchbox-terminal: Update commitID
> > Message-ID:
> > 	<642b938d82295e3b7ce922dad711c63904d62ca5.camel@linuxfounda
> > tion.org>
> > Content-Type: text/plain; charset="UTF-8"
> > 
> > On Mon, 2018-06-11 at 12:39 +0000, Devarsh Thakkar wrote:
> > > Hi Richard,
> > > 
> > > Thanks for the quick review.
> > > Replies inline.
> > > 
> > > > Message: 5
> > > > Date: Sun, 10 Jun 2018 09:29:14 +0100
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > To: Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
> > > > 	openembedded-core@lists.openembedded.org
> > > > Cc: maulikd@xilinx.com, varunkum@xilinx.com, JAEWON@xilinx.com,
> > > > 	Devarsh Thakkar <devarsht@xilinx.com>
> > > > Subject: Re: [OE-core] [PATCH] matchbox-terminal: Update
> > > > commitID
> > > > Message-ID:
> > > > 	<56788cd154d9af0b6c9ea2ef78de23b1909fd7ee.camel@linuxfo
> > > > undati
> > > > on.org>
> > > > Content-Type: text/plain; charset="UTF-8"
> > > > 
> > > > On Sat, 2018-06-09 at 04:59 -0700, Devarsh Thakkar wrote:
> > > > > Pull in change which adds support for command line
> > > > > options (-e and --command) which can be used for
> > > > > launching programs or running commands in matchbox-terminal
> > > > > via command line.
> > > > > 
> > > > > Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
> > > > > ---
> > > > >  meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb 
> > > > > | 2
> > > > > +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > > terminal_0.1.bb b/meta/recipes-sato/matchbox-
> > > > > terminal/matchbox-
> > > > > terminal_0.1.bb
> > > > > index 4488191..b7fbee7 100644
> > > > > --- a/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > > terminal_0.1.bb
> > > > > +++ b/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > > terminal_0.1.bb
> > > > > @@ -10,7 +10,7 @@ DEPENDS = "gtk+3 vte"
> > > > >  SECTION = "x11/utils"
> > > > > 
> > > > >  #SRCREV tagged 0.1
> > > > 
> > > > I'm guessing the above comment is no longer valid, nor is the
> > > > value
> > > > of
> > > > PV?
> > > 
> > > Yes the comment is no longer valid I will remove that in V2.
> > > But the PV is still valid as matchbox-terminal package version is
> > > still 0.1 ( as set in AC_INIT at http://git.yoctoproject.org/cgit
> > > .cgi
> > > /matchbox-terminal/tree/configure.ac) even after this commit.
> > 
> > No, after your change its not the 0.1 release, its
> > 0.1+git<revision>,
> > its a different version sometime after 0.1.
> 
> Thanks for sharing, I got your point. I guess there are below
> possible solutions here :
> 1) set PV="${BPV}+gitr${SRCPV}" were BPV=0.1
> 2) move the tag 0.1 to ccbc3c70946b04313c6166ab0dfef21e5e83c289 for
> matchbox-terminal
> 3) Update a new tag at 0.2 at to
> ccbc3c70946b04313c6166ab0dfef21e5e83c289
> 
> Kindly let me know which of the above is preferred way.

I've pushed a 0.2 tag to matchbox-terminal so we should be able to
upgrade the recipe to use that.

Cheers,

Richard


