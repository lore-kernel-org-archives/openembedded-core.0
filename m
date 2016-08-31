Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 43B3870057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:07:17 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id e7so1670420lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b9Zmu/XA51icUfum7688xIjRbNcEEZcUNsvQ/70pd1U=;
	b=D6fbYRFrmI2gC5JPad8/pkUohMA0NtGxp2Sitq+6SrjX3JWnxdCysNkKApJm2G6SMe
	8yUHxTssR7AU2WII6/As8XkNKkjnUc4cPvANXLQjRB5Hcv+tw5rm8iz8dtPNskRD/ev4
	TlFdocNA61dwUyTNs501enISIElp1u5KksydW3Ogrefhymj141kaEjCezbOvtBiBCFuV
	t+DbwFMcbXMpc68flx3W36IEsw4GlLx95qc5BaZCkCAFYW3fiF2MiAciFS5yHZRXvFGJ
	qUSukTr22Ev5Ry0dRn7Uj01TiaYG/FCHVi21lOuwYoI8bxOIb3uCn5YxvB0MLgCQnth9
	QhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b9Zmu/XA51icUfum7688xIjRbNcEEZcUNsvQ/70pd1U=;
	b=CusX7G+iwLK5pdvhJlIe2Y9oVyYFFr4YpozV3KRosYaaM4ja+0/G+BAV44pdjI6ED1
	YqkCE5JXzt2fSPfBMuvFEnDmDspr6hGo0A2oLulzoFxUa+Vw5fuGOFOc4ec0C3nGI/Tv
	AlP8OishHvZSiWIq8iBc0He/6aEkYbWFw3TDo5AfbCWEFzaY56fTCfXe0zhEv4afDLe2
	7Cqb7eb+kLyy/fK2yHryYT4bE1TFHNbaE4KJeZmEEtgjCgVN7X/0g6zeLadTJ7AaEtgU
	dKdbguerMqGy/LyQ9EI9mNh6QLDBR8vgzmsqgvq48U8aGeuJ2fmZNI5IHvYEDLx8yZeG
	WZ4Q==
X-Gm-Message-State: AE9vXwOLU343C+pzrLLwkVa8mLf0EXRhNIG9KmSOu/S+fXSeyDIOXMZa6JecwREGoYguxnFjc3AhL8z4mRG+gA==
X-Received: by 10.46.32.29 with SMTP id g29mr3701466ljg.32.1472670437545; Wed,
	31 Aug 2016 12:07:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 31 Aug 2016 12:07:16 -0700 (PDT)
In-Reply-To: <156e1e513d5.c474d9aa54721.2629815168808718551@geekcentral.pub>
References: <156dbcc9234.fecba7bb134253.7144318255325985625@geekcentral.pub>
	<156e1e513d5.c474d9aa54721.2629815168808718551@geekcentral.pub>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 31 Aug 2016 21:07:16 +0200
Message-ID: <CA+chaQePytMyqg3aVSC_2yiDDgCEeJj8hOscuJN+DY1J=FEdCw@mail.gmail.com>
To: Ian Geiser <geiseri@geekcentral.pub>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Cannot build any external kernel modules in krogoth
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
X-List-Received-Date: Wed, 31 Aug 2016 19:07:19 -0000
Content-Type: multipart/alternative; boundary=001a1142b0184d1b77053b62ce8f

--001a1142b0184d1b77053b62ce8f
Content-Type: text/plain; charset=UTF-8

You're not alone, this might be the same issue (fixed only in master):
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9352

On Wed, Aug 31, 2016 at 8:38 PM, Ian Geiser <geiseri@geekcentral.pub> wrote:

>
>  ---- On Tue, 30 Aug 2016 10:13:52 -0400 Ian Geiser
> <geiseri@geekcentral.pub> wrote ----
>  > Greetings,  I have an issue where I cannot seem to build any external
> kernel module recipes.  The one in particular is iscsitarget, but it seems
> none of them build now.
>  >
>  > It seems that what is happening is that the "work-shared/*/kernel-build-artifacts"
> is getting erased right before the module recipe tries to use them.  Has
> anyone seen this before?
>  >
>  > As a key point, I am also using my own kernel recipe that only uses the
> kernel.bbclass, not the kernel-yocto.bbclass.  Is there magic I am missing
> that will not allow me to build modules unless I am using the yocto kernels?
>  >
>
> Looking at this further it looks like this is a normal issue with all
> kernels.  There is a race condition that will cause the kernel to rebuild
> everytime you build a module.  During this process the build artifacts are
> always cleared out and sometimes it wont actually populate the shared
> workdir.  I tested with most kernels and found all modules suffer this
> issue.  Am I the only one seeing this?
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1142b0184d1b77053b62ce8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You&#39;re not alone, this might be the same issue (fixed =
only in master):<div><a href=3D"https://bugzilla.yoctoproject.org/show_bug.=
cgi?id=3D9352">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9352</a>=
<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Wed, Aug 31, 2016 at 8:38 PM, Ian Geiser <span dir=3D"ltr">&lt;<a href=3D=
"mailto:geiseri@geekcentral.pub" target=3D"_blank">geiseri@geekcentral.pub<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0---- On Tue, 30 Aug 2016 10:13:52 -0400 Ian Geiser &lt;geiseri@geekce=
ntral.pub&gt; wrote ----<br>
=C2=A0&gt; Greetings,=C2=A0 I have an issue where I cannot seem to build an=
y external kernel module recipes.=C2=A0 The one in particular is iscsitarge=
t, but it seems none of them build now.<br>
=C2=A0&gt;<br>
=C2=A0&gt; It seems that what is happening is that the &quot;work-shared/*/=
kernel-build-<wbr>artifacts&quot; is getting erased right before the module=
 recipe tries to use them.=C2=A0 Has anyone seen this before?<br>
=C2=A0&gt;<br>
=C2=A0&gt; As a key point, I am also using my own kernel recipe that only u=
ses the kernel.bbclass, not the kernel-yocto.bbclass.=C2=A0 Is there magic =
I am missing that will not allow me to build modules unless I am using the =
yocto kernels?<br>
=C2=A0&gt;<br>
<br>
Looking at this further it looks like this is a normal issue with all kerne=
ls.=C2=A0 There is a race condition that will cause the kernel to rebuild e=
verytime you build a module.=C2=A0 During this process the build artifacts =
are always cleared out and sometimes it wont actually populate the shared w=
orkdir.=C2=A0 I tested with most kernels and found all modules suffer this =
issue.=C2=A0 Am I the only one seeing this?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1142b0184d1b77053b62ce8f--
