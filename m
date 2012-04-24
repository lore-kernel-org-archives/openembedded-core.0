Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMdMe-0000mW-QR for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 12:52:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OAhNYH006225
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 11:43:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06095-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 11:43:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OAhF1g006219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 11:43:16 +0100
Message-ID: <1335264194.12692.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 11:43:14 +0100
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/43] Post 1.2 Catch Up
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 10:52:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-20 at 09:44 -0700, Saul Wold wrote:
> This is a series of patches that I have collected during the
> 1.2 stabilization time, the large set of changes from Mark H 
> for update-alternatives.
> 
> This also includes some packaging updates from me to remove
> more warnings, with this set, we build package warning free with
> the exectption of the nativesdk (eglibc 2.15 introduced a new 
> install target). So we are close to enabling this as an ERROR,
> at least in the poky distro.

I've gone through this and merged it onto my master-next branch.

There are a few other pending changes on master-next including a fixed
automake upgrade.

I did not take all of Mark's update-alternatives changes, I want to
revisit the whole manual link thing as I still don't like it. I did take
the ones which just converted code to use the class which didn't involve
manual links.

Cheers,

Richard



