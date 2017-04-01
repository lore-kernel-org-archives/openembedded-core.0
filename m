Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD5577A90
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 05:52:26 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id y22so11927996wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 22:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=80CvW8Sl2p3WBdcyTfc14a3qoAihru6qnmk9DpzURVM=;
	b=r5IHCsbxWXvdBB2M1LQUj67GaJ6v9Xt55p/fXWHXv1Qg44hJn72WME+7WH9+EDWfdj
	GQy+YE2qvfr54NfyOkGWsb99HbYM9A8vGyne1Q8rHRo21wzfDC/MrINjird+oaVReq8s
	Ee/kLA0DUp784msUcAeADyPDUgejUdaClMCvR1EGdxW0yj4TVPa5E2ZuzzoMm4+f+43P
	8sl8Mh0pRc3KLWTRzTaQfAHD/BU1s5Tq6dQahhBGCNLtKj/0ZbPR02iTXbgUg/FsD254
	Slw1qY6FOYx07IHgwwnceIsgoPcFPCtWZa8gH0oTeNBxGCeG3N69UFmuh9yb69u3I6UF
	yhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=80CvW8Sl2p3WBdcyTfc14a3qoAihru6qnmk9DpzURVM=;
	b=RYCZu/qhQd/r3O+MC7UJ01uzA2RtQh63Cag6Tk7xVxtRqcX/aWzV+RDhoWbQvq5L5c
	7p6z0nu2fkE0fCEOqVXSuyn23Y2K0enA6ug52imfhW3L/d5qsDJKgvXLfHILJrcRQoSj
	tqPvCXhe8jAfm6O2o2n5A2VS8VNocWzGRdzCqWK3fOmN/sVhUOAgUwaUhffsqyPsA3H6
	ZX0LVWObKAUEsWtMNquaNye7Y/hQISwSOEFaJHvhQ6kJ3FxBM/PoQXLLNXvEvCBSmBdu
	fDjtn341uL5wpR0WSTpPWoeMOeA2FiJqd2P0bY0LpIBIU2Qsw2q/tBM3dsAV1/y0/fJH
	Uq+w==
X-Gm-Message-State: AFeK/H1MYieRc0QbDM8hUUWFwHj/hJgRzxOFxwa30ACN92ETZKGK2uKb
	jd0IIRv65fBUEBIBuqP3BYozo6XWEQ==
X-Received: by 10.28.134.70 with SMTP id i67mr958262wmd.124.1491025947867;
	Fri, 31 Mar 2017 22:52:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Fri, 31 Mar 2017 22:52:27 -0700 (PDT)
In-Reply-To: <CAMKF1soVTYoZKuNumi+qOw8sgSQqpcXkLW2skhM9v_warvRgkw@mail.gmail.com>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
	<CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
	<20170331150810.GA3897@jama>
	<CAMKF1soVTYoZKuNumi+qOw8sgSQqpcXkLW2skhM9v_warvRgkw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 1 Apr 2017 07:52:27 +0200
Message-ID: <CA+chaQdj48R74vNax1XPzc_mB6EQe7y+bgwXmOW417BQxtguoQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Sat, 01 Apr 2017 05:52:27 -0000
Content-Type: multipart/alternative; boundary=001a11441e62f940ac054c14878e

--001a11441e62f940ac054c14878e
Content-Type: text/plain; charset=UTF-8

Why is it needed?
Without this change mesa was finding llvm-config correctly, that's why I've
just reverted this to continue building.

On Fri, Mar 31, 2017 at 5:57 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:
> >> On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> > I'm not sure if this is the root cause, but last qemux86 build shows:
> >> >
> >> >
> >> > | configure: error: --enable-gallium-llvm selected but llvm-config is
> not
> >> > found
> >> > | ERROR: Function failed: do_configure (log file is located at
> >> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-
> linux/mesa/2_17.0.1-r0/temp/log.do_configure.11359)
> >> >
> >>
> >> can you point where is llvm-config installed in sysroot ? its possible
> >> its not in native sysroot location ${STAGING_BINDIR_NATIVE}
> >
> > OE qemux86@ ~/build/oe-core $ find tmp-glibc/work/i586-oe-linux/
> mesa/2_17.0.2-r0/recipe-sysroot* -name llvm\*
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/bin/crossscripts/llvm-config
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/bin/crossscripts/llvm-config3.3
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/include/llvm3.3
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/include/llvm3.3/llvm-c
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/include/llvm3.3/llvm
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/include/llvm3.3/llvm/Config/llvm-config.h
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/lib/llvm3.3
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/sysroot-providers/llvm-common
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/sysroot-providers/llvm3.3
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm3.3.complete
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm-common.complete
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm-common.6be6a4ae98ee0dff7c2a4c4df17f026a
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm-common
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm3.3.388adaa288ab3b1d35e01a43b6542368
> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm3.3
> >
>
> so it seems it should point to <recipe-sysroot>/usr/bin/crossscripts
> can you try changing -with-llvm-prefix to point to this dir ?
>
> >>
> >> >
> >> > I've noticed some llvm changes for meta-clang, do we need similar
> changes
> >> > for meta-oe version of llvm?
> >> >
> >> >
> >> > On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com>
> wrote:
> >> >>
> >> >>
> >> >>
> >> >> On 3/11/17 1:30 PM, Khem Raj wrote:
> >> >> > The following changes since commit
> >> >> > a47e64d985a610535449730806651f5bfd75d9ec:
> >> >> >
> >> >> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
> >> >> >
> >> >> > are available in the git repository at:
> >> >> >
> >> >> >   git://git.openembedded.org/openembedded-core-contrib kraj/pu
> >> >> >   http://cgit.openembedded.org/openembedded-core-contrib/log/
> ?h=kraj/pu
> >> >> >
> >> >> > Khem Raj (1):
> >> >> >   mesa: Contain configure search for llvm
> >> >> >
> >> >>
> >> >> I added another fix for mesa-gl to remove one of obsolete
> packageconfigs
> >> >> and its on the same pull branch now.
> >> >>
> >> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> >
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >
> >> >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a11441e62f940ac054c14878e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why is it needed?<div>Without this change mesa was finding=
 llvm-config correctly, that&#39;s why I&#39;ve just reverted this to conti=
