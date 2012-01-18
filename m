Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1RncrJ-0000yk-3p
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 22:15:54 +0100
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 2F4F921BE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 16:08:16 -0500 (EST)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute6.internal (MEProxy); Wed, 18 Jan 2012 16:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:date:in-reply-to
	:references:content-type:content-transfer-encoding:message-id
	:mime-version; s=smtpout; bh=8xz7mKW+aOUkvPrLr1tK9l8/7tk=; b=ZTT
	rDx+wKakl109mcsk7mKTiHYPll0KEcZrN5WavhGmBaQo12pI+OcDtWcFGENRuytO
	8GrTodcVs7V1GixBEVX0qcDnb8t91Pfjnsfx396VY/GronnD7LxdgA1Z4RqJNzUe
	2rx6XewOpcDj2Lg5Uic0i0JAH+WNhC6sPcEwuxCs=
X-Sasl-enc: xGfX7odpmk82J4cgY0LrYZrYFOf6wArKp9wguXEVYu/v 1326920895
Received: from [192.168.1.6] (c-65-96-60-117.hsd1.ct.comcast.net
	[65.96.60.117])
	by mail.messagingengine.com (Postfix) with ESMTPA id BF3E0483513;
	Wed, 18 Jan 2012 16:08:15 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 18 Jan 2012 16:07:54 -0500
In-Reply-To: <4F172C5D.5020806@linux.intel.com>
References: <1326651241.9066.0.camel@lenny>
	<4F13A366.1010807@linux.intel.com> <1326812944.3467.46.camel@lenny>
	<4F15CDFD.8050204@linux.intel.com> <1326916687.24335.4.camel@lenny>
	<4F172C5D.5020806@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1326920874.24335.7.camel@lenny>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: Put all libltdl headers in the correct libltdl-dev package
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
X-List-Received-Date: Wed, 18 Jan 2012 21:15:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-18 at 12:32 -0800, Saul Wold wrote:

> So are you asking that we pull all these changes into oe-core or this is 
> the change set you have made for your system?  I guess I am alittle unclear.

Not all of them; I have the hack-around to remove -dev dependency chain
in there for example.  I've been sending here the ones that are pure
bugfixes.

> Also, if you want items into OE-Core, you should ensure they are based 
> against oe-core master.

Ok.  It'll take me a bit to set up a build/test environment for it.





