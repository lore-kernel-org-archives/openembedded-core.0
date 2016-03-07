Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6592F73192
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 17:17:02 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id z8so44044210ige.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 09:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UHfNzckly3JZ5ZgU+CFJ5g67XxBCpAuHYArD+xdhwbw=;
	b=AmFfSVJNedUPRLg4IZKEM66iTn/Wxg2Gm1plG5kgZomypncbvI1zf910V+mBfLBgHl
	p152MRPNx285gepH8fNvCz19kjBpLIKH/J0+fse11EPEeA90N35jMXCyE3AHRyUbVUtZ
	69XQ8Cnk3DoXVjXUgNeWlOogKMWRagckNMwWx2hysiW4ncIZMKZapzhCs93h3pXVcnbf
	o7tWdehkf4FeR3T9ypE89UxddKbWcOhHmPm5KQJBGEFHmCvJCN6B9aBnuC04im0h5eGX
	T+yczpNct7sVO3t5BOPad3XuYRot0tiK3OnxiZk0CNj6+DKTkF4PbaF+aGgRf16I9XY3
	TakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UHfNzckly3JZ5ZgU+CFJ5g67XxBCpAuHYArD+xdhwbw=;
	b=Ad9kEfeZMce7VsntU8vTIY2m+rCGqMpQAQCKoYq0FiKb6t0VrF34wkAfIgLbso9VxW
	SLCwBIjYutkrKb+PI4nZ37Vlfg+ai3R0KXi4vc5r8S03Ye8D39PvPWYXkOFmbVCqtfNv
	A1zgqGRCtSPgQo0tp5m6UIlrnR5960a9re5cCm3gfvqGyR8Uempdl0XfQWlh9OhTDrv1
	Bdm9qjeCXMuuCUgJDIdk/i1whSII4LGHVo9rrTchA4RnYqqbWavmPCSHUOAObdn7A+jR
	Q5XF2qI/rqWBzyF7DUfU0DJt4x3N+DqL/Oh1w0oeXOFG1djIX12dbMPBozM3Ql1MIByD
	265Q==
X-Gm-Message-State: AD7BkJKmvwo1k+a3uIYGlu2cYNO9eRulgluvwKhXPWhfABQlntyr1n+oQCKE5g8VV/lz7E/5mg1ag1fwnMks8woH
X-Received: by 10.50.97.71 with SMTP id dy7mr13693742igb.78.1457371023736;
	Mon, 07 Mar 2016 09:17:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 09:16:44 -0800 (PST)
In-Reply-To: <CAD3vsf7djsRsAVnRQ7Q0Ztgsdxj2J6TO5FHis1QuSYWdRf6ubA@mail.gmail.com>
References: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LZwOpAaUSOVYyuoKQxjU3OkUsi=pTvY5NihHw_kQGJ1Qg@mail.gmail.com>
	<CAD3vsf7djsRsAVnRQ7Q0Ztgsdxj2J6TO5FHis1QuSYWdRf6ubA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 17:16:44 +0000
Message-ID: <CAJTo0LaH2jPp86=sh7mqiqcQLYmogdx2n4sppm6ma3XaPT8NKg@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v3] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Mon, 07 Mar 2016 17:17:03 -0000
Content-Type: multipart/alternative; boundary=047d7b10cfc12d1b5d052d78a2fd

--047d7b10cfc12d1b5d052d78a2fd
Content-Type: text/plain; charset=UTF-8

On 7 March 2016 at 16:45, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> I can send an updated patch for the master branch. For jethro, this patch
> can be applied successfully.
>

I've merged this into my staging branch for master, no need to send again.

Ross

--047d7b10cfc12d1b5d052d78a2fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 March 2016 at 16:45, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<=
a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanja=
nappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv>I can send an updated patch for the master branch. For jethro, this patc=
h can be applied successfully.</div><div></div></blockquote></div><br>I&#39=
;ve merged this into my staging branch for master, no need to send again.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--047d7b10cfc12d1b5d052d78a2fd--
