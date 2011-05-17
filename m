Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMCQS-0001eH-Ni
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 07:02:32 +0200
Received: by fxm19 with SMTP id 19so291964fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 21:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=uudNlJ60IRiCfC9N27uDljjtcfhqmRe3ZGvfjyOvNsI=;
	b=WW8Bw+zYZ1nQ9pUUEi1HwcFyT8uz394N2/JSWwsC+AExFieblhK/g6hiMl6SdJKMNF
	cXRllAUTTEvxXLh0Y1lucXjP1fRyy+JHakVB1lkYFKlsYyoeA0mwI/H14zKk6mmX5JGK
	ZeF1quLxRJWNXJPqnohBsGCZQeIzp/Glbnp70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pKQ8oeXH8+TWBL0mz02NFFQPSLC6AQYMPZaWF7VD3gW71dYV7kQSY9E+i+iXuH+ZBl
	SwmCVqbZBwj4sjofJEHIGPzHF2ugvPpsmcTH2rnKqJBhEuX289Fon31kYrOlNjKT/ltF
	gxXysq28e409DOkIWjcAtKVSXFWvr0tVxf6qI=
Received: by 10.223.54.148 with SMTP id q20mr242916fag.84.1305608379770;
	Mon, 16 May 2011 21:59:39 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id t15sm47762fau.0.2011.05.16.21.59.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 21:59:38 -0700 (PDT)
Date: Tue, 17 May 2011 06:59:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110517045931.GB3509@jama.jama.net>
References: <cover.1305580484.git.sgw@linux.intel.com>
	<3f105b122736772aa2cf11d4b346d764239b2a68.1305580484.git.sgw@linux.intel.com>
	<1305588971.3424.142.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305588971.3424.142.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 04/14] xserver-kdrive: upgrade from 1.7.99.2 to 1.10.1
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
X-List-Received-Date: Tue, 17 May 2011 05:02:32 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 12:36:11AM +0100, Richard Purdie wrote:
> On Mon, 2011-05-16 at 14:44 -0700, Saul Wold wrote:
> > From: Yu Ke <ke.yu@intel.com>
> >=20
> > - remove the patches
> >   * xserver-kdrive-1.3.0.0/*: no longer used
> >   * disable-xf86-dga-xorgcfg.patch: no longer used
> >   * nodolt.patch: already in upstream
> >   * enable-xcalibrate.patch: it is invalid now, because XCALIBRATE
> >     extension has been removed since commit edcceedb
>=20
> Er, has anyone actually tried touchscreens with these changes,
> particularly trying to calibrate a touchscreen under X with xtscal?=20
>=20
> As far as I can tell, we can throw away xtscal, libxcalibrate, and
> calibrateproto after that change since they need that X extension. Its a
> good example of why changes need to get upstream as if the build fix was
> there, they'd have had less reason to remove it. We probably are going
> to need to rewrite xtscal to use XI2 at this point :/.

Cannot we use xinput-calibrator like with xserver-xorg?
=20
Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0ntfKIWw70PvrIHh--
