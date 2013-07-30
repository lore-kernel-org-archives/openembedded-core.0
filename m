Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1767A6B3EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 15:19:12 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V4Bhf-0004N6-OZ; Tue, 30 Jul 2013 17:19:11 +0200
Message-ID: <1375197551.8017.6.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 30 Jul 2013 16:19:11 +0100
In-Reply-To: <51F7D1BB.8010405@windriver.com>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
	<CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
	<1375186489.13247.55.camel@phil-desktop.brightsign>
	<CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
	<51F7D1BB.8010405@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 15:19:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-30 at 09:46 -0500, Mark Hatle wrote:
> They want a method similar to the one posted by Otavio in order to tailor the 
> system.  End users never want to create a new distribution, they simply want to 
> start with one and tweak it.

They can already do that by overriding the distro's own DISTRO_FEATURES
in local.conf (modulo poky's alleged _append thing), and/or by copying
and hacking the distro.conf file itself.  And, of course, any distro
which intends itself to be explicitly end-user-tweakable like this is
welcome to include a mechanism like Otavio's one in their own layer.

> So with that said, my opinion is to enable this code, allowing end users to 
> tweak their distribution settings.  But make it a stated policy that 
> distribution layers should only "set" the value of DISTRO_FEATURES, and should 
> never modify/update this new EXTRA_DISTRO_FEATURES value.  (Of course, I doubt 
> there is a way to police that, other then state it's policy.)

Both end-users and distro maintainers already have enough trouble
understanding what the interactions are between the different variables
and who's meant to be setting which ones (see DISTRO_FEATURES_BACKFILL
for example which seems to be fairly frequently misunderstood).  Adding
extra complexity to what is already a fraught area seems like a bad
plan.

> This is the same type of reason that end users was a "don't install this 
> package" feature as well.  While anyone can write a new image recipe, nobody 
> wants to, especially when they only want one or two less packages in their image.

End users already have BAD_RECOMMENDATIONS for that, right?  And
courtesy Paul's recent changes I think this now even works for the
rpm-using fraternity.

p.



