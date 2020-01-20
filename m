Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 863437FC98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:44:35 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id f7so11777153uaa.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=36S+ijeYAMdCiLgKLWCw8V9nS8v7p1Wn6yUWIwWltZo=;
	b=ns5RJDyCwssFjaylRpf4S9cMxydYLrq0Ok8+NN5PkaqB1XqhFpkF7C4FD1CvQ7Kneb
	2mkQKUA41TI2jLv5DTI4rjZDu/ggmRIF/lWhjZKx1NCJk8j6yZCCXp/g5K0S7Iql7SS0
	vo/44CHqBDyYZH+8wP6X1DSN0cSHcNBZEgxj+xyuj8Tg6fNbOGiVDvPReqQzW/Pb2ky9
	Z+dbao42qca1OyDN9FQ3UF6mlZ+pFfL1o9mwoHIXwT99UhK8p0yf4lVpEFXoHHu8C4El
	nkXOeWVx23BQjwRX3TB3ErQH6T6W2SJYsq6E70tVTbDO6tf+WelTpG0RUnuqX41GHEBY
	/K8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=36S+ijeYAMdCiLgKLWCw8V9nS8v7p1Wn6yUWIwWltZo=;
	b=Qq0Pb7yHWeG6lXnnMBEPMe1sq8Owug1+YQWAVFmVfF7UEJCuudkj3a998pq0HoHyBs
	JPKa0Hr6cr4z976c4TfFmim7NG00b4Ou06LeA7i2EMaN1g3aq8SVTZXYXfRIiCq472Vh
	VrYW227s+MFlEIuNN40kK+ulTRIqs4N3juFKSWCekntSGbAv0xlI3WcyFJptILCR2e/d
	O5feztjOrTYWNCNZcN0nvOCRWS3NgvlFA06XD/bhCEVyixy7qC7P4QQw1Jj4l/XCBlSJ
	BBqdlzCo5ViOt32FxhGLgoTuaHBv/P/OqliYcrq6IVe1G1skeiyWIO2iRY/FlIoW1h8/
	fBHA==
X-Gm-Message-State: APjAAAWPXq9H8llZ2lrzZVp4coIUWqy/5sdGI8yVfhHH8NV9PLW6HiDt
	ajBDlp8z7LosLsj39BaarSaL/Cy37oWHpio14jkIfZdp
X-Google-Smtp-Source: APXvYqya+ZvKwxhQUfH9v3MaRFTuDaT8thaSY6djE4VlHFEgH+y+FEt2liYierp4p9dnyRhvd7+HNBTrP8Xy+KL3gcU=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr533128uap.93.1579542276386;
	Mon, 20 Jan 2020 09:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-10-alex.kanavin@gmail.com>
	<20200120173722.GA15172@joraj-alpa>
In-Reply-To: <20200120173722.GA15172@joraj-alpa>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Jan 2020 18:44:21 +0100
Message-ID: <CANNYZj9JrJJxt_O+Jv-86H_-e1wMu7nCahuUi+C7cjJbaxGUNA@mail.gmail.com>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/24] ptests: exclude lttng-tools
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
X-List-Received-Date: Mon, 20 Jan 2020 17:44:35 -0000
Content-Type: multipart/alternative; boundary="0000000000004ab249059c95d80c"

--0000000000004ab249059c95d80c
Content-Type: text/plain; charset="UTF-8"

Basically you can view the history of the builds here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81

Click on any of the builds (identified by number), even green ones, then
'run-config - > step 1c -> view all lines
For example:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/632/steps/8/logs/step1c

Alex

On Mon, 20 Jan 2020 at 18:37, Jonathan Rajotte-Julien <
jonathan.rajotte-julien@efficios.com> wrote:

