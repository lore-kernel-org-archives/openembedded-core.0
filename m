Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Riy9R-00014d-2X
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 01:59:21 +0100
Received: (qmail invoked by alias); 06 Jan 2012 00:51:57 -0000
Received: from p4FDF0BFB.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.11.251]
	by mail.gmx.net (mp006) with SMTP; 06 Jan 2012 01:51:57 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18XS0N7MHcXp/QViiKgm5boCMkTh32TTb5JwrihXa
	L3m/zHrfDT+9zK
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jan 2012 01:52:57 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <cover.1325649220.git.scott.a.garman@intel.com>
	<4F0640F7.50903@linux.intel.com>
In-Reply-To: <4F0640F7.50903@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201201060152.57498.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 0/7] New QA tests for unsafe references to exec_prefix [v2]
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
X-List-Received-Date: Fri, 06 Jan 2012 00:59:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday, January 06, 2012 01:31:51 AM Saul Wold wrote:
> On 01/03/2012 07:56 PM, Scott Garman wrote:
> > Hello,
> > 
> > This is a P2 feature for Yocto 1.2. It adds two new QA tests to check
> > files in base_bindir, base_sbindir, and base_libdir for references to
> > files under exec_prefix (e.g, dynamic linking for binaries and
> > references to exec_prefix in scripts).
> > 
> > The reason for these tests is that exec_prefix (typically /usr) can
> > be kept on a separate partition that may be mounted late in the boot
> > process, or may not be mounted at all during system recovery
> > operations.
> > 
> > It was my original goal to make the dynamic linking test a QA error
> > upon failure, but it turned out the amount of recipe work needed was
> > much larger than I expected. So for the time being they have been
> > changed to generate QA warmings.
> > 
> > The libraries I've moved to base_libdir in this pull request should
> > take care of all binaries in /bin and /sbin for packages we include
> > in core-image-minimal and -sato.
> > 
> > I would like to ask recipe maintainers to look for these QA warnings
> > and fix them ASAP, as I believe we'll be changing this to a QA error
> > before the release of 1.2.
> > 
> > This is a second pull request that is rebased against the latest
> > master with merge conflicts resolved, and only sets BUILD_LDFLAGS
> > in ncurses.inc for virtclass-native.
> > 
I missed that and it explains first part of [1]. Wondering how long this will us 
take...

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-
January/015667.html


