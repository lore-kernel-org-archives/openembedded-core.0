Return-Path: <obi@opendreambox.org>
Received: from relay.dream-property.net (relay.dream-property.net
	[178.19.67.222])
	by mail.openembedded.org (Postfix) with ESMTP id F3CA87FBC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 13:57:41 +0000 (UTC)
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 99B8410095A21;
	Wed, 27 Nov 2019 13:57:41 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de
	[176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 235F23147CCF;
	Wed, 27 Nov 2019 14:57:40 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org; 
	s=dkim; t=1574863061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=R6XCo76Ojp7V2YYsz/f4YAVBlBTmvh+cE3u4rtFKXFA=;
	b=yNo1qz+nXwIiVqzQKMZd0PhFTfTbmuZMH/3+P+fycPbBpGa138BJnl9lbE2Q2ALDxt25ln
	zogxN9vVUiwus4Bw==
Date: Wed, 27 Nov 2019 14:57:38 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: =?UTF-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20191127145738.51091396@opendreambox.org>
In-Reply-To: <0a51e56f3585d35895cf858f8e044a3dc5234948.camel@andred.net>
References: <0a51e56f3585d35895cf858f8e044a3dc5234948.camel@andred.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: packageA rdepends on packageB but it isn't a build dependency warnings
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
X-List-Received-Date: Wed, 27 Nov 2019 13:57:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 27 Nov 2019 12:56:43 +0000
Andr=C3=A9 Draszik <git@andred.net> wrote:

> I am getting above QA warnings for some packages. Simple example - a reci=
pe
> packageA with a shell script that calls out to certain other command line
> utilities from packageB.
>=20
> Given packageA is only a shell script, it ought to be enough to simply add
> an RDEPENDS on packageB in that recipe. But when I do that, most of the t=
ime
> (not always it appears, though!) I get the warning from the subject of th=
is
> email.
> I have even seen the generated IPK package to not have an entry for the r=
untime
> dependency. Again, sometimes, not always.
>=20
> Is it really necessary in this case to add a DEPENDS, or is there some fl=
ag
> that can be set or something? I didn't find anything after a quick search=
...

in general, it should work with just RDEPENDS_${package}, if package is lis=
ted
in PACKAGES statically. If you build the list of PACKAGES dynamically, e.g.
with do_split_packages or anonymous python, then you'll need to add explicit
entries in DEPENDS.

Best regards,
Andreas

