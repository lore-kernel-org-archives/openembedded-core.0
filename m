Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 464847861A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:41:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8DAfiLt006562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 13 Sep 2017 11:41:46 +0100
Message-ID: <1505299304.18640.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ola x Nilsson <ola.x.nilsson@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 11:41:44 +0100
In-Reply-To: <1505215422363.98035@axis.com>
References: <20170828145816.17208-1-olani@axis.com>
	, <20170828145816.17208-2-olani@axis.com> <1505215422363.98035@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 2/2] externalsrc.bbclass: Avoid symlink clashes	for virtclasses
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
X-List-Received-Date: Wed, 13 Sep 2017 10:41:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-09-12 at 11:23 +0000, Ola x Nilsson wrote:
> I noticed that the preceding commit has been merged. 
> Is there some problem with this one?

Its not something I can describe easily, more a gut feeling that is
shared by some others I've talked to.

Basically externalsrc is turning into an ever more complicated pile of
corner cases and it worries me a lot. I can't help thinking we really
want to simplify and streamline this, not add more complexity to it.

How exactly we do that I'm not sure, I haven't had the time to spend
looking at the code. I do appreciate you added a test case though.

I guess what might help would be creating standard API in lib/oe to get
things like the remapped name.

I'm actually tempted to throw out he externalsrc symlinks stuff. If our
directory layout is so bad we really should fix that "properly" and
that's something I'm thinking about for the next development cycle...

Cheers,

Richard



