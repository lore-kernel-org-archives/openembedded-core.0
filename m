Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1SkN6R-0000NK-E3
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 00:22:19 +0200
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 96BE620A3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 18:11:25 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Thu, 28 Jun 2012 18:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=Bxh9A3CHTMywlLZKLeVTEZ
	s4Zt0=; b=bsCxgEivHMjtC1jbUBGKNMUsKRroYo70WJGGqBqDDymsvOZFBf+uCc
	s2VFrqn0rHSs0ZuImbo7nxjo2k5ziYMng+b3csT2EZOS5DGwW9SBHMos8aM1Qlyk
	LYrcPgnBqNh27ofQ70JVkedVyQPiPfjsTHXIOx46tTE4b84+HHT/M=
X-Sasl-enc: gYVRpysDgbYT+Btp/BnxpquIRP9bfOW+mcibvCtgSp08 1340921485
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4DDD7482627
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 18:11:25 -0400 (EDT)
Message-ID: <1340921452.3482.3.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2012 18:10:52 -0400
In-Reply-To: <C4D2E4A76F2943CD9278FA15BFD5C15E@intel.com>
References: <1340705423-18430-1-git-send-email-ross.burton@intel.com>
	<1340744566.3500.2.camel@lenny>
	<C4D2E4A76F2943CD9278FA15BFD5C15E@intel.com>
X-Mailer: Evolution 3.4.3 (3.4.3-1.fc17) 
Mime-Version: 1.0
Subject: Re: [PATCH] gconf.bbclass: don't register schemas in the install stage
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
X-List-Received-Date: Thu, 28 Jun 2012 22:22:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-27 at 07:01 +0100, Ross Burton wrote:

> I'd prefer to use an option that the GConf autoconf macro provides
> over patching every module that uses GConf, 

I wasn't objecting to your patch.  However, please do *also* (in
addition, as well, etc. ;) ) consider patching these modules upstream.

Concretely doing so will also fix jhbuild (and my gnome-ostree build
system).




