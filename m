Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id AF4D561220
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 14:16:08 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id o7so6954363lbv.17
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=2acUwgIbzvbyWm5h6ixfheLpwli8lMm2MNERclYObyI=;
	b=CHacD/b8Ua7CqI9Z2ox07j3HXHeHpHrh7jxgSCkv6LhtQP9EOONTufk3Puxa9Qr+I1
	ruWA/PN6epyFjXP2qNPerGuG7rJEsPrNvFSiXMyYZjqNA4h7cA9Q3ZRAiGweVY+Q8oUC
	/KrLTqprEG3ZmgFh2ghxEvHrzFnrsRI0zxGA9k4pQ/6ngpAAvpk5guaVKu3WBxOxZu/N
	UgmD7OJkZzTEnPSgtQ60qL7euRK4yIzvyd3VxIscrg78hVxmzFGcJjkktpg7M6fx362x
	UziI5ZTFs224XR4tlJAd7VJAMfOHk6pcvugCVfwt3Kwzqx2rNWHVE5DSmZhUveltgtgo
	1I0g==
X-Received: by 10.112.50.109 with SMTP id b13mr650204lbo.47.1376489768780;
	Wed, 14 Aug 2013 07:16:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Wed, 14 Aug 2013 07:15:48 -0700 (PDT)
In-Reply-To: <20130814141339.GY17945@jama>
References: <520B8B6C.40408@pabigot.com> <20130814141339.GY17945@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 14 Aug 2013 07:15:48 -0700
X-Google-Sender-Auth: hZ9TEJ9Cvj3FJZwe7dHv0liKlpk
Message-ID: <CABcZANkRQHr8s8M1fgk2S-FyB7Gp6wS5SUohX4pS1dQKBpr9mg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: recipe whitespace style questions
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
X-List-Received-Date: Wed, 14 Aug 2013 14:16:09 -0000
Content-Type: multipart/alternative; boundary=001a11336ce2b489dc04e3e8ff74

--001a11336ce2b489dc04e3e8ff74
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 14, 2013 at 7:13 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Aug 14, 2013 at 08:51:40AM -0500, Peter A. Bigot wrote:
> >
> > SRC_URI = "file://skeleton \
> >             file://skeleton_test.c \
> >             file://COPYRIGHT \
> > "
> >
> > which I'll call "none", and;
> >
> > SRC_URI = "file://skeleton \
> >             file://skeleton_test.c \
> >             file://COPYRIGHT"
> >
> > which I'll call "joined".
> >
> > Again, for consistency's sake it would be nice to have a
> > recommendation.  I personally prefer "none", which matches the closing
> > bracket style for functions.
> >
> > Next: I've also seen:
> >
> > SRC_URI = " \
> >      file://skeleton \
> >      file://skeleton_test.c \
> >      file://COPYRIGHT \
> > "
>
> I prefer this one (especially for longer variables or entries) or "none",
> because with "none" it's easier to see where multiline variable ends.
>
> Worst is IMHO "joined" because when appending one more line you have to
> edit 2 lines to move '"' so the diff for review is longer and harder to
> read than just one added line.


I'd agree on both counts.
-- 
Christopher Larson

--001a11336ce2b489dc04e3e8ff74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 14, 2013 at 7:13 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Aug 14, 2013 at 08=
:51:40AM -0500, Peter A. Bigot wrote:<br>
&gt;<br>
&gt; SRC_URI =3D &quot;file://skeleton \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://skeleton_test.c \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COPYRIGHT \<br>
&gt; &quot;<br>
&gt;<br>
&gt; which I&#39;ll call &quot;none&quot;, and;<br>
&gt;<br>
&gt; SRC_URI =3D &quot;file://skeleton \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://skeleton_test.c \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COPYRIGHT&quot;<br>
&gt;<br>
&gt; which I&#39;ll call &quot;joined&quot;.<br>
&gt;<br>
&gt; Again, for consistency&#39;s sake it would be nice to have a<br>
&gt; recommendation. =C2=A0I personally prefer &quot;none&quot;, which matc=
hes the closing<br>
&gt; bracket style for functions.<br>
&gt;<br>
&gt; Next: I&#39;ve also seen:<br>
&gt;<br>
&gt; SRC_URI =3D &quot; \<br>
&gt; =C2=A0 =C2=A0 =C2=A0file://skeleton \<br>
&gt; =C2=A0 =C2=A0 =C2=A0file://skeleton_test.c \<br>
&gt; =C2=A0 =C2=A0 =C2=A0file://COPYRIGHT \<br>
&gt; &quot;<br>
<br>
</div>I prefer this one (especially for longer variables or entries) or &qu=
ot;none&quot;,<br>
because with &quot;none&quot; it&#39;s easier to see where multiline variab=
le ends.<br>
<br>
Worst is IMHO &quot;joined&quot; because when appending one more line you h=
ave to<br>
edit 2 lines to move &#39;&quot;&#39; so the diff for review is longer and =
harder to<br>
read than just one added line.</blockquote></div><br>I&#39;d agree on both =
counts.<br>-- <br>Christopher Larson</div></div>

--001a11336ce2b489dc04e3e8ff74--
