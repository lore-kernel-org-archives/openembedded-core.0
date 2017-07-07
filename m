Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4C39077DE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 15:38:13 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id i2so30057292qta.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jul 2017 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qcMxyWN8P9XGa32IPHUfh7p0BL5kYenbx7riUOVcc1s=;
	b=SSuVaPL5ScDx7pGQaeXnZz37nEfCnF42epMJwiNL2pmjS/HczAVwKNM7r9+Qo2j0wk
	2P2kvLXpru6VzES3uUTiwiIOD2dN+S5e5Mz9FFCTZ34vkAm0Vrmx0nNiIOb5rHJRCnYx
	G8Wrkoa/zQdlOQyV+iSrHq1/ndh9FEvlZTfX5iuVbtla+UX8WuL1UfMX5SAnisPUtXHn
	CgKHEipz5AXSk0UNiFaeYZaWEjsFHCaUI4NRtKKUSfKlcA6NwzRx0h3xnzYC6vmG6Of+
	K0mn1bW0HjAzkATzuvaxykBPrFQ444xhE2Ba6Qdj93yy2YWgFw2Jd1EANFDk+lPNgfJb
	ZgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qcMxyWN8P9XGa32IPHUfh7p0BL5kYenbx7riUOVcc1s=;
	b=BUAGwYqtPgbv+AgeLjqR94k/UzW61XnSaI+feVuYiXQXUWJqvNheNo4rpYoFUhUwwA
	z39cCjxv/PTBOZJ2PabFHx5qlN4ipd59Lx9UrZ6drcFZAnkIbq/mL5UwpkuN6NATj9+T
	TbMGm2nRCsD1VvDsn5e+m2N1tzXR53DC2cUY+gukUDRsnPhdpZATEUja7NGwdDTdKxeH
	2Oy7NzQekZz+89fkYK1XE3jtxWdztXPcOK1pC8tCrew2Gofmpp+D0vJWC5F71vqgCxHa
	hc/uiV2V+FzxzlVtxKf709Hz7am8rdnUXC032ogmrGDNbbPGfeuDn8EvSDuVRvXFnWN2
	Tjmg==
X-Gm-Message-State: AIVw113ivOZWIxOv3QrUYNq/sghykaGddhhV8YVudG7/Te01xSdAPfEI
	6cvTth+iy/gbQUVzzEKPOYTT+WcUh6DC
X-Received: by 10.200.45.241 with SMTP id q46mr19660822qta.177.1499441894948; 
	Fri, 07 Jul 2017 08:38:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Fri, 7 Jul 2017 08:37:54 -0700 (PDT)
In-Reply-To: <cover.1499294682.git.wei.tee.ng@intel.com>
References: <cover.1499294682.git.wei.tee.ng@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Jul 2017 16:37:54 +0100
Message-ID: <CAJTo0Lb3TBAp3vXMxz9ovH2xnT7hOd-77HuJVr5jZUDfNB19SQ@mail.gmail.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][master] [PATCH v3 0/2] initramfs-framework: configuration to boot up live image
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
X-List-Received-Date: Fri, 07 Jul 2017 15:38:14 -0000
Content-Type: multipart/alternative; boundary="001a1137558c8297860553bc0598"

--001a1137558c8297860553bc0598
Content-Type: text/plain; charset="UTF-8"

On 6 July 2017 at 19:28, <wei.tee.ng@intel.com> wrote:

> Ng, Wei Tee (2):
>   initramfs-framework: setup-live: detect media and assign rootfs image
>   initramfs-framwork: module to support boot live image
>

Can you squash these into a single commit, as the addition of setup-live in
the first commit doesn't achieve anything on its own.

Ross

--001a1137558c8297860553bc0598
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 July 2017 at 19:28,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wei.tee.n=
g@intel.com" target=3D"_blank">wei.tee.ng@intel.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div id=3D":1j7" class=3D"a3s aXjCH m15d1a=
b4005a2ea5d">Ng, <span class=3D"il">Wei</span> Tee (2):<br>
=C2=A0 initramfs-framework: setup-live: detect media and assign rootfs imag=
e<br>
=C2=A0 initramfs-framwork: module to support boot live image<br></div></blo=
ckquote></div><br>Can you squash these into a single commit, as the additio=
n of setup-live in the first commit doesn&#39;t achieve anything on its own=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a1137558c8297860553bc0598--
