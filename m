Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0E35060845
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 12:10:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6TCKCkM001601; Mon, 29 Jul 2013 13:20:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Nvctn36Gl5Ms; Mon, 29 Jul 2013 13:20:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6TCK5fk001568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 29 Jul 2013 13:20:06 +0100
Message-ID: <1375099816.5851.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 29 Jul 2013 13:10:16 +0100
In-Reply-To: <cover.1374992925.git.sgw@linux.intel.com>
References: <cover.1374992925.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (Part 1) 00/64] Ready to pull (Acked on Friday)
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
X-List-Received-Date: Mon, 29 Jul 2013 12:10:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-07-27 at 23:30 -0700, Saul Wold wrote:
> Richard,
> 
> This is ready to pull, this is the set that was ACK'ed on friday by Paul
> and Ross, I removed the git recipe renames as requested and moved my obex
> change to a part 2.
> 
> I did include a couple of priority patches from friday, Ross's revert, and
> a couple of Upstream-Status changes, along with my patch to fix the 
> externa-toolchain issue that was being seen.

I've merged this branch however there is one small tweak I'd like to
see:

Paul, Can you move BAD_RECOMMENDS from bitbake.conf to
rootfs.bbclass/image.bbclass/populate*.bbclass or somewhere specific to
image generation. We should really try and keep the image variables
somewhere specific to images, I agree it shouldn't be backend specific.
We could probably do with overhauling those class files as there seems
to be too many of them.

Cheers,

Richard



