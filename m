Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id D592671D79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 14:46:22 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id t22so23153892ioa.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Feb 2018 06:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9FwlK4rbRnoeYHXaGw90s2NDDE4N0bWCGxwTXBCAh60=;
	b=JgZPUVkDyrNuDNMzHdswyL5MlwYebr4DZSM811o+C/54dMNXuJb1GQYXM44VxO0p7h
	J3o3StJ/ZZwZvjiXO3gl2z+m6MlgwGs4ic0OcCtOFTVnWUX+3DYW0ryuq1J5Ul1gfIbl
	mxk9nT6QuG/o/4zu7mWJ60tYqgQSjDVZl+0xijb3gkjjFGduxC0b5KZYHJkLAGwx0DyZ
	/j2zS+FMwkTI2YANa3ukaJ+393pk0RAkVjsiObkBqrxAbZTasiLXiBRWpD5+CfHIAScv
	RsYceipe12F+S/yNUnj+CCX5YKfhn9C5hYafCz2dhGPyn5yk0qVY/hAjq7+C66MkExOE
	eNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9FwlK4rbRnoeYHXaGw90s2NDDE4N0bWCGxwTXBCAh60=;
	b=GfmJXFvH8t90l9nUs1OxebrPzG4Dk8G0pSoevTeGnS2mjoRTDFiZdOQyus0iPqmdGg
	K3DBi9xd96mDzylepSWGJQO6K+BMQtTB9a14Bl8L8oqpFxQIzEVsSgHzY6bmP29m7hj4
	wI4SCyrOr4IT3j0NOS4wK9gObp0R0svw9ADRf6bmLhjfg+4ix6mipgyrFmkyWx9rMhgv
	R7bV5Rj2xO2tcgMiQDpTwDNBcZqYqLq+P37Rtkn932CPHrtrjgW9RZ0oHMSdsORdkrcN
	7w71ljFrmGdqKV2fmgSRAzclDxJ14xhq2LigoLYV5q8JNpMigfbXBPPIKO0OKc5s7Sar
	lggA==
X-Gm-Message-State: AKwxytdh0hq5I3ENf7yJdeKzMwL6+SzmXWWHSeWf0+ETHMhY2dtIpanb
	2y694tXmQjLMaNJx1bxTrI5Zy7fXV8bKNJ9v+vhMkQ==
X-Google-Smtp-Source: AH8x225sW974HzFLzpC/Pm59w9wlMh6WF4nAtcvz07EepPk9V4scnU9GvoUrGl5g2x30lSBGAgHvEE6Q3FmL3zeWmBo=
X-Received: by 10.107.175.8 with SMTP id y8mr43442649ioe.37.1517582783774;
	Fri, 02 Feb 2018 06:46:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 2 Feb 2018 06:46:03 -0800 (PST)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA0156714C9B@ALA-MBC.corp.ad.wrs.com>
References: <cover.1517555249.git.jackie.huang@windriver.com>
	<20180202073300.15542.39974@do.openembedded.org>
	<1B858668EC6A94408DCA5225FDFA85AA0156714C9B@ALA-MBC.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Feb 2018 14:46:03 +0000
Message-ID: <CAJTo0LYiPUnGLzFrZuKEwHt3dzdCFWJFoEu_1qBM7ASnz_PiSA@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGUyZnNwcm9nczogZml4ZXMgZm9yIHB0ZXN0?=
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
X-List-Received-Date: Fri, 02 Feb 2018 14:46:23 -0000
Content-Type: multipart/alternative; boundary="001a1144a268be8b0f05643bc63b"

--001a1144a268be8b0f05643bc63b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, this clearly isn't right.

On 2 February 2018 at 07:52, Huang, Jie (Jackie) <Jackie.Huang@windriver.co=
m
> wrote:

