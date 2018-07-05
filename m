Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 94F3C788B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 08:38:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k7-v6so730399wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gwS2E+AAFdW2xi8S5PFHVmjJZxD1BxHwkqc1TfuvMcw=;
	b=ezGVOMzNpRbTxMGcI1cjezMvZzSijmVWsDAfRb2BjhKtHoQ1PBTz1Prqnttjgi6p5d
	cNaxVgi3b9FlzUlBVgAiKhTsRXOhuG4oULHR73u+f7cnuWRjYIdhZdGu6r5gVyhz8JxY
	StchTgdg4ZpxB15PdRedzkG9YXUyljj+wOC/w3OX2iRTukog8KrtxEOgdohV+/2mgJUu
	NIz8AiMGR6DJeO7AqLAloGfhgTMpuIFNC+FXUXR1vHH9LzQHzN/d9Nf2erSTxYLks5yU
	RqScRssCdOOnBwRFUOEhosNZxjnR+qbTNbZrvRzpy4i9aSUEYSM/e+S28bQmiF9C8b0C
	9dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gwS2E+AAFdW2xi8S5PFHVmjJZxD1BxHwkqc1TfuvMcw=;
	b=D4DEXqNdA937eNebyXSZEm/Cw6CaeontPVk+pOj6hvW+9g60mxGPWrdAibmO2Dg7Vk
	j2BAjPDpX3QDI0xeQeINFPQ9Jkh0MxYeVLeWeq5zL3DLa/VxSt6gHXhAGobdqchM6L/S
	zWXU5A0zmnU/6GgJ7UOP+laEf2GzuMaBcpO17ln2yzYR1lHzH0QW2wkMWRfBl+F+RJ/K
	rategow5ZcEGVrAqangni/G9NKOtDo8gJE5enPp6RwRPtloYMYPQKoebkwde6JpZPPSa
	u/wi/yKCyPyWHyiW75tqbrEY1eLF753dW1jWfRjd8oCE6IYvmRCIHBNYRPtFiOYnWOWi
	YREw==
X-Gm-Message-State: APt69E2wZ39iVqE9ucPrLvokaDUVRrPowcb/XUm6QqQNREkOQZl1OHtE
	o0SuDr7cnw7tobbXoECaY+FIzNhklKblT5zPUuo=
X-Google-Smtp-Source: AAOMgpdN//RbVdHMa6dt42DV0MCy359TASZzmOXQFwnKZmdaroODOodbEFArRtT2dL768FgB+d5lhdwNDEl6evPAaUk=
X-Received: by 2002:adf:8541:: with SMTP id
	59-v6mr3587768wrh.223.1530779899322; 
	Thu, 05 Jul 2018 01:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704200654.285-1-Martin.Jansa@gmail.com>
	<CAP71Wjwy0T-s7-D+aRDRwcH+w0nBD0gSV_HN3hFi6qpYnWfnkw@mail.gmail.com>
	<df456e87b2e9b34cff9991b91c98717020bfb3c9.camel@linuxfoundation.org>
In-Reply-To: <df456e87b2e9b34cff9991b91c98717020bfb3c9.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Jul 2018 10:38:06 +0200
Message-ID: <CA+chaQdQfoBLr9Z6EAaXPAzMWL2Z8AdB2d6owge-H_6o1q86Vw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel-devicetree: Corrected normalize_dtb"
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
X-List-Received-Date: Thu, 05 Jul 2018 08:38:18 -0000
Content-Type: multipart/alternative; boundary="00000000000020e42605703c7863"

--00000000000020e42605703c7863
Content-Type: text/plain; charset="UTF-8"

I am out til Sunday, so please someone else please resend just the revert.
Next week I will check the ppc issue and resend the rest (v2 is the same as
v3 except the rebase after this change, so after revert the v2 will apply
cleanly again)

On Thu, Jul 5, 2018, 10:23 Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2018-07-05 at 09:15 +0200, Nicolas Dechesne wrote:
> > On Wed, Jul 4, 2018 at 10:07 PM Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > >
> > > This reverts commit 2e7f3b2b9318d1e5395ad58131eafb873f614326.
> > >
> > > It was breaking quite common use case that the dtb files are in
> > > some subdirectory and then kernel build fails to build them.
> > >
> > > As reported by khem:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2018-July
> > > /152578.html
> > > me:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2018-July
> > > /152579.html
> > > on raspberrypi3 build:
> > >
> > > make[3]: *** No rule to make target
> > > 'arch/arm/boot/dts/dwc2.dtbo'.  Stop.
> > > arch/arm/Makefile:345: recipe for target 'dwc2.dtbo' failed
> > > make[2]: *** [dwc2.dtbo] Error 2
> > > Makefile:146: recipe for target 'sub-make' failed
> > >
> > > and trevor on the IRC:
> > > 20:35:49 < tlwoerner> the recent
> > > 2e7f3b2b9318d1e5395ad58131eafb873f614326 commit in oe-core seems to
> > > cause dragonboard-410c's kernel to fail to build
> > > 20:36:26 < tlwoerner> for the dragonboard-410c, KERNEL_DEVICETREE
> > > is set to "qcom/apq8016-sbc.dtb" but the build failure is:
> > > 20:36:37 < tlwoerner> *** No rule to make target
> > > 'arch/arm64/boot/dts/dts/qcom/apq8016-sbc.dtb'.  Stop.
> > > 20:36:44 < tlwoerner> i.e. the "qcom/" is getting removed
> > > 20:37:08 < tlwoerner> oops!!
> > > 20:37:33 < tlwoerner> wrong copy&paste, the actual error is:
> > > 20:37:36 < tlwoerner> *** No rule to make target
> > > 'arch/arm64/boot/dts/apq8016-sbc.dtb'.  Stop.
> > > 20:37:53 < tlwoerner> i.e., the "qcom/" is being stripped out
> >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
> > Thanks! As reported by Trevor, it's needed for meta-qcom..
> >
> > Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> Just to note that I'm happy to take this but its based on top of
> Martin's other patches and those look like they'll need a respin so
> this will either have to wait or get rebased...
>
> Cheers,
>
> Richard
>

