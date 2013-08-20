Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id E60256B7B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 15:46:17 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id u10so617156lbi.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 08:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qq/b0iwFCzL9KZ78bJNuafQuxe8iOVCsQX0e4xMkgAQ=;
	b=iwPzExKr2cGMqvVUscEgACYbLReE8cbLEy2nyB0nKEd9nq0O5TY4HEGty92iWvBJGW
	rYT4S9QnCEWhK5JkyI02aAHDIBsNjiMz9rMceZwloG0e3+NUSlKyCqfq5vQPqOvwibV6
	VftsJTGMu9A4X2jRTAeNnq+mTsJVFXmUrfiXEI/fwNoM4QvNPaT9eubNYBxMHaK8qoLg
	Ae14wEmkhmFn9z2Bp6ltcvnZUE287pVa/ritFmIVsk0RjSJazVIrWrpXCDiMUcgIl92K
	R+GXxYskQGJwHhmH0KxLshCVw2kFzXJdmnU7EFy590O2WmILLYY1hWiJmbLFtcRpAUaZ
	Uuhw==
X-Received: by 10.112.33.231 with SMTP id u7mr1162082lbi.49.1377013577141;
	Tue, 20 Aug 2013 08:46:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.53.197 with HTTP; Tue, 20 Aug 2013 08:45:56 -0700 (PDT)
In-Reply-To: <CAP9ODKp2ofdWzn_P7xnZGZZ7QffxyE7XJtmn_m=V4ZoWfc_Zdg@mail.gmail.com>
References: <1376966880-4557-1-git-send-email-kergoth@gmail.com>
	<CAP9ODKp2ofdWzn_P7xnZGZZ7QffxyE7XJtmn_m=V4ZoWfc_Zdg@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 20 Aug 2013 08:45:56 -0700
Message-ID: <CABcZAN=7Qx_J-ijqYgbo_FcBzPj3rdGdZ1BvZ4on2qjXNuQdig@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe.types: add 'path' type
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
X-List-Received-Date: Tue, 20 Aug 2013 15:46:18 -0000
Content-Type: multipart/alternative; boundary=14dae947376b1dd35404e462f59b

--14dae947376b1dd35404e462f59b
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 20, 2013 at 8:23 AM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Mon, Aug 19, 2013 at 11:48 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > - path normalization ('normalize' flag, defaults to enabled)
> > - existence verification for paths we know should exist ('mustexist'
> flag)
> > - supports clean handling of relative paths ('relativeto' flag)
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>
> Great addition :-)
>
> > ---
> >  meta/lib/oe/types.py | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
> > index 5dac9de..7f47c17 100644
> > --- a/meta/lib/oe/types.py
> > +++ b/meta/lib/oe/types.py
> > @@ -1,4 +1,7 @@
> > +import errno
> >  import re
> > +import os
> > +
>
> No need for another new and empty line here.
>
> Rest of code looks alright :-)


Good call, will tweak slightly and re-submit. Thanks for the review.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--14dae947376b1dd35404e462f59b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Aug 20, 2013 at 8:23 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.c=
om.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, Aug 19, 2013 at 11=
:48 PM, Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">kergoth=
@gmail.com</a>&gt; wrote:<br>


&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; - path normalization (&#39;normalize&#39; flag, defaults to enabled)<b=
r>
&gt; - existence verification for paths we know should exist (&#39;mustexis=
t&#39; flag)<br>
&gt; - supports clean handling of relative paths (&#39;relativeto&#39; flag=
)<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
</div>Great addition :-)<br>
<div class=3D"im"><br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oe/types.py | 18 ++++++++++++++++++<br>
&gt; =C2=A01 file changed, 18 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py<br>
&gt; index 5dac9de..7f47c17 100644<br>
&gt; --- a/meta/lib/oe/types.py<br>
&gt; +++ b/meta/lib/oe/types.py<br>
&gt; @@ -1,4 +1,7 @@<br>
&gt; +import errno<br>
&gt; =C2=A0import re<br>
&gt; +import os<br>
&gt; +<br>
<br>
</div>No need for another new and empty line here.<br>
<br>
Rest of code looks alright :-)</blockquote></div><br>Good call, will tweak =
slightly and re-submit. Thanks for the review.<br>-- <br>Christopher Larson=
<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaur=
us<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--14dae947376b1dd35404e462f59b--