nue building.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Fri, Mar 31, 2017 at 5:57 PM, Khem Raj <span dir=3D"ltr">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb">=
<div class=3D"h5">On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
&gt; On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:<br>
&gt;&gt; On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa &lt;<a href=3D"mail=
to:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; I&#39;m not sure if this is the root cause, but last qemux86 =
build shows:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; | configure: error: --enable-gallium-llvm selected but llvm-c=
onfig is not<br>
&gt;&gt; &gt; found<br>
&gt;&gt; &gt; | ERROR: Function failed: do_configure (log file is located a=
t<br>
&gt;&gt; &gt; /home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/work/i586-oe-<=
wbr>linux/mesa/2_17.0.1-r0/temp/<wbr>log.do_configure.11359)<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; can you point where is llvm-config installed in sysroot ? its poss=
ible<br>
&gt;&gt; its not in native sysroot location ${STAGING_BINDIR_NATIVE}<br>
&gt;<br>
&gt; OE qemux86@ ~/build/oe-core $ find tmp-glibc/work/i586-oe-linux/<wbr>m=
esa/2_17.0.2-r0/recipe-<wbr>sysroot* -name llvm\*<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/usr/bin/crossscripts/<wbr>llvm-config<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/usr/bin/crossscripts/<wbr>llvm-config3.3<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/usr/include/llvm3.3<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/usr/include/llvm3.3/<wbr>llvm-c<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/usr/include/llvm3.3/<wbr>llvm<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/usr/include/llvm3.3/<wbr>llvm/Config/llvm-config.h<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/usr/lib/llvm3.3<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/sysroot-providers/<wbr>llvm-common<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
/sysroot-providers/<wbr>llvm3.3<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
-native/installeddeps/<wbr>llvm3.3.complete<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
-native/installeddeps/<wbr>llvm-common.complete<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
-native/installeddeps/<wbr>llvm-common.<wbr>6be6a4ae98ee0dff7c2a4c4df17f02<=
wbr>6a<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
-native/installeddeps/<wbr>llvm-common<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
-native/installeddeps/<wbr>llvm3.3.<wbr>388adaa288ab3b1d35e01a43b65423<wbr>=
68<br>
&gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2-r0/recipe-<wbr>sysroot=
-native/installeddeps/<wbr>llvm3.3<br>
&gt;<br>
<br>
</div></div>so it seems it should point to &lt;recipe-sysroot&gt;/usr/bin/<=
wbr>crossscripts<br>
can you try changing -with-llvm-prefix to point to this dir ?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;ve noticed some llvm changes for meta-clang, do we need=
 similar changes<br>
&gt;&gt; &gt; for meta-oe version of llvm?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On 3/11/17 1:30 PM, Khem Raj wrote:<br>
&gt;&gt; &gt;&gt; &gt; The following changes since commit<br>
&gt;&gt; &gt;&gt; &gt; a47e64d985a610535449730806651f<wbr>5bfd75d9ec:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0libcomps: add a recipe (2017-03-11 16:08=
:50 +0000)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; are available in the git repository at:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded=
.org/openembedded-core-contrib" rel=3D"noreferrer" target=3D"_blank">git.op=
enembedded.org/<wbr>openembedded-core-contrib</a> kraj/pu<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/=
openembedded-core-contrib/log/?h=3Dkraj/pu" rel=3D"noreferrer" target=3D"_b=
lank">http://cgit.openembedded.org/<wbr>openembedded-core-contrib/log/<wbr>=
?h=3Dkraj/pu</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Khem Raj (1):<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0mesa: Contain configure search for llvm<=
br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I added another fix for mesa-gl to remove one of obsolete=
 packageconfigs<br>
&gt;&gt; &gt;&gt; and its on the same pull branch now.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 meta/recipes-graphics/mesa/<wbr>mesa.inc | 2 +=
-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<=
br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mail=
to:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div></blockquote></div><br></div>

--001a11441e62f940ac054c14878e--
