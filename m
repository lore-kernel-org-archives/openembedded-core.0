Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id E96F9719D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 09:17:45 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n204so157987906qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 01:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cK4NoLdrGThXUye02rZQEFUnWvMN1LQuI9GNsqVZImk=;
	b=kC5BTgJz6NKLhw34V2li9SrmiPlUVLt5OPNXEYY4Jxutmd3KseuSnhive1HBBism5q
	oxYR+EssBPGIFt1ThazaRLMqBn31EZUK+iw7faKPHO35VeV5q2LvasUJup1Bd5Gx5Z4l
	OgZ/bJwwpB47YFw4+SDDNnpJbYFABBdmEjwSyJVsRJ1ocXkkutf4sseCw8ZMM66hxSwC
	m2HghlTRVmqCObcMuypOQ99UOGB+CINdzfwwHTbPY9xu9DGOQvwGAR/xwDwZrVP3NfA5
	zVR50aETEaP8L290DkRvzC+ArLIFvaZJGW2M4hyyDgK5uhW2mL/nLjONNYNCnBBE+8YU
	OeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cK4NoLdrGThXUye02rZQEFUnWvMN1LQuI9GNsqVZImk=;
	b=HEP/njZ3V3r2XpUzVuKuvQGqU24UNQpWH9kEuiKyEh0iCZyOe5ypHohYyCcCXM7EJ+
	ulg81An1szcW0Zb26ymMnSHuQQ0zlrqjDz0//VweHCYNER4sc4+Kb6X+vvcAhoRJo1wt
	sQKCTYpmkvFxcAEeLDe3VHoHhLaBH8dAUprEwl885K3xQbdnDy6RjfqDkddNLiglG6Yo
	StPxBAGEziM/C04RkTOelYIa+LINzXrktQdaUv3kPzTMy98WiclKvu6NRZ99LyTaLCXI
	PbWzkWuI9cPiOMmoW0r1GUJb8WmqQim+5da13hr4fuAV78+O+W9TsrsaWytCdfq/u4J+
	LPfQ==
X-Gm-Message-State: ABUngvdzhW6K69RLQlT7u7KFrTkdhaa0LoDRack/993HmHwB2MBd/7AhEQP8snb5a8Aiv9MU7KEhdd4lSATnJ+Bw
X-Received: by 10.55.8.20 with SMTP id 20mr6129268qki.3.1478510266616; Mon, 07
	Nov 2016 01:17:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 01:17:26 -0800 (PST)
In-Reply-To: <20161107085544.2205.30867@do.openembedded.org>
References: <cover.1478505779.git.liezhi.yang@windriver.com>
	<20161107085544.2205.30867@do.openembedded.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 09:17:26 +0000
Message-ID: <CAJTo0LZtqJWMP-mhjLrrSi=_fr5grqzxQX38BPDBv0dOL9uZ-w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	daniela.plascencia@linux.intel.com
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHBvcHVsYXRlX3Nka19leHQuYmJjbGFzczogY2hlY2sgdW5mc2QgYmVmb3JlIGNyZWF0ZSBpdA==?=
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
X-List-Received-Date: Mon, 07 Nov 2016 09:17:46 -0000
Content-Type: multipart/alternative; boundary=001a114c9d603d28b20540b27fb0

--001a114c9d603d28b20540b27fb0
Content-Type: text/plain; charset=UTF-8

On 7 November 2016 at 08:55, Patchwork <patchwork@patchwork.openembedded.org
> wrote:

> Test Name        test_signed_off_by_presence
> Proposed Fix     Sign off the patch
> Commit shortlog  populate_sdk_ext.bbclass: check unfsd before create it
>

The patch has a s-o-b, so this is a false positive.  Is this checking the
cover letter instead of the patch?

Ross

--001a114c9d603d28b20540b27fb0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2016 at 08:55, Patchwork <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:patchwork@patchwork.openembedded.org" target=3D"_blank">patchwork@patch=
work.<wbr>openembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D"m_-4032362437076946965:3n0" class=3D"m_-4032362437076946=
965a3s m_-4032362437076946965aXjCH m_-4032362437076946965m1583e004a5efea8a"=
>Test Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_signed_off_by_presence<br>
Proposed Fix=C2=A0 =C2=A0 =C2=A0Sign off the patch<br>
Commit shortlog=C2=A0 populate_sdk_ext.bbclass: check unfsd before create i=
t<br></div></blockquote></div><br>The patch has a s-o-b, so this is a false=
 positive.=C2=A0 Is this checking the cover letter instead of the patch?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a114c9d603d28b20540b27fb0--
