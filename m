Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 591DC60767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 20:50:59 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id k76so6835539ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Qx3ZGspjzYqH3er4Up3ytO9Ds9NJS28FDXfR6K6MiIo=;
	b=n1XWhOoZMYV6x8DeATaXoro/xpnvzFv33D1VGjP3G9Z2ymh8QMY6xy/pVAbi/4pMDg
	BCYUmmvh+h+dIdlpcCn+1y5jLPjdXY/lqAly+PhiEXUEEVyN2R1IlOnbRcpoKOuB90L/
	A6OL3ejDlOBmurNaGgxFHGKxpR3vsVUFViByzTg+7l9aV4P7YtZN4EKYw/0tg4bHu7dC
	hAyK0X6DGpCWwf3Nk/wfk2/uHicinY2dgRYRdKuzJMyop/DenRVUSWnxxT/AtcID3yOM
	NNEacRWVwfizvew3K3ADbCWq0CQnmbQV6NBg+G6dP7G10RL20ytYRNcpPhiFZWqwOfQw
	A2fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Qx3ZGspjzYqH3er4Up3ytO9Ds9NJS28FDXfR6K6MiIo=;
	b=yHpwYmvMp1Stm5BVFfmM6AfEJTFFPVMFOgL2Xho9qO/sEuCO0ze8EuZoxYffIbjcNt
	fF3OVrhby9FeJR3OVD7fApCTiuTVkM3rPgdiDGsbmBPIV1RVItf2WKqErUnBzqgMhJ0u
	gqVokt+Wn9OB0E/TnXnyEF4Cl9mXx4OdFTFJ+GV9bpja0HACbMTf/Lqp6Hpe9vsLiOeO
	Qjkm9wRaKGAN82JmDaqhzm9b7V71hn9Oe3p4Q7EJL5fEMKTSCXVE73q6nq0rPn4xswQK
	A79UicUG6ui79IZ9uh+ByXl7bYgdll3rxYkcsTudatx5EvWyt+QcAnnoJtY2c1YeGQiZ
	/6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Qx3ZGspjzYqH3er4Up3ytO9Ds9NJS28FDXfR6K6MiIo=;
	b=cHk5IlNw933K3WPskWXcuAJJe2rF+l/bJ3PDGFby0e8dRJMPGQqRmUOizd+8GB5+f7
	jmdYbHNilSdVa4FUB1/mlMPh9r1isnF46zLomnP4ssTha8z8hBAr4dnz4nnynSXZ7RmB
	LpwPaI1MwF1N1pdLU4uzSuU5lTa3Iw8iJRYpY8r6i4guviPxTPRra+IKO9EA62a02b3r
	rs+5GoHDB8BXfmu47/evxRiAeDbVC+iDWgK0RrFZLm+402/GUSJXPmBXHijmhR9/svF+
	6fUyK/B19altU+nPqntPm0wyoY50OgrL6JqXyvLKUUDUwFF6BpkE4IHrDXhD5xw27ra2
	dYFA==
X-Gm-Message-State: ALyK8tLholpWNK3SFhNDphqQdk9ZQV2CXcQtlZGZ12eKdyKP8Lrg6QYFoiAbXe/9CAa5rEq2qJPvNVb/0Y8BHQ==
X-Received: by 10.36.41.11 with SMTP id p11mr5831971itp.66.1464208404557; Wed,
	25 May 2016 13:33:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Wed, 25 May 2016 13:33:05 -0700 (PDT)
In-Reply-To: <cover.1464208170.git.chris_larson@mentor.com>
References: <cover.1464208170.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 25 May 2016 13:33:05 -0700
X-Google-Sender-Auth: M_2yAl9oBmeEh21mPS8u_5Jrzdg
Message-ID: <CABcZAN=9ESYdYiGxzEZdyTbQPn0mEPe=2kzB8ZtLnzG8q7PEmQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/3] Deploy startup.nsh for wic's bootimg-efi plugin
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
X-List-Received-Date: Wed, 25 May 2016 20:51:00 -0000
Content-Type: multipart/alternative; boundary=001a1143fd70d4e4ed0533b0953c

--001a1143fd70d4e4ed0533b0953c
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2016 at 1:31 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Currently, wic EFI images don't end up with startup.nsh, so the user has to
> type in the correct bits into the EFI command-line, which isn't very
> user-friendly. mkefidisk.sh in oe-core writes it for us, but we don't get
> it
> for wic images.
>
> Alter grub-efi.bbclass and gummiboot.bbclass to write it for the non-iso
> case,
> not only iso, so wic can grab and use it, and alter wic's bootimg-efi
> plugin to
> do so.


I tested this with success on the MinnowMax board, but that's the only EFI
device I have to test it on, so would appreciate testing from others on
this, if possible.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143fd70d4e4ed0533b0953c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, May 25, 2016 at 1:31 PM, Christopher Larson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">From: Christopher Larson &=
lt;<a href=3D"mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&g=
t;<br>
<br>
Currently, wic EFI images don&#39;t end up with startup.nsh, so the user ha=
s to<br>
type in the correct bits into the EFI command-line, which isn&#39;t very<br=
>
user-friendly. mkefidisk.sh in oe-core writes it for us, but we don&#39;t g=
et it<br>
for wic images.<br>
<br>
Alter grub-efi.bbclass and gummiboot.bbclass to write it for the non-iso ca=
se,<br>
not only iso, so wic can grab and use it, and alter wic&#39;s bootimg-efi p=
lugin to<br>
do so.</blockquote><div><br></div><div>I tested this with success on the Mi=
nnowMax board, but that&#39;s the only EFI device I have to test it on, so =
would appreciate testing from others on this, if possible.</div></div>-- <b=
r><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>ker=
goth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mai=
ntainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1143fd70d4e4ed0533b0953c--
