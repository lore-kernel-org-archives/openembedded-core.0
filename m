Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id AB24170961;
	Wed, 30 Jul 2014 16:56:55 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so7704834igb.2
	for <multiple recipients>; Wed, 30 Jul 2014 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=BsYalL77OaKXkdqQdsRfMpK/EyAuMV3UlZdHphbeYFU=;
	b=GRAaRyHNap07BX8qLEETN8PDW5+ekatZ7948D9gVw59lLVtbsPehpsX0efmkcSVP9O
	yPX5mfDtymlpxQu+mpVjrjRkZ69T6ZpHdIO1XP63XVqaVMSEbI1UCHNBJBe0skLswywf
	q02ZdV2LNUTnf4eaSM7MLu2qIJZdAXqcaF+K6rPTnTHOcWaTg4uoC7fZLA0FSe3O99+M
	ph9mnGLEdDHSY/av6OGOYAHc7EbSuhVYwdVlXOE6UQlcwjhqYEzrS/2Oe29mPtn07wn5
	ctnDMemRsvZKf/Vukg+nlQwAhngS/J3DnM52jG+qKxXq05Bf1YkvLB5EjIF1qTM/wh2G
	gFcA==
X-Received: by 10.50.43.134 with SMTP id w6mr9367954igl.17.1406739417048; Wed,
	30 Jul 2014 09:56:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 30 Jul 2014 09:56:26 -0700 (PDT)
In-Reply-To: <53D8DB24.2070409@phytec.de>
References: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
	<1406543035.13346.11.camel@ted> <53D8DB24.2070409@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2014 09:56:26 -0700
Message-ID: <CAMKF1sp6=sCzffe9Q=nEjPjaidKrg2_LYtLeZS+ZMgAsUMdVig@mail.gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Wed, 30 Jul 2014 16:57:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 4:46 AM, Stefan M=C3=BCller-Klieser
<s.mueller-klieser@phytec.de> wrote:
>
> it happened that I am also preparing our barebox recipe for OE-core. I
> started similar to David but it evolved already. I added support for
> packages, configuration fragments and an the ipl, needed for some SoCs. I
> will send it to the list for comments. Even if it will not be accepted, i=
t
> might be useful for some people. I will provide an explanation for the
> maintainer.

could you both merge your changes and propose single recipe ?
We could put it in meta-oe and later decide to move to or-core if that
becomes the case.
so also send to oe-devel ml when you send v2

