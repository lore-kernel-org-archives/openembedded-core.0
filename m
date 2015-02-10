Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD3E601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 15:59:01 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id f12so8450194qad.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 07:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qPM20RSGmBGSl9KUQZDUNkiXYv2TuxOEWiuPhA6Ru5o=;
	b=V/Zhx8plz4LnImnRF3FAer9rgJ8D1D8TmCkt5MWZL/Ui41tbXkXFSRVoywUITuBuaR
	jYc2EybXhSqFrJOW8xioqhYoNoo2wXSTDIri+mH1Zz/eYc1v/Zuars/cqcUv/C8uh/gJ
	GWotRatRDtpG0SsYu8xielJFXfaF9hG/zakhhkR6IijgT7gGKcPcnsYtdsSRWYMjpWRO
	t9EqXeMu95v14qkqAtErN49n5Er4r2jYmg0ArQF115YUSeqsAhuKDdkPJk35LFfExpXv
	SI0965m79C5CVifgfCvIU9iOpOGl+IcxNhJ7UdV8gtiXtuWs7RUw9Hf8PWy1WCpSsp/n
	2zww==
X-Gm-Message-State: ALoCoQnPFGNy9i8O6JrJf2dl7EMcjcUPUA6iml28Tt6qOkY7eDnROh4jLa5G0syXy+jAEk10PLXS
X-Received: by 10.224.16.207 with SMTP id p15mr21976956qaa.22.1423583942253;
	Tue, 10 Feb 2015 07:59:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 07:58:42 -0800 (PST)
In-Reply-To: <54DA2A79.3020002@linux.intel.com>
References: <cover.1423583089.git.anibal.limon@linux.intel.com>
	<a4615dc0eee370013a8948a093a730f3233d5888.1423583089.git.anibal.limon@linux.intel.com>
	<CAJTo0LbzAFYpQ6jD4djPCdMzAMRxCZhQ2rBTTLuGeft9uPDHzQ@mail.gmail.com>
	<54DA2A79.3020002@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 15:58:42 +0000
Message-ID: <CAJTo0LZmMbNb+5hwbG-WYWEcd_LQF_0FxBLmr3hYYSMN6GFqgw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xserver-xorg: Update to 1.16.3
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
X-List-Received-Date: Tue, 10 Feb 2015 15:59:07 -0000
Content-Type: multipart/alternative; boundary=047d7bf166202fa8a1050ebdf7e1

--047d7bf166202fa8a1050ebdf7e1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 February 2015 at 15:57, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.in=
tel.com>
wrote:

> When you enable systemd-logind xserver automatically links to dbus causin=
g
> a QA issue that is the reason of
> add this dependency.
>
> systemd uses dbus for all the communications with applications.
>

That explains the third option (additional build dependency of "dbus") but
not the fourth (additional runtime dependency of dbus-lib).

Ross

--047d7bf166202fa8a1050ebdf7e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2015 at 15:57, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;=
<a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.li=
mon@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":1ud" class=3D"a3s" style=3D"overflow:hidden">When you enable s=
ystemd-logind xserver automatically links to dbus causing a QA issue that i=
s the reason of<br>
add this dependency.<br>
<br>
systemd uses dbus for all the communications with applications.</div></bloc=
kquote></div><br>That explains the third option (additional build dependenc=
y of &quot;dbus&quot;) but not the fourth (additional runtime dependency of=
 dbus-lib).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--047d7bf166202fa8a1050ebdf7e1--
