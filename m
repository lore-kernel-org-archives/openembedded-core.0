Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id D76D47F2B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 07:23:33 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id x19so1330547eda.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 00:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7MTxmApubT8F8ZbFLlGHgOPGVF2azOC4wop48gMJH8Q=;
	b=YEOiZrIcoON07C4dkHbAAxDkYf72aE9IqsECg1e4iBjJzmgCPPPzPwtlnwB5uyOQmk
	XDMHpk+qbuWbl0dyM3bW5Wm0qzlInc+xtYGVY2nfNqNj+Otd8AgYQJS3HjJAGd12lrSu
	hGy27otD6owmYz/7GoTrr9x3niZjOXNVER4u4Ra47qOpQ2+2R8d3hRC9rXy+kDuQcE08
	1eqL8i7B4nm69tY4e1ws2zU/fU+PISaAn/XaT05SppXNRt4ib49eYntdW4NY1fgkiPfD
	iCRE3USOj9AF1C3bkrd7uh1oVvDt2YEikIJaXTDjvU6h0gnLQ+OYqkw/GwMh9zR3NHbR
	IkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7MTxmApubT8F8ZbFLlGHgOPGVF2azOC4wop48gMJH8Q=;
	b=K3iO8txZvzcKhe6/wER7/ftP+geCIuBxoU2ccCMlm9iLIafeWgclWiRn2KEXwFYCtv
	Al7zNBeQyHyFoLt0gZ0ysCKnjFE2mOpgJ/oVcsX6x31N93L7oOmZrCTHO5dANRI7uDpO
	kR72GPh+rG6N+umFp8Re7sPWbTeb3MW/6AbHQpl9cmLkLGUC/V/MfNzziE8FWsUQDYWM
	sGDvxBGgyn6fe9EXDqjsKqzKErMU+JFtMMJ/J8IGsrpgaYw1Q2rO5aTiyE8Y/oAlXteB
	G/EZ0WtzUGoZoc3wHpmy/cbaO6Us7NuzFP4SRdYyN6BvSTKN8HnW3Pxd9Pb6dsoyANp7
	HfTw==
X-Gm-Message-State: APjAAAWFXV+rPoRayKR1NiDHr3DwgzFMA8CI+U7itEDbX0zEExUL0ChO
	wAUtiaPTRsG+pDYrOz09qnL2Gsl2PtgnIHMEas8=
X-Google-Smtp-Source: APXvYqyoyr0sTSPydKhimzM3C7aHE9LyvrGNiWhdaQT2kgVD2DZuI5+YYrgrejRDgCUHqr2ECrmdCcNHdVerRhrdfbk=
X-Received: by 2002:a17:906:6a87:: with SMTP id
	p7mr3105112ejr.277.1565853814363; 
	Thu, 15 Aug 2019 00:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
	<7128b7d3-78c0-0a66-8e55-65fedeab2dd1@intel.com>
In-Reply-To: <7128b7d3-78c0-0a66-8e55-65fedeab2dd1@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Aug 2019 09:23:23 +0200
Message-ID: <CA+chaQeeS+Ludz64ke19Hr5h1knrvbe769N5vhMQLH7=E_dmbQ@mail.gmail.com>
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Thu, 15 Aug 2019 07:23:34 -0000
Content-Type: multipart/alternative; boundary="000000000000601b83059022c0c8"

--000000000000601b83059022c0c8
Content-Type: text/plain; charset="UTF-8"

NAK

Yes, the first part was merged in warrior and is correct.

But this second part isn't good (you don't want git-lfs to sometimes work
and sometimes fail) and that's why it was rejected for master and
_shouldn't_ be merged to warrior. If you have recipes which need git-lfs,
then add it to normal HOSTTOOLS in your builds to make sure it's always
present when needed.

On Thu, Aug 15, 2019 at 9:01 AM Saini, Naveen Kumar <
naveen.kumar.saini@intel.com> wrote:

