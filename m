Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id C056F600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 16:07:29 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id s19so391917ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 08:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=18RFS1JfEkZm6emqFKmOOHqoPA9Wj9EjYeQ7ZEN27Ew=;
	b=JwqC8kuBRgumHAu47DnmvlfIbdFiYMdmm+vwcaDmu06V7aefVctBx1qrXrupo/bbIs
	XvmJRPXRXfL6AatqHl/4lz/sTLNyBZ8Gx8aN4pMagB8LrIBghctjoMFeecTtkYtVEHwO
	ZSUjUV+MuySSLABmi3Ilm61rlEUnH104xqLyASDC1PPSabaKJ0t/BpTNH/G5XqZoqrLp
	WElLEfc/WLhnhcYullMR2dGVawtAogNMrssNQXWAhkGDFmv56YnR6C01vlaP+ym4An4w
	jCvAnara6j4CElfEHiM0bCMvqfNyOSmCtmEtrMeNXoL1Van+biJVN27xsWPn+9c935/w
	vAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=18RFS1JfEkZm6emqFKmOOHqoPA9Wj9EjYeQ7ZEN27Ew=;
	b=jyhzhw2d9sYTwZ57g4AdJ/0KKvMFwXrLWoqqdzp/JZj4qpBUirtUI+9eUpUBrMplvh
	xyICVlgpRaEefi4X+1p/+i19sBQ5jzp+nPjciJNHhp+qhZUOqUkO81YWIt75Mpi5rL6R
	JYgzJkqK30SFt0lEhgzbvlohU+XIiBlY/VNF84uOkqKwZigaQ5TXaMd/Cg1zqJiqYfnS
	h7PnT2qFLSICyhUuIEKAL5VMd54APlr9WB4yWva6sggwF/67czfniLa6rJsQQhbfkxGn
	Tr7xzBLJsK0RdkGa6cHSXRV0NRciIqLrmGpCDu48w1xS6SmLtEFR2UuBWj3FAtVC0mic
	tlBQ==
X-Gm-Message-State: AJaThX7gvLrB4DBxRFS4/9EkxggN+lR0+wq9kBgl/D2mnzsE61fkxvRb
	tccGagMjCQYpZriMMe1WXSJriTkElrSHVwgL/qmA0w==
X-Google-Smtp-Source: AGs4zMZcGS/FnR3dCWYz/IYkbHjcHO3lLSo8mwSwkdMBghMQ1WSCrhdEaiOsXYQa31NZTzfGW11nuRu9ZwyJ7gw3vu0=
X-Received: by 10.107.20.68 with SMTP id 65mr49495225iou.244.1511885250763;
	Tue, 28 Nov 2017 08:07:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.8.1 with HTTP; Tue, 28 Nov 2017 08:07:30 -0800 (PST)
In-Reply-To: <CAMKF1sr2ZAM0sH19g0Y0Ewbb7D61x6igA4NBXd0wrXYBx9Wvvw@mail.gmail.com>
References: <1511460302-27041-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sr2ZAM0sH19g0Y0Ewbb7D61x6igA4NBXd0wrXYBx9Wvvw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Tue, 28 Nov 2017 21:37:30 +0530
Message-ID: <CAD3vsf7S+QhF5_qQbLVt9DrzGrwZb_HUX3BNL=iMgp8CVtgn6g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Morty][PATCH] binutils: Fix build issue on Centos 6
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
X-List-Received-Date: Tue, 28 Nov 2017 16:07:30 -0000
Content-Type: multipart/alternative; boundary="001a114fa584505399055f0d377f"

--001a114fa584505399055f0d377f
Content-Type: text/plain; charset="UTF-8"

> From: Armin Kuster <akuster@mvista.com>

> >
> > Per Yocto Compatable: The following change was made to fix a build issue
> we are seeing on
> > Centos 6. Not expecting this to be merge.
> >
> > binutils-cross-canadian-arm-2.27-r0.47: task do_compile:
> >
>
> does installing https://people.centos.org/tru/devtools-2/6/x86_64/RPMS/
> help ?
>
> The above link points to gcc rpms of v4.8.1/2, but the  "-Wstack-usage"
option
was introduced in gcc v4.9.x; so I think the problem exists with the above
rpms.
Ref: https://sourceware.org/bugzilla/show_bug.cgi?id=19854

Regards,
Jagadeesh

