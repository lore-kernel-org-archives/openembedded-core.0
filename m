Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D68871D7E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 05:55:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y10so1686653wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 May 2017 22:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OTQrFItvsUcRWPw9PKXZD4LxoD9g0zyfUxktG7K5lNA=;
	b=XAPTxYbm3cNCZyPfmFhke/VOnDiqJ7LTLD7/N+9VYcUq5BPQi1Xwj05jfqVpKnQFE+
	qFWXhwUKCYvVECf2x25l0Ca2WdcyCmnbAwQuZ7kJ1xUeXI0ip3pJ0HQ6rVCh8hNvVPHz
	yZLCxE9yeRdLk4TvuY2DVi/Dn859OBHUiLYy7j+GqiW6WBN2MDDnnekezSzLpHyT42q4
	W0Hseq5mHDCc74CeKL6yLqNZ7Vx8ydVj2MktnfaAU6cHS6rj3Op40RY+HvNlcJIm0EbE
	+RJUOR7ntCk+7rVV64T9Xd2DYXOnpdQ2nnwAjWqREdoxTenLw4B60E6hqAWCVHExVsXO
	AZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OTQrFItvsUcRWPw9PKXZD4LxoD9g0zyfUxktG7K5lNA=;
	b=rjap91thBD9Gwe0d97H4dYFZj66RL6gX3z9IJZ0AXiCtuLS6dwPU6xqsDp/W3jwnc9
	XW4MkS6Du/dkm95ZKz9o72wlC8zn7Bl7RwraMR8+ZNlQ+bRvtYCT96OfIQpA52/M2mkH
	nPKmaJIi2SbBUDmlo7DtvJQ30N48fc1EO8KO7mCt/sCmjMhqzKeEjfALcM5dnG9OVYfI
	jmq+77cgduCOyt8K4SdTuy84G8H/zikn6UMYzIbtLQmWT6e9fey3Hp13eloMD/ZZ8sgW
	NM9thGCTGAEPYcEVTgtNvueto6S2VlKlKPiAIGSvuYnOXLwpkGqnBDEQmR37CefhKAMS
	YEwQ==
X-Gm-Message-State: AN3rC/7YIhpWZcQ5hYF2C5CZ4XYD+OHVZNp1W26oUWA9/5GtzoRPqwNT
	AY/s0yRj8e3w8Wz7DwZ0DesXHjjDLA==
X-Received: by 10.80.149.203 with SMTP id x11mr21833412eda.181.1493704532484; 
	Mon, 01 May 2017 22:55:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Mon, 1 May 2017 22:55:31 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B611950590@ORSMSX112.amr.corp.intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
	<1493672344-21965-2-git-send-email-juro.bystricky@intel.com>
	<1493680397.23535.47.camel@linuxfoundation.org>
	<6E51916E4A1F32428260031F4C7CD2B611950590@ORSMSX112.amr.corp.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 2 May 2017 07:55:31 +0200
Message-ID: <CA+chaQexGCjEYDjqRm3UDw5xE9=zk=DPZCUXXVLXk_N9yXq42g@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH v2 1/6] bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
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
X-List-Received-Date: Tue, 02 May 2017 05:55:32 -0000
Content-Type: multipart/alternative; boundary=94eb2c0e4b660ee74d054e843094

--94eb2c0e4b660ee74d054e843094
Content-Type: text/plain; charset=UTF-8

I think you can define them in bitbake.conf, but then export them only
where needed.

On Tue, May 2, 2017 at 2:35 AM, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> I see your point. The original idea was to keep all related variables in
> one place. There is
> one variable ( BUILD_REPRODUCIBLE_BINARIES ) that I think should be global,
> as it should be visible by all tasks (well, a lot of tasks). The rest can
> be moved to more appropriate places.
>
>
> ________________________________________
> From: Richard Purdie [richard.purdie@linuxfoundation.org]
> Sent: Monday, May 01, 2017 4:13 PM
> To: Bystricky, Juro; openembedded-core@lists.openembedded.org
> Cc: joshua.g.lock@linux.intel.com; Burton, Ross; martin.jansa@gmail.com;
> raj.khem@gmail.com; jurobystricky@hotmail.com
> Subject: Re: [PATCH v2 1/6] bitbake.conf: new variable
> BUILD_REPRODUCIBLE_BINARIES
>
> On Mon, 2017-05-01 at 13:58 -0700, Juro Bystricky wrote:
> > Building reproducible binaries may remove certain intentional
> > randomness intended for increased security. Hence, it is reasonable
> > to expect there will be cases where this is not desirable.
> > The user can select his/her preferences via the variable
> > BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not
> > build reproducible binaries) in order to minimize any potential
> > regressions. (Once the reproducible binaries code is mature enough,
> > it can be set to "1".)
> > If the variable BUILD_REPRODUCIBLE_BINARIES is set to "1",
> > timestamp values taken from additional variables will be optionally
> > used
> > when building binary reproducible images:
> >
> >     REPRODUCIBLE_TIMESTAMP_ROOTFS
> >         If the value is specified, all files mtime will be set to
> > this value.
> >         In addition, /etc/timestamp and /etc/version will both
> > contain the value.
> >         If no value is specified, timestamp will be derived from the
> > top git commit.
> >
> >     REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK
> >         Value passed via environment variable PRELINK_TIMESTAMP to
> > the prelink program.
> >         If the value is specified, the value will be used.
> >         If no value is specified, timestamp will be derived from the
> > top git commit.
> >
> > Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > ---
> >  meta/conf/bitbake.conf | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 227babd..6ce1a1a 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -859,3 +859,14 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends
> > \
> >
> >  MLPREFIX ??= ""
> >  MULTILIB_VARIANTS ??= ""
> > +
> > +BUILD_REPRODUCIBLE_BINARIES ??= "0"
> > +BUILD_REPRODUCIBLE_BINARIES[export] = "1"
> > +
> > +# Unix timestamp
> > +REPRODUCIBLE_TIMESTAMP_ROOTFS ??= ""
> > +REPRODUCIBLE_TIMESTAMP_ROOTFS[export] = "1"
> > +
> > +# Unix timestamp
> > +REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK ??= ""
> > +REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK[export] = "1"
>
> Please don't add new global exports in bitbake.conf. Changing the value
> of this will cause everything to rebuild (e.g. recompile) since the
> exported environment goes to all tasks. We really don't want to do that
> if it only affects the image generation.
>
> I'll give this a bit more thought/review but wanted to comment on this
> whilst I see it/remember.
>
> Cheers,
>
> Richard
>
>

