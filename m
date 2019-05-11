Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 787BD7DE0E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 01:18:02 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 198so9090054wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 18:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kfRvLpHn7aEf6dvdAQKWMRrx7Agfkdz5KQroZiXeFYk=;
	b=d6wYs8RURc3H0B8jYZaDDNSFk2Ktzx6fzSxxs6hlfrGGNgQsd+/6P2035lcrjjZIQu
	pC+ix7JcVb7Gnpz3Y4TjQrXQsREeySaxZ+blrI2rROWiPF3AjCV1pfT9Rq0iQFwQaEWD
	jokc7/BCVv0Vr97PxnMbR5DIXy5pxeP0TwDy9svx6SDB23gCwBH0oHSb8RI/wQjHUr8B
	wTyx47zNqCxF5VGLto/VGs7+q0JeAWq8A1XWq22DojL3GYhHQOsKDEEZ5R/8QsJl7KAL
	uVr0ujplOLumN2oVaw7fyrnHC/cNawFtp4Y8A0uA1RExDUMD/BCIXDxeugk4Vs/0oRDq
	rqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kfRvLpHn7aEf6dvdAQKWMRrx7Agfkdz5KQroZiXeFYk=;
	b=Sd0lDPxUXYik5ivXoUhDevKDyRMefLpJ9ldUUNUQ6EQqRaqZTFjlV8hngy0TUc+KuN
	6AN7O+C2DvcSgx3qHflIFH4yCq2iWcdNIb9bK5pbMxOO8GHSXb1qluctqlRLgSZxSdSA
	3vuJSRCTDCaRu0EduyHmWPwlWBZYDlCISWDbzhk+iir+hEAd94TNFNTKASR4ob3aJEyu
	1dpwwM1KTWxwkxMR5Rq0vxVO9rgzgRdbDcYSxAuXwe92feLDHbt8V/PLJxYocS97jAXk
	RD9TRAjhp8GpQyhFHgxMEStOms0iIRdH+ueRvifJDjxs9adVOun6yF/caNxpqPhyXEO7
	6JSg==
X-Gm-Message-State: APjAAAU//ixQtyccwmXqCcwGx9UZPbqLLzDtaSnlIGhFI3wFo6LLyGEZ
	dYW85ZURnltNi78icSGO9aCYJ2lFyAHDzJrha9d664yC
X-Google-Smtp-Source: APXvYqx6VxpbfQZ9EyuPARHGXdDaTeI96YZLE4z2k+DpmO2tjZhFAdkkewboXH5jLfqpS769A1N6QG/Is6SBxJZbbPY=
X-Received: by 2002:a1c:be16:: with SMTP id o22mr8474098wmf.1.1557537482935;
	Fri, 10 May 2019 18:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
	<5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
	<CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
	<3b7d605c-ac73-6edf-7b39-598d451a4453@gmail.com>
	<20190511010421.GA1523@jama>
In-Reply-To: <20190511010421.GA1523@jama>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 10 May 2019 20:17:50 -0500
Message-ID: <CAJdd5GYVfHO8Hs21P0Ohun12nEEqcgwBeWdYtsUPdtLGLi6MXQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Sat, 11 May 2019 01:18:03 -0000
Content-Type: multipart/alternative; boundary="0000000000006513ee058892742f"

--0000000000006513ee058892742f
Content-Type: text/plain; charset="UTF-8"

