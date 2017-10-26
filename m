Return-Path: <vomegaz@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7DF60068
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 03:59:02 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id l196so3474617itl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 20:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pdmYvL22XBKEZWxywPxVsBUFWYrp8PV+8ifG3Xg/7K0=;
	b=JbCGUET0oqjm1Lgxsow/vcFCUFSxzNp8vYsf3jeQOiJx45YdcDPesIqjdP1co6giI9
	+wyv8j8N4TC1rEiY64Bd+v3kqyWogUBds1bTPcjOVe747Ykh8MPmMqRPUJPh0MbWgBVH
	AYBcWCY9cwHcdC4BJsA58TjigqXswMrGGXlGQhXoqlUht7z47a01lL8yH9pyYqUW01/q
	zmMFS9stjw8efauJTB57fSSQU78w5p2bQFJNwECqAFrZdsOxkPzJhsjWlBHONMOX9h1P
	aYuP9IYQ0vNTeorYlR+iXSjNvHqM4pueuySZoWWMpJGof83hug+zC9gcx5B2uKDGx4Lm
	DPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=pdmYvL22XBKEZWxywPxVsBUFWYrp8PV+8ifG3Xg/7K0=;
	b=RgYqnqJshFi8uc5Xm8ok3E9XTMqJW1cRC18/Cxem5AwOYY2hxmAoNxqCAyaKNMWM47
	mT1HrAg6+iRq6CkOsy4G7QfxZ2TiLG8xGIyXraeyQiHdWSEI0c4mpzhAKfch98qs7T6B
	m4uCLuy2H4fN2pFfd7XYSR3pamO5eO3x9QCGpfP9eaJW6FXT8SOgT+HQHMvU+91SFLWz
	AG+fQMKOndlE+C3HWnNf4Nn9xh/dlsd8FkS4H5Hfq4rpK4AWAcedH5qtEipcdI6xfq36
	Z7cQIbP0gdZhUK76phH3F9AXQILF4Udkby5y57E2Bp3Y0L+/kIlEeGln/6KMZpdT/02d
	NgQw==
X-Gm-Message-State: AMCzsaW5j+yx3GvGwquakuNFKibVZvJ8LB6jXZ/87AfEh6XOWXia3raG
	j7WFdVTO9n0Wij5sjT2cnkgXQajCT5jFKOYgVlk=
X-Google-Smtp-Source: ABhQp+TIgT6982QSeads1AALMiV5MTYZE2G6CvuScrY1eMCZiH2mo2AOvb6p5Bv2Q+aTJMQyl+tv83oC+/Hl5nMkm1c=
X-Received: by 10.36.4.212 with SMTP id 203mr702072itb.10.1508990343992; Wed,
	25 Oct 2017 20:59:03 -0700 (PDT)
MIME-Version: 1.0
Reply-To: thomas.perrot@tupi.fr
Sender: vomegaz@gmail.com
Received: by 10.107.167.211 with HTTP; Wed, 25 Oct 2017 20:58:23 -0700 (PDT)
In-Reply-To: <CAP9ODKpUtT3XCXgmWh7Fze8Sy+Qb9gXgmHhAFARnFQQ16+ToTA@mail.gmail.com>
References: <1508918112-9459-1-git-send-email-B40290@freescale.com>
	<CAP9ODKpUtT3XCXgmWh7Fze8Sy+Qb9gXgmHhAFARnFQQ16+ToTA@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Thu, 26 Oct 2017 05:58:23 +0200
X-Google-Sender-Auth: QAr3nujlvEOCNz6VWK1bZFCijbE
Message-ID: <CAGXeWg=uqPE1D_53XNJa-oHVDbUBavNpPg4To9bJ=D9rss2AsA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Chunrong Guo <chunrong.guo@nxp.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: add DTB_LOAD to set dtb address
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
X-List-Received-Date: Thu, 26 Oct 2017 03:59:03 -0000
Content-Type: multipart/alternative; boundary="001a1140b3306c5ab9055c6b316c"

--001a1140b3306c5ab9055c6b316c
Content-Type: text/plain; charset="UTF-8"

Hi,

it would seem that it is also necessary to add the entry field on some
targets.

I think the best would to be do as for UBOOT_RD_LOADADDRESS and
UBOOT_RD_ENTRYPOINT.

