Return-Path: <lpapp@archlinux.us>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2D59061F47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:55:30 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id f4so6039091iea.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ootfCDn7sHoKMn1qSEE0ZVncEqycSY2rn+I9SPNdoGY=;
	b=VYFOygHNMt1Mhho0gDeISjvvysiazhRDdgqOqqK/Te0wk1DgDeu7yvQygqvlnR9k/U
	ISp4HVacRS2hW+sm3yXMy5Z4O9Y3M8c/Nb92sb2EPwFbniycG6aaOYSG7XyAiFvQL0+U
	YcwTpK9JxeXrtQe8dEzKs90/uYNtvrj+/7qtp7HySeiBcRnRXXd384GpySLCAhZ+aJkk
	TneTS9l+XEQQjzdU2MGH36EHrKOtDiaY6AA4M1QNWML8uaIcjokhPe583T1WlFN+eWNs
	fCsh75GaEcpzER07wxv1dIXQwgT94oIMKvAPy2GeayvtU7NgT+NPsNJkoEjwk7jE4+Ap
	+OHA==
X-Gm-Message-State: ALoCoQkD6HjhFD8OrcJ1hfshnlCvHvhLXSZL9j0yUsBxb3/yUPy+IIP9Gjz4m/0ZEYwvAmI0tiyF
MIME-Version: 1.0
X-Received: by 10.42.87.73 with SMTP id x9mr8605052icl.8.1377554131017; Mon,
	26 Aug 2013 14:55:31 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.43.88.197 with HTTP; Mon, 26 Aug 2013 14:55:30 -0700 (PDT)
In-Reply-To: <521BCD34.8090003@pabigot.com>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<CAOMwXhNWFicCJ1C4-Cd+9shAhTGuXkFu+885R8NfMurEZ+6rCQ@mail.gmail.com>
	<521B9698.7030803@linux.intel.com> <521BCD34.8090003@pabigot.com>
Date: Mon, 26 Aug 2013 22:55:30 +0100
X-Google-Sender-Auth: tH95ItfNVT35lVSJmVAfkCr5vJs
Message-ID: <CAOMwXhOzFuuxmDdpgJ5Dn1exZrNB-NccoK5vA3URXwCiG8UU4A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Mon, 26 Aug 2013 21:55:31 -0000
Content-Type: multipart/alternative; boundary=90e6ba613dd6a37a5504e4e0d065

--90e6ba613dd6a37a5504e4e0d065
Content-Type: text/plain; charset=ISO-8859-1

This email contains some nuances, so I will try to reply to the main points
(IMO).

On Mon, Aug 26, 2013 at 10:48 PM, Peter A. Bigot <pab@pabigot.com> wrote:

> Is there reason to create a parallel UBOOT_VERSION?
>

Yes. fw-utils is not available with this u-boot version just yet. Also, I
have not tested all the reference BSPs.


> Is there a better approach than bbappend-in-layer that I should use for
> adding patches required for a specific u-boot machine?
>

That is hard to answer without details. fw-utils could be some help layer,
maybe. Other than that, what do you mean? Something like config fragments
(see busybox)?

Cheers,
Laszlo

--90e6ba613dd6a37a5504e4e0d065
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This email contains some nuances, so I will try to reply t=
o the main points (IMO).<br><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Mon, Aug 26, 2013 at 10:48 PM, Peter A. Bigot <span dir=3D"lt=
r">&lt;<a href=3D"mailto:pab@pabigot.com" target=3D"_blank">pab@pabigot.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Is there reason to create a parallel UBOOT_V=
ERSION?<br></blockquote><div><br></div><div>Yes. fw-utils is not available =
with this u-boot version just yet. Also, I have not tested all the referenc=
e BSPs.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Is there a better approach tha=
n bbappend-in-layer that I should use for adding patches required for a spe=
cific u-boot machine?<br>
</blockquote><div><br></div><div>That is hard to answer without details. fw=
-utils could be some help layer, maybe. Other than that, what do you mean? =
Something like config fragments (see busybox)?</div><div><br></div><div>
Cheers,</div><div>Laszlo</div></div></div></div>

--90e6ba613dd6a37a5504e4e0d065--
