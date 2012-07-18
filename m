Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1SrZ12-0005Um-FG
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 20:30:28 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1F89120997;
	Wed, 18 Jul 2012 14:19:09 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 18 Jul 2012 14:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=roKWAGZO1nc/rsMRamljmQ
	x2o28=; b=kC1RBfAATNOFCa3EORzKFJFKSdpz6GaWL6bmrx0XKulMRyepYSAdSk
	LcBwPVnNAyiWe26pHGUtp/Ig1YmBFmCAXXsL6ZsqxhSHaU+48MudbAsqBzmCG5XJ
	n22xcasGYTyQEEgRsO+SKLaU17ncN57aeHMC+7EFnxNeOWN/tQf9M=
X-Sasl-enc: UzmZijZ55YU2Gq6R7Zb4OZo20YaBObPliw+zy/G6RPIb 1342635548
Received: from [10.193.23.196] (unknown [66.187.233.203])
	by mail.messagingengine.com (Postfix) with ESMTPA id B02E8482799;
	Wed, 18 Jul 2012 14:19:08 -0400 (EDT)
Message-ID: <1342635512.5148.0.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jul 2012 14:18:32 -0400
In-Reply-To: <1342635209.513.50.camel@ted>
References: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
	<5006049E.40509@linux.intel.com> <1342572457.2860.11.camel@lenny>
	<1342635209.513.50.camel@ted>
X-Mailer: Evolution 3.4.3 (3.4.3-2.fc17) 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] glib: upgrade to 2.32.4
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
X-List-Received-Date: Wed, 18 Jul 2012 18:30:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 19:13 +0100, Richard Purdie wrote:

> Generally we kind of cheat and encode "/usr/bin/env xxx" into
> native/nativesdk scripts and ${bindir}/env xxx into target scripts.

How is that accomplished?  Can you link me an example?




