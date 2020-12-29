Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.10111.1609237465319533438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Dec 2020 02:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dHGpe4M9;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id r24so6827818vsg.10
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Dec 2020 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yKixw97CPaYZl33MlI3HfJusjk1S08vpVSR3MFE3dAE=;
        b=dHGpe4M96MOP0zW2mnByb7Np6ivx81bAFRmGbeYdlDemFCwyy5C+j6+qqLbPAL8MhW
         qD3d5vcvIeLheLa4UTsZL1PZ+cxBegtSyiBCR5ekYUd1o4NH0tVy9/bqE7NYUNcme6WK
         PIK78BEnqCdPtwaXNmR3GMHb072CRP+AkWx3D4iyHa7xAnRY25hk/YCHJjk2pUD3HJAE
         MirD6SulsiL16haEtfRraaPJeNPQNNZPzvQJQ/oBSM3mC01tLamZeZoFDENQTM5uab55
         aC/PwjAGJb+di4OuK38HP7TsPamsLjiCTGoGe8tb0mDbvbWkjORx/wUXpOc8w9YjX90/
         3Sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKixw97CPaYZl33MlI3HfJusjk1S08vpVSR3MFE3dAE=;
        b=L3BnvPjpYAFJJCkWzvu/ju01K/2X0bQlCoXdNomxmLACWl+HDjWAg80AfemgZeb1Iq
         APZStSD2ZMyTwza4NmNZOpDLJC0Ylcwf/yu+3DCrbVhchbiv82XZSxAk5Fp8lQt0tftc
         wMBwfTuHBvs4dZ4SffuZPEDifcptoU+bxBOxGHPCBxHDeEUrVvd7bNqmyV7TGlA1uIEf
         BpbBgNadbCXBk6ByqwH694X1RqRHXLTA4YS7sKbCh3Uee7vlJBcGWuVehgdYW1vdxqE0
         9PYQHTJXUascY+zTmCL2Oy9QffLIF2PgJ0ROtR+f7yH6XsMX12c6vuZC8+vJyPRCMYyp
         8M9Q==
X-Gm-Message-State: AOAM533gJm8IiKSEZrSYSZquI8VwaHFjqu4Iv7tlxY6J7bNB2oNLp458
	UoTHmuTA9IPS44xt21qyGxYoxpLOyvi1mdXurzo=
X-Google-Smtp-Source: ABdhPJwNOwxhfTIfYbgdpwS04WCG2fF+FZyQYA/MnxNtNzy9e48iKqA5M/nHIpc13urPR2QoV+FYPscg1RxJJYe43dQ=
X-Received: by 2002:a67:6044:: with SMTP id u65mr29003527vsb.31.1609237464394;
 Tue, 29 Dec 2020 02:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
 <20201226092732.52323-36-alex.kanavin@gmail.com> <ed57b85896d24aeb9446840ea1a03062@intel.com>
In-Reply-To: <ed57b85896d24aeb9446840ea1a03062@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 29 Dec 2020 05:24:13 -0500
Message-ID: <CANNYZj_zOSu_kyFRc_LHi25iBCj1dR=SyL2jxTJABVGvrqoQ0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 36/48] glib-2.0: update 2.66.2 -> 2.66.4
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006cb08d05b797cb09"

--0000000000006cb08d05b797cb09
Content-Type: text/plain; charset="UTF-8"

Thanks, sadly the failure pre-dates the version update. I made a patch that
could've helped, but alas it didn't, and I'm out of ideas at this point:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master&id=2848b3d949312681902a51938dae34f6389bd24d

Alex

On Tue, 29 Dec 2020 at 02:45, Saini, Naveen Kumar <
naveen.kumar.saini@intel.com> wrote:

