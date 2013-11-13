Return-Path: <mian.muhammad.tauqir.ahmad@gmail.com>
Received: from mail-lb0-f196.google.com (mail-lb0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 081046D726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:40:21 +0000 (UTC)
Received: by mail-lb0-f196.google.com with SMTP id w7so615258lbi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ha30DW7yLbu5yR+RQey+K7vrAe+T7NbrTn4EUOePNRw=;
	b=GyRID2i6Y9bPAgqLgKMrSpHNbu++e6qP9W/th2iO6iV3uwDWJaUD7FgmyMEdkiu53v
	ZRuLyjYqMKnYSwTOQQoALU2Vtv1dXGwWH40SpgqQKx3PUFHCo+KafsEpaZaGAq5pGRPu
	+TbdPItWHy2WgUeT5y9chkB7utBSyYaqkVlf954dfIlyvAygw4DfqwYzIsMXDU5L40AR
	xRqDxyMAYiHkD7QbAtg8aaqA2MXv1E1xu+9JGF60bDLj6d3qAhngtiHYAOHE2zi+f7II
	sLWDeFtEUx4z0Es9q8Igd8dS37n+oa76OwEC/pri2kvhEQtj18Yh4TtvmYaUh9xslP0k
	gqyg==
MIME-Version: 1.0
X-Received: by 10.152.6.169 with SMTP id c9mr8998261laa.28.1384306823096; Tue,
	12 Nov 2013 17:40:23 -0800 (PST)
Received: by 10.112.89.170 with HTTP; Tue, 12 Nov 2013 17:40:23 -0800 (PST)
Date: Tue, 12 Nov 2013 20:40:23 -0500
Message-ID: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
From: Muhammad Tauqir Ahmad <mian.muhammad.tauqir.ahmad@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Exploring LLVM/Clang for OE
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
X-List-Received-Date: Wed, 13 Nov 2013 01:40:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am trying to explore the possibility of using LLVM+Clang for
building OE-core images.
The first objective might be to try to build (poky-tiny's)
core-image-minimal? That is the smallest image we know of so maybe
that's a good starting point?

Right now, I am looking at how to build LLVM+Clang cross-compiler
using bitbake and am trying to adapt the llvm3.3 recipe from meta-oe.
As far as I can tell, it doesn't build any tools (doesn't build Clang)
so I am looking at how to modify it to build Clang as well or maybe
just write a new recipe for clang3.3.

The email is meant as an RFC. I would appreciate any pointers and help
I could get with this.
I would also be interested in finding out if and how much work has
been done to try to use LLVM+Clang for OE in the past. If, e.g.,
someone already has the bitbake recipes to get me started and getting
some basic userspace packages to build with LLVM+Clang, it would be
really helpful and avoid duplicate work.
If someone is already working on this, I could work with them.

Any other general or specific comments would also be helpful.

Thanks.

