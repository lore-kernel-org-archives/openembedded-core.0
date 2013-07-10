Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5B56AA5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 14:57:30 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so4970595ead.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gqDZjyWlDK4XEUQqqRymcpKM3ms4mbfLVpWbbLH/SLA=;
	b=KUrhwYqC9gPu+/WzzSk9u1WFLGqAmwBqxTjhihX4PEekZ/WJkKOwDw/Sxo+ZR9xDzu
	FiIRCKZhY1R+DA+LS5WKx5WCc95x/XAKi4gxjnwuCkU8Hhcu6rIqYPjI46h92aYTZZBb
	xNCnAP7zuyiBfE74l7Uol/C3WqNEahDOX+yYrzkKoQCgO/ySua+Fzev8ZV3YOeQ2yP/j
	FUtdH1/08TkFGTSjfIGu5ErJjfCJSKObTlGg1FTXsvoiEWNfqg6P5hBvcnMVTH6SNzzM
	wJa5lkgYLBBSbKyW5OABZoqd4WfKUACKE5eNGuN/4oe1EN6tMjyMjKN5bdnZ7DMmKMBE
	+M7g==
X-Received: by 10.15.33.132 with SMTP id c4mr37134365eev.12.1373468250567;
	Wed, 10 Jul 2013 07:57:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cg12sm60570004eeb.7.2013.07.10.07.57.29 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 07:57:29 -0700 (PDT)
Date: Wed, 10 Jul 2013 16:57:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130710145740.GC3288@jama>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
	<20130710124115.GB3288@jama>
	<CAJTo0LZiDgWj+Ezz201tUA-QkGEtb=NKZ4xhNWFzJLcgfiJtow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZiDgWj+Ezz201tUA-QkGEtb=NKZ4xhNWFzJLcgfiJtow@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Wed, 10 Jul 2013 14:57:31 -0000
X-Groupsio-MsgNum: 41743
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PYvLm/IFaQmMAfx6"
Content-Disposition: inline

--PYvLm/IFaQmMAfx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 03:34:58PM +0100, Burton, Ross wrote:
> On 10 July 2013 13:41, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Build with last version of this script is still running (after 37 hours)
> > Building recipe: gnome-desktop (485/1848)
> > but I've tested it in smaller builds and I'm happy with current
> > functionality, I'll send found issues in tomorrow or day after that when
> > the build is complete.
>=20
> As this has been on my todo list for a while now, come to ELC-E and
> I'll get you a beer. :)

OK :)

> Anyone volunteering to run this on oe-core master this weekend?

I have it running with more layers included so it will take longer, but
will report more "autodetected" deps.

Well for some reason the server is very slow now, it moved only couple
recipes since writting that previous e-mail :/

Building recipe: gnumeric (505/1848)
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PYvLm/IFaQmMAfx6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHddmQACgkQN1Ujt2V2gBxwZwCfTWPMyGm7sCb0OB3F9mIn6UpC
rJMAn0pt9tAI3veDeLtkmUUMARUIN3BM
=qwqt
-----END PGP SIGNATURE-----

--PYvLm/IFaQmMAfx6--
