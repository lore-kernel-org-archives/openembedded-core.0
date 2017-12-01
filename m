Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B82CB785E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 21:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1AF6B18843;
	Fri,  1 Dec 2017 22:13:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qvmA3p5yPyPC; Fri,  1 Dec 2017 22:13:29 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5599B18842;
	Fri,  1 Dec 2017 22:13:29 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42D251A077;
	Fri,  1 Dec 2017 22:13:29 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37AA91A073;
	Fri,  1 Dec 2017 22:13:29 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri,  1 Dec 2017 22:13:29 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 2B0AC23D4;
	Fri,  1 Dec 2017 22:13:29 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 1BF299C0AD; Fri,  1 Dec 2017 22:13:29 +0100 (CET)
Date: Fri, 1 Dec 2017 22:13:29 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20171201211328.enhdinuar24niey7@axis.com>
Mail-Followup-To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<7bb6a35d-19ac-1b50-46c1-e0395a0fee61@windriver.com>
MIME-Version: 1.0
In-Reply-To: <7bb6a35d-19ac-1b50-46c1-e0395a0fee61@windriver.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Fri, 01 Dec 2017 21:13:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17-12-01 11:43 -0600, Mark Hatle wrote:
> The original implementation did not include the ',' options because different
> versions of file (as well as different architectures) would return different
> strings.
> 
> They all contains the same information, but order and inclusion of ',' changed
> regularly.
> 
> So I would caution that for this to check out a wide variety of host systems and
> architectures would need to be verified.  (It's very possible that all modern
> systems now conform to a single standard...)
> 
> (The rest of the serious looks like a very good improvement, and I've got no
> further comments on that.)

I was a little bit worried about this, thanks, this is useful
feedback. Perhaps dropping the "," while still retaining the
whitespace delimitation could be enough, and still work with a
variety of file implementations?

And while we're talking portability, is the use of GNU file's
--brief option a problem (as introduced by another patch in this
series)? It isn't specified in posix, I don't know how widespread
it is.

-- 
olofjn

