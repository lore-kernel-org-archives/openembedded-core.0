Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id D45E272332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 13:44:03 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id n3so2211724wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 05:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0WAOrvvDMqL/ibIlDYZZoGCI7vICDA+BEP9k/9pTmGE=;
	b=DT549jpJ2xYoWeY4+mQmF/nvY8BPjJ+8BVwV55NqRauK5efZo/fhTALm8Rv88gJdhZ
	flJ7Nx8HhSjuX/9epPKVLSl0YGqWsM3jHXI+J/OA7kPU6Tc8rPtMOd0mFVkZU96KowEE
	pSLe2tlMYwrbpjBiyiqXOUQDUESHL7WRRN8WPf8ArgNm/041kea1xuIWVbD68jCR2b40
	gC3g6hgYQWEUfuuCzU1iw5zswxM0d3RY2iH3rIxMSb1u+CYMJAbNwWpcY4LSbhnURfeI
	iGcKL7Qva99CPHNBbb1ZtzwQHDoFRFggwpWhpYHbxY/ogyXE2l0lcoSjp0nqLN2GctYP
	McxQ==
X-Gm-Message-State: ALoCoQmJrlzl2976MknGE5gfyZLkLlcBRAT0Md3d6qtLslZ1v1WoDAdev1b2o8XmzF53Oy0coTPe
X-Received: by 10.180.85.35 with SMTP id e3mr6410548wiz.14.1421415843232; Fri,
	16 Jan 2015 05:44:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.107.132 with HTTP; Fri, 16 Jan 2015 05:43:42 -0800 (PST)
X-Originating-IP: [109.100.140.128]
In-Reply-To: <1421415523-29824-1-git-send-email-andrei.gherzan@windriver.com>
References: <1421415523-29824-1-git-send-email-andrei.gherzan@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 16 Jan 2015 14:43:42 +0100
Message-ID: <CAK18fxF0+4OvqPFq36yyaH7LFbi9P0sNHxr1xNdqd=sJdjzyQg@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Cc: holger@windriver.com
Subject: Re: [PATCH 1/1] systemd: Don't create /var/tmp, log directories
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
X-List-Received-Date: Fri, 16 Jan 2015 13:44:13 -0000
Content-Type: multipart/alternative; boundary=f46d041824f66a1a1f050cc52a63

--f46d041824f66a1a1f050cc52a63
Content-Type: text/plain; charset=UTF-8

Hi guys,

On Fri, Jan 16, 2015 at 2:38 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> /var/tmp and /var/log are symlinks created by base-files and point to their
> respective directories in /var/volatile.
> With this patch we avoid systemd-tmpfiles runtime errors like:
> systemd-tmpfiles[108]: chmod(/var/tmp) failed: No such file or directory
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>

Could you please cherry-pick this into the dizzy branch too? Thanks.

ag

--f46d041824f66a1a1f050cc52a63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi guys,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Fri, Jan 16, 2015 at 2:38 PM, A=
ndrei Gherzan <span dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro" ta=
rget=3D"_blank">andrei@gherzan.ro</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"=
>/var/tmp and /var/log are symlinks created by base-files and point to thei=
r<br>
respective directories in /var/volatile.<br>
With this patch we avoid systemd-tmpfiles runtime errors like:<br>
systemd-tmpfiles[108]: chmod(/var/tmp) failed: No such file or directory<br=
>
<br>
Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@windrive=
r.com">andrei.gherzan@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Could you please cherry-pick this into the dizzy branch too? Thanks.</=
div><div><br></div><div>ag=C2=A0</div></div>
</div></div>

--f46d041824f66a1a1f050cc52a63--
