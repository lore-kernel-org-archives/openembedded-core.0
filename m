Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 59A0378411
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:17:21 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id d137so5363413itc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r6+2jRRZcZ0CGKc3hvVOKTkoBmVxkbpgWIrBi9/YaxE=;
	b=u+JyGFT/Z1Z48KLXLtnmOchsG6TthGAmsaVdPFUGwJfv7zYRzfGcUtkKzG/irhEAOX
	wHB4aoHr9LgDqWCQ8Fd5Z6hl+TRPX251CC9hWe84IQaOMMduO+zTeRrdUlEI6JSbmkCh
	cURMlXV7buQpws15tNKRuTnpsfTgpMIdXq/grJlnQiK72rhv3dtWkMFL0o84fCkanzn9
	/OEA9VkPycIJYC233TQ2ofPP1O/p3VXmisCYzZFUEzqQSlhM20AL0oGDgXe/cF9dSQk/
	1AsEVtm5TDq2+JtTuQN6ZHRxTElJrHmCGmp2/kJWTDTbzcaaM87iMVRqdZzFjmGpFzec
	g3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r6+2jRRZcZ0CGKc3hvVOKTkoBmVxkbpgWIrBi9/YaxE=;
	b=RCIp7xGbCYUwHVOdeyVHj/RnhSCEAiQwNKP53mUFmtHanneXBkYZGzRl+hb1vaU+pd
	06Rk6GTaX1tvpMXobrPgUGskxVUwg/IiTWri2l2OsLktzCQA5oVesMopDQYfKuJsqEya
	mmPCPL3vV2pK2GUCEbO6gaa9l8zoJYPKatLwFOO2KZSbSFiSokuLVCXq096aj29c53Ad
	v1wiQUZ1nEKjEzDrXn5W1dncI43TCctok+TPmhVHI8Zd2Uyv00jfDeC7t2B/HgdcwsG0
	O7Mw6IDDfKbKbsOdUZwHM/F1tZ5C3xM7Vmw8puvgpVsvkHDZFO04fnA08EJ6m5EfsXBk
	A7xg==
X-Gm-Message-State: AKGB3mI+r5K2Ue6vbP8rTp4XyhIfIBF2bl6eLk+6v/5L3VW0ZIXO52yk
	vr7FBQ6fdwhZPMHssTd6b75MAV+TfrWVkMK6EATRfg==
X-Google-Smtp-Source: AGs4zMbWT0gjYzspKb1DJsbkMLj7SiCgO/TDHMpLACgpKKiZt5wWKRDzGGlJs1DJki4CcwBB0p8ezflz/IV54hNG3U8=
X-Received: by 10.36.162.65 with SMTP id o1mr12408389iti.85.1512382642736;
	Mon, 04 Dec 2017 02:17:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Mon, 4 Dec 2017 02:17:02 -0800 (PST)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA4D08@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1511932233-21738-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<b825822d-713c-d31a-e071-bf0733555040@linux.intel.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA4D08@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Dec 2017 10:17:02 +0000
Message-ID: <CAJTo0LYNCDPA89HsgcoZqjoqF2OBuKDGGXA8pDgC9jGsgtwQ8g@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libyui
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
X-List-Received-Date: Mon, 04 Dec 2017 10:17:21 -0000
Content-Type: multipart/alternative; boundary="f403045fbd842f6477055f8106aa"

--f403045fbd842f6477055f8106aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Again, it sounds like this should be in another layer.

Ross

On 4 December 2017 at 02:01, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Hi Alex:
>    I attend to make dnfdragora(which is a gui for dnf) used in oe-core,
> and libyui is the depend of dnfdragora.
>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: Wednesday, November 29, 2017 2:48 PM
> To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu.c=
om>;
> openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] libyui
>
> On 11/29/2017 07:10 AM, zhengrq wrote:
> > Add a new recipe libyui.
>
>
> Add why? What does it do? Why should it be in oe-core?
>
> Alex
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045fbd842f6477055f8106aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Again, it sounds like this should be in another layer.<div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 4 December 2017 at 02:01, Zheng, Ruoqin <span dir=3D"lt=
r">&lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhe=
ngrq.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Hi Alex:<br>
=C2=A0 =C2=A0I attend to make dnfdragora(which is a gui for dnf) used in oe=
-core, and libyui is the depend of dnfdragora.<br>
<br>
------------------------------<wbr>--------------------<br>
Zheng Ruoqin<br>
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)<br>
ADDR.: No.6 Wenzhu Road, Software Avenue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Nanjing, 210012, China<br>
MAIL : <a href=3D"mailto:zhengrq.fnst@cn.fujistu.com">zhengrq.fnst@cn.fujis=
tu.com</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
-----Original Message-----<br>
From: Alexander Kanavin [mailto:<a href=3D"mailto:alexander.kanavin@linux.i=
ntel.com">alexander.kanavin@<wbr>linux.intel.com</a>]<br>
Sent: Wednesday, November 29, 2017 2:48 PM<br>
To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 &lt;<a href=3D"mailto:zhengr=
q.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt;; <a href=3D"mail=
to:openembedded-core@lists.openembedded.org">openembedded-core@lists.<wbr>o=
penembedded.org</a><br>
Subject: Re: [OE-core] [PATCH] libyui<br>
<br>
On 11/29/2017 07:10 AM, zhengrq wrote:<br>
&gt; Add a new recipe libyui.<br>
<br>
<br>
Add why? What does it do? Why should it be in oe-core?<br>
<br>
Alex<br>
<br>
<br>
<br>
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

--f403045fbd842f6477055f8106aa--
