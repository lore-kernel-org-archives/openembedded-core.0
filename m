Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id BE9887451A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 00:22:15 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id t4so5636074ual.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 17:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k5SLyA8VEEQh+Cyj4545mLQq0ZOmvYXVoO32y0u2QHw=;
	b=nzD1lcmklcHthqdJWm4KO1TsMGyfEYFbn8Qh92heElRt3a5UIhNDoDNjQmTlsB+Vc2
	tD1Jkq/kUhhVhGzn1CBJsukWwhUvhvkAUVGWm94wDPqPL7lRLvt35b8E34vJfifP9UFw
	Y1oTWrO+9Vr0OQeMy8qDrEGzNMCpDwZSnUv5D5oIKxBghCaE2pHW/PGo1suyS2Q15xFH
	MgISGSUpU/PbIg1aUkEgC8JejJUD7HAvGBkSN9RJcUrwRCHFpQ8ky/zNEWzPOuRN1mEy
	wHxj4j3AkYY8ruskk8Ca14KT5dVCw5hH+nEAGkQpa1PlfoQw+nhEfjnx0wlEmvFfXoU6
	N6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k5SLyA8VEEQh+Cyj4545mLQq0ZOmvYXVoO32y0u2QHw=;
	b=I6fzRoSF0GA+Vcf9o93DPr0vGOiCZqRIvW3NBaEg729U6/GhRvuNmeyHXQgBI9BDPH
	hiSEA+AtEZmvBhzJd/1hZrljjAziVLFVDAnmYamjDGixVeu0Kr6A+1VoovoS0RO5Fsgt
	+zlXnAfO47biLjxvES5OEy5dM24TzdWiOI40pnpOMXnxBvdQC7VAW4oY961ivmMIakww
	WGZTsNHBn9h6mUGpeyfBBEG2HPnwKXgPnqxYzCiHdar4f0LgHTvZwsi9RzgJKQn+L8gF
	y49o7ZuDDFb0/PQWcdMo4nkiRmM8/yF7qa1zHVsUma8vzUOqeOQhwEf06+fAz1PUmrjK
	UhsA==
X-Gm-Message-State: ALQs6tBs7QiX//jXhqSFZB6k6A3+e8meVRhMjk+FxJCp/PfD5Rl9EueQ
	QI2EchWbFctKUi50kE8KCM77UzqCjE1CMQORq6c=
X-Google-Smtp-Source: AIpwx48NMJOgGmY8Wnu7kFnywNfn4ggIpWrhzbehdDYijQh7o/FVR4BY/HXVv3bnr+7Uqyx/EhKgMQMTaytP/QgkqQs=
X-Received: by 10.176.1.36 with SMTP id 33mr12922600uak.7.1523924536349; Mon,
	16 Apr 2018 17:22:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.131.86 with HTTP; Mon, 16 Apr 2018 17:22:15 -0700 (PDT)
In-Reply-To: <CAJ86T=UWu-WB-2jLUDzP2fiM+3tyo4ecyK5PHUcEmgEyCuk4Ug@mail.gmail.com>
References: <1523906765-12497-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=UWu-WB-2jLUDzP2fiM+3tyo4ecyK5PHUcEmgEyCuk4Ug@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 17 Apr 2018 02:22:15 +0200
Message-ID: <CALatG=7s-PZ9itnJOB_oo5EzxwS8UtySzZXZ18f_3hy662Nbsg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] externalsrc.bbclass: introduce INHIBIT_SRCTREE_FILE_CHECKSUMES
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
X-List-Received-Date: Tue, 17 Apr 2018 00:22:15 -0000
Content-Type: multipart/alternative; boundary="001a113e36a2a759d1056a00547a"

--001a113e36a2a759d1056a00547a
Content-Type: text/plain; charset="UTF-8"

My mistake, that is a typo, will send the V2 soon.

//Ming Liu

2018-04-16 23:22 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:

> On Mon, Apr 16, 2018 at 12:26 PM,  <liu.ming50@gmail.com> wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > It defaults to be '0', but it allows the developers to choose not add
> > file-checksums to do_compile for the entire source tree, by setting to
> > '1'.
> >
> > We need this because we have a huge project with 100G bytes source
> > files, and we do not want them to be added to file-checksums variable
> > flag.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes/externalsrc.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> > index c9f5cf7..16c6862 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -26,6 +26,7 @@
> >
> >  SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
> >  EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
> > +INHIBIT_SRCTREE_FILE_CHECKSUMES ?= "0"
>
> Plural of CHECKSUM is CHECKSUMS (ie no 'E').
>
> >  python () {
> >      externalsrc = d.getVar('EXTERNALSRC')
> > @@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=None):
> >          with open(oe_hash_file, 'w') as fobj:
> >              fobj.write(sha1)
> >          ret = oe_hash_file + ':True'
> > -    else:
> > +    elif not d.getVar('INHIBIT_SRCTREE_FILE_CHECKSUMES'):
> >          ret = s_dir + '/*:True'
> >      return ret
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113e36a2a759d1056a00547a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My mistake, that is a typo, will send the V2 soon.<div><br=
></div><div>//Ming Liu</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2018-04-16 23:22 GMT+02:00 Andre McCurdy <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gma=
il.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n Mon, Apr 16, 2018 at 12:26 PM,=C2=A0 &lt;<a href=3D"mailto:liu.ming50@gma=
il.com">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@=
gmail.com</a>&gt;<br>
&gt;<br>
&gt; It defaults to be &#39;0&#39;, but it allows the developers to choose =
not add<br>
&gt; file-checksums to do_compile for the entire source tree, by setting to=
<br>
&gt; &#39;1&#39;.<br>
&gt;<br>
&gt; We need this because we have a huge project with 100G bytes source<br>
&gt; files, and we do not want them to be added to file-checksums variable<=
br>
&gt; flag.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">li=
u.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/externalsrc.<wbr>bbclass | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/externalsrc.<wbr>bbclass b/meta/classes/exte=
rnalsrc.<wbr>bbclass<br>
&gt; index c9f5cf7..16c6862 100644<br>
&gt; --- a/meta/classes/externalsrc.<wbr>bbclass<br>
&gt; +++ b/meta/classes/externalsrc.<wbr>bbclass<br>
&gt; @@ -26,6 +26,7 @@<br>
&gt;<br>
&gt;=C2=A0 SRCTREECOVEREDTASKS ?=3D &quot;do_patch do_unpack do_fetch&quot;=
<br>
&gt;=C2=A0 EXTERNALSRC_SYMLINKS ?=3D &quot;oe-workdir:${WORKDIR} oe-logs:${=
T}&quot;<br>
&gt; +INHIBIT_SRCTREE_FILE_<wbr>CHECKSUMES ?=3D &quot;0&quot;<br>
<br>
</span>Plural of CHECKSUM is CHECKSUMS (ie no &#39;E&#39;).<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 externalsrc =3D d.getVar(&#39;EXTERNALSRC&#39;)<br=
>
&gt; @@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(oe_hash_file, &#39;w&#39;)=
 as fobj:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fobj.write(sha1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D oe_hash_file + &#39;:True&#3=
9;<br>
&gt; -=C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 elif not d.getVar(&#39;INHIBIT_SRCTREE_<wbr>FILE_CHECKS=
UMES&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s_dir + &#39;/*:True&#39;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113e36a2a759d1056a00547a--
