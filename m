Return-Path: <kergoth@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id B130E6070C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 21:48:49 +0000 (UTC)
Received: by qczu9 with SMTP id u9so20527688qcz.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 14:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=f4a5RjiVg+aBwCrwzZbE6DwS5ZJu8PU1i87UbApHsE8=;
	b=wNiiFOjNZctsjzpUoL4vfqdq1IT7gsycPULldTuTDw8FIaAj4xsmSXCqQYCRBBP+Wo
	brmf8mKj/fZVVuCaFdIlC07RhfVYOaQwXBl7cgy9S1xK3GCxd170CBqsQoI0j5gL+Wy+
	T/mOpLGUmTLKRCWr/la5XUaNcNSc8e/PPUlbSrv4/nST5KtVNeeeqHSDGgvUpJgF7OYL
	e5sIwUiRslUhwuGA6ufQou2q4i5D8QKM9+aVXJ5s+xwofxTcTwDMdhofyPMawFq9VCU9
	C9KTp2aJwoaUY0I05iDw+dxFVNPirs7DoVbiyfJ6W3jHQb+q0C4/ChHW3zZcWsgOp9NN
	oKvQ==
X-Received: by 10.140.43.199 with SMTP id e65mr21709840qga.80.1435614529908;
	Mon, 29 Jun 2015 14:48:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.73 with HTTP; Mon, 29 Jun 2015 14:48:30 -0700 (PDT)
In-Reply-To: <1435605033-11509-5-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
	<1435605033-11509-5-git-send-email-ed.bartosh@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 29 Jun 2015 14:48:30 -0700
X-Google-Sender-Auth: gN9lu7ZeoUn0oFdv5VVtmPof548
Message-ID: <CABcZANk_vhTvj+rAyo+T8CbUpPd2SGxGk6m3Mt8WwB-M0LGq0Q@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH 04/20] wic: Refactor getting bitbake variables
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
X-List-Received-Date: Mon, 29 Jun 2015 21:48:52 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa16f8990519af0ea2

--001a113a9baa16f8990519af0ea2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 12:10 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> +    global _BITBAKE_VARS
> +
> +    if image not in _BITBAKE_VARS:
>

In general, I=E2=80=99d suggest using a cache class/object rather than glob=
als,
similar to how it=E2=80=99s handled in bb.checksum, or a transparent LRU. W=
henever
a cache is involved, it=E2=80=99s best to consider what its lifetime is.
Admittedly, wic isn=E2=80=99t long-running, but best not to get into bad ha=
bits.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113a9baa16f8990519af0ea2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Mon, Jun 29, 2015 at 12:10 P=
M, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto:ed.bartosh@linux.inte=
l.com" target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;</span> wrote:<b=
r><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5b"=
 class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 global _BITBAKE_VAR=
S<br>
+<br>
+=C2=A0 =C2=A0 if image not in _BITBAKE_VARS:</div></blockquote></div><br>I=
n general, I=E2=80=99d suggest using a cache class/object rather than globa=
ls, similar to how it=E2=80=99s handled in bb.checksum, or a transparent LR=
U. Whenever a cache is involved, it=E2=80=99s best to consider what its lif=
etime is. Admittedly, wic isn=E2=80=99t long-running, but best not to get i=
nto bad habits.<br>-- <br><div class=3D"gmail_signature">Christopher Larson=
<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaur=
us<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113a9baa16f8990519af0ea2--
