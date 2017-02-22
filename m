Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD7D601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 20:55:10 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id z127so7572718lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SeKjRMGGVQmcDyZIAODTbc3L1ty4OcW7ccveCYCYr/o=;
	b=PeQfg9rxKYZyn/z6VmW/h74dfU5IV0j5VHA9CycO1x/2YM4fkrqQE2iJx5TNw9BDYp
	L1mksL0cKXg3LuErviRjuXWPlfwIb6vnPXRcb8EFLy7LibriEPd+ZLNd/t6LagR4e16N
	yOfrIlyx7MXiJU4kxOxt4IAfWKzOS090iaKtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SeKjRMGGVQmcDyZIAODTbc3L1ty4OcW7ccveCYCYr/o=;
	b=QrcaAd0jRWSn+H2j/GD4uyr7G5VWzeHrCtDDdeyLk2fx6okxLw40qwweweD5yjJ/vI
	9hF6kvM1FpwHCxYKn2eqHqb7MbTGZiHC15vXPBno0YzSnNiRRUG+/KCrAP3J2dNoWL1A
	2uRT7zyE4pMdipGwwSdiu8lZ/QBSaoAFdm95vK+60mqaiNiuOqf0hZrWDRD2T51aIkzW
	9jqTuFGoRxcgDYIZWRoj/MAlV5fneZdlbFmSMeNoks3JS8TIjPkCYnvUvDfh2v1EUD1+
	+3UrdnS11MMeikqv96U+vaNN6F1rLQt3qCI3VG/GKhq31KhqjghmVekobij0l4OAG81J
	GCiw==
X-Gm-Message-State: AMke39krx7qa6yXj9xYUIYdZVc3z8qIfb8vc5peBQk6n0GffAwbi+UOKcGzgSJPBW4L2MBnhQJE62kcbMEF4vcmd
X-Received: by 10.46.92.201 with SMTP id q192mr4561553ljb.78.1487796910950;
	Wed, 22 Feb 2017 12:55:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.10 with HTTP; Wed, 22 Feb 2017 12:55:10 -0800 (PST)
Received: by 10.25.156.10 with HTTP; Wed, 22 Feb 2017 12:55:10 -0800 (PST)
In-Reply-To: <20170222204736.GG3283@jama>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 22 Feb 2017 12:55:10 -0800
Message-ID: <CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Derek Straka <derek@asterius.io>, "Lamego,
	Jose A" <jose.a.lamego@intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork not picking changes from the ML Was: [oe] [meta-python][PATCH] python-paho-mqtt: update to version 1.2
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
X-List-Received-Date: Wed, 22 Feb 2017 20:55:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c1b63dc6022d3054924b6c4

--94eb2c1b63dc6022d3054924b6c4
Content-Type: text/plain; charset=UTF-8

I've seen several issues with hooks. I was working on them yesterday and
will continue today.

These are currently managed by hand but we are moving them into
configuration management which should help keep them working consistently.

