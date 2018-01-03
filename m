Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 44B9471AB9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 21:20:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03LKkgX015536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 21:20:48 GMT
Message-ID: <1515014446.5525.157.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Jan 2018 21:20:46 +0000
In-Reply-To: <661e1908-ae7a-3125-cc49-fc87014ee1cb@gmail.com>
References: <661e1908-ae7a-3125-cc49-fc87014ee1cb@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: glibc update
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
X-List-Received-Date: Wed, 03 Jan 2018 21:20:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-03 at 12:17 -0800, akuster808 wrote:
> I noticed all but the glibc updates where merged from Khem's
> toolchain-update branch. Is there an issue with the glibc update, 
> was it just missed or pending more testing?
> 
> I have some patches I need to submit but I don't want to chase a
> moving target.

I'm trying to test things in batches without too many moving pieces and
I'm deferring the most risky things.

Given the number of glibc upgrade issues we've had recently (think
uninative) I'm apprehensive about the glibc patches and we had a queue
of other patches which conflict. I therefore have deferred that
particular patch until I have others sorted out. We are missing the
corresponding uninative upgrade to match the glibc upgrade which is
another factor. It may all turn out to be an unfounded worry or it may
not.

We will get there but I'm also kind of enjoying greenish builds ;-)

Cheers,

Richard

