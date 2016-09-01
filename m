Return-Path: <mattias.waldo@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 38D1876651
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 14:40:12 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r128so5896013qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Sep 2016 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H0KLceTU3dWesinB/YP4m+AltKou6gv8divvXaTQE+g=;
	b=GotCG+M1y+/rOZ6u7sk0wA4/VyGERqzTIsSDEBz92wzIYO+ZpRPh9GjB3zMNJkcnJL
	Q72EQAeV+vwpaFO4J8/QOJVpHkuGU+hxWE8JirhUkh6P4J3MJCWdRFDPbnMWAJvX5rde
	a+FjBRKhsXrSDcu2aRH57LM+rVBaTy3YhtDSQVqFOX9VALE99t59BWNB82utCk5QogSV
	6kJGlC62kCoBNMfSlF/aAMlts8x3qBMJBapE3GMzWvSqwPfN+C+fy2mxECkYOmpBZufH
	flz/OY5i5kG8oinWzzxeyNGUHhHdDzLS/TwUQKJWPNa3xQyHGEzl0oD8Z8umopMV+KPH
	rOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H0KLceTU3dWesinB/YP4m+AltKou6gv8divvXaTQE+g=;
	b=Oqp8dv8c4SKMfxXbp329mZa/FB6jth7Br9r2ZiNyT/u1UvzVK98kFWxIAOHAwxND6v
	u6dIIkDnx6xbvCXRUe9esegUoxQmG794VCjbPwIR1sbm8qwprQ04EVQ/T+LmJ55WoMPB
	Ix6f0iQ89rxstN2xpifk/frWCWNA+FLZfI1EvkxHbJHiy/u20V1+zKiWqKGEqi/4AObS
	7muXSJk56Cx9ue8F8d2oVLqnw4TKyf9rimWHJIMxI4Rex8AP/qWSSFIt5g1NkyJznVKV
	eL9sG5BLgK+xdHyg6t87SPlCMjFhTVVh2XEsYdghvCqSA3zKoOeIG6ZRA87jcwhZQgKl
	pyLQ==
X-Gm-Message-State: AE9vXwPr+yPNLKfeDJ3Rxf/QRac29UBzkKUjh2LTytRoikw7Wskbhpp3/fPx4qNBRUkozOm6zQ8w0PDRnWXTaA==
X-Received: by 10.55.155.11 with SMTP id d11mr13898771qke.156.1472740813413;
	Thu, 01 Sep 2016 07:40:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.78.23 with HTTP; Thu, 1 Sep 2016 07:40:13 -0700 (PDT)
In-Reply-To: <1472597121.29583.59.camel@linuxfoundation.org>
References: <1472237886-7172-1-git-send-email-mattias.waldo@gmail.com>
	<1472597121.29583.59.camel@linuxfoundation.org>
From: Mattias Waldo <mattias.waldo@gmail.com>
Date: Thu, 1 Sep 2016 16:40:13 +0200
Message-ID: <CACy21+Pck_hs8Rdez_WAvdLyP3x_xJEegHZDQubZRP7g4X6z0A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Thu, 01 Sep 2016 14:40:14 -0000
Content-Type: multipart/alternative; boundary=94eb2c075ad407a96c053b733105

--94eb2c075ad407a96c053b733105
Content-Type: text/plain; charset=UTF-8

Hi!

I just submitted version 5 of the patch, which hopefully doesn't break the
build. In addition it should handle both 4.1 and 4.4 versions of the Linux
kernel, which use different locations for their signing key files.

Regards,

Mattias

On Wed, Aug 31, 2016 at 12:45 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2016-08-26 at 20:58 +0200, Mattias Waldo wrote:
> > The absence of certs/signing_key.* in $kerneldir made signing of
> > out-of-tree kernel modules fail (silently). Add copying of these
> > files during the shared_workdir task.
> >
> > Signed-off-by: Mattias Waldo <mattias.waldo@saabgroup.com>
> > ---
> >  meta/classes/kernel.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Sadly this breaks the build when you don't have any keys:
>
> e.g.: https://autobuilder.yoctoproject.org/main/builders/build-applianc
> e/builds/892/steps/BuildImages_1/logs/stdio
>
> but there were many many other failures :(
>
> Cheers,
>
> Richard
>

--94eb2c075ad407a96c053b733105
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi!<br><br></div>I just submitted version 5=
 of the patch, which hopefully doesn&#39;t break the build. In addition it =
should handle both 4.1 and 4.4 versions of the Linux kernel, which use diff=
erent locations for their signing key files.<br><br></div>Regards,<br><br><=
/div>Mattias<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Wed, Aug 31, 2016 at 12:45 AM, Richard Purdie <span dir=3D"ltr">&lt=
;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Fri, 2016-08-26 at 20:58 +0200, Mattias Waldo wrote:<br>
&gt; The absence of certs/signing_key.* in $kerneldir made signing of<br>
&gt; out-of-tree kernel modules fail (silently). Add copying of these<br>
&gt; files during the shared_workdir task.<br>
&gt;<br>
&gt; Signed-off-by: Mattias Waldo &lt;<a href=3D"mailto:mattias.waldo@saabg=
roup.com">mattias.waldo@saabgroup.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel.bbclass | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
Sadly this breaks the build when you don&#39;t have any keys:<br>
<br>
e.g.: <a href=3D"https://autobuilder.yoctoproject.org/main/builders/build-a=
pplianc
e/builds/892/steps/BuildImages_1/logs/stdio" rel=3D"noreferrer" target=3D"_=
blank">https://autobuilder.<wbr>yoctoproject.org/main/<wbr>builders/build-a=
pplianc<br>
e/builds/892/steps/<wbr>BuildImages_1/logs/stdio</a><br>
<br>
but there were many many other failures :(<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--94eb2c075ad407a96c053b733105--
