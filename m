Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8B41078094
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 08:56:09 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id k43so17746215uaf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 01:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sd5UdokPWus/LDo8e17E2mR4R6FyoFXkdbSsXKRW+LQ=;
	b=HMyV8h8PUk56sYzR2WDUrZ9elbLUtnNf2SrUKxwY0auvHzCEk/xS/I5XqDRNMtgk8K
	rNKD7PJaILzuJhGly6b9AAecFkk/cCDZ5fmnQHDfmuQpUeXnzSO9z+IrLqBGkW+EA3dn
	8jQKU8aUgYFWpMX7fKFAg4Afw/LSXGbh97Ik3Rk2qOwAHYq222oldx103tqGYz9NlIDL
	L4kEwxfIRiZ4GoYDmMJE21m9gVCPmXtEQ6hdAFI463KVb87zySIDNAZpbypriNwC2vKn
	DXm2Zu4OqXdPAO/PzEEV4761OYIYkD2EXMOEYWs8uO5jbDcYu8UZT28+EfcDl0vA16Kl
	Nb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sd5UdokPWus/LDo8e17E2mR4R6FyoFXkdbSsXKRW+LQ=;
	b=NOoiThgLqLu1CyLSRuP4zpsPc156jDvg15211YKSOxkkMGagvYaqzHjrfiS3o8LHxj
	78oluoOviA6ka7q1AX4wKtoGGVo37wqf38HdrGfcE0ZN+Qk5ExUtdGSgiDFzxDGWTl9w
	UYENiDzJH3m2EgeDp+JQCdTVTcqKnH+f2FCZa+MhSp9IwSqCzNrhzSY0zHHXfsb01+nq
	ShEREt0kktng27V3MWUrPojScBSoBLiZaPI76A7s0MSJTNaF0AOatAOs38Tps8s0zUH8
	PRuD5ZtoBqzycswNDIITxBYpB9xdBgCQaFVpnislx0GcNN9ot2rl951UGYu5CW592rvD
	bDQQ==
X-Gm-Message-State: AIVw110CpbKiO1aQ3660sy5sz3zCcDTFahcY0idP+324cglSlOygO1l5
	137v/xfBRtrCuMmdy3htOE+zyizxhQ==
X-Received: by 10.176.79.43 with SMTP id n43mr14644373uah.101.1501664171270;
	Wed, 02 Aug 2017 01:56:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Wed, 2 Aug 2017 01:56:10 -0700 (PDT)
In-Reply-To: <20170802082604.GA2944@linux.intel.com>
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
	<1501607630-30241-3-git-send-email-liu.ming50@gmail.com>
	<20170802082604.GA2944@linux.intel.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 2 Aug 2017 10:56:10 +0200
Message-ID: <CALatG=5MawbdgfQCNxuppczzAs_OuWV4UEK9KTG99bgH-2MJ-A@mail.gmail.com>
To: ed.bartosh@linux.intel.com
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] image_types_wic.bbclass: deal with dependencies only with WKS_FILE_DEPENDS_DEFAULT
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
X-List-Received-Date: Wed, 02 Aug 2017 08:56:10 -0000
Content-Type: multipart/alternative; boundary="f403043c6d248029f40555c16f96"

--f403043c6d248029f40555c16f96
Content-Type: text/plain; charset="UTF-8"

Hi, Ed:

Thanks for testing it, I will investigate the cause and get back to you.

the best,
thank you

2017-08-02 10:26 GMT+02:00 Ed Bartosh <ed.bartosh@linux.intel.com>:

> On Tue, Aug 01, 2017 at 07:13:48PM +0200, liu.ming50@gmail.com wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > Drop do_image_wic depends varflags, move the dependencies to
> > WKS_FILE_DEPENDS_DEFAULT. I can not see the need to maintain them
> > in two different ways, besides that it's out of USING_WIC control.
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  meta/classes/image_types_wic.bbclass | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/image_types_wic.bbclass
> b/meta/classes/image_types_wic.bbclass
> > index b825b47..7b0a1c7 100644
> > --- a/meta/classes/image_types_wic.bbclass
> > +++ b/meta/classes/image_types_wic.bbclass
> > @@ -39,9 +39,8 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH
> WKS_FILES"
> >  USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
> '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> >  WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> >  do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> > -do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot'
> % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> >
> > -WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native
> cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
> > +WKS_FILE_DEPENDS_DEFAULT = "parted-native gptfdisk-native
> dosfstools-native mtools-native syslinux-native bmap-tools-native
> cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
> >  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> >  WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
> >  WKS_FILE_DEPENDS_BOOTLOADERS_x86-64 = "syslinux grub-efi systemd-boot"
>
> This breakes wic build on qemux86-64 target on my machine with the
> error: "ERROR: A native program parted required to build the image was not
> found (see details above)."
>
> --
> Regards,
> Ed
>

