Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC8065DB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 20:50:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7MKoHCh020678
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Aug 2014 13:50:17 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 13:50:16 -0700
Date: Fri, 22 Aug 2014 15:49:54 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140822154954.04d4fc02@e6410-2>
In-Reply-To: <20140822193910.GD20524@jama>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Fri, 22 Aug 2014 20:50:31 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 22 Aug 2014 21:39:10 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> Even enabling thumb seems wrong, because ARM_INSTRUCTION_SET is arm by
> default, so this change is only renaming the feed, but still building
> the same binaries (unless distro sets ARM_INSTRUCTION_SET).

I think that's okay, because the point is to correctly indicate that
the CPU can run thumb binaries if someone had a reason to make them.

I mean, strictly speaking, I don't even *know of* an actual chip for which
armv7a-neon is a correct descriptor. Because "armv7a-neon" is a chip which
*cannot* run thumb binaries. Does anyone actually make a neon armv7a which
can't run thumb binaries?

And yeah, the RFC and ensuing discussion gets to some sort of underlying
questions about what the purpose of DEFAULTTUNE is. I am inclined to think
that the DEFAULTTUNE for a given tune-foo should be either the baseline of
that chipset or a somewhat optimized tune for it.

I note that tune-core2 and tune-corei7 both set tunes (core2-32, corei7-64)
which include target-specific optimizations; this would be comparable to
using cortexa9t-neon as the default tune for tune-cortexa9.inc.

I don't think the current state of tunings reflects a completely consistent
view of what DEFAULTTUNE means in a tuning file.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

