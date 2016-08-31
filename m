Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 574DC731B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:44:12 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c52so1691400qte.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 05:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zq5UXqzi9pKLi3n1ga+X8LeD8F7T8439OOVYADd6KP4=;
	b=fKxeI7JNFWtPsLVLNiEhy2950OspE2kd2K5DnwX64y8XZTCfrGj6DgEOob625HR8ZN
	1cj74x6LFJnx9jWGvfUqocKp7phqRK7gjVUMIDmn79b5vrVAwCBhyc9WerfTyXae8jWu
	EU9ealzjZ90CnLjs3qne75EXhyRdh9oEs7626qaa5ahFyhC+fc3Eaxw2K4P8YOPmBumf
	HvnrcpEmNLLIPLarnv7DdT4RaHkA8lDIOttzBkS9mywBZfIUWiscQU7C2uBIWUTi2ZrI
	VitCbtMPSwbBDJoOa1FhsKCMjmfVrp51gAih3DPV34yiwQ5IfUmHyWMCP9aJRykG4irY
	KV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zq5UXqzi9pKLi3n1ga+X8LeD8F7T8439OOVYADd6KP4=;
	b=DwqnuArPciJqME+Kqlndw8chsCYD/B+pCpndbru/WFd4x7Tu7zvV0hNoi4c+XIMT1i
	l09RpRgnn0x0mh3R88yPpRkh8HB2lvjocQ/jjrECK4i0Fy2DEmZb2BV7/WK9qvRET5z2
	3aarrgFMIwuqEdb+reMiy7yGFvwsb3m9OaKiYSoA5g1OJgtxABRfVYVrEClNQsjFyaor
	rAKGnEj36wkAFbQkXXNEgxt/xk49qI+10YT2yPdyApyjTCEXC2ZHQl2mNBvTRea+bhF+
	pvxK7AN2uQdlFs8oXAiCjF7LRSsk8E2M66w0PVzxaRAMGWvw3iSn57DkcDw5zZERMYLl
	4qfA==
X-Gm-Message-State: AE9vXwM7h1i4TV1Lufir+VQHSHenTiEorZRi3zfic63lozWPBPcPUvL0OAd+W3PRZg1dMcM7/FzTCmQa/3oZyw==
X-Received: by 10.237.47.1 with SMTP id l1mr10577376qtd.124.1472647453467;
	Wed, 31 Aug 2016 05:44:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.53.83 with HTTP; Wed, 31 Aug 2016 05:44:12 -0700 (PDT)
In-Reply-To: <1472628175.29583.64.camel@linuxfoundation.org>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
	<7a16ab60139050fc112ae798e763f1270e7abbfd.1472574514.git.bruce.ashfield@windriver.com>
	<1472628175.29583.64.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Aug 2016 08:44:12 -0400
Message-ID: <CADkTA4McwPvagc7z4gO1a88NkAZLsE3EZTvh=bU+aqht78nx8g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 3/9] qemuarm: add device tree support
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
X-List-Received-Date: Wed, 31 Aug 2016 12:44:13 -0000
Content-Type: multipart/alternative; boundary=94eb2c1252f25811e1053b5d7432

--94eb2c1252f25811e1053b5d7432
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 31, 2016 at 3:22 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2016-08-30 at 12:49 -0400, Bruce Ashfield wrote:
> > As of the 4.7 kernel qemuarm must be booted with a dtb. To allow
> > older and recent kernels to both boot qemuarm, we add the device
> > tree definitions only to recipes that need it (linux-yocto-dev)
> > and make runqemu detect and use the dtb if present.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> >  scripts/runqemu-internal | 3 +++
> >  1 file changed, 3 insertions(+)
>
> This doesn't work with Roberts runqemu conversion to python.
>
> I did try adding http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=ma
> ster-next&id=e91d7bf00bfab5142bc290425103971b897c208b however this
> requires the use of the dtb file and doesn't work with older kernels.
> I'll see if I can come up with something better based on kernel
> PREFERRED_VERSION...
>

Yah. I mentioned this one in my 0/N, I was working against the current
master
(I should just work against master-next for these .. mental note for next
time).


Bruce


>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c1252f25811e1053b5d7432
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 31, 2016 at 3:22 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Tue, 2016-08-30 at 12:49 -0400, Bruce Ash=
field wrote:<br>
&gt; As of the 4.7 kernel qemuarm must be booted with a dtb. To allow<br>
&gt; older and recent kernels to both boot qemuarm, we add the device<br>
&gt; tree definitions only to recipes that need it (linux-yocto-dev)<br>
&gt; and make runqemu detect and use the dtb if present.<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@win=
driver.com">bruce.ashfield@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/runqemu-internal | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
<br>
</span>This doesn&#39;t work with Roberts runqemu conversion to python.<br>
<br>
I did try adding <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commi=
t/?h=3Dma
ster-next&amp;id=3De91d7bf00bfab5142bc290425103971b897c208b" rel=3D"norefer=
rer" target=3D"_blank">http://git.yoctoproject.org/<wbr>cgit.cgi/poky/commi=
t/?h=3Dma<br>
ster-next&amp;id=3D<wbr>e91d7bf00bfab5142bc29042510397<wbr>1b897c208b</a> h=
owever this<br>
requires the use of the dtb file and doesn&#39;t work with older kernels.<b=
r>
I&#39;ll see if I can come up with something better based on kernel<br>
PREFERRED_VERSION...<br></blockquote><div><br></div><div>Yah. I mentioned t=
his one in my 0/N, I was working against the current master<br></div><div>(=
I should just work against master-next for these .. mental note for next ti=
me).<br><br><br></div><div>Bruce</div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c1252f25811e1053b5d7432--