--f403043c6d248029f40555c16f96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Ed:<div><br></div><div>Thanks for testing it, I will i=
nvestigate the cause and get back to you.</div><div><br></div><div>the best=
,</div><div>thank you</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2017-08-02 10:26 GMT+02:00 Ed Bartosh <span dir=3D"ltr">&l=
t;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartos=
h@linux.intel.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On Tue, Aug 01, 2017 at 07:13:48PM +0200, <a href=3D"mailto:liu.m=
ing50@gmail.com">liu.ming50@gmail.com</a> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.c=
om">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;<br>
&gt; Drop do_image_wic depends varflags, move the dependencies to<br>
&gt; WKS_FILE_DEPENDS_DEFAULT. I can not see the need to maintain them<br>
&gt; in two different ways, besides that it&#39;s out of USING_WIC control.=
<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atl=
ascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/image_types_wic.<wbr>bbclass | 3 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/image_types_<wbr>wic.bbclass b/meta/classes/=
image_types_<wbr>wic.bbclass<br>
&gt; index b825b47..7b0a1c7 100644<br>
&gt; --- a/meta/classes/image_types_<wbr>wic.bbclass<br>
&gt; +++ b/meta/classes/image_types_<wbr>wic.bbclass<br>
&gt; @@ -39,9 +39,8 @@ IMAGE_CMD_wic[vardepsexclude] =3D &quot;WKS_FULL_PAT=
H WKS_FILES&quot;<br>
&gt;=C2=A0 USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;<wbr>IMAGE_FST=
YPES&#39;, &#39;wic &#39; + &#39; &#39;.join(&#39;wic.%s&#39; % c for c in =
&#39;${CONVERSIONTYPES}&#39;.split()), &#39;1&#39;, &#39;&#39;, d)}&quot;<b=
r>
&gt;=C2=A0 WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; % o=
s.path.exists(&#39;${WKS_FULL_<wbr>PATH}&#39;) if &#39;${USING_WIC}&#39; el=
se &#39;&#39;}&quot;<br>
&gt;=C2=A0 do_image_wic[file-checksums] +=3D &quot;${WKS_FILE_CHECKSUM}&quo=
t;<br>
&gt; -do_image_wic[depends] +=3D &quot;${@&#39; &#39;.join(&#39;%s-native:d=
o_populate_<wbr>sysroot&#39; % r for r in (&#39;parted&#39;, &#39;gptfdisk&=
#39;, &#39;dosfstools&#39;, &#39;mtools&#39;))}&quot;<br>
&gt;<br>
&gt; -WKS_FILE_DEPENDS_DEFAULT =3D &quot;syslinux-native bmap-tools-native =
cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native&q=
uot;<br>
&gt; +WKS_FILE_DEPENDS_DEFAULT =3D &quot;parted-native gptfdisk-native dosf=
stools-native mtools-native syslinux-native bmap-tools-native cdrtools-nati=
ve btrfs-tools-native squashfs-tools-native e2fsprogs-native&quot;<br>
&gt;=C2=A0 WKS_FILE_DEPENDS_BOOTLOADERS =3D &quot;&quot;<br>
&gt;=C2=A0 WKS_FILE_DEPENDS_BOOTLOADERS_<wbr>x86 =3D &quot;syslinux grub-ef=
i systemd-boot&quot;<br>
&gt;=C2=A0 WKS_FILE_DEPENDS_BOOTLOADERS_<wbr>x86-64 =3D &quot;syslinux grub=
-efi systemd-boot&quot;<br>
<br>
</span>This breakes wic build on qemux86-64 target on my machine with the<b=
r>
error: &quot;ERROR: A native program parted required to build the image was=
 not found (see details above).&quot;<br>
<br>
--<br>
Regards,<br>
Ed<br>
</blockquote></div><br></div>

--f403043c6d248029f40555c16f96--
