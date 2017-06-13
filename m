Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 53C46782CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 20:13:47 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id w1so187441497qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 13:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MwJzwaUJHCgkVoddf5uFeXP4Pi4UrZ5zZAW+U/XmApE=;
	b=q41pDJxWc0eXZgW3SyffYryaPsPvDDlmQxAZhmgJWKCihievikw5OkTdTxhAvYvHSk
	QL6e8JCMA1PDHllH23aua+hZtX3kOo/1foMw2mJ53dXQfEyXhPGFR1O89HngM4osyLBX
	xvJacn89P9STIyWgaILoN37H9q/LwOZTxK8R69VFvrotcvbRhw3ICUbM2yhPhZBAHsK+
	7P6zs+ocjsPuNU+SNselq3vdnOdBTV2+faJbRIKei2X6dGnEMOjdEW0FTaO6AaKX9FnB
	hFadyY9XcBN1kRIp3uHEMvzhVywWXIYIgxyxqKaAYZv20KEn12r3C8aZ/yqB1FCUwun9
	KW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MwJzwaUJHCgkVoddf5uFeXP4Pi4UrZ5zZAW+U/XmApE=;
	b=pur8Ei/oxYnbRIMMNgsaJbT7MtYZ5e6WqolGLDk+5YKz44VOKcaqJhQsuPQaT3ffom
	RS8UID8yu/UorJqQ0idSfK7gdzO6j+1I1juWIqms9rIdUtBodVXaToCtNoPyugr21HQQ
	v5fCLJcdWl8ah40DjW4Sl/Z6w4jg6NC6j0+6NSW0ibeloNRWaIYSgXsZVFfZb8A89Jyz
	m4t24gncIEouDyZ5bYEhdqSkOfAAiIeKzeOV7MXuroO/JqcvponGnrhafE/E230Al53L
	kyipX2+3W7GIxFk654NXo6tcvJnE1xb2W6sWrvbT1xeSgu3ZT80TN5o4dmyCnP2CJPEE
	8RGQ==
X-Gm-Message-State: AKS2vOy3sBlY9bhK+0CPuu+hlVhbamFJvVrSRhEwYwpdvnbQ7W57KkDo
	5f3yFn6yFPo1+qViciHcLr6fRYdHqqzS
X-Received: by 10.55.102.214 with SMTP id a205mr2283711qkc.154.1497384828901; 
	Tue, 13 Jun 2017 13:13:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 13 Jun 2017 13:13:28 -0700 (PDT)
In-Reply-To: <4368246.Ra2jL4npuG@yow-masselst-lx1>
References: <1497377291-489-1-git-send-email-mark.asselstine@windriver.com>
	<4368246.Ra2jL4npuG@yow-masselst-lx1>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jun 2017 21:13:28 +0100
Message-ID: <CAJTo0LZM24U_5KuSFbkXUrQnvEh0DWNsogUrPCHtoyHS1U_gVw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: Fix build failure when image includes man-pages pkg
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
X-List-Received-Date: Tue, 13 Jun 2017 20:13:48 -0000
Content-Type: multipart/alternative; boundary="94eb2c0580a8d1b2710551dd129c"

--94eb2c0580a8d1b2710551dd129c
Content-Type: text/plain; charset="UTF-8"

On 13 June 2017 at 19:46, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> Yet the 'Upstream-status' is marked in the same way for both patches. So I
> am
> ingnoring this unless someone is able to see the issue which I can not.
>

The test is picky:

+Upstream-status: Backport

The correct string (as machines are stupid) is Upstream-Status.

Ross

--94eb2c0580a8d1b2710551dd129c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2017 at 19:46, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"=
mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:36g"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m15ca2c7bcb1c229a">Yet the &#39;Upstr=
eam-status&#39; is marked in the same way for both patches. So I am<br>
ingnoring this unless someone is able to see the issue which I can not.<br>=
</div></blockquote></div><br>The test is picky:</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra"><span style=3D"font-size:12.80000=
0190734863px">+Upstream-status: Backport</span><br style=3D"font-size:12.80=
0000190734863px"></div><div class=3D"gmail_extra"><span style=3D"font-size:=
12.800000190734863px"><br></span></div><div class=3D"gmail_extra"><span sty=
le=3D"font-size:12.800000190734863px">The correct string (as machines are s=
tupid) is Upstream-Status.</span></div><div class=3D"gmail_extra"><span sty=
le=3D"font-size:12.800000190734863px"><br></span></div><div class=3D"gmail_=
extra"><span style=3D"font-size:12.800000190734863px">Ross</span></div></di=
v>

--94eb2c0580a8d1b2710551dd129c--