> gprof' cc1: error: unrecognized command line option "-Wstack-usage=262144"
> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > Reviewed-by: Jeremy Puhlman <jpuhlman@mvista.com>
> > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > index ae14642..30e3bc6 100644
> > --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > @@ -12,6 +12,13 @@ EXTRA_OECONF += "--with-sysroot=${SDKPATH}/
> sysroots/${TUNE_PKGARCH}${TARGET_VEND
> >  # e.g. we switch between different machines with different tunes.
> >  EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
> >
> > +EXTRA_OEMAKE += "WARN_CFLAGS='-W -Wall -Wstrict-prototypes
> -Wmissing-prototypes -Wshadow'"
> > +do_configure_prepend () {
> > +       sed -i ${S}/bfd/warning.m4 -e "/Wstack-usage/D"
> > +       sed -i ${S}/bfd/configure -e "s/-Wstack-usage=262144//"
> > +       sed -i ${S}/binutils/configure -e "s/-Wstack-usage=262144//"
> > +}
> > +
> >  do_install () {
> >         autotools_do_install
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114fa584505399055f0d377f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te"><span class=3D"gmail-"></span><span class=3D"gmail-">&gt; From: Armin K=
uster &lt;<a href=3D"mailto:akuster@mvista.com">akuster@mvista.com</a>&gt;<=
/span><br><span class=3D"gmail-"></span><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><span class=3D"gmail-">
&gt;<br>
&gt; Per Yocto Compatable: The following change was made to fix a build iss=
ue we are seeing on<br>
&gt; Centos 6. Not expecting this to be merge.<br>
&gt;<br>
&gt; binutils-cross-canadian-arm-2.<wbr>27-r0.47: task do_compile:<br>
&gt;<br>
<br>
</span>does installing <a href=3D"https://people.centos.org/tru/devtools-2/=
6/x86_64/RPMS/" rel=3D"noreferrer" target=3D"_blank">https://people.centos.=
org/tru/<wbr>devtools-2/6/x86_64/RPMS/</a> help ?<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br></div></div></block=
quote><div>The above link points to gcc rpms of v4.8.1/2, but the=C2=A0 &qu=
ot;-Wstack-usage&quot; option</div><div>was introduced in gcc v4.9.x; so I =
think the problem exists with the above rpms.</div><div>Ref: <a href=3D"htt=
ps://sourceware.org/bugzilla/show_bug.cgi?id=3D19854">https://sourceware.or=
g/bugzilla/show_bug.cgi?id=3D19854</a></div><div><br></div><div>Regards,</d=
iv><div>Jagadeesh</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">
&gt; gprof&#39; cc1: error: unrecognized command line option &quot;-Wstack-=
usage=3D262144&quot;<br>
&gt;<br>
&gt; Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishn=
anjanappa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
&gt; Reviewed-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com"=
>jpuhlman@mvista.com</a>&gt;<br>
&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">=
akuster@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr>canadian=
.inc | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr>c=
anadian.inc b/meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr>canad=
ian.inc<br>
&gt; index ae14642..30e3bc6 100644<br>
&gt; --- a/meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr>canadian=
.inc<br>
&gt; +++ b/meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr>canadian=
.inc<br>
&gt; @@ -12,6 +12,13 @@ EXTRA_OECONF +=3D &quot;--with-sysroot=3D${SDKPATH}=
/<wbr>sysroots/${TUNE_PKGARCH}${<wbr>TARGET_VEND<br>
&gt;=C2=A0 # e.g. we switch between different machines with different tunes=
.<br>
&gt;=C2=A0 EXTRA_OECONF[vardepsexclude] =3D &quot;TUNE_PKGARCH&quot;<br>
&gt;<br>
&gt; +EXTRA_OEMAKE +=3D &quot;WARN_CFLAGS=3D&#39;-W -Wall -Wstrict-prototyp=
es -Wmissing-prototypes -Wshadow&#39;&quot;<br>
&gt; +do_configure_prepend () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/bfd/warning.m4 -e &quot;/Wstac=
k-usage/D&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/bfd/configure -e &quot;s/-Wsta=
ck-usage=3D262144//&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/binutils/configure -e &quot;s/=
-Wstack-usage=3D262144//&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"gmail-HOEnZb"><font color=3D"#888888">&gt; --<br=
>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a114fa584505399055f0d377f--
