Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 277786CC84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 06:56:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9A6u9Gq017829; Thu, 10 Oct 2013 07:56:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8ORohd30vmIW; Thu, 10 Oct 2013 07:56:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9A6u5Iv017825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 10 Oct 2013 07:56:06 +0100
Message-ID: <1381388161.29912.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Oct 2013 07:56:01 +0100
In-Reply-To: <D14FF4AA-C9DA-40C4-B706-3953E31F1A35@dominion.thruhere.net>
References: <D14FF4AA-C9DA-40C4-B706-3953E31F1A35@dominion.thruhere.net>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Architectures with underscores in their names, how to handle that?
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
X-List-Received-Date: Thu, 10 Oct 2013 06:56:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-10 at 08:27 +0200, Koen Kooi wrote:
> Hi,
> 
> I'm working on adding support for big-endian armv8 and the toolchain
> people decided that it should be named 'aarch64_eb'. That currently
> works in OE because there isn't a 'eb' override yet, but there might
> be one in the future.
> 
> So my question is, how can I safely handle a name like this?

I suspect we'll just have to be careful never to add an "eb" override,
in much the same way as a 64 override would also cause problems for
x86_64. There is code in place to change the _ to - for package feed
use.

Longer term I'd like to see us find a better character for overrides
than the current use of "_" but that would be a fair bit of work to
achieve. I'd like to think that would performance as well as readablity
of .bb files but I've yet to prove it.

Cheers,

Richard


