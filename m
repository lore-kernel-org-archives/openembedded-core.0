Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6015F7589F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:30:06 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so21128700qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vOUL6Wmm+24g4qvdLPiAz1V+6Er0oDVHptDVs1572WU=;
	b=Ql9NM8ZMTipXF0///SDLLPQ/nEbSfylhspxlNcgT+eZeeamc80yB59l56Wg/czdpkm
	4WFka2X0Nh74hDDhgNYC8iq+DdplKWrXW1hk0evauRG8gsyUetEc05pbs8cW2Yy18TY5
	VEvCe7SyUkPNcn8ZxU+ngVPdCMIUuzosltUEvfc/71ocsapIOVc5Rk8dRNLFvnXZIuP9
	WSI3FbWKA+iTRfHVlWZSn8K/f+Dwdj/edc0SGjdvIR3AuGUx+pSsXKAiYjHHxxzWsYHC
	oNV+wxBatkSg1zFCTRa0wAvqqmI0JQovm60TFxrGwBH3dkphb0SNXiTa6Z/B167F2EdQ
	rasQ==
X-Gm-Message-State: ALoCoQm9PkgOVO41t9EtaeL9VZGNtCf9IjoSuiDtm6EECcCqpNZ9+N/1gGu+GvEX6fCQNiA3fU5M
X-Received: by 10.140.43.199 with SMTP id e65mr36242392qga.80.1436567407065;
	Fri, 10 Jul 2015 15:30:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:29:47 -0700 (PDT)
In-Reply-To: <1436257069-1908-1-git-send-email-zhixiong.chi@windriver.com>
References: <1436257069-1908-1-git-send-email-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:29:47 +0100
Message-ID: <CAJTo0LaYRWRF5bNYOpN7QB-cHO2u6DbKuK7dH=Y2-EB6=Du=rw@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] db: add debug_lock option to show diagnostic info
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
X-List-Received-Date: Fri, 10 Jul 2015 22:30:11 -0000
Content-Type: multipart/alternative; boundary=001a113a9baafe9162051a8ce908

--001a113a9baafe9162051a8ce908
Content-Type: text/plain; charset=UTF-8

On 7 July 2015 at 09:17, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:

> +Index: db-6.0.30/dist/configure
>

Don't patch generated files as they'll change drastically over time and
make maintaining the patch impossible.

Also if the patch has been submitted upstream, including a link to the
submission (bug, list thread, etc) is helpful when doing upgrades in the
future.

Ross

--001a113a9baafe9162051a8ce908
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2015 at 09:17, Zhixiong Chi <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zhixiong.chi@windriver.com" target=3D"_blank">zhixiong.chi@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1fn" c=
lass=3D"a3s" style=3D"overflow:hidden">+Index: db-6.0.30/dist/configure<br>=
</div></blockquote></div><br>Don&#39;t patch generated files as they&#39;ll=
 change drastically over time and make maintaining the patch impossible.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also if =
the patch has been submitted upstream, including a link to the submission (=
bug, list thread, etc) is helpful when doing upgrades in the future.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113a9baafe9162051a8ce908--