> Could you point me toward reports for the failing tests?
>
> I just want to make sure they are not actual regression.
>
> A yocto specific patch was dropped that allowed ptest to pass when
> lttng-ust is not present. This can be a source of problems.
> OE commit:015aea5d93614676decd18578a8ae2d68417cfc5
>
> Also some tests required a minimum requirement for /tmp that could lead to
> problem for image/test setup with limited memory since AFAIK /tmp size is
> derived from the available memory (at least when using qemu test image).
>
> Cheers
>
> On Mon, Jan 20, 2020 at 06:24:56PM +0100, Alexander Kanavin wrote:
> > These tests are producing failures that appear and
> > disappear randomly. This requires investigation
> > by someone with expertise, so let's disable until then.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/distro/include/ptest-packagelists.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> > index 49cb9046c6c..f42e90bd187 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -58,6 +58,7 @@ PTESTS_FAST = "\
> >  #    rt-tests-ptest \ # Needs to be checked whether it runs at all
> >  #    bash-ptest \ # Test outcomes are non-deterministic by design
> >  #    mdadm-ptest \ # Multiple failures; mdmon crashes in at least one
> of the tests
> > +#    lttng-tools-ptest \ # Random failures that are difficult to
> reproduce
> >  #"
> >
> >  PTESTS_SLOW = "\
> > @@ -67,7 +68,6 @@ PTESTS_SLOW = "\
> >      glib-2.0-ptest \
> >      gstreamer1.0-ptest \
> >      libevent-ptest \
> > -    lttng-tools-ptest \
> >      openssh-ptest \
> >      openssl-ptest \
> >      perl-ptest \
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Jonathan Rajotte-Julien
> EfficiOS
>

--0000000000004ab249059c95d80c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Basically you can view the history of the builds here=
:</div><div><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/build=
ers/81">https://autobuilder.yoctoproject.org/typhoon/#/builders/81</a></div=
><div><br></div><div>Click on any of the builds (identified by number), eve=
n green ones, then &#39;run-config - &gt; step 1c -&gt; view all lines</div=
><div>For example:</div><div><a href=3D"https://autobuilder.yoctoproject.or=
g/typhoon/#/builders/81/builds/632/steps/8/logs/step1c">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/81/builds/632/steps/8/logs/step1c</a><=
/div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 20 Jan 2020 at 18:37, Jonath=
an Rajotte-Julien &lt;<a href=3D"mailto:jonathan.rajotte-julien@efficios.co=
m">jonathan.rajotte-julien@efficios.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Could you point me toward reports fo=
r the failing tests?<br>
<br>
I just want to make sure they are not actual regression.<br>
<br>
A yocto specific patch was dropped that allowed ptest to pass when<br>
lttng-ust is not present. This can be a source of problems.<br>
OE commit:015aea5d93614676decd18578a8ae2d68417cfc5<br>
<br>
Also some tests required a minimum requirement for /tmp that could lead to<=
br>
problem for image/test setup with limited memory since AFAIK /tmp size is<b=
r>
derived from the available memory (at least when using qemu test image).<br=
>
<br>
Cheers<br>
<br>
On Mon, Jan 20, 2020 at 06:24:56PM +0100, Alexander Kanavin wrote:<br>
&gt; These tests are producing failures that appear and<br>
&gt; disappear randomly. This requires investigation<br>
&gt; by someone with expertise, so let&#39;s disable until then.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/ptest-packagelists.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/co=
nf/distro/include/ptest-packagelists.inc<br>
&gt; index 49cb9046c6c..f42e90bd187 100644<br>
&gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; @@ -58,6 +58,7 @@ PTESTS_FAST =3D &quot;\<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 rt-tests-ptest \ # Needs to be checked whether it=
 runs at all<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 bash-ptest \ # Test outcomes are non-deterministi=
c by design<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 mdadm-ptest \ # Multiple failures; mdmon crashes =
in at least one of the tests<br>
&gt; +#=C2=A0 =C2=A0 lttng-tools-ptest \ # Random failures that are difficu=
lt to reproduce<br>
&gt;=C2=A0 #&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PTESTS_SLOW =3D &quot;\<br>
&gt; @@ -67,7 +68,6 @@ PTESTS_SLOW =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 glib-2.0-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gstreamer1.0-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libevent-ptest \<br>
&gt; -=C2=A0 =C2=A0 lttng-tools-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 openssh-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 openssl-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-ptest \<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<br>
-- <br>
Jonathan Rajotte-Julien<br>
EfficiOS<br>
</blockquote></div>

--0000000000004ab249059c95d80c--