--00000000000020e42605703c7863
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am out til Sunday, so please someone else please resend=
 just the revert. Next week I will check the ppc issue and resend the rest =
(v2 is the same as v3 except the rebase after this change, so after revert =
the v2 will apply cleanly again)</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Thu, Jul 5, 2018, 10:23 Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2018-07-05 at 09=
:15 +0200, Nicolas Dechesne wrote:<br>
&gt; On Wed, Jul 4, 2018 at 10:07 PM Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">martin.jansa@gmai=
l.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; This reverts commit 2e7f3b2b9318d1e5395ad58131eafb873f614326.<br>
&gt; &gt; <br>
&gt; &gt; It was breaking quite common use case that the dtb files are in<b=
r>
&gt; &gt; some subdirectory and then kernel build fails to build them.<br>
&gt; &gt; <br>
&gt; &gt; As reported by khem:<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-c=
ore/2018-July" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists=
.openembedded.org/pipermail/openembedded-core/2018-July</a><br>
&gt; &gt; /152578.html<br>
&gt; &gt; me:<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-c=
ore/2018-July" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists=
.openembedded.org/pipermail/openembedded-core/2018-July</a><br>
&gt; &gt; /152579.html<br>
&gt; &gt; on raspberrypi3 build:<br>
&gt; &gt; <br>
&gt; &gt; make[3]: *** No rule to make target<br>
&gt; &gt; &#39;arch/arm/boot/dts/dwc2.dtbo&#39;.=C2=A0 Stop.<br>
&gt; &gt; arch/arm/Makefile:345: recipe for target &#39;dwc2.dtbo&#39; fail=
ed<br>
&gt; &gt; make[2]: *** [dwc2.dtbo] Error 2<br>
&gt; &gt; Makefile:146: recipe for target &#39;sub-make&#39; failed<br>
&gt; &gt; <br>
&gt; &gt; and trevor on the IRC:<br>
&gt; &gt; 20:35:49 &lt; tlwoerner&gt; the recent<br>
&gt; &gt; 2e7f3b2b9318d1e5395ad58131eafb873f614326 commit in oe-core seems =
to<br>
&gt; &gt; cause dragonboard-410c&#39;s kernel to fail to build<br>
&gt; &gt; 20:36:26 &lt; tlwoerner&gt; for the dragonboard-410c, KERNEL_DEVI=
CETREE<br>
&gt; &gt; is set to &quot;qcom/apq8016-sbc.dtb&quot; but the build failure =
is:<br>
&gt; &gt; 20:36:37 &lt; tlwoerner&gt; *** No rule to make target<br>
&gt; &gt; &#39;arch/arm64/boot/dts/dts/qcom/apq8016-sbc.dtb&#39;.=C2=A0 Sto=
p.<br>
&gt; &gt; 20:36:44 &lt; tlwoerner&gt; i.e. the &quot;qcom/&quot; is getting=
 removed<br>
&gt; &gt; 20:37:08 &lt; tlwoerner&gt; oops!!<br>
&gt; &gt; 20:37:33 &lt; tlwoerner&gt; wrong copy&amp;paste, the actual erro=
r is:<br>
&gt; &gt; 20:37:36 &lt; tlwoerner&gt; *** No rule to make target<br>
&gt; &gt; &#39;arch/arm64/boot/dts/apq8016-sbc.dtb&#39;.=C2=A0 Stop.<br>
&gt; &gt; 20:37:53 &lt; tlwoerner&gt; i.e., the &quot;qcom/&quot; is being =
stripped out<br>
&gt; <br>
&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">Martin.Jansa@gmail.com</a>&gt=
;<br>
&gt; <br>
&gt; Thanks! As reported by Trevor, it&#39;s needed for meta-qcom..<br>
&gt; <br>
&gt; Reviewed-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@l=
inaro.org" target=3D"_blank" rel=3D"noreferrer">nicolas.dechesne@linaro.org=
</a>&gt;<br>
<br>
Just to note that I&#39;m happy to take this but its based on top of<br>
Martin&#39;s other patches and those look like they&#39;ll need a respin so=
<br>
this will either have to wait or get rebased...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--00000000000020e42605703c7863--
