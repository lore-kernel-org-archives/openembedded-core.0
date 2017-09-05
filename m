Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7172677EFE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 09:55:47 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id j141so9392272ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=nOuKEr3UH21+VTy/HXi5jZwI/QtUoum7gsudlb0R1xw=;
	b=J4CNs/ucpTThp6nijnoJ7KXdCF+BgZ6hhkXBKtJ8VAqfIBcHvj8AIedrIivlZI9s1w
	oXOvRm47ilrmnk6+jc+TNzNrxENNBn9aFhMVj7rkvy3qg8kNHjPNaIPu4jo/rwpttWJ/
	Hnuf6SddRLL3gbB0X9TUAaRVFQz531v6DhyQGIR3ON0dxHuW6xS+wq2PRpolwVLKRMaO
	OCkU426SOLO96z+phiCT3qI8MircMEIl35KGag8bBQqr1oSQbLndB9cZ/x51zNe5F5UP
	sxpVG+c0oNSFaKuJ0YAGRwdtxMzFrXIxrX6aP+22hAYl8Mc4k4dcl321PiwiPEWYlV2X
	jHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=nOuKEr3UH21+VTy/HXi5jZwI/QtUoum7gsudlb0R1xw=;
	b=Nf6kN4gZGzPh2uLgz9FK7Dwz+tMSBXPdahR7kB3CFty00vTFJLSGB9KN4q5WKyBbo8
	ZRpgBDg/GVtVZLeG7R8a+ZH1jUESBfuNwpkCcgm5qplDe5oLMflaIFUHrFm3jc4lA8Wz
	Dt5AvyrTTdEal/Vn6ytdxg/cERg+I+YqqOgTRcC04r3mXYNBB3iEQxIbjIQT8eHt5u4e
	HXxccQ98IdQnLE4Zi3OlFxLxOUklP3dAlhc2ewQK6UYfiqq6gC/H5vLOQdQZBu6e/SDA
	f1lMiJGVsO/Knems8l8cDGTm7q7WOTi/lS0uaJm3C3g/ZocDcUzGuMsbvW3Wp+OTvVIn
	TW5w==
X-Gm-Message-State: AHPjjUgHzYSJS4lJ9DmZWNT6wBjeFhSZoc8MW3vixd6x6B7OFzW/HaIy
	dYfjkmCn01sFxvzpNcoDFgAxRJEuCpef
X-Google-Smtp-Source: ADKCNb61vJO9lMNKyJnjW3VCUPhd4YY1N4UB6zuzSPYeEBD66fsSQNruLTo5UuZX9wFERJQCKywWGI+DEuQYIL39TMI=
X-Received: by 10.36.108.137 with SMTP id w131mr3363132itb.42.1504605348744;
	Tue, 05 Sep 2017 02:55:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Tue, 5 Sep 2017 02:55:28 -0700 (PDT)
In-Reply-To: <CAM_RqkO1s_bEH+fmBgE6kEP4Q+pNqHFg30BqUOdPojceFOMCiQ@mail.gmail.com>
References: <1504597605-18076-1-git-send-email-ankit.tarot@gmail.com>
	<CAJTo0LbyFH-7a2Yq4TpBcYJ5o2D6t5s55qJqhk9s7b29RkAX8w@mail.gmail.com>
	<CAM_RqkO1s_bEH+fmBgE6kEP4Q+pNqHFg30BqUOdPojceFOMCiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Sep 2017 10:55:28 +0100
Message-ID: <CAJTo0LYSDC_mBz=7fM6XCpu+9hke0u2HrM3JQpiDf1sepQozgQ@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ell: upgrade SRCREV and move recipes to core
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
X-List-Received-Date: Tue, 05 Sep 2017 09:55:47 -0000
Content-Type: multipart/alternative; boundary="001a113f651e56f0be05586e3beb"

--001a113f651e56f0be05586e3beb
Content-Type: text/plain; charset="UTF-8"

[CC'ing the list]

On 5 September 2017 at 10:52, Ankit Navik <ankit.tarot@gmail.com> wrote:

> ok, I was not aware of release.
> This library, I use in our project called OMA-DM IMEI Sync.
> It should be fine, If we don't update as well. since initial recipes of
> ELL is already merged in oe-core.
>

Presumably you meant meta-oe, not oe-core.

Being used in a single other package that isn't part of core doesn't count
as sufficient justification for oe-core, so this can stay in meta-oe.

Ross

--001a113f651e56f0be05586e3beb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">[CC&#39;ing the list]<div><br></div><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote">On 5 September 2017 at 10:52, Ankit Navik <=
span dir=3D"ltr">&lt;<a href=3D"mailto:ankit.tarot@gmail.com" target=3D"_bl=
ank">ankit.tarot@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr"><div>ok, I was not aware of release.<br>This libra=
ry, I use in our project called OMA-DM IMEI Sync. =C2=A0<br>It should be fi=
ne, If we don&#39;t update as well. since initial recipes of ELL is already=
 merged in oe-core.</div></div></blockquote><div><br></div><div>Presumably =
you meant meta-oe, not oe-core.</div><div><br></div><div>Being used in a si=
ngle other package that isn&#39;t part of core doesn&#39;t count as suffici=
ent justification for oe-core, so this can stay in meta-oe.</div><div><br><=
/div><div>Ross</div></div></div></div>

--001a113f651e56f0be05586e3beb--
