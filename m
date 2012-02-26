Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1S1dQ3-0003tj-FS
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 13:41:39 +0100
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 76BC5212DD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 07:33:16 -0500 (EST)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute6.internal (MEProxy); Sun, 26 Feb 2012 07:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:date:in-reply-to
	:references:content-type:content-transfer-encoding:message-id
	:mime-version; s=smtpout; bh=bhjHlmQKG4atYr+ZhDykXmq5jWk=; b=Ajy
	rZf2ROZ5wGgPdnmo371FhSLJvr/i/L/1BPNwFmmCu5TCcaWvSggdkQKW5XhAaOTZ
	62c21ZCgCc6vP4pIdDWtCioKNJgJjZcL5L0fVjqzZ0icoX7tx7o5c13idU/5wl0r
	FXvZmpysWkV/rvmcoZm3d3u3Z6B9SeqXTJMRTQYM=
X-Sasl-enc: 7JSmNsPw8ZoYHNrCgHpbxD4lndZJ49M5jYWpiUfphWOi 1330259596
Received: from [10.0.250.78] (unknown [89.206.243.164])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0075E48247C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 07:33:15 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 26 Feb 2012 07:32:47 -0500
In-Reply-To: <1330259412.28988.10.camel@lenny>
References: <1330185446.13788.40.camel@ted> <1330259412.28988.10.camel@lenny>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1330259567.28988.12.camel@lenny>
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
X-List-Received-Date: Sun, 26 Feb 2012 12:41:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-02-26 at 07:30 -0500, Colin Walters wrote:
> On Sat, 2012-02-25 at 15:57 +0000, Richard Purdie wrote:
> > dbus is only needed for some of the glib tests which we don't use. We can
> > therefore drop the dependency and gain some small parallelism gains.
> 
> Maybe you want
> https://bugzilla.gnome.org/show_bug.cgi?id=667806#c4
> 
> Care to comment there that it'd be useful for you?

Specifically you should argue that if cross compiling there's no
point to building the tests (if they're not installed), because
you can't run them (well, without some qemu hackery).

Due to libtool mainly compiling the tests also takes about 20%
of the build time.






