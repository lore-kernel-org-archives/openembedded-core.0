Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 65239758BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 20:16:38 +0000 (UTC)
Received: by qcnj1 with SMTP id j1so10201082qcn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 13:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YGAzWC4QWPZPz4uOI/WwKXrpu0kCS4dk+B24loSfJ/8=;
	b=C1Nz4VLPsvsV836hmj361HvinTuNiaU3Yf4/xvEaUXFMrdwuRly2Z5zzkQ4LLYc7eC
	K6YABdiHBADTmdFFXjDybScM/+OOKvZpY2NBgpGXeC3e3XzWaTQqsAz4KuDO6DHklRdn
	Uv651HukWKVmVkCXG1TiV0GUcw3DLwn+sq8Pbt2C19ZcDEqQjcNKfIoXyaHcfxM5j7eL
	9BRMsTBgm1FIe+AybP7IvVc9tDgfxlgE2KKF3O4erkc9UDRL2yNEvA3ZGJJfWTxDo8uY
	K0hzaxTPBbeNjxhO5o8ETYaoO6LMoNHuHA0rd0bUEtdPg+rWc2mjcd0I1sICjYcC/WGn
	d1qQ==
X-Gm-Message-State: ALoCoQljfvh5uKNI2YYDT1/nx5Gpv3rOnfbG9DsQ5zwQV2B0yxINyHcWXI5JJoqx/61U5bljG8ra
X-Received: by 10.55.43.130 with SMTP id r2mr47100017qkr.14.1433880999250;
	Tue, 09 Jun 2015 13:16:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 13:16:18 -0700 (PDT)
In-Reply-To: <1433878226-21350-1-git-send-email-akuster808@gmail.com>
References: <1433878226-21350-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 21:16:18 +0100
Message-ID: <CAJTo0LbixBMU_CFPAegnVpnmFmTq_VpQK6SMnLsyBfUsMq3VwA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] gnutls update to 3.4.1
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
X-List-Received-Date: Tue, 09 Jun 2015 20:16:39 -0000
Content-Type: multipart/alternative; boundary=001a1147afb09c629705181b6fc6

--001a1147afb09c629705181b6fc6
Content-Type: text/plain; charset=UTF-8

On 9 June 2015 at 20:30, Armin Kuster <akuster808@gmail.com> wrote:

> re-sending as I think I may have done it incorrectly before. did not see
> it in patch queue.
>

You sent fine it but it results in neon not linking correctly (silently,
unless you apply a patch I sent earlier).  Can you have a look?

Ross

--001a1147afb09c629705181b6fc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2015 at 20:30, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2fs" class=3D"a3s"=
 style=3D"overflow:hidden">re-sending as I think I may have done it incorre=
ctly before. did not see it in patch queue.<br></div></blockquote></div><br=
>You sent fine it but it results in neon not linking correctly (silently, u=
nless you apply a patch I sent earlier).=C2=A0 Can you have a look?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a1147afb09c629705181b6fc6--
