Return-Path: <ross.burton@intel.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id B01A7602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 14:53:01 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id y9so35014186uae.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 06:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=80kxAJRQPKRGKn6qNKWfPYPSzmtsFNCE6CbNeh0/HHg=;
	b=TUo4ycUTTF/tK+fDuau/2C40R9Iv6khsdx50L6k3+gHwczwny++qjrGhE+t/NZnSy/
	+U9ITZueXWdZbfeDRusIBo4noBXKgsn+ZPWW/FVvvOXWZgl9wP5Ajcgyw/Qari2nFS09
	+L598MSUNZ8FxJ+WSJ7r7A/Nyx3GC103tnhMkDJ/BcISFaaNUV8OaI5/hCG6f+266vxu
	tcH4D1ycIfOvmiao4Tnm1I6+CSaUJEBgMJwx6UYm6fKPmf86IiX+9BN/+ugqlFpTyZrk
	mBvU71jNUox6ntIyjctX7iI3v22HcSAeWXrzp1r2RM97HkzlgmanylGHpZKBle63o2JY
	uf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=80kxAJRQPKRGKn6qNKWfPYPSzmtsFNCE6CbNeh0/HHg=;
	b=pFgHd9Vj85eol0Ax5skTpD1r7nDuOx5zfyQHcAgnIf3k6ORBgm+YUsOrDflBlM96DG
	TVjVxsapQH+w1KVqFMEpdVh+AM54tSpgALPdNnotocNxikYfqIImCKJNEmNpQPHwC2PD
	cqCwiZDwQLS+0Bm9+mjFXua9PSUseWRn6tS6LoP7OUR1WeJPfex/VVcknr/RexHmEyBj
	NY7QIyDg02qQ5tXv1oFDOxmnZs64xaSOMiEtk/WB9FwuCkgbsH384odOwqaCBVC5e3Eu
	WabD1UaRT1bkTd7zY8xQOV84YAJ9krQBrYu83SjhL1xOB+nYgx58tgE0zJYqL8tWpWo4
	dB8g==
X-Gm-Message-State: AIkVDXKU6kTY1xeLD7jJg9hAFZXCK9CEoQ33yKTyIP037N12QPKcAVB+ov2mT0nJc80bLKTxO4ooyo7n/Cdc97io
X-Received: by 10.237.62.232 with SMTP id o37mr7603042qtf.188.1484837581601;
	Thu, 19 Jan 2017 06:53:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 06:52:40 -0800 (PST)
In-Reply-To: <1482459368-72764-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1482459368-72764-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 14:52:40 +0000
Message-ID: <CAJTo0LYfffDPNuW4rqGLvSrfJ07FJgKftnzoLzm0LktMRNbO-w@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] elfutils 0.166->0.167
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
X-List-Received-Date: Thu, 19 Jan 2017 14:53:02 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e99d00f054673b027

--001a11406f0e99d00f054673b027
Content-Type: text/plain; charset=UTF-8

On 23 December 2016 at 02:16, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 2) Delete 5 patches below, since they are integrated upstream.
>     elfutils-0.166/0001-elf_getarsym-Silence-Werror-maybe-
> uninitialized-fals.patch
>     elfutils-0.166/0001-remove-the-unneed-checking.patch
>     elfutils-0.166/aarch64_uio.patch
>     elfutils-0.166/fixheadercheck.patch
>     elfutils-0.166/shadow.patch
>

Picking on a random patch, fixheadercheck.patch.  The patch is just this:

-                if (unlikely (! powerof2 (shdr->sh_addralign))
-                    || unlikely ((shdr->sh_addralign ?: 1) < sh_align))
+                if (shdr->sh_size && (unlikely (! powerof2
(shdr->sh_addralign))
+                    || unlikely ((shdr->sh_addralign ?: 1) < sh_align)))

And upstream the code is:

                  if (unlikely (! powerof2 (shdr->sh_addralign))
                      || unlikely ((shdr->sh_addralign ?: 1) < sh_align))

Have there been other changes to mean this patch isn't needed any more? Or
should it not be deleted after all?

Ross

--001a11406f0e99d00f054673b027
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 December 2016 at 02:16, Zheng Ruoqin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fuji=
tsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3c7" cl=
ass=3D"gmail-a3s gmail-aXjCH gmail-m1592977ee394f9c4">2) Delete 5 patches b=
elow, since they are integrated upstream.<br>
=C2=A0 =C2=A0 <span class=3D"gmail-il">elfutils</span>-0.166/0001-elf_<wbr>=
getarsym-Silence-Werror-maybe-<wbr>uninitialized-fals.patch<br>
=C2=A0 =C2=A0 <span class=3D"gmail-il">elfutils</span>-0.166/0001-remove-<w=
br>the-unneed-checking.patch<br>
=C2=A0 =C2=A0 <span class=3D"gmail-il">elfutils</span>-0.166/aarch64_uio.<w=
br>patch<br>
=C2=A0 =C2=A0 <span class=3D"gmail-il">elfutils</span>-0.166/fixheadercheck=
.<wbr>patch<br>
=C2=A0 =C2=A0 <span class=3D"gmail-il">elfutils</span>-0.166/shadow.patch</=
div></blockquote></div><br>Picking on a random patch, fixheadercheck.patch.=
=C2=A0 The patch is just this:</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (unlikely (! powerof2 (shdr-&gt;sh_addralign))<br></div><div clas=
s=3D"gmail_extra"><div class=3D"gmail_extra">- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| unlikely ((shdr-&gt;sh_addralig=
n ?: 1) &lt; sh_align))</div><div class=3D"gmail_extra">+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (shdr-&gt;sh_size &amp;&amp; (unli=
kely (! powerof2 (shdr-&gt;sh_addralign))</div><div class=3D"gmail_extra">+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| un=
likely ((shdr-&gt;sh_addralign ?: 1) &lt; sh_align)))</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">And upstream the code is:</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (unlikely (! powerof2 (shdr-&gt;sh_addralign))</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 || unlikely ((shdr-&gt;sh_addralign ?: 1) &lt; sh_alig=
n))</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ha=
ve there been other changes to mean this patch isn&#39;t needed any more? O=
r should it not be deleted after all?</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div></div></div>

--001a11406f0e99d00f054673b027--
