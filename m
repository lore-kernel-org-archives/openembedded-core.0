Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B317A6ACE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 21:56:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6BLucWt021500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jul 2014 14:56:38 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 11 Jul 2014 14:56:38 -0700
Date: Fri, 11 Jul 2014 16:56:35 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140711165635.372f66f3@e6410-2>
In-Reply-To: <1405114369.21289.95.camel@ted>
References: <cover.1405110050.git.peter.seebach@windriver.com>
	<0cbfa0da548acdef1a4ab12cb708c699a495dd7f.1405110050.git.peter.seebach@windriver.com>
	<CAJTo0Lay1CB_BumWQDDLHrS2i2XkiE99TamO3bwMH86_=P8gFg@mail.gmail.com>
	<20140711152449.08d84fdc@e6410-2> <1405114369.21289.95.camel@ted>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.0.bb: uprev to pseudo 1.6
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
X-List-Received-Date: Fri, 11 Jul 2014 21:56:41 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 11 Jul 2014 22:32:49 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> The issue is the lack of the xattr headers from what I saw, not the
> xattr support itself and we're missing what looks like a single define.
> For the complexity, I did wonder if we should ship a default...

Hmm. We could in theory add a test to the configure script for the header,
and just hard-code that value in a couple of places. I don't think we actually
need the header for much else. I don't know how stable that value is across
distros or anything, though. I assume it's pretty stable.

The main thing is that I've tried to avoid making dependencies on compile
checks like "can I compile something using this header" because those are
annoying and slow.
 
> Adding in the xattr-native dependency may well be easier than updating
> the docs on dependencies on all the different distros.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

