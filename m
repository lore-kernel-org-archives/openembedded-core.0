Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 40C7A78145
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:09:18 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id c10so11290796qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UBn4Kt6LowNXxdaHtBcIn352tX4kuLnn1Cg6fDRZ4Hw=;
	b=r6nfm6MDK4MUhZYouh9U3sjEyxeSdl4qQw00dBkPuB0/nmI71pOEYrJXni5KYAodnp
	IzViEa/lq8KK5v8QTUUZyIuNDsT5/Mone2+hqLivSdPU6OKWzbbX3bAEn2HBDIH0GfUR
	3IkHEAtRp6pbxjF7j9guZEp+PUNrLdfqFDg+fGbnjTDYHuqTCxihcIdKU+RXKbnpa6bc
	MbOs/s7ainYBicYg9L9Poec072UP2hPmU+AZ3Y/RMqswMrzzi4ul1F2mtrQlc+IP4Hb8
	UuJSvPjfKh2HQvCz5FleuPXIu2W3wgCs2hCUym/bA98G6AqE1jXcuzuE/JmcAjzdsfVs
	cMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UBn4Kt6LowNXxdaHtBcIn352tX4kuLnn1Cg6fDRZ4Hw=;
	b=do3THpOM6qaQY4hPGTV/OM7OOAFjnZ1DMMWZ5ysFaSmOb5D6XsdQfPX1+BXW6yGUQt
	pB8sZEvA634bH/dMnNT/DPd+jNjwzd1W69E1BYDOXIdcsSCtichnytO4acfl4dGtm0c8
	ycGu1GBMmDnFkzkc9nTXdCW51uxVTEw0RlcugCZ3vKffiSIqDqHPYHZBUdOsulRDJncT
	GHROwQHWa3aFKleyWoiAf1t8Lmf9e09ZaoS4z/bXnwqbOijsoqVNZdR0Vokf4eOW5QiY
	V6a0P181dgM6IuY/fvsH3HZlZkh74nCc/cSjihANIVLalHc7FwTH3ChSrT2cCUHH72Cc
	01FA==
X-Gm-Message-State: AODbwcA8hoVZPn5Q5EJUp5YexMJIsds5R2Wh+Otlo1FEEI2Bux/9QkJI
	go7RCCDCCSxzuK/Xt0p4oyeOz5z5swII
X-Received: by 10.55.42.212 with SMTP id q81mr36290342qkq.228.1496851760010;
	Wed, 07 Jun 2017 09:09:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 7 Jun 2017 09:08:59 -0700 (PDT)
In-Reply-To: <8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jun 2017 17:08:59 +0100
Message-ID: <CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Wed, 07 Jun 2017 16:09:19 -0000
Content-Type: multipart/alternative; boundary="001a1147a9fc701a25055160f59b"

--001a1147a9fc701a25055160f59b
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 18:28, Martin Kelly <mkelly@xevo.com> wrote:

> I sent a separate patch for fixing the systemd issue, so I think we can
> merge the two patches separately (they're both needed):
>
> https://patchwork.openembedded.org/patch/140355/
>
> Neither of our patches have been merged yet.
>

Sorry, somehow slipped through the net.

This patch doesn't apply as it's been corrupted by the mailer.  Please use
git-send-email instead of copy/pasting (I've managed to apply it manually
as it's a simple patch this time).

Ross

--001a1147a9fc701a25055160f59b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 June 2017 at 18:28, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":4au" class=3D"a3s aXjCH m15c=
7e739055e354a">I sent a separate patch for fixing the systemd issue, so I t=
hink we can merge the two patches separately (they&#39;re both needed):<br>
<br>
<a href=3D"https://patchwork.openembedded.org/patch/140355/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.openembedded<wbr>.org/patch/140355=
/</a><br>
<br>
Neither of our patches have been merged yet.<br></div></blockquote><div><br=
></div><div>Sorry, somehow slipped through the net.</div><div><br></div><di=
v>This patch doesn&#39;t apply as it&#39;s been corrupted by the mailer.=C2=
=A0 Please use git-send-email instead of copy/pasting (I&#39;ve managed to =
apply it manually as it&#39;s a simple patch this time).</div><div><br></di=
v><div>Ross=C2=A0</div></div><br></div></div>

--001a1147a9fc701a25055160f59b--
