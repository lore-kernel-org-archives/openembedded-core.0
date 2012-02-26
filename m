Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1S1dNY-0003r0-Cc
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 13:39:04 +0100
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1671321384
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 07:30:41 -0500 (EST)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute4.internal (MEProxy); Sun, 26 Feb 2012 07:30:41 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:date:in-reply-to
	:references:content-type:content-transfer-encoding:message-id
	:mime-version; s=smtpout; bh=NuYynvsQDwctsX0wK3Oujvozsr0=; b=UCp
	RCbf1CCDIACtJNnO7tqHuOVybclY8QuDF32xTXTJYW8P96Z3myf/E1SnUnQn9fNH
	ywCnU/KniGqrVdfkEc0bqzkC2itc1Esiw+/VODZjjE2ohnw8wpq60J+Uc2mg0xjP
	tW7mV4NOiv6Bm4w7kS7VKWYQDbPucdx3w+KfMPB8=
X-Sasl-enc: 8YJY/oiwm6iHpcbuQXKqEPEFm8ijGmo0dhrXzG+ZP62N 1330259440
Received: from [10.0.250.78] (unknown [89.206.243.164])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8D25A8E021F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 07:30:40 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 26 Feb 2012 07:30:11 -0500
In-Reply-To: <1330185446.13788.40.camel@ted>
References: <1330185446.13788.40.camel@ted>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1330259412.28988.10.camel@lenny>
Mime-Version: 1.0
Subject: Re: [PATCH] glib: Drop dbus dependency, it isn't useful
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
X-List-Received-Date: Sun, 26 Feb 2012 12:39:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-02-25 at 15:57 +0000, Richard Purdie wrote:
> dbus is only needed for some of the glib tests which we don't use. We can
> therefore drop the dependency and gain some small parallelism gains.

Maybe you want
https://bugzilla.gnome.org/show_bug.cgi?id=667806#c4

Care to comment there that it'd be useful for you?