On Fri, May 10, 2019, 8:04 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, May 10, 2019 at 04:54:57PM -0700, Khem Raj wrote:
> >
> >
> > On 5/10/19 4:00 PM, Andre McCurdy wrote:
> > > On Fri, May 10, 2019 at 3:16 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> On 5/10/19 3:13 PM, akuster808 wrote:
> > >>> should we change the default to openssl ?
> > >>
> > >> I dont think so. Since newer versions of gnuTLS works okay.
> > >
> > > Isn't one of the goals for OE 2.8 to replace dependencies on [L]GPLv3
> > > components with non-[L]GPLv3 alternatives so that meta-gplv2 can be
> > > deprecated? This would seem to fit that goal exactly.
> >
> > Is that stated somewhere ? while I like the goal probably I missed the
> > memo, my suggestion was just to give openssl backend some time to mature
> > since its relatively new, and maybe give it some soak time
> >
> > >
> > > It wasn't possible to build glib-networking with openssl until very
> > > recently but now that it's supported upstream I think we should
> > > switch.
> > >
> > >    https://github.com/GNOME/glib-networking/blob/master/NEWS
>
> I don't have strong opinion either way.
>
> I didn't want to change the default, because my only motivation was the
> license issue with the newer gnutls, with the PACKAGECONFIG available
> it's easy to change the TLS backend and that's all I need.
>
> Will send v2 if there is some consensus from glib-networking users that
> it should be changed and someone provides me the reasoning for the
> commit message.
>

FWIW, moving away from GPLv3 and/or meta-gplv2 has been discussed in the
2.8 planning meetings:
https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/edit?usp=drivesdk

Not that it needs to be done right now. It is nice to at least have the
option.


> Cheers,
>
> > >
> > >>> - armin
> > >>>
> > >>> On 5/10/19 2:55 PM, Martin Jansa wrote:
> > >>>> * gnutls from meta-gplv2 isn't new enough for this version of
> glib-networking:
> > >>>>     meson.build:74:0: ERROR:  Invalid version of dependency, need
> 'gnutls' ['>= 3.4.6'] found '3.3.30'
> > >>>>
> > >>>> * disabling gnutls PACKAGECONFIG isn't an option either:
> > >>>>     meson.build:131:2: ERROR:  Problem encountered: No TLS backends
> enabled. Please enable at least one TLS backend
> > >>>>
> > >>>> * add an option to replace gnutls with openssl
> > >>>>
> > >>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >>>> ---
> > >>>>    meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1
> +
> > >>>>    1 file changed, 1 insertion(+)
> > >>>>
> > >>>> diff --git a/meta/recipes-core/glib-networking/
> glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/
> glib-networking_2.60.1.bb
> > >>>> index 09af229d69..e2b4cffb2b 100644
> > >>>> --- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> > >>>> +++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> > >>>> @@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] =
> "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
> > >>>>    PACKAGECONFIG ??= "gnutls"
> > >>>>
> > >>>>    PACKAGECONFIG[gnutls] =
> "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
> > >>>> +PACKAGECONFIG[openssl] =
> "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
> > >>>>    PACKAGECONFIG[libproxy] =
> "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
> > >>>>
> > >>>>    EXTRA_OEMESON = "-Dgnome_proxy=disabled"
> > >>>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006513ee058892742f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 10, 2019, 8:04 PM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Fri, May 10, 2019 at 04:54:57PM -0=
700, Khem Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 5/10/19 4:00 PM, Andre McCurdy wrote:<br>
&gt; &gt; On Fri, May 10, 2019 at 3:16 PM Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</=
a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 5/10/19 3:13 PM, akuster808 wrote:<br>
&gt; &gt;&gt;&gt; should we change the default to openssl ?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I dont think so. Since newer versions of gnuTLS works okay.<b=
r>
&gt; &gt; <br>
&gt; &gt; Isn&#39;t one of the goals for OE 2.8 to replace dependencies on =
[L]GPLv3<br>
&gt; &gt; components with non-[L]GPLv3 alternatives so that meta-gplv2 can =
be<br>
&gt; &gt; deprecated? This would seem to fit that goal exactly.<br>
&gt; <br>
&gt; Is that stated somewhere ? while I like the goal probably I missed the=
 <br>