--94eb2c0e4b660ee74d054e843094
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think you can define them in bitbake.conf, but then expo=
rt them only where needed.</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, May 2, 2017 at 2:35 AM, Bystricky, Juro <span dir=
=3D"ltr">&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">=
juro.bystricky@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">I see your point. The original idea was to keep all related variables=
 in one place. There is<br>
one variable ( BUILD_REPRODUCIBLE_BINARIES ) that I think should be global,=
<br>
as it should be visible by all tasks (well, a lot of tasks). The rest can b=
e moved to more appropriate places.<br>
<br>
<br>
______________________________<wbr>__________<br>
From: Richard Purdie [<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@<wbr>linuxfoundation.org</a>]<br>
Sent: Monday, May 01, 2017 4:13 PM<br>
To: Bystricky, Juro; <a href=3D"mailto:openembedded-core@lists.openembedded=
.org">openembedded-core@lists.<wbr>openembedded.org</a><br>
Cc: <a href=3D"mailto:joshua.g.lock@linux.intel.com">joshua.g.lock@linux.in=
tel.com</a>; Burton, Ross; <a href=3D"mailto:martin.jansa@gmail.com">martin=
.jansa@gmail.com</a>; <a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.=
com</a>; <a href=3D"mailto:jurobystricky@hotmail.com">jurobystricky@hotmail=
.com</a><br>
Subject: Re: [PATCH v2 1/6] bitbake.conf: new variable BUILD_REPRODUCIBLE_B=
INARIES<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Mon, 2017-05-01 at 13:58 -0700, Juro Bystricky wrote:<br>
&gt; Building reproducible binaries may remove certain intentional<br>
&gt; randomness intended for increased security. Hence, it is reasonable<br=
>
&gt; to expect there will be cases where this is not desirable.<br>
&gt; The user can select his/her preferences via the variable<br>
&gt; BUILD_REPRODUCIBLE_BINARIES. The variable defaults to &quot;0&quot; (d=
o not<br>
&gt; build reproducible binaries) in order to minimize any potential<br>
&gt; regressions. (Once the reproducible binaries code is mature enough,<br=
>
&gt; it can be set to &quot;1&quot;.)<br>
&gt; If the variable BUILD_REPRODUCIBLE_BINARIES is set to &quot;1&quot;,<b=
r>
&gt; timestamp values taken from additional variables will be optionally<br=
>
&gt; used<br>
&gt; when building binary reproducible images:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0REPRODUCIBLE_TIMESTAMP_ROOTFS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If the value is specified, all files =
mtime will be set to<br>
&gt; this value.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In addition, /etc/timestamp and /etc/=
version will both<br>
&gt; contain the value.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If no value is specified, timestamp w=
ill be derived from the<br>
&gt; top git commit.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0REPRODUCIBLE_TIMESTAMP_IMAGE_<wbr>PRELINK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Value passed via environment variable=
 PRELINK_TIMESTAMP to<br>
&gt; the prelink program.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If the value is specified, the value =
will be used.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If no value is specified, timestamp w=
ill be derived from the<br>
&gt; top git commit.<br>
&gt;<br>
&gt; Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@int=
el.com">juro.bystricky@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/bitbake.conf | 11 +++++++++++<br>
&gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 227babd..6ce1a1a 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -859,3 +859,14 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D &quot;doc deps de=
pends<br>
&gt; \<br>
&gt;<br>
&gt;=C2=A0 MLPREFIX ??=3D &quot;&quot;<br>
&gt;=C2=A0 MULTILIB_VARIANTS ??=3D &quot;&quot;<br>
&gt; +<br>
&gt; +BUILD_REPRODUCIBLE_BINARIES ??=3D &quot;0&quot;<br>
&gt; +BUILD_REPRODUCIBLE_BINARIES[<wbr>export] =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +# Unix timestamp<br>
&gt; +REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D &quot;&quot;<br>
&gt; +REPRODUCIBLE_TIMESTAMP_<wbr>ROOTFS[export] =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +# Unix timestamp<br>
&gt; +REPRODUCIBLE_TIMESTAMP_IMAGE_<wbr>PRELINK ??=3D &quot;&quot;<br>
&gt; +REPRODUCIBLE_TIMESTAMP_IMAGE_<wbr>PRELINK[export] =3D &quot;1&quot;<b=
r>
<br>
Please don&#39;t add new global exports in bitbake.conf. Changing the value=
<br>
of this will cause everything to rebuild (e.g. recompile) since the<br>
exported environment goes to all tasks. We really don&#39;t want to do that=
<br>
if it only affects the image generation.<br>
<br>
I&#39;ll give this a bit more thought/review but wanted to comment on this<=
br>
whilst I see it/remember.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div></div></blockquote></div><br></div>

--94eb2c0e4b660ee74d054e843094--