Best regards,
Thomas P.

On Wed, Oct 25, 2017 at 6:52 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Wed, Oct 25, 2017 at 5:55 AM, Chunrong Guo <B40290@freescale.com>
> wrote:
> > From: Chunrong Guo <chunrong.guo@nxp.com>
> >
> > kernel-fitimage for arm64 and arm need dynamically sets dtb address,
> > thus we need a flexible way to load dtb address value.
> >
> > Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> > ---
> >  meta/classes/kernel-fitimage.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> > index 179185b..479ffd4 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -36,6 +36,8 @@ python __anonymous () {
> >  # Options for the device tree compiler passed to mkimage '-D' feature:
> >  UBOOT_MKIMAGE_DTCOPTS ??= ""
> >
> > +# Options for load dtb address
> > +DTB_LOAD ??= ""
> >  #
> >  # Emit the fitImage ITS header
> >  #
> > @@ -137,6 +139,7 @@ fitimage_emit_section_dtb() {
> >                          type = "flat_dt";
> >                          arch = "${UBOOT_ARCH}";
> >                          compression = "none";
> > +                        load = <${DTB_LOAD}>;
>
> What happens if it is empty?
>
>
> >                          hash@1 {
> >                                  algo = "${dtb_csum}";
> >                          };
> > --
> > 1.9.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140b3306c5ab9055c6b316c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br><span id=3D"gmail-result_box" cl=
ass=3D"gmail-" tabindex=3D"-1" lang=3D"en"><span>it would seem that it is a=
lso necessary to add the entry field on some targets.<br><br></span></span>=
</div><span id=3D"gmail-result_box" class=3D"gmail-" tabindex=3D"-1" lang=
=3D"en"><span>I think the best would to be do as for UBOOT_RD_LOADADDRESS a=
nd UBOOT_RD_ENTRYPOINT.<br><br></span></span></div><span id=3D"gmail-result=
_box" class=3D"gmail-" tabindex=3D"-1" lang=3D"en"><span>Best regards,<br><=
/span></span></div><span id=3D"gmail-result_box" class=3D"gmail-" tabindex=
=3D"-1" lang=3D"en"><span>Thomas P.<br><br></span></span>On Wed, Oct 25, 20=
17 at 6:52 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otav=
io.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossystems.c=
om.br</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5">On Wed, Oct 25, 2017 at 5:55 AM, Chunrong Guo &lt;<a href=3D"mailto=
:B40290@freescale.com">B40290@freescale.com</a>&gt; wrote:<br>
&gt; From: Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com">chunron=
g.guo@nxp.com</a>&gt;<br>
&gt;<br>
&gt; kernel-fitimage for arm64 and arm need dynamically sets dtb address,<b=
r>
&gt; thus we need a flexible way to load dtb address value.<br>
&gt;<br>
&gt; Signed-off-by: Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com=
">chunrong.guo@nxp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-fitimage.<wbr>bbclass | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-<wbr>fitimage.bbclass b/meta/classes/=
kernel-<wbr>fitimage.bbclass<br>
&gt; index 179185b..479ffd4 100644<br>
&gt; --- a/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; +++ b/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; @@ -36,6 +36,8 @@ python __anonymous () {<br>
&gt;=C2=A0 # Options for the device tree compiler passed to mkimage &#39;-D=
&#39; feature:<br>
&gt;=C2=A0 UBOOT_MKIMAGE_DTCOPTS ??=3D &quot;&quot;<br>
&gt;<br>
&gt; +# Options for load dtb address<br>
&gt; +DTB_LOAD ??=3D &quot;&quot;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Emit the fitImage ITS header<br>
&gt;=C2=A0 #<br>
&gt; @@ -137,6 +139,7 @@ fitimage_emit_section_dtb() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 type =3D &quot;flat_dt&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 arch =3D &quot;${UBOOT_ARCH}&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 compression =3D &quot;none&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 load =3D &lt;${DTB_LOAD}&gt;;<br>
<br>
</div></div>What happens if it is empty?<br>
<span class=3D"im HOEnZb"><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 hash@1 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 algo =3D &quot;${dtb_csum}=
&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 };<br>
&gt; --<br>
&gt; 1.9.0<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
<br>
<br>
</span><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--001a1140b3306c5ab9055c6b316c--
