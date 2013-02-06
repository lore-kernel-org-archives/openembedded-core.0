Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U35tf-0000sf-GN
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 15:22:52 +0100
Received: by mail-pa0-f48.google.com with SMTP id hz10so858140pad.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 06:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7hVNFEDuJsnxW8CNCts9MSZ2ChOtBlQScoWcUCTWeeQ=;
	b=Httr1Q+nUZnpI+5tpElXFFSMIhlxpaDH4beT2fKGTnv8cf0iBxXszCkHMmYh/jSym2
	NBmTV220PWl3kmHEJrng/Mt73HJMVPd+rdIK58BhSsSR0LNv7ot1Hyh/FMbDvRNW0JNq
	YwM8WzN8qtqk4oma+T0ZB3LtejxV811ZSkb9EhJlHxYNf3nus8iNiKoy3AnD/qMbPQZj
	jcOK1EJmRj5ScdrVVMqEQX2/RdV0YLj1tUiwVSKuGl6VHkfoGvOwgWB/dvSUMoYftwOW
	60jtwy0/UXGWHSl1neW7on4Frx/J2tahn0Dqs19PxUb52VzQzhi+uEma4QIJwl/gMjqG
	ZD6A==
X-Received: by 10.66.75.200 with SMTP id e8mr19950946paw.72.1360159615590;
	Wed, 06 Feb 2013 06:06:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k7sm24673617paz.13.2013.02.06.06.06.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 06:06:54 -0800 (PST)
Date: Wed, 6 Feb 2013 15:06:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20130206140646.GW3271@jama>
References: <1359984404.14071.160.camel@ted>
	<1360157209-19641-1-git-send-email-Martin.Jansa@gmail.com>
	<51125E3D.20602@topic.nl>
MIME-Version: 1.0
In-Reply-To: <51125E3D.20602@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rm_work: remove package and packages-split dirs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 14:22:58 -0000
X-Groupsio-MsgNum: 35102
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eu12+zRL7gQwOC+E"
Content-Disposition: inline

--eu12+zRL7gQwOC+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 02:44:29PM +0100, Mike Looijmans wrote:
> (see comment below)
>=20
> On 02/06/2013 02:26 PM, Martin Jansa wrote:
> > * as described in
> >    http://git.openembedded.org/openembedded-core/commit/?id=3D6107ee294=
afde395e39d084c33e8e94013c625a9
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/classes/rm_work.bbclass | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> > index 997dcd1..5aa5f24 100644
> > --- a/meta/classes/rm_work.bbclass
> > +++ b/meta/classes/rm_work.bbclass
> > @@ -17,15 +17,12 @@ do_rm_work () {
> >       cd ${WORKDIR}
> >       for dir in *
> >       do
> > -        if [ `basename ${S}` =3D $dir ]; then
> > -            rm -rf $dir
> > -        # The package and packages-split directories are retained by s=
state for
> > -        # do_package so we retain them here too. Anything in sstate 'p=
laindirs'
> > -        # should be retained. Also retain logs and other files in temp.
> > -        elif [ $dir !=3D 'temp' ] && [ $dir !=3D 'package' ]  && [ $di=
r !=3D 'packages-split' ]; then
> > +        # Retain only logs and other files in temp.
> > +        if [ $dir !=3D 'temp' ]; then
> >               rm -rf $dir
> >           fi
> >       done
> > +
> >       # Need to add pseudo back or subsqeuent work in this workdir
> >       # might fail since setscene may not rerun to recreate it
> >       mkdir ${WORKDIR}/pseudo/
> > @@ -54,6 +51,15 @@ do_rm_work () {
> >                   i=3Ddummy
> >                   break
> >                   ;;
> > +            # We remove do_package entirely, including any
> > +            # sstate version since otherwise we'd need to leave 'plain=
dirs' around
> > +            # such as 'packages' and 'packages-split' and these can be=
 large. No end
> > +            # of chain tasks depend directly on do_package anymore.
> > +            *do_package|*do_package_setscene)
> > +                i=3Ddummy
> > +                rm -f $i;
>=20
> Hmm, I think you intended "rm -f $dir" here? This would only remove a=20
> file named "dummy".

Good catch thanks, it should be before i=3Ddummy. I'm testing v3 now.

Interesting that after last rebuild I haven't found any
do_package,do_package_setscene stamps..

Cheers,

> > +                break
> > +                ;;
> >               *_setscene*)
> >                   i=3Ddummy
> >                   break
> >
>=20
> Mike.
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eu12+zRL7gQwOC+E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESY3YACgkQN1Ujt2V2gBwaBwCeMbPNh7oH7z/7knTL7A5GwSgi
ZtkAoK+TPmJpAAaS1kCXr8rZ16tusWoG
=VMhY
-----END PGP SIGNATURE-----

--eu12+zRL7gQwOC+E--