> ptest failure observed on qemux86-64 machine.
>
> AssertionError: Failed ptests:
> {'glib-2.0': ['glib/codegen.py.test']}
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1711
>
> Regards,
> Naveen
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: Saturday, December 26, 2020 5:27 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > Subject: [OE-core] [PATCH 36/48] glib-2.0: update 2.66.2 -> 2.66.4
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../glib-2.0/{glib-2.0_2.66.2.bb => glib-2.0_2.66.4.bb}         | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> meta/recipes-core/glib-
> > 2.0/{glib-2.0_2.66.2.bb => glib-2.0_2.66.4.bb} (95%)
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
> b/meta/recipes-
> > core/glib-2.0/glib-2.0_2.66.4.bb
> > similarity index 95%
> > rename from meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
> > rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
> > index 01ed54d06a..70e8aa8785 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
> > @@ -21,7 +21,7 @@ SRC_URI =
> > "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> >
> >  SRC_URI_append_class-native = " file://relocate-modules.patch"
> >
> > -SRC_URI[sha256sum] =
> > "ec390bed4e8dd0f89e918f385e8d4cfd7470b1ef7c1ce93ec5c4fc6e3c6a17c4"
> > +SRC_URI[sha256sum] =
> > "97df8670e32f9fd4f7392b0980e661dd625012015d58350da1e58e343f4af984"
> >
> >  # Find any meson cross files in FILESPATH that are relevant for the
> current  #
> > build (using siteinfo) and add them to EXTRA_OEMESON.
> > --
> > 2.29.2
>
>

--0000000000006cb08d05b797cb09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, sadly the failure pre-dates the version updat=
e. I made a patch that could&#39;ve helped, but alas it didn&#39;t, and I&#=
39;m out of ideas at this point:</div><div><a href=3D"http://git.yoctoproje=
ct.org/cgit/cgit.cgi/poky/commit/?h=3Dmaster&amp;id=3D2848b3d949312681902a5=
1938dae34f6389bd24d">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/=
?h=3Dmaster&amp;id=3D2848b3d949312681902a51938dae34f6389bd24d</a></div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 29 Dec 2020 at 02:45, Saini, Naveen K=
umar &lt;<a href=3D"mailto:naveen.kumar.saini@intel.com">naveen.kumar.saini=
@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">ptest failure observed on qemux86-64 machine.<br>
<br>
AssertionError: Failed ptests:<br>
{&#39;glib-2.0&#39;: [&#39;glib/codegen.py.test&#39;]}<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/1711" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/1711</a> <br>
<br>
Regards,<br>
Naveen<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin<br>
&gt; Sent: Saturday, December 26, 2020 5:27 PM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 36/48] glib-2.0: update 2.66.2 -&gt; 2.66.4<=
br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glib-2.0/{<a href=3D"http://glib-2.0_2.66.2.bb" rel=3D"noref=
errer" target=3D"_blank">glib-2.0_2.66.2.bb</a> =3D&gt; <a href=3D"http://g=
lib-2.0_2.66.4.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.4.bb<=
/a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)=C2=A0 rename meta/=
recipes-core/glib-<br>
&gt; 2.0/{<a href=3D"http://glib-2.0_2.66.2.bb" rel=3D"noreferrer" target=
=3D"_blank">glib-2.0_2.66.2.bb</a> =3D&gt; <a href=3D"http://glib-2.0_2.66.=
4.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.4.bb</a>} (95%)<br=
>
&gt; <br>
&gt; diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.6=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.2.bb</a> b/meta/=
recipes-<br>
&gt; core/glib-2.0/<a href=3D"http://glib-2.0_2.66.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">glib-2.0_2.66.4.bb</a><br>
&gt; similarity index 95%<br>
&gt; rename from meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66=
.2.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.2.bb</a><br>
&gt; rename to meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.4=
.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.4.bb</a><br>
&gt; index 01ed54d06a..70e8aa8785 100644<br>
&gt; --- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.2.bb</a><br>
&gt; +++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.4.bb</a><br>
&gt; @@ -21,7 +21,7 @@ SRC_URI =3D<br>
&gt; &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \<br>
&gt; <br>
&gt;=C2=A0 SRC_URI_append_class-native =3D &quot; file://relocate-modules.p=
atch&quot;<br>
&gt; <br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;ec390bed4e8dd0f89e918f385e8d4cfd7470b1ef7c1ce93ec5c4fc6e3c6a17c4=
&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;97df8670e32f9fd4f7392b0980e661dd625012015d58350da1e58e343f4af984=
&quot;<br>
&gt; <br>
&gt;=C2=A0 # Find any meson cross files in FILESPATH that are relevant for =
the current=C2=A0 #<br>
&gt; build (using siteinfo) and add them to EXTRA_OEMESON.<br>
&gt; --<br>
&gt; 2.29.2<br>
<br>
</blockquote></div>

--0000000000006cb08d05b797cb09--
