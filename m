Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 265987564A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 10:29:17 +0000 (UTC)
Received: by qcej9 with SMTP id j9so14700566qce.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 03:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+whV0k4A4DeLQnAM3kghArjNBWRW79dRmuE6yPyr8dA=;
	b=hLbL7J0tRqU0PtTgKfDE80Fesm63qol3Mp8IBz/Iv330K2fDeF396Z7HL6NgX7J+/D
	FUTt1KxpoiRwXZfRvDog2Zbr7LXJxpvM4NPVpvWsuNOOuCG/mWYC3jky9gunp/URMqdq
	A4Z5zzHN2Qd8vP8BTqaQIBTr9RQHQQ+ddep0kK5Y5QRFbgbZSGT9Yam2ol6gKY5Lp4G9
	c7JhGk+v9UM/7JTu4+hXLou7FoNYLkWMV2SnkcA5POEAadTZiQA59lXd8k1J6k2Jk44O
	kws2MRgi3D7gPEvN+X0CaiRDhYrwAGgn8GLThcOk1Qg93UwVx801VK23Rh1nBcKHM7iU
	RsBg==
X-Gm-Message-State: ALoCoQnNcNtWmg6aqXbgWP5baypdpj+G3/QItYo+DTYOG52IQuPYBf3fEqPZH5xJPo0AV3lRUOBH
X-Received: by 10.140.235.19 with SMTP id g19mr28956602qhc.52.1433240958797;
	Tue, 02 Jun 2015 03:29:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 03:28:58 -0700 (PDT)
In-Reply-To: <1433143433-528-2-git-send-email-kai.kang@windriver.com>
References: <1433143433-528-1-git-send-email-kai.kang@windriver.com>
	<1433143433-528-2-git-send-email-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 11:28:58 +0100
Message-ID: <CAJTo0Lbj24HwbrH+YQpOgFbQi4q=jG52qv2Dse6bzVsvaWaX_A@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: remove hdajacksensetest for framebuffer build
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
X-List-Received-Date: Tue, 02 Jun 2015 10:29:21 -0000
Content-Type: multipart/alternative; boundary=001a11376dac3a22700517866acb

--001a11376dac3a22700517866acb
Content-Type: text/plain; charset=UTF-8

On 1 June 2015 at 08:23, Kai Kang <kai.kang@windriver.com> wrote:

> Sub-component hdajacksensetest in alsa-tools requires library glib, so
> remove it when do framebuffer build.
>

glib doesn't depend on X11, so just add glib-2.0 to DEPENDS instead.

Ross

--001a11376dac3a22700517866acb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 June 2015 at 08:23, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mailto:k=
ai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1fm" class=3D"a3s"=
 style=3D"overflow:hidden">Sub-component hdajacksensetest in alsa-tools req=
uires library glib, so<br>
remove it when do framebuffer build.<br></div></blockquote></div><br>glib d=
oesn&#39;t depend on X11, so just add glib-2.0 to DEPENDS instead.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11376dac3a22700517866acb--