>
>
> > -----Original Message-----
> > From: Patchwork [mailto:patchwork@do.openembedded.org]
> > Sent: Friday, February 02, 2018 15:33
> > To: Huang, Jie (Jackie)
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: =E2=9C=97 patchtest: failure for e2fsprogs: fixes for ptest
> >
> > =3D=3D Series Details =3D=3D
> >
> > Series: e2fsprogs: fixes for ptest
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/10824/
> > State : failure
> >
> > =3D=3D Summary =3D=3D
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. This i=
s
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             Patches not removed from tree
> [test_src_uri_left_files]
> >   Suggested fix    Amend the patch containing the software patch file
> removal
> >   Patch            quiet-debugfs.patch
>
> What I did is moving the "quiet-debugfs.patch" from SRC_URI to
> SRC_URI_append_class-native,
> the patch file is not meant to be removed.
>
> I think the test_src_uri_left_files needs to consider such changes.
>
> Thanks,
> Jackie
>
> >
> >
> >
> > If you believe any of these test results are incorrect, please reply to
> the
> > mailing list (openembedded-core@lists.openembedded.org) raising your
> > concerns.
> > Otherwise we would appreciate you correcting the issues and submitting =
a
> > new
> > version of the patchset if applicable. Please ensure you add/increment
> the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2]
> ->
> > [PATCH v3] -> ...).
> >
> > ---
> > Guidelines:
> > https://www.openembedded.org/wiki/Commit_Patch_Message_Guideline
> > s
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144a268be8b0f05643bc63b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, this clearly isn&#39;t right.</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 2 February 2018 at 07:52, Huang,=
 Jie (Jackie) <span dir=3D"ltr">&lt;<a href=3D"mailto:Jackie.Huang@windrive=
r.com" target=3D"_blank">Jackie.Huang@windriver.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Patchwork [mailto:<a href=3D"mailto:patchwork@do.openembedded.or=
g">patchwork@do.<wbr>openembedded.org</a>]<br>
&gt; Sent: Friday, February 02, 2018 15:33<br>
&gt; To: Huang, Jie (Jackie)<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Subject: =E2=9C=97 patchtest: failure for e2fsprogs: fixes for ptest<b=
r>
&gt;<br>
&gt; =3D=3D Series Details =3D=3D<br>
&gt;<br>
&gt; Series: e2fsprogs: fixes for ptest<br>
&gt; Revision: 1<br>
&gt; URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series=
/10824/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openem=
bedded.org/series/10824/</a><br>
&gt; State : failure<br>
&gt;<br>
&gt; =3D=3D Summary =3D=3D<br>
&gt;<br>
&gt;<br>
&gt; Thank you for submitting this patch series to OpenEmbedded Core. This =
is<br>
&gt; an automated response. Several tests have been executed on the propose=
d<br>
&gt; series by patchtest resulting in the following failures:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; * Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Patches not rem=
oved from tree [test_src_uri_left_files]<br>
&gt;=C2=A0 =C2=A0Suggested fix=C2=A0 =C2=A0 Amend the patch containing the =
software patch file removal<br>
&gt;=C2=A0 =C2=A0Patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 quiet-debug=
fs.patch<br>
<br>
</span>What I did is moving the &quot;quiet-debugfs.patch&quot; from SRC_UR=
I to SRC_URI_append_class-native,<br>
the patch file is not meant to be removed.<br>
<br>
I think the test_src_uri_left_files needs to consider such changes.<br>
<br>
Thanks,<br>
Jackie<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; If you believe any of these test results are incorrect, please reply t=
o the<br>
&gt; mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg">openembedded-core@lists.<wbr>openembedded.org</a>) raising your<br>
&gt; concerns.<br>
&gt; Otherwise we would appreciate you correcting the issues and submitting=
 a<br>
&gt; new<br>
&gt; version of the patchset if applicable. Please ensure you add/increment=
 the<br>
&gt; version number when sending the new version (i.e. [PATCH] -&gt; [PATCH=
 v2] -&gt;<br>
&gt; [PATCH v3] -&gt; ...).<br>
&gt;<br>
&gt; ---<br>
&gt; Guidelines:<br>
&gt; <a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_Guid=
eline" rel=3D"noreferrer" target=3D"_blank">https://www.openembedded.org/<w=
br>wiki/Commit_Patch_Message_<wbr>Guideline</a><br>
&gt; s<br>
&gt; Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/p=
atchtest" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/=
<wbr>cgit/cgit.cgi/patchtest</a><br>
&gt; Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/=
cgit/cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git=
.yoctoproject.org/<wbr>cgit/cgit.cgi/patchtest-oe</a><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1144a268be8b0f05643bc63b--
