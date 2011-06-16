Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QXArq-0002rB-7D
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 13:36:10 +0200
Received: by pzk36 with SMTP id 36so1127437pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 04:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=FZneVhnoEgJDwP7Ekp9mQTQkfiq5MqU3uOzFWq6ireQ=;
	b=g3UjcKPyOVlLICIzxHkU2sZCYL5Y+7vghgV4QveDv/72yppr2IYu9RQqGUGidoBh3d
	xRVsaYjYVYq3l30NLnMdQNURfxbqWWKhnRCFeboQZx/5/ZtHh5L/h9sgYuSuBaanyuYV
	+mBNXx6vANpOjKcATiNcLbp1/kcFiLHR9hxkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UJy3/ie0sSx0hxW+S2dKktLqbPsSiw6JXFhE0nudZq8TOTNnSkG+bBgbl7qV0c8w8S
	oDtsgPKJKiNpWR8j8D559ZFUZdFgwnZ7d60ENYnVc+FKS69GFIbrcD7CKsfsj2OlQLjQ
	iFDk71zNTicWtNjjxLvkW5Dd/KMs8DkbnjmEU=
MIME-Version: 1.0
Received: by 10.142.225.11 with SMTP id x11mr147615wfg.133.1308223961532; Thu,
	16 Jun 2011 04:32:41 -0700 (PDT)
Received: by 10.142.178.20 with HTTP; Thu, 16 Jun 2011 04:32:41 -0700 (PDT)
In-Reply-To: <1308221984.25285.4286.camel@phil-desktop>
References: <1308221984.25285.4286.camel@phil-desktop>
Date: Thu, 16 Jun 2011 13:32:41 +0200
Message-ID: <BANLkTik6J+DnjFm44mx_BtEgwy1UfY83Kg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: multiple git checkouts in SRC_URI
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
X-List-Received-Date: Thu, 16 Jun 2011 11:36:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2011 at 12:59 PM, Phil Blundell <pb@pbcl.net> wrote:
> I'm probably just being dim, but I couldn't immediately figure out how
> to use more than one git:// checkout in SRC_URI. =A0Is there some
> particular trick to making this work?

this worked for svn://
http://git.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-efl/recipe=
s-efl/efl/elementary-theme-efenniht_svn.bb
with only small change from oe.dev version
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dblobdiff;f=3Dre=
cipes-efl/efl/elementary-theme-efenniht_svn.bb;h=3D79557cd6f5ca4b820c97c5f6=
e45b54d777844b02;hp=3D2e8ac8a484a7dce7d76a77de2b167d393a7cddfa;hb=3Df4eb05d=
4766d9e27cc6c0a33a17ea30db550059b;hpb=3Ddd270582c25e00eafc89cc7600ca915bb7f=
6031c

not sure if the same can be used for git:// but iirc I had such recipe
(cannot find it now)

Cheers,