&gt; memo, my suggestion was just to give openssl backend some time to matu=
re <br>
&gt; since its relatively new, and maybe give it some soak time<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; It wasn&#39;t possible to build glib-networking with openssl unti=
l very<br>
&gt; &gt; recently but now that it&#39;s supported upstream I think we shou=
ld<br>
&gt; &gt; switch.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/GNOME/glib-networking/=
blob/master/NEWS" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/GNOME/glib-networking/blob/master/NEWS</a><br>
<br>
I don&#39;t have strong opinion either way.<br>
<br>
I didn&#39;t want to change the default, because my only motivation was the=
<br>
license issue with the newer gnutls, with the PACKAGECONFIG available<br>
it&#39;s easy to change the TLS backend and that&#39;s all I need.<br>
<br>
Will send v2 if there is some consensus from glib-networking users that<br>
it should be changed and someone provides me the reasoning for the<br>
commit message.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">FWIW, moving away from GPLv3 and/or meta-gplv2 has been disc=
ussed in the 2.8 planning meetings:=C2=A0<a href=3D"https://docs.google.com=
/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/edit?usp=3Ddrivesd=
k">https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2H=
baJGXbU/edit?usp=3Ddrivesdk</a></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Not that it needs to be done right now. It is nice to at least ha=
ve the option.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
&gt; &gt; <br>
&gt; &gt;&gt;&gt; - armin<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On 5/10/19 2:55 PM, Martin Jansa wrote:<br>
&gt; &gt;&gt;&gt;&gt; * gnutls from meta-gplv2 isn&#39;t new enough for thi=
s version of glib-networking:<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0meson.build:74:0: ERROR:=C2=A0 Inv=
alid version of dependency, need &#39;gnutls&#39; [&#39;&gt;=3D 3.4.6&#39;]=
 found &#39;3.3.30&#39;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; * disabling gnutls PACKAGECONFIG isn&#39;t an option =
either:<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0meson.build:131:2: ERROR:=C2=A0 Pr=
oblem encountered: No TLS backends enabled. Please enable at least one TLS =
backend<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; * add an option to replace gnutls with openssl<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Mar=
tin.Jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">Martin.Jansa@gmai=
l.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 meta/recipes-core/glib-networking/<a hre=
f=3D"http://glib-networking_2.60.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">glib-networking_2.60.1.bb</a> | 1 +<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; diff --git a/meta/recipes-core/glib-networking/<a hre=
f=3D"http://glib-networking_2.60.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">glib-networking_2.60.1.bb</a> b/meta/recipes-core/glib-networki=
ng/<a href=3D"http://glib-networking_2.60.1.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">glib-networking_2.60.1.bb</a><br>
&gt; &gt;&gt;&gt;&gt; index 09af229d69..e2b4cffb2b 100644<br>
&gt; &gt;&gt;&gt;&gt; --- a/meta/recipes-core/glib-networking/<a href=3D"ht=
tp://glib-networking_2.60.1.bb" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">glib-networking_2.60.1.bb</a><br>
&gt; &gt;&gt;&gt;&gt; +++ b/meta/recipes-core/glib-networking/<a href=3D"ht=
tp://glib-networking_2.60.1.bb" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">glib-networking_2.60.1.bb</a><br>
&gt; &gt;&gt;&gt;&gt; @@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] =3D &quo=
t;d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 PACKAGECONFIG ??=3D &quot;gnutls&quot;<b=
r>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 PACKAGECONFIG[gnutls] =3D &quot;-Dgnutls=
=3Denabled,-Dgnutls=3Ddisabled,gnutls&quot;<br>
&gt; &gt;&gt;&gt;&gt; +PACKAGECONFIG[openssl] =3D &quot;-Dopenssl=3Denabled=
,-Dopenssl=3Ddisabled,openssl&quot;<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 PACKAGECONFIG[libproxy] =3D &quot;-Dlibp=
roxy=3Denabled,-Dlibproxy=3Ddisabled,libproxy&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 EXTRA_OEMESON =3D &quot;-Dgnome_proxy=3D=
disabled&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">Openembedded-core@lists.openembedded.or=
g</a><br>
&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://list=
s.openembedded.org/mailman/listinfo/openembedded-core</a><br>
<br>
-- <br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">Martin.Jansa@gma=
il.com</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--0000000000006513ee058892742f--
