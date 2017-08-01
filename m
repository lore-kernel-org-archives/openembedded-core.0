Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2129778276
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 10:28:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v71ARjtX032667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 1 Aug 2017 11:27:47 +0100
Message-ID: <1501583265.18633.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 01 Aug 2017 11:27:45 +0100
In-Reply-To: <20170731174832.GV26405@denix.org>
References: <1501273600-109472-1-git-send-email-denis@denix.org>
	<CAJ86T=WdvrPzvz6325onhpMWxgdOz5weZ=hUSSVXo94NzoA7Cw@mail.gmail.com>
	<20170731174832.GV26405@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 01 Aug 2017 11:27:47 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2] autoconf: fix mistakes in SUMMARY and DESCRIPTION
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
X-List-Received-Date: Tue, 01 Aug 2017 10:28:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-07-31 at 13:48 -0400, Denys Dmytriyenko wrote:
> On Fri, Jul 28, 2017 at 04:47:40PM -0700, Andre McCurdy wrote:
> > On Fri, Jul 28, 2017 at 1:26 PM, Denys Dmytriyenko <denis@denix.org
> > > wrote:
> > > @@ -1,5 +1,5 @@
> > > -SUMMARY = "A GNU tool that procude shell scripts to
> > > automatically configure software"
> > > -DESCRIPTION = "Autoconf is an extensible package of M4 macros
> > > that produce shell scripts to automatically \
> > > +SUMMARY = "A GNU tool that produces shell scripts to
> > > automatically configure software"
> > > +DESCRIPTION = "Autoconf is an extensible package of M4 macros
> > > that produces shell scripts to automatically \
> > The DESCRIPTION was correct originally (since it's the M4 macros
> > which
> > produce the shell scripts, not the extensible package).
> > 
> > https://www.gnu.org/software/autoconf/autoconf.html
> Good thing Richard picked up v1 of the patch then! :)

That was in fact based on this mail thread! :)

Cheers,

Richard

