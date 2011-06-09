Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUhjy-0000OE-Su
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 18:05:51 +0200
Received: by bwz5 with SMTP id 5so1772686bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=J6zdjTqLUTDdYFrb2MS278QK9aGfnmGzUcwWkyQTqUg=;
	b=YRr4B8A+rQSluBxjc3pYIdJAse7YQXGxG3wJkJM9R2243irL7cQjzgtv/RwnXfmZJ7
	eaMGOYgog8p2Lt3ZB3TqX3hdOERTbrxAtu8flsbbZIU+iNCJOvJ9LCaVhNuF05u6rze2
	NGYKt2R64HTIhes7W0iQNTQ3oCQ9shgg7goHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=K+YFaKb6vWciQcOoCHEfGt15Rho4ZE8LDJQq17Oqvd1nNUYb5TlYqEhtuW0oKIZGvj
	lnvl763lT0DDT0C9nPh5JX9OCttlhV4CoL+E6PrJaDIyQLnDd3rME6zxiR+nFHjXRfII
	kALjeA86MM8LSdwRQ15jj5MyVTYv3hFQlsoxk=
Received: by 10.204.46.132 with SMTP id j4mr913929bkf.86.1307635350720;
	Thu, 09 Jun 2011 09:02:30 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q20sm1693022bka.17.2011.06.09.09.02.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 09:02:29 -0700 (PDT)
Date: Thu, 9 Jun 2011 18:02:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110609160228.GA9108@jama.jama.net>
References: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
	<201106091631.48506.paul.eggleton@linux.intel.com>
	<201106091654.57519.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <201106091654.57519.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: List of bbappends without matching recipes
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
X-List-Received-Date: Thu, 09 Jun 2011 16:05:51 -0000
X-Groupsio-MsgNum: 3834
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2011 at 04:54:57PM +0100, Paul Eggleton wrote:
> On Thursday 09 June 2011 16:31:48 Paul Eggleton wrote:
> > I've recently submitted a patch to bitbake-devel which fixes
> > bitbake-layers' handling of skipped recipes so that it doesn't report t=
hem
> > as missing. I don't think skipped recipes can account for that entire l=
ist
> > however.
>=20
> OK so those patches don't apply anymore, have rebased them locally (+ add=
ed=20
> one fix) and will resubmit. FYI this is the list I have come up with, wit=
hout=20
> skipped recipes:
>=20
> ---------------
> meta-intel:
>   meta-emenlow/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-
> target.bbappend
>   meta-emenlow/recipes-gnome/tasks/task-poky-sdk-gmae.bbappend
>  =20
> meta-smartphone:
>   meta-nokia/recipes-bsp/udev/udev_168.bbappend

was removed after koen's report
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Df37d=
05ca7450f85642cea0e43a75df10663bd8f6

I see 2 more
WARNING: No recipes available for:
  /OE/shr-core/meta-smartphone/meta-palm/recipes-bsp/x-load/x-load_git.bbap=
pend
  /OE/shr-core/meta-smartphone/meta-palm/recipes-bsp/u-boot/u-boot_git.bbap=
pend
and I'll talk with morphis to update them

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3w7pQACgkQN1Ujt2V2gBwUZACbBQfFgBcmWuIomEFHSOtp/SL3
5EMAn0HfqH+C3CE2Gq3HJ5SxLHJmZLxg
=tGym
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