> The corresponding first patch of this patch series already merged in
> Warrior
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/bitbake/lib?h=warrior&id=6e3a4d7926296380da23536c29af35d5702e02fb
>
> So this patch should also go in warrior.
>
>
> On 8/15/19 2:53 PM, Naveen Saini wrote:
> > This provides git large file storage (lfs) extension.
> >
> > Include git-lfs conditionally. If git-lfs is present on host and repo
> > has lfs pointers, then git-lfs will be used. If git-lfs is not present
> > on host, it will be ignored.
> >
> > [YOCTO #13198]
> >
> > (From OE-Core rev: 2968ad8514721ec06e67aaf3fd5ec7b247b3431d)
> >
> > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/conf/bitbake.conf | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index c996301a8b..c5313ccd19 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -514,6 +514,9 @@ HOSTTOOLS_NONFATAL += "bzr"
> >   # Used by ssh fetcher
> >   HOSTTOOLS_NONFATAL += "scp"
> >
> > +# Link to git-lfs if present
> > +HOSTTOOLS_NONFATAL += "git-lfs"
> > +
> >   CCACHE ??= ""
> >
> >   TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000601b83059022c0c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>NAK</div><div><br></div>Yes, the first part was merge=
d in warrior and is correct.<div><br></div><div>But this second part isn&#3=
9;t good (you don&#39;t want git-lfs to sometimes work and sometimes fail) =
and that&#39;s why it was rejected for master and _shouldn&#39;t_ be merged=
 to warrior. If you have recipes which need git-lfs, then add it to normal =
HOSTTOOLS in your builds to make sure it&#39;s always present when needed.<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Aug 15, 2019 at 9:01 AM Saini, Naveen Kumar &lt;<a href=3D"mai=
lto:naveen.kumar.saini@intel.com">naveen.kumar.saini@intel.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The correspon=
ding first patch of this patch series already merged in <br>
Warrior<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/bitbake/l=
ib?h=3Dwarrior&amp;id=3D6e3a4d7926296380da23536c29af35d5702e02fb" rel=3D"no=
referrer" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/poky=
/commit/bitbake/lib?h=3Dwarrior&amp;id=3D6e3a4d7926296380da23536c29af35d570=
2e02fb</a><br>
<br>
So this patch should also go in warrior.<br>
<br>
<br>
On 8/15/19 2:53 PM, Naveen Saini wrote:<br>
&gt; This provides git large file storage (lfs) extension.<br>
&gt; <br>
&gt; Include git-lfs conditionally. If git-lfs is present on host and repo<=
br>
&gt; has lfs pointers, then git-lfs will be used. If git-lfs is not present=
<br>
&gt; on host, it will be ignored.<br>
&gt; <br>
&gt; [YOCTO #13198]<br>
&gt; <br>
&gt; (From OE-Core rev: 2968ad8514721ec06e67aaf3fd5ec7b247b3431d)<br>
&gt; <br>
&gt; Signed-off-by: Naveen Saini &lt;<a href=3D"mailto:naveen.kumar.saini@i=
ntel.com" target=3D"_blank">naveen.kumar.saini@intel.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/bitbake.conf | 3 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index c996301a8b..c5313ccd19 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -514,6 +514,9 @@ HOSTTOOLS_NONFATAL +=3D &quot;bzr&quot;<br>
&gt;=C2=A0 =C2=A0# Used by ssh fetcher<br>
&gt;=C2=A0 =C2=A0HOSTTOOLS_NONFATAL +=3D &quot;scp&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# Link to git-lfs if present<br>
&gt; +HOSTTOOLS_NONFATAL +=3D &quot;git-lfs&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0CCACHE ??=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0TOOLCHAIN_OPTIONS =3D &quot; --sysroot=3D${STAGING_DIR_TAR=
GET}&quot;<br>
&gt; <br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000601b83059022c0c8--
