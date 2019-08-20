Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
	[209.85.221.179])
	by mail.openembedded.org (Postfix) with ESMTP id EF1D17EDDD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 19:19:18 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id b204so1613451vka.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 12:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i03ELGFILwhBEWlyfWli3aVGQZGTe2Dm6Gz3dbe8M9g=;
	b=eBaa3L3fXcmFDeiCM51Y+5VDWWjYglUBICjjcjB5qaR/ncRn2MY3cOs3n4QPx4BV8O
	POK0Rm0dErn7yEXmK3B9QloqXO1FyjJn5jhdWPtUfyN5JWi1AIjOk/QNTYuBR+ROpcHE
	TY7sL+zcEGsnqyrROkyD2mptTftrW7VXTHPxPtIQmaEty/Mk2KRhwAOm9+auInG7f9Db
	nsllsER/Ecl2Vrw3sjbESpm/G9CZjzLFOGwc+lExFHiflrnv/YU55eonQknNDPCCfiWL
	4oXzxCg6OFp2C00N5soqVH9yyZTTzbPa5TXuQrsm/KWvmIvCSk0l9vMdJRM3aS/IKnCq
	SAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i03ELGFILwhBEWlyfWli3aVGQZGTe2Dm6Gz3dbe8M9g=;
	b=NAjwhALMcE1FwVUBubLZxDOA8J9ZZSUac354gRYKoIyO3w2tfw1l9qVTIAaIyt82I9
	crWlyL9SVG/fPJewnhn/k4AqBWo/Vr/uHTO5C9suVIlAqa9MXb8CM+02iXP8/70Nj1+r
	G3ulA88vtcE6MdKHdNbhvITrQBEqzzSNqZZpn2QkXsn11mSt8jdsLHzRCu/rmGT+lOpc
	sVQTbPWkQOZ1sQms9dOe8h+cis5m9zX1kg0lCBt8baZzix44XApOQDlgBzUAz8+PzyUM
	/c0xhll8bok4cxzJgOqdycjoM68nSDNHQUzIvVGK/fABP03tLiI4IXZXrZIaWYZCK2W5
	5X2Q==
X-Gm-Message-State: APjAAAVRMUNaTRA0MMwfSC/YrHjrDxwjJTa3E9hOEI6AKCYDpMzdBi7T
	fV1r+zTsJ8tdp/96DKfSDuimMHO3sC3PZ9RbSc82A+3B
X-Google-Smtp-Source: APXvYqy35O/hfIpTkKZlrqVKlg2ZUA83B7lSAuz+YD+XW1z22fMyoH8geMUIQtYpuESIv5Fkc3YOHcLKQXOeKNU3KOg=
X-Received: by 2002:a1f:1288:: with SMTP id 130mr655796vks.12.1566328759789;
	Tue, 20 Aug 2019 12:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190820090559.196193-1-kai.kang@windriver.com>
	<20190820090559.196193-2-kai.kang@windriver.com>
	<e37dbfa4-eea3-ba19-da18-337cb7ec8ec3@intel.com>
In-Reply-To: <e37dbfa4-eea3-ba19-da18-337cb7ec8ec3@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Aug 2019 21:19:08 +0200
Message-ID: <CANNYZj9sQJgBvh0q66R2Ah0d9uXVO45a+5Z68nZ_yygX1-v88A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] adwaita-icon-theme: workaround for do_populate_sysroot failure
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
X-List-Received-Date: Tue, 20 Aug 2019 19:19:19 -0000
Content-Type: multipart/alternative; boundary="0000000000005433a3059091558c"

--0000000000005433a3059091558c
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Aug 2019 at 20:42, Ross Burton <ross.burton@intel.com> wrote:

> > It fails to run task do_populate_sysroot of adwaita-icon-theme rarely:
> >
> > | DEBUG: Executing shell function sysroot_stage_all
> > | cpio: ./icons/Adwaita/16x16/legacy/_inst.21134_: Cannot stat: No such
> >    file or directory
> >
> > In script ${S}/install-sh, temporary files _inst.* are created and will
> be
> > removed by shell builtin command trap when the script exits:
> >
> >      # Make a couple of temp file names in the proper directory.
> >      dsttmp=${dstdirslash}_inst.$$_
> >      rmtmp=${dstdirslash}_rm.$$_
> >
> >      # Trap to clean up those temp files at exit.
> >      trap 'ret=$?; rm -f "$dsttmp" "$rmtmp" && exit $ret' 0
> >
> > The temporary files should be deleted already after task do_install. But
> > somehow they are still exist until the gap between commands find and
> > cpio in populate_sysroot function sysroot_stage_dir().
>
> So does this only happen to adwaita-icon-theme?  Is it a bug in
> install-sh, so impacts almost every automake-using package?  Or is it a
> bug in how adwaita-icon-theme is using install-sh?
>

This might actually be caused by my glorious hack:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch?h=master-next

There is a 'wait' after every '&', so not sure what goes wrong here.

Alex

--0000000000005433a3059091558c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Tue, 20 Aug 2019 at 2=
0:42, Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@=
intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1e=
x">&gt; It fails to run task do_populate_sysroot of adwaita-icon-theme rare=
ly:<br>
&gt; <br>
&gt; | DEBUG: Executing shell function sysroot_stage_all<br>
&gt; | cpio: ./icons/Adwaita/16x16/legacy/_inst.21134_: Cannot stat: No suc=
h<br>
&gt;=C2=A0 =C2=A0 file or directory<br>
&gt; <br>
&gt; In script ${S}/install-sh, temporary files _inst.* are created and wil=
l be<br>
&gt; removed by shell builtin command trap when the script exits:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Make a couple of temp file names in the proper d=
irectory.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dsttmp=3D${dstdirslash}_inst.$$_<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rmtmp=3D${dstdirslash}_rm.$$_<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Trap to clean up those temp files at exit.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 trap &#39;ret=3D$?; rm -f &quot;$dsttmp&quot; &quo=
t;$rmtmp&quot; &amp;&amp; exit $ret&#39; 0<br>
&gt; <br>
&gt; The temporary files should be deleted already after task do_install. B=
ut<br>
&gt; somehow they are still exist until the gap between commands find and<b=
r>
&gt; cpio in populate_sysroot function sysroot_stage_dir().<br>
<br>
So does this only happen to adwaita-icon-theme?=C2=A0 Is it a bug in <br>
install-sh, so impacts almost every automake-using package?=C2=A0 Or is it =
a <br>
bug in how adwaita-icon-theme is using install-sh?<br></blockquote><div><br=
></div><div>This might actually be caused by my glorious hack:</div><div><a=
 href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-=
gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs=
.patch?h=3Dmaster-next">https://git.yoctoproject.org/cgit/cgit.cgi/poky/tre=
e/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-command=
s-as-shell-jobs.patch?h=3Dmaster-next</a></div><div><br></div><div>There is=
 a &#39;wait&#39; after every &#39;&amp;&#39;, so not sure what goes wrong =
here.</div><div><br></div><div>Alex=C2=A0</div></div></div></div>

--0000000000005433a3059091558c--