On Feb 22, 2017 12:47 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
>
> It's not your fault Derek, but most of the patches from today and based
> on the pings from today also some earlier patches didn't make it into
> patchwork. This one is the only exception.
>
> Michael, Jose: are you aware of some issues with patchwork? Could it be
> caused by the default Reply-to change from yesterday (or day before
> during OEDAM)?
>
> I know only about issues processing merged changes:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10967
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10759
>
> And also UI issue in patchwork that paging doesn't work, e.g.:
> https://patchwork.openembedded.org/bundle/jama/
> master-next/?submitter=&state=&q=&archive=both
> shows that there are 5 pages of changes (which should be in most cases
> marked as accepted by the hook above), but clicking on 2nd page produces
> link which drops the query parameters:
> https://patchwork.openembedded.org/bundle/jama/master-next/?page=2
> so it says "No patches to display"
>
> Regards,
>
> > ---
> >  .../python/{python-paho-mqtt_1.1.bb => python-paho-mqtt_1.2.bb}
>  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.1.bb =>
> python-paho-mqtt_1.2.bb} (68%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> > similarity index 68%
> > rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> > rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> > index b8f5f3f..c8acfc5 100644
> > --- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> > +++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> > @@ -11,5 +11,5 @@ RDEPENDS_${PN} = "\
> >                 python-threading \
> >  "
> >
> > -SRC_URI[md5sum] = "a6407b74eb5e5411e157be1de5c11366"
> > -SRC_URI[sha256sum] = "0f7a629efe6e3a2c61b59d3550aa9f
> 2c4529b5689a65fde45e6f1ac36b9a261e"
> > +SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
> > +SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a21
> eb66f436184691d0bf1f2a85a6213c6c1f"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--94eb2c1b63dc6022d3054924b6c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I&#39;ve seen several issues with hooks. I was working on=
 them yesterday and will continue today.<div dir=3D"auto"><br></div><div di=
r=3D"auto">These are currently managed by hand but we are moving them into =
configuration management which should help keep them working consistently.<=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Feb=
 22, 2017 12:47 PM, &quot;Martin Jansa&quot; &lt;<a href=3D"mailto:martin.j=
ansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br type=3D"attributio=
n"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Wed, Feb 22, 2017 at 12:45:36PM -0500,=
 Derek Straka wrote:<br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">d=
erek@asterius.io</a>&gt;<br>
<br>
It&#39;s not your fault Derek, but most of the patches from today and based=
<br>
on the pings from today also some earlier patches didn&#39;t make it into<b=
r>
patchwork. This one is the only exception.<br>
<br>
Michael, Jose: are you aware of some issues with patchwork? Could it be<br>
caused by the default Reply-to change from yesterday (or day before<br>
during OEDAM)?<br>
<br>
I know only about issues processing merged changes:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10967" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D10967</a><br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10759" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D10759</a><br>
<br>
And also UI issue in patchwork that paging doesn&#39;t work, e.g.:<br>
<a href=3D"https://patchwork.openembedded.org/bundle/jama/master-next/?subm=
itter=3D&amp;state=3D&amp;q=3D&amp;archive=3Dboth" rel=3D"noreferrer" targe=
t=3D"_blank">https://patchwork.<wbr>openembedded.org/bundle/jama/<wbr>maste=
r-next/?submitter=3D&amp;state=3D<wbr>&amp;q=3D&amp;archive=3Dboth</a><br>
shows that there are 5 pages of changes (which should be in most cases<br>
marked as accepted by the hook above), but clicking on 2nd page produces<br=
>
link which drops the query parameters:<br>
<a href=3D"https://patchwork.openembedded.org/bundle/jama/master-next/?page=
=3D2" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembed=
ded.org/bundle/jama/<wbr>master-next/?page=3D2</a><br>
so it says &quot;No patches to display&quot;<br>
<br>
Regards,<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .../python/{<a href=3D"http://python-paho-mqtt_1.1.bb" rel=3D"no=
referrer" target=3D"_blank">python-paho-mqtt_<wbr>1.1.bb</a> =3D&gt; <a hre=
f=3D"http://python-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-paho-mqtt_1.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/<wbr>python/{<a href=3D"http=
://python-paho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-pah=
o-mqtt_1.1.<wbr>bb</a> =3D&gt; <a href=3D"http://python-paho-mqtt_1.2.bb" r=
el=3D"noreferrer" target=3D"_blank">python-paho-mqtt_1.2.bb</a>} (68%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-<wbr>devtools/python/<a href=3D"http:=
//python-paho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho=
-<wbr>mqtt_1.1.bb</a> b/meta-python/recipes-<wbr>devtools/python/<a href=3D=
"http://python-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-paho-<wbr>mqtt_1.2.bb</a><br>
&gt; similarity index 68%<br>
&gt; rename from meta-python/recipes-devtools/<wbr>python/<a href=3D"http:/=
/python-paho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-=
mqtt_1.1.bb</a><br>
&gt; rename to meta-python/recipes-devtools/<wbr>python/<a href=3D"http://p=
ython-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-mq=
tt_1.2.bb</a><br>
&gt; index b8f5f3f..c8acfc5 100644<br>
&gt; --- a/meta-python/recipes-<wbr>devtools/python/<a href=3D"http://pytho=
n-paho-mqtt_1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-<wbr>m=
qtt_1.1.bb</a><br>
&gt; +++ b/meta-python/recipes-<wbr>devtools/python/<a href=3D"http://pytho=
n-paho-mqtt_1.2.bb" rel=3D"noreferrer" target=3D"_blank">python-paho-<wbr>m=
qtt_1.2.bb</a><br>
&gt; @@ -11,5 +11,5 @@ RDEPENDS_${PN} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-th=
reading \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>a6407b74eb5e5411e157be1de5c113<wbr>66&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>0f7a629efe6e3a2c61b59d3550aa9f<wbr>=
2c4529b5689a65fde45e6f1ac36b9a<wbr>261e&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>241150b3fcb920ddca4d33181f3238<wbr>b1&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>9100a6aa706ab699d414ec02705a21<wbr>=
eb66f436184691d0bf1f2a85a6213c<wbr>6c1f&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-devel mailing list<br>
&gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembed=
ded-devel@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/=
<wbr>mailman/listinfo/openembedded-<wbr>devel</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div></div>

--94eb2c1b63dc6022d3054924b6c4--
