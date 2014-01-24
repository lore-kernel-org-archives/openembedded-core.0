Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 65A5F6E8B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 20:56:09 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W6nnM-00077s-IO; Fri, 24 Jan 2014 21:56:08 +0100
Message-ID: <1390596961.24755.21.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
Date: Fri, 24 Jan 2014 20:56:01 +0000
In-Reply-To: <c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390326205.874.95.camel@ted>
	<c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Thu, 2014-01-23 at 18:22 +0000,
	alexandru.sardan@freescale.com
	wrote: > [Alex Sardan] No. The more generic target powerpc-none-linux
	will
	not > generate SPE code and the powerpc-none-linux-gnuspe target that
	generates > SPE will not be able to generate Altivec. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: "catalin.udma@freescale.com" <catalin.udma@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Fri, 24 Jan 2014 20:56:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-23 at 18:22 +0000, alexandru.sardan@freescale.com wrote:
> [Alex Sardan] No. The more generic target powerpc-none-linux will not
> generate SPE code and the powerpc-none-linux-gnuspe target that generates
> SPE will not be able to generate Altivec.

Why not?  As far as I can tell from the gcc configury, the target string
only affects the defaults (i.e. powerpc-*-linux gets -mno-spe
-mno-altivec, powerpc-*-linuxaltivec gets -maltivec -mno-spec, and
powerpc-*-linuxspe gets -mno-altivec -mspe).  There doesn't seem to be
any real impact beyond this that would make the compiler binary
fundamentally incapable of generating either type of instruction if you
pass the appropriate options on the command line.

p.



