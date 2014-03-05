Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 520756D189
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 19:54:01 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id y1so1036153lam.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 11:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=EbXYo5hB/GbWHvF3pXjP7kpOIyOdKdfTkg+s7Ic2Khg=;
	b=M3ZFu3GSX5Jom2UMRwErR8LqMZaoGrvFIKYchFnz6KREAHiYA/62BubMLjaulPdM8Q
	kI+oaLl6P4NbpTx8w8Ft9WbWFfOdt1uQctmb8pEeiv7h3lqVFshwwsAGXivyI5EXkz1g
	077Px5yXmd8jZg46bBtJma94Ce1Rbj1p1gLy+KWPfSfVanTn8LON6XPdiVT3TxmyYdn3
	wfoZCZVAoo9nAx4Ix4lXEuYphIwLiCp4X7Iorxb8NhmbDJjplU3er94iDKy7uI/JonvW
	N6Np67jUbguUKH+Yw3DRomT36tpym6CvPazB8mEZ+C3dHcRxtn5NcMUE4K9xQ3VqF2fo
	5zzw==
X-Received: by 10.112.235.133 with SMTP id um5mr4687693lbc.28.1394049241774;
	Wed, 05 Mar 2014 11:54:01 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Wed, 5 Mar 2014 11:53:41 -0800 (PST)
In-Reply-To: <1394041627.31845.127.camel@ted>
References: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
	<1394041627.31845.127.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 5 Mar 2014 12:53:41 -0700
X-Google-Sender-Auth: oS1-hFYQRGYfw8V20XQQBqWhSyU
Message-ID: <CABcZAN=E+XFNCegQy+foqsfqdn+NjfgUKrvTjBFvDZK2nNFe5g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: Inspect remote branches with git ls-remote
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
X-List-Received-Date: Wed, 05 Mar 2014 19:54:03 -0000
Content-Type: multipart/alternative; boundary=001a11c3cc90db004d04f3e16188

--001a11c3cc90db004d04f3e16188
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 5, 2014 at 10:47 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2014-03-05 at 16:49 +0000, Matt Fleming wrote:
> > From: Matt Fleming <matt.fleming@intel.com>
> >
> > 'git branch' may use ANSI escape codes in its output (to provide colour)
> > which doesn't play well with commands expecting pure plain text, e.g.
> >
> >     fatal: '^[[31mmaster^[[m' is not a valid branch name.
> >
> > Furthermore, the output of 'git branch' is subject to change and trying
> > to parse it could potentially lead to breakage in the future.
> >
> > Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
>
> My worry with this change is that it will cause the system to hit the
> network. We specifically support builds from archives of the
> repositories so I'd worry about using ls-remote like this :/.


What about git for-each-ref? If we just need a list of refs, that's what
for-each-ref is ideal for.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3cc90db004d04f3e16188
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Mar 5, 2014 at 10:47 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Wed, 2014-03-05 at 16:49 =
+0000, Matt Fleming wrote:<br>
&gt; From: Matt Fleming &lt;<a href=3D"mailto:matt.fleming@intel.com">matt.=
fleming@intel.com</a>&gt;<br>
&gt;<br>
&gt; &#39;git branch&#39; may use ANSI escape codes in its output (to provi=
de colour)<br>
&gt; which doesn&#39;t play well with commands expecting pure plain text, e=
.g.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 fatal: &#39;^[[31mmaster^[[m&#39; is not a valid branch =
name.<br>
&gt;<br>
&gt; Furthermore, the output of &#39;git branch&#39; is subject to change a=
nd trying<br>
&gt; to parse it could potentially lead to breakage in the future.<br>
&gt;<br>
&gt; Signed-off-by: Matt Fleming &lt;<a href=3D"mailto:matt.fleming@intel.c=
om">matt.fleming@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/kernel-yocto.<span class=3D"il">bbclass</span> | 10=
 +++++-----<br>
&gt; =C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
</div>My worry with this change is that it will cause the system to hit the=
<br>
network. We specifically support builds from archives of the<br>
repositories so I&#39;d worry about using ls-remote like this :/.</blockquo=
te></div><br></div><div class=3D"gmail_extra">What about git for-each-ref? =
If we just need a list of refs, that&#39;s what for-each-ref is ideal for.<=
br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c3cc90db004d04f3e16188--
