Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 97F8371AB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 16:15:16 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id n21so53741113qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 08:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PqQtlXnK2c/wgioopj/dro6y2fTSZPltgdE5vJVM2G8=;
	b=MtUrYcHDF3RIa/Cenlo7f6rBo44Dvua2URwbRCu0BONJEOhYFrh4nBIpcgkH839cic
	DD1Vj06NFCgBhrro8EcxHrGxhdDml4xaxPPGS+9QkqWLdAxb7oGNt8pFbYy9e8uMSSFI
	W6SEWpxQPNPHw3e2wfb54AyR0xMyRDemcSqo3ogOrmdus+3DrA2Mhp4teFPR4tKwO4Lx
	66GzS97pZbChDzNSg65jj/awJbnYgFlIc9HDQmVqwhMh9AM1URuH1NQYaWmXpvH8ndzv
	sP+Sg+cIgPz6637NPzR0l7npJWzboaOFw4VQ0H8ZbnUQhdYPjTNKHDXvAknxIpQWTu5I
	eA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PqQtlXnK2c/wgioopj/dro6y2fTSZPltgdE5vJVM2G8=;
	b=RbEFgbl6WOym34zgHS3LBz7HfSlq5t1sDV1SxFONT0M7gkK1IiwzbMWdfYPKOqXpea
	dHVlbsWnk4LKUE3GrqzwkzNlE+VQtWHPRdCdPMNmEJ3XSX37HblKb5aORsCCCAnyL4m5
	R1QCfVy3ciYCYIRrWSfyGN2z6Q47SkaLduR+VRjDDJkdgD4hc/2MapEkqU4wVPQLyxo5
	jjtbG3IPrjvPOlPPom2Q1UUcIZAr5COOMYIPQo7KU/Sn4XTJS9U5xkY5nC0Hv+GdtSzG
	ejg13FnoKrkPgfiM8SXJFR5YmugSkDHPIeV3fGO2ZCz6fm7GdnLVBZQHD9k3urclwd/D
	EgtA==
X-Gm-Message-State: AKaTC03DehKcq9rYIUnLQpvuCLgdUzZh5qMS0RfXwKZbngGSskIsSB9ZPY0cPrpzbuWoUYBkELB/LeFAY3kfivyn
X-Received: by 10.55.5.145 with SMTP id 139mr2677901qkf.77.1480004117387; Thu,
	24 Nov 2016 08:15:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 24 Nov 2016 08:14:56 -0800 (PST)
In-Reply-To: <fa116937-6c95-06a5-c63d-345cedcb304b@balister.org>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
	<20161123174209.211349-2-mark.hatle@windriver.com>
	<20161123181039.GF3265@jama>
	<c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
	<20161123185617.GH3265@jama>
	<fa116937-6c95-06a5-c63d-345cedcb304b@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Nov 2016 16:14:56 +0000
Message-ID: <CAJTo0LaG=UxRdVxG9c1ywqWTfKSH26t3a-aHU1X4rV6_q1G2ng@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Thu, 24 Nov 2016 16:15:16 -0000
Content-Type: multipart/alternative; boundary=001a114c8f84aeeea305420e4fba

--001a114c8f84aeeea305420e4fba
Content-Type: text/plain; charset=UTF-8

On 24 November 2016 at 14:03, Philip Balister <philip@balister.org> wrote:

> It is useful for the larger community to see what vendors have to do.
> Possibly we could decide vendor specific patches code benefit the larer
> community. I'd much rather vendors over publish then under publish.
>

Yeah, exactly.

All I ask is that vendors, when sending patches they know are for
compliance and don't expect to be merged for whatever reason, mark the
patch appropriately.

Ross

--001a114c8f84aeeea305420e4fba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 November 2016 at 14:03, Philip Balister <span dir=3D"ltr">&lt;<a href=
=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":151" class=
=3D"a3s aXjCH m15896bdc24855c9a">It is useful for the larger community to s=
ee what vendors have to do.<br>
Possibly we could decide vendor specific patches code benefit the larer<br>
community. I&#39;d much rather vendors over publish then under publish.</di=
v></blockquote></div><br>Yeah, exactly.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">All I ask is that vendors, when sending p=
atches they know are for compliance and don&#39;t expect to be merged for w=
hatever reason, mark the patch appropriately.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c8f84aeeea305420e4fba--
