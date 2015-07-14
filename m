Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6545765C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 11:14:47 +0000 (UTC)
Received: by qgep37 with SMTP id p37so2424224qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 04:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mx5O7lZqhgIQLnCLvN/0loPByNjh0mSOGFUAZ1fD0Ew=;
	b=kWbb/irbS4Ss7mgxuEC7mYYePi/MGHEVCsbAC54/Q1VH5EAqFMmffBEyp0KoLLa2T8
	D5GGcO7zkLGHYGmh1N14qqfUZwnf9lNS6EqaRBz7DG7kE9YfgPuUfAxppLClrkMJi9CG
	t7BM6MZr6DQ/Reqy6ZrAP+ypSa8sAn/pqj48lAUhnyRkSynwKXgCn0MhMeiC2X5a0AIo
	9EfG/ERHa7czuHs1TZ/neAoD4nro4GO9ft2Y4RqGw22gV2Jx3ljs3XA62MyK+9vpbZJa
	05reLeYjGhdne3dHt5KnXrTkfpr7EOwxFHf/NzXNDyubFWP6qc1DIvzzNgSKRcihCNY0
	ugVg==
X-Gm-Message-State: ALoCoQmMY05NFnj9lQZHk/C4AdJ2Q6x8JsBsCA0FtfmJhkKV7BAgtsfmrFEvvC6DyBtizuiOBtJu
X-Received: by 10.140.89.100 with SMTP id u91mr59810123qgd.15.1436872487862;
	Tue, 14 Jul 2015 04:14:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 14 Jul 2015 04:14:28 -0700 (PDT)
In-Reply-To: <1436765128-16695-1-git-send-email-wenzong.fan@windriver.com>
References: <1436765128-16695-1-git-send-email-wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Jul 2015 12:14:28 +0100
Message-ID: <CAJTo0Lb8L_NZVvJqaKB0VfWd2SdoL1p8rtfuOjof4J8yQ1kf9A@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1 v2] rpcbind: handle rpcbind options
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
X-List-Received-Date: Tue, 14 Jul 2015 11:14:51 -0000
Content-Type: multipart/alternative; boundary=001a11c1334e3a3f61051ad3f269

--001a11c1334e3a3f61051ad3f269
Content-Type: text/plain; charset=UTF-8

On 13 July 2015 at 06:25, <wenzong.fan@windriver.com> wrote:

> -EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
> +EnvironmentFile=@SYSCONFDIR@/rpcbind.conf
>

Did you intend to drop the - from the EnvironmentFile statement?  I'm
guessing not.

Ross

--001a11c1334e3a3f61051ad3f269
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2015 at 06:25,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzong.=
fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":27d" class=3D"a3s" =
style=3D"overflow:hidden">-EnvironmentFile=3D-@SYSCONFDIR@/rpcbind.conf<br>=
+EnvironmentFile=3D@SYSCONFDIR@/rpcbind.conf</div></blockquote></div><br>Di=
d you intend to drop the - from the EnvironmentFile statement?=C2=A0 I&#39;=
m guessing not.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a11c1334e3a3f61051ad3f269--
