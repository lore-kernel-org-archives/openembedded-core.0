Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7014C71AC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:02:32 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id w127so15182645iow.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NDxfyZzXa5vu1KNNc2/G/rYqtiUu2HYJEM0AuUtLWbI=;
	b=lw/UOxfDijs3fh2ZdHdDOAxU7RGYSrv9F7eEcNMpukIs9UskdaddMTl18Tk84xPSGd
	jGpwR40WxpNrap79CCQ7nl1dUilRIire+FFgawyqXaC3r8/DYnk6zq4ErkkqvaQUgpdo
	D9ZdSbSBYccPJW6usrkExXEHL0kR3PB6pqVEsao00zASvMucMOtHWs0P5Kjoe3K54PYW
	uGUXDfNr9vtxIGD6uZ+l8wkBQlCBckyPTMcbIinQYp3ndUE0oHeAGRAJXAcEaXXVCV3E
	Squ7O4gIrllRgtI4f4wdHt7/9tZL6r06px7/mlMkSgLmy/+9pddxJLU31ZePbNV3s+J8
	hYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NDxfyZzXa5vu1KNNc2/G/rYqtiUu2HYJEM0AuUtLWbI=;
	b=Qc/1L8hf12/u8ivG7ISh/d+PQvfa5Y+ZpUwsBgT7TGBnxUjySb1Rdqj5jROLGbwICp
	9AIQC+Xw81qH9QyjGCI59Hbg69153IXHOPhUqmGup6zstJ/bAsNyggsgs5rLJetWG7Sy
	DyURyTAks9tasMl9ZDWtxNtgxHhjc00IRILRq1YXNZWYQzmfhoK18Y9yIfqMGWV2aTLc
	46wf+zjJV/pzDEQ8LYO38pWJnKULd33TdNP7QO2UKpepbgcMCocjZ+zAVMvKowmQMuL9
	bPcaiVUg8LsyNssxBBTe8RxD0BVuFqrkFU7V2VAW0LhB7bt/eUjXF2LApcuNt7S1uUf/
	T8Bg==
X-Gm-Message-State: AKGB3mLTe5iC5FmYY3VDDTVEopN/+ujCBgUv5asLH34eols1KOQcSZbu
	IR0XYi9OhaQR53Sfgh0+FNEQKkYlmUWgQqnIH1fyDQ==
X-Google-Smtp-Source: ACJfBov9i/9iISnYowhXBCIg5wTbolfXED+9nzSKXINfxvckSgGR30wv9MFsERPPpDc2DWvyu9jsW3E4TCXxHSDSn9I=
X-Received: by 10.107.146.9 with SMTP id u9mr4570429iod.37.1513720953572; Tue,
	19 Dec 2017 14:02:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Tue, 19 Dec 2017 14:02:13 -0800 (PST)
In-Reply-To: <BL2PR02MB21635E15F53E8D190D70AD01B90F0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1513189598-9420-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<BL2PR02MB21635E15F53E8D190D70AD01B90F0@BL2PR02MB2163.namprd02.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Dec 2017 22:02:13 +0000
Message-ID: <CAJTo0LZD7BvXHsvmUaF9r+-j02o6uHN_gRSo+NT5F5xkSs9fQg@mail.gmail.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: Fix bad image type replacement for aarch64
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
X-List-Received-Date: Tue, 19 Dec 2017 22:02:32 -0000
Content-Type: multipart/alternative; boundary="94eb2c05b10aba3ec00560b89f91"

--94eb2c05b10aba3ec00560b89f91
Content-Type: text/plain; charset="UTF-8"

This is queued in ross/mut2 and should be in master shortly, although as
it's almost the Christmas holidays here it may be in the new year.

Ross

On 19 December 2017 at 21:34, Manjukumar Harthikote Matha <
MANJUKUM@xilinx.com> wrote:

