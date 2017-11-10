Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id C271D784C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 11:57:33 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 72so1366609itl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 03:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R/aph5+hCNlQGVCVaxLxtXpd2LVXFgErBv9n/L7Fros=;
	b=DLW2gEPYk+u3gCHGkvzzfEgcHqZcIpnDHk+lRVY5THoNRIkY57y3woRuCWv53eIMQN
	i7A9qSO1b17PfifHwHvufGeH83vsbEVdDs1eXPd9Ns4gPbaVW7A0bZS3McxKSvQmIPuq
	q+nkvNhePyaOOmsKpmKGX7uzxbhkHHc8FPVtacuiBxfREWsaT/jcb750CqmRYUMiDEIV
	BmYXBg9U/5WIjYu9SBgUYQCJpRe0s+Ox32IsxDOUSSUCIhBzUzu5OuMsgxQYgA6cw0lE
	OGkRKvArItomB5vTyvuaU/T6BbtZCOIiWcqSQyKyYlGKDW82EAwfefPUBUu1ernLGrvY
	fG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R/aph5+hCNlQGVCVaxLxtXpd2LVXFgErBv9n/L7Fros=;
	b=UgG5JmIBY3wCv5FU8fAw/h6O5xTwj1TMbpTSehHkOG28iu2MSBbyUFZN3JCmygWVzi
	GBaAFNEErFKLVai9uz2vH+76or2GheT24vTmgvEGfyQiwdoBpwq+xkvSdozz7P5rMM8D
	p/tbaAtKCg6n4p6ET3310G9DYTnWXSWRhfc/r3REvMvsFJQViKo5A9ijoLUS9h9SlvC2
	5NSJzvMsvfPzPknbAWqeVx2vDT9aNk859Ah1NBobwnXGvIFflTuA6WW8fYmWuIDPDapd
	m+7QD3aRlDWpKRB9ehnuIQKZTeYzKrpMjB1EWNYW0wzg43Lx3Ln46KRd5ZukYPmhWUM5
	R9Dw==
X-Gm-Message-State: AJaThX48kvCgVk6eSidiIRwgW894bzGCMiQlSI5Q8bMeZ8UjLiIBKSa2
	uw9ZAWJHK3U7SYaw9eMpXed4dB4KIAoonHV7Z5sveQ==
X-Google-Smtp-Source: AGs4zMah+pWQsBQhOloXarzVpLTy9dXzlHaID5ZYtCHEHWAo/JsZeVlF1ygC0+ERyMTUBB/zQaFpu1xOQqFDJcRciEQ=
X-Received: by 10.36.71.74 with SMTP id t71mr88458itb.53.1510315054760; Fri,
	10 Nov 2017 03:57:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 10 Nov 2017 03:57:14 -0800 (PST)
In-Reply-To: <d7759440-3eef-7974-85d8-cae3b44a894d@siemens.com>
References: <20171109132529.26285-1-nathan@nathanrossi.com>
	<d7759440-3eef-7974-85d8-cae3b44a894d@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Nov 2017 11:57:14 +0000
Message-ID: <CAJTo0LZCG0mtCT+253Srp=Z9nqP2KNp8GvV_VepzPbfPqfFx5A@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox.inc: Add sanity check to test if the suid binary provides sh
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
X-List-Received-Date: Fri, 10 Nov 2017 11:57:34 -0000
Content-Type: multipart/alternative; boundary="001a113f6a2056a2dc055d9fa012"

--001a113f6a2056a2dc055d9fa012
Content-Type: text/plain; charset="UTF-8"

How is /bin/sh being busybox.suid a good thing?

Ross

On 10 November 2017 at 07:17, Andrej Valek <andrej.valek@siemens.com> wrote:

> I don't think so, that adding bbfatal into this recipe is a good
> solution. Someone could build the busybox with /bin/sh linking into
> .suid eg. for more secure. We can leave live with this one as before.
>
> Andrej
>
> On 11/09/2017 02:25 PM, Nathan Rossi wrote:
> > Add a sanity check during the do_compile task to fail if the suid
> > busybox provides /bin/sh. This is considered as a hard fail since not
> > only is providing sh as suid problematic for security reasons but also
> > because the sh configured for suid is less functional than the nosuid
> > configured sh and breaks a number of required features (e.g. 64-bit
> > test).
> >
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-core/busybox/busybox.inc | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> > index 4012f921c6..157aea3968 100644
> > --- a/meta/recipes-core/busybox/busybox.inc
> > +++ b/meta/recipes-core/busybox/busybox.inc
> > @@ -183,6 +183,12 @@ do_compile() {
> >                       oe_runmake busybox.links
> >                       mv busybox.links busybox.links.$s
> >               done
> > +
> > +             # hard fail if sh is being linked to the suid busybox
> (detects bug 10346)
> > +             if grep -q -x "/bin/sh" busybox.links.suid; then
> > +                     bbfatal "busybox suid binary incorrectly provides
> /bin/sh"
> > +             fi
> > +
> >               # copy .config.orig back to .config, because the install
> process may check this file
> >               cp .config.orig .config
> >               # cleanup
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f6a2056a2dc055d9fa012
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>How is /bin/sh being busybox.suid a good thing?</div>=
<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 10 November 2017 at 07:17, Andrej Valek <span dir=3D"=
ltr">&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andr=
ej.valek@siemens.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">I don&#39;t think so, that adding bbfatal into this recipe is a good<br>
solution. Someone could build the busybox with /bin/sh linking into<br>
.suid eg. for more secure. We can leave live with this one as before.<br>
<br>
Andrej<br>
<br>
On 11/09/2017 02:25 PM, Nathan Rossi wrote:<br>
&gt; Add a sanity check during the do_compile task to fail if the suid<br>
&gt; busybox provides /bin/sh. This is considered as a hard fail since not<=
br>
&gt; only is providing sh as suid problematic for security reasons but also=
<br>
&gt; because the sh configured for suid is less functional than the nosuid<=
br>
&gt; configured sh and breaks a number of required features (e.g. 64-bit<br=
>
&gt; test).<br>
&gt;<br>
&gt; Signed-off-by: Nathan Rossi &lt;<a href=3D"mailto:nathan@nathanrossi.c=
om">nathan@nathanrossi.com</a>&gt;<br>
&gt; Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burt=
on@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/busybox/<wbr>busybox.inc | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/<wbr>busybox.inc b/meta/recipes=
-core/busybox/<wbr>busybox.inc<br>
&gt; index 4012f921c6..157aea3968 100644<br>
&gt; --- a/meta/recipes-core/busybox/<wbr>busybox.inc<br>
&gt; +++ b/meta/recipes-core/busybox/<wbr>busybox.inc<br>
&gt; @@ -183,6 +183,12 @@ do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0oe_runmake busybox.links<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mv busybox.links busybox.links.$s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# hard fail if sh is =
being linked to the suid busybox (detects bug 10346)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q -x &quot;/=
bin/sh&quot; busybox.links.suid; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bbfatal &quot;busybox suid binary incorrectly provides /bin/sh&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# copy .config.o=
rig back to .config, because the install process may check this file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp .config.orig =
.config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# cleanup<br>
&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113f6a2056a2dc055d9fa012--
