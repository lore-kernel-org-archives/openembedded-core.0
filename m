Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 096436018F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 20:54:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t12KsRh3002752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Feb 2015 12:54:27 -0800 (PST)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 12:54:27 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 2DE30E1D124; Mon,
	2 Feb 2015 15:54:30 -0500 (EST)
Date: Mon, 2 Feb 2015 15:54:30 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150202205429.GC3394@windriver.com>
References: <1422662905-3598-1-git-send-email-paul.gortmaker@windriver.com>
	<5253630.c2vWHxRG0u@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <5253630.c2vWHxRG0u@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtools: add a bb for git-manpages
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
X-List-Received-Date: Mon, 02 Feb 2015 20:54:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [OE-core] [PATCH] devtools: add a bb for git-manpages] On 02/02/2015 (Mon 17:04) Paul Eggleton wrote:

> Hi Paul,
> 
> On Friday 30 January 2015 19:08:25 Paul Gortmaker wrote:
> > These could be created from scratch from git itself, but it
> > requires asciidoc, xsltproc, python bits and too much other
> > baggage.  Since the git folks issue a tarball with the manpages
> > for each release, it is simpler to just go get that.
> 
> I'm just wondering, would it be simpler to just do this as part of the git 
> recipe itself and have the manpages go into git-doc? Then you would get the 
> documentation automatically if you had git in your image and doc-pkgs in 
> IMAGE_FEATURES, plus we wouldn't have to remember to upgrade this every time 
> we upgraded the git recipe.

I'm sure we can do that if desired.  It is probably worth mentioning
that I had this standalone recipe off in a layer for a while, and after
discussions on how to deal with coreutils and the mess it creats with
the openly hostile to cross-compile "help2man" that the idea of a
separate bb for manpages appeared acceptable.  So, based on that, I
figured it was time to post my git-manpages bb.

This brings me back to coreutils -- should we source prebuilt manpages
within the main recipe there too, or do a coreutils-manpages.bb  ?

P.
--

> 
> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre

