Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC3C606E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 13:08:22 +0000 (UTC)
Received: by qgfa63 with SMTP id a63so3290294qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 06:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1Xi6bOr38KGOv2PzTAPKmhP0C7d7apxSrzI2U6i11x0=;
	b=TpbPx68CCbbxIpPwEDKsoDTuJuX1Ri0I4FRuFtavVtzBfW6lhEPLAWXPrPNWXf3gtz
	uvsntSJ/sfeKD5EOaOSwI7EbRRHWd/dzsEOAraq0qWYOib615b14Y5YC9GR+zv0f/G/Y
	u3zPDQE3BrpQDfWtW5vQGDxraT+7AglSFQOLFuF0aKMg9+kKyGs7tHiEFUX6Iu/uCuK3
	8eIl5ANrNkZr5xGLdyHwrdLZZhRC/e+rEjmgJWhfNKSBFquAH2ivuHJ7tvv1nHDu7J1u
	OEBIV2yCkFjvIGaSXztOJidM4CuyDf4hV9KUow9ysbQTBUDhpuhIlDIZ/Fl9Jx57XIAv
	JwZg==
X-Gm-Message-State: ALoCoQkNAKnrP6iVa86IGA3JbtAgSTa5FGQ3z+i1feL6tIGC8/7mjXUq+ixE4m/o8pbokXNz/A/n
X-Received: by 10.55.43.130 with SMTP id r2mr40466691qkr.14.1433336902881;
	Wed, 03 Jun 2015 06:08:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 3 Jun 2015 06:08:02 -0700 (PDT)
In-Reply-To: <CAJTo0LbafkiQvTu8ancvk3OE8Ai6pFUyeNtPC4HNGara5qDoyQ@mail.gmail.com>
References: <CADQ2m_xJEa1uw8PoVdCn6A8Xt_MPO3R9nhLMn-EHopc0P0+5mw@mail.gmail.com>
	<CAJTo0LbafkiQvTu8ancvk3OE8Ai6pFUyeNtPC4HNGara5qDoyQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jun 2015 14:08:02 +0100
Message-ID: <CAJTo0La-EL3Yd807gK5b_yCUcHrsfJhriLHqxUViESP7qtSndw@mail.gmail.com>
To: Krishnakumar Kulkarni <kulakarni.krishnakumar@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: EGL version error while building the weston.
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
X-List-Received-Date: Wed, 03 Jun 2015 13:08:24 -0000
Content-Type: multipart/alternative; boundary=001a1147afb0f0aa9305179cc0a6

--001a1147afb0f0aa9305179cc0a6
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 14:05, Burton, Ross <ross.burton@intel.com> wrote:

> *| Requested 'egl >= 7.10' but version of egl is 1*
>>
>
> Your EGL packages don't follow the Mesa versioning, so can't be considered
> a drop-in replacement.  This is a problem with your BSP so you should
> contact Toradex.


In particular this file:

http://git.toradex.com/cgit/meta-toradex.git/tree/recipes/trdx-nv-binaries/files/egl.pc

You could just try changing that 1 to 7.10 and seeing if it works... but at
this point you're hoping that the nVidia drivers they ship are compatible
enough with Mesa to actually work with Weston.

Ross

--001a1147afb0f0aa9305179cc0a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 14:05, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><span class=3D""><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid=
;padding-left:1ex"><div><b>| Requested &#39;egl &gt;=3D 7.10&#39; but versi=
on of egl is 1</b></div></blockquote></div><br></span>Your EGL packages don=
&#39;t follow the Mesa versioning, so can&#39;t be considered a drop-in rep=
lacement.=C2=A0 This is a problem with your BSP so you should contact Torad=
ex.</blockquote></div><br>In particular this file:</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra"><a href=3D"http://git.toradex.=
com/cgit/meta-toradex.git/tree/recipes/trdx-nv-binaries/files/egl.pc">http:=
//git.toradex.com/cgit/meta-toradex.git/tree/recipes/trdx-nv-binaries/files=
/egl.pc</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">You could just try changing that 1 to 7.10 and seeing if it works=
... but at this point you&#39;re hoping that the nVidia drivers they ship a=
re compatible enough with Mesa to actually work with Weston.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147afb0f0aa9305179cc0a6--
