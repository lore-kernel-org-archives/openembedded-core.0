Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id DA05E731AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 15:17:52 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id s8so11532256ign.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IjZxuuIeADjG674ncjnkWftuwe1gw7dxPIERxYjC1ss=;
	b=tKGgRkOxzYU4fRYGY9l5CUmlPKNXyccZOSlIKOcL38I6mPhP5NUXhNwToy10mA3he+
	BwVPmRyziaAUaAlEkDmvv/ieNT0rT4kYEZ4dYDxO7YNbqZia3O70Kc81vrIe5vZlX9iX
	KDi+MMtrk5LdPwheio+FTgNpYNmOp/wnQq5v+Kq+n66wpmMvhGAXekhtfK9XcMtxJkdP
	t9gnWbANLF9UvGfXqNtmoLwK+EgxkC5h0o5uwWfGgvbQADTZvyPjEkXA6yXqiSP2iwSc
	y5qZQ63kqRdIWCIhw2lIJyjtrf0yYGPKNUDoFf3tbI3anEIweARzEo2XLmavh5uLtgTz
	sZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IjZxuuIeADjG674ncjnkWftuwe1gw7dxPIERxYjC1ss=;
	b=Irtr6u6Jpd842GkubF5sQ82iaAbXIpBLqpylE9/YznftXzciysOcIdA2vud38qN/dl
	sT95lPME0zzUh3dI5gHdPqZUbaRXqhKSVG8yYwY/SHQW+q/SECO0eEubAaF5fKOT2V5e
	SS28d1OdYTAxEL0uio6rB3n8I18ThSvQhaYqSoY0rC+TEs+KlPXWZqgBEm+/KzLQWwou
	IrwXxS/88St/ccALW/wXS4Td0bIl74s6OCy7QZueT9hknIVjQAsyTADP03WUXuV7n3jV
	+12ujUiXjHIV41VHXHm8xhl3R8v90K/KuD2Dtx4vt/RtYVg1R0iUlQLUyer8QjBBOc3H
	2Jhw==
X-Gm-Message-State: AOPr4FXwplfLmmreQWdknJEdvxQ5voYZUdkUfX5rRhMWhLobjv3AiyFn6cyevVRHpucNqeqpv3z0q/R8wN5GjJEx
X-Received: by 10.50.119.67 with SMTP id ks3mr1589635igb.78.1463498272945;
	Tue, 17 May 2016 08:17:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 17 May 2016 08:17:33 -0700 (PDT)
In-Reply-To: <573A0236.6040003@linux.intel.com>
References: <1462984915-12056-1-git-send-email-anibal.limon@linux.intel.com>
	<573A0236.6040003@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 May 2016 16:17:33 +0100
Message-ID: <CAJTo0LYeSgsebL1wd8EFcYEiJUEDpevsLarXi33LYZrJTa2R7Q@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patrick Ohly <patrick.ohly@gmx.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/base: get_lic_checksum_file_list imporve validaton of url's
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
X-List-Received-Date: Tue, 17 May 2016 15:17:53 -0000
Content-Type: multipart/alternative; boundary=089e011847f6b0545b05330b3e8b

--089e011847f6b0545b05330b3e8b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is in master-next now, thanks Anibal!

Ross

On 16 May 2016 at 18:24, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.c=
om> wrote:

> ping
>
> On 05/11/2016 11:41 AM, An=C3=ADbal Lim=C3=B3n wrote:
> > When specify an URL different that supported file:// the function
> > returns an empty path causing an exception without notice the user
> > that the URL is Malformed.
> >
> > [YOCTO #9211]
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> > ---
> >  meta/classes/base.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index a7ca3a6..c3c2669 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -105,6 +105,9 @@ def get_lic_checksum_file_list(d):
> >          # any others should be covered by SRC_URI.
> >          try:
> >              path =3D bb.fetch.decodeurl(url)[2]
> > +            if not path:
> > +                raise bb.fetch.MalformedUrl(url)
> > +
> >              if path[0] =3D=3D '/':
> >                  if path.startswith(tmpdir):
> >                      continue
> >
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--089e011847f6b0545b05330b3e8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is in master-next now, thanks Anibal!<div><br></div><=
div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On 16 May 2016 at 18:24, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limo=
n@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">p=
ing<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On 05/11/2016 11:41 AM, An=C3=ADbal Lim=C3=B3n wrote:<br>
&gt; When specify an URL different that supported file:// the function<br>
&gt; returns an empty path causing an exception without notice the user<br>
&gt; that the URL is Malformed.<br>
&gt;<br>
&gt; [YOCTO #9211]<br>
&gt;<br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.lim=
on@linux.intel.com">anibal.limon@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/base.bbclass | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
&gt; index a7ca3a6..c3c2669 100644<br>
&gt; --- a/meta/classes/base.bbclass<br>
&gt; +++ b/meta/classes/base.bbclass<br>
&gt; @@ -105,6 +105,9 @@ def get_lic_checksum_file_list(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # any others should be covered by SR=
C_URI.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D bb.fetch.deco=
deurl(url)[2]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not path:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.fetc=
h.MalformedUrl(url)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path[0] =3D=3D &#39=
;/&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path.=
startswith(tmpdir):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue<br>
&gt;<br>
<br>
</div></div><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--089e011847f6b0545b05330b3e8b--
