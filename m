Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPpp5-0002gD-Jl
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 07:42:59 +0200
Received: by fxm19 with SMTP id 19so1351083fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 22:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=r+W7LJyjM5KlryLA+wpai8oaNPTQ1m6lyWI3taKLN7o=;
	b=OA2q8Enq75d/eLe/ZemInsxE+qYl/aJ8RnxdiMgVJTFePn4jx0Y6t6HWfQbDD1vUpH
	WXVnd/gRT1E3PnQE10qyRpJKE1nhZLV+Drn/pg7aLdf0H9mYQg56fDUwM6VwDvg1gW6I
	6acgUmQMKINwC2If8wulqCHA95y5UjDFnbssE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=T0XCQQZcsQnWROskrx9q01Le/vlUSFlisvDE5XsQ8TtEeEMxMS0kD2MPfe+E7YpqPe
	vaCcfCz7o6kUYTIKNqx9KZNW8sva6TxpzHTSFeZ8pfbMD2T+38WvDhx+DWiTZ/T+3gFJ
	cwF0EwRUergl0TG2vZXDCbyHzRo4F2j1cQMTk=
Received: by 10.223.97.196 with SMTP id m4mr1824947fan.55.1306474794655;
	Thu, 26 May 2011 22:39:54 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c1sm537130faa.37.2011.05.26.22.39.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 22:39:53 -0700 (PDT)
Date: Fri, 27 May 2011 07:39:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110527053946.GP3222@jama.jama.net>
References: <20110526220829.GO3222@jama.jama.net>
	<1306451615.27470.212.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1306451615.27470.212.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Sad story about Shared State
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
X-List-Received-Date: Fri, 27 May 2011 05:42:59 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eLe8FOcWSbbyMVJD"
Content-Disposition: inline

--eLe8FOcWSbbyMVJD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2011 at 12:13:35AM +0100, Richard Purdie wrote:
> On Fri, 2011-05-27 at 00:08 +0200, Martin Jansa wrote:
> > Good evening,
> >=20
> > sorry for long and pesimistic e-mail, but I hope that someone will point
> > me to something I'm doing completely wrong.
> >=20
> > First I was surprised to see how many recipes were rebuilt after this
> > change:
> > http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=3Daeb=
b9d6599aac683456adf56dc11f8b9f10f25c3
> >=20
> > because [YOCTO #1074] was resolved by bitbake commit:
> > http://git.openembedded.net/cgit.cgi/bitbake/commit/?id=3D139b8a6258182=
25c358a1b8363518d7ed6913188
> > and I had rm_work change
> > http://patches.openembedded.org/patch/4807/
> > during this build I decided to find out what is changing so many sstate
> > checksums for such small changes
> >=20
> > so I took another small dbus change from patchwork
> > http://patches.openembedded.org/patch/4831/
> > and rebuild many recipes again to play with bitbake-diffsig for a while=
=2E.
>=20
> [...]
>=20
> > .. end of story ..
> >=20
> > .. I agree it's "right (TM)" to rebuild not only changed package but al=
so its dependencies ..
> > .. I agree it's not possible to differentiate between important library=
 change
> >    which can infulence also packages depending on it even if only trans=
itive and
> >    cosmetic change improving ie RDEPENDS_${PN} which doesn't influence =
even direct dependants
> > .. but impact of such small change on small shr-lite-image?
> >    almost 2 hours on my quadcore AMD Phenom(tm) II X4 965@3.4Ghz, 4GB R=
AM, tmp/work on raid0 (3 SATA2 discs)
> >=20
> > guess how long is runqueue when someone bumps binutils or gcc PR.. it's=
 like DISTRO_PR bump :/
> > but almost after every "git pull --rebase".
> >=20
> > this was for our minimal image
> > task-shr-feed we have in old OE takes about 2-3 days on our buildhost (=
dualcore with 2GB ram)
> > for 1 arch, we (SHR) are supporting 3 arm architectures=20
> > armv4t (om-gta01, om-gta02), armv6-novfp (htcdream), armv7a (palmpre, p=
almpre2, nokia900)
> > so currently it takes 10-14 days to rebuild feed after DISTRO_PR change=
=2E.
> >=20
> > I'm not sure if we can afford our feeds to track oe-core/meta-oe HEADs=
=20
> > like we did with old OE :(.
>=20
> It should still be possible for OE-Core to behave like "old OE".
>=20
> > Is it expected use-case to base layers only on released version of=20
> > oe-core/meta-oe and never touch recipes which are higher in dependency =
tree?
>=20
> It is expected that as we get a more stable and fully featured core that
> people should be able to base off released versions of it rather than
> needing to track master the whole time.
>=20
> > Is it possible to disable sstate and do DISTRO_PR bumps manually when=
=20
> > distro maintainder decides it's really needed and buildhost is free=20
> > for long enough to populate feeds?
>=20
> What do you mean by disable sstate as there are several different
> elements to it.

I meant something like switch back to something like pstage was or
disable both (IIRC I had strange error on many places without sstate
inherited by distro).
=20
> Which BB_SIGNATURE_HANDLER are you using? It sounds like you're using
> basichash but want the behaviour generated by basic (the current
> default). Nobody is forcing you to use basichash.

AFAIK I'm using default basic..
OE @ ~/shr-core/meta-smartphone $ git grep BB_SIGNATURE_HANDLER
OE @ ~/shr-core/meta-openembedded $ git grep BB_SIGNATURE_HANDLER
OE @ ~/shr-core/openembedded-core $ git grep BB_SIGNATURE_HANDLER
meta/conf/bitbake.conf:BB_SIGNATURE_HANDLER ?=3D "basic"

OE @ ~/shr-core $ bitbake -e shr-lite-image | tee -a log; grep BB_SIGNATURE=
_HANDLER log
# BB_SIGNATURE_HANDLER=3Dbasic
BB_SIGNATURE_HANDLER=3D"basic"

but even when I set it to not existing basic2
it doesn't show error from
lib/bb/siggen.py
        logger.error("Invalid signature generator '%s', using default 'noop=
'\n"
                     "Available generators: %s",
                     ', '.join(obj.name for obj in siggens))
but fails like this:
NOTE: Preparing runqueue
ERROR: Running idle function
Traceback (most recent call last):
  File "/usr/lib64/python2.7/site-packages/bb/server/process.py", line 151,=
 in idle_commands
    retval =3D function(self, data, False)
  File "/usr/lib64/python2.7/site-packages/bb/cooker.py", line 792, in buil=
dTargetsIdle
    retval =3D rq.execute_runqueue()
  File "/usr/lib64/python2.7/site-packages/bb/runqueue.py", line 940, in ex=
ecute_runqueue
    self.rqexe =3D RunQueueExecuteScenequeue(self)
  File "/usr/lib64/python2.7/site-packages/bb/runqueue.py", line 1434, in _=
_init__
    valid =3D bb.utils.better_eval(call, locs)
  File "/usr/lib64/python2.7/site-packages/bb/utils.py", line 390, in bette=
r_eval
    return eval(source, _context, locals)
TypeError: expected a character buffer object

I'll add some debugging code to bitbake to see what's really going on here..

> As you mention, there are benefits and drawbacks either way.

Yes I see the benefits and if we find out that basichash is somehow used
instead of configured basic I'll be really happy to continue using it.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eLe8FOcWSbbyMVJD--