> Ping?
>
> Any reason for this being in pending status? Please let me know
>
> Thanks,
> Manju
>
> > -----Original Message-----
> > From: Manjukumar Matha [mailto:manjukumar.harthikote-matha@xilinx.com]
> > Sent: Wednesday, December 13, 2017 10:27 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Thomas Perrot <thomas.perrot@tupi.fr>; Manjukumar Harthikote Matha
> > <MANJUKUM@xilinx.com>
> > Subject: [OE-core][PATCH] kernel-fitimage: Fix bad image type
> replacement for
> > aarch64
> >
> > From: Thomas Perrot <thomas.perrot@tupi.fr>
> >
> > When using kernel-fitimage class with aarch64, the image type has to be
> Image not
> > zImage.  This patch fixes the bad image type replacement for
> > aarch64
> >
> > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> > Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> > ---
> >  meta/classes/kernel-fitimage.bbclass | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> > fitimage.bbclass
> > index 179185b..9baf399 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -7,9 +7,12 @@ python __anonymous () {
> >          depends = "%s u-boot-mkimage-native dtc-native" % depends
> >          d.setVar("DEPENDS", depends)
> >
> > -        if d.getVar("UBOOT_ARCH") == "mips":
> > +        uarch = d.getVar("UBOOT_ARCH")
> > +        if uarch == "arm64":
> > +            replacementtype = "Image"
> > +        elif uarch == "mips":
> >              replacementtype = "vmlinuz.bin"
> > -        elif d.getVar("UBOOT_ARCH") == "x86":
> > +        elif uarch == "x86":
> >              replacementtype = "bzImage"
> >          else:
> >              replacementtype = "zImage"
> > --
> > 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05b10aba3ec00560b89f91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is queued in ross/mut2 and should be in master shortl=
y, although as it&#39;s almost the Christmas holidays here it may be in the=
 new year.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 19 December 2017 at 21:34, Manjukumar Harth=
ikote Matha <span dir=3D"ltr">&lt;<a href=3D"mailto:MANJUKUM@xilinx.com" ta=
rget=3D"_blank">MANJUKUM@xilinx.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Ping?<br>
<br>
Any reason for this being in pending status? Please let me know<br>
<br>
Thanks,<br>
Manju<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; -----Original Message-----<br>
&gt; From: Manjukumar Matha [mailto:<a href=3D"mailto:manjukumar.harthikote=
-matha@xilinx.com">manjukumar.harthikote-<wbr>matha@xilinx.com</a>]<br>
&gt; Sent: Wednesday, December 13, 2017 10:27 AM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Cc: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.fr">thomas.=
perrot@tupi.fr</a>&gt;; Manjukumar Harthikote Matha<br>
&gt; &lt;<a href=3D"mailto:MANJUKUM@xilinx.com">MANJUKUM@xilinx.com</a>&gt;=
<br>
&gt; Subject: [OE-core][PATCH] kernel-fitimage: Fix bad image type replacem=
ent for<br>
&gt; aarch64<br>
&gt;<br>
&gt; From: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.fr">thoma=
s.perrot@tupi.fr</a>&gt;<br>
&gt;<br>
&gt; When using kernel-fitimage class with aarch64, the image type has to b=
e Image not<br>
&gt; zImage.=C2=A0 This patch fixes the bad image type replacement for<br>
&gt; aarch64<br>
&gt;<br>
&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.=
fr">thomas.perrot@tupi.fr</a>&gt;<br>
&gt; Signed-off-by: Manjukumar Matha &lt;<a href=3D"mailto:manjukumar.harth=
ikote-matha@xilinx.com">manjukumar.harthikote-matha@<wbr>xilinx.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-fitimage.<wbr>bbclass | 7 +++++--<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-<wbr>fitimage.bbclass b/meta/classes/=
kernel-<br>
&gt; fitimage.bbclass<br>
&gt; index 179185b..9baf399 100644<br>
&gt; --- a/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; +++ b/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; @@ -7,9 +7,12 @@ python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-mkimage-=
native dtc-native&quot; % depends<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;DEPENDS&quot;, depend=
s)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;UBOOT_ARCH&quot;) =3D=
=3D &quot;mips&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uarch =3D d.getVar(&quot;UBOOT_ARCH&quot;=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if uarch =3D=3D &quot;arm64&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &quot;I=
mage&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif uarch =3D=3D &quot;mips&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &q=
uot;vmlinuz.bin&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif d.getVar(&quot;UBOOT_ARCH&quot;) =3D=
=3D &quot;x86&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif uarch =3D=3D &quot;x86&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &q=
uot;bzImage&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &q=
uot;zImage&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c05b10aba3ec00560b89f91--
