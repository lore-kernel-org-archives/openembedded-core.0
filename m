Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 063E06093D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:59:13 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id w14so459821itc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qBrld9PL2ystYF8TFlRPImdxEq5oIsOFfheSLIlxE9M=;
	b=ODKfhq+haK8uC0EJdHbJ3FaazlYtZAg/rdcBaNRSRC+X7+WMAMk0+mwv/LtXkm6tYD
	CasDo2l1ZGwoOwavsDXsZLTaaqyMqugxlTkJuv1WPSF+1HnmK5ARK21gSsOY1gCgHAI4
	VnZTm1jdJUMBzXDiEF+77PO3u1dQkNOFsC/eyHZJoWE9YX7dB+B0TtbnpRErnA3VqEyL
	Q5eHPo7rKNNBAAtlWri7HR2QfQ6FBIcf5PA5P1HVxO5cIvql+Xrh6OXpujvSuZujWzcn
	sAsjIml6YqXL8l8cV0PaIokfAkKOLIA1T5/LBLpnJdFS0ojxtPKmLjBmXNfq3FV4iutB
	rmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qBrld9PL2ystYF8TFlRPImdxEq5oIsOFfheSLIlxE9M=;
	b=lyrhb3atYtdWE5zezVUoUVyaV045vMBUj9wn+vLk8+BNLp0XDWPBtrDcwStn1pcKCw
	BMCbg+Ro3pwWZkjLwQ9qG36Kqh0VKESl66yUl0zrPG1Rfjh560KJkDrshJ95Qqvo4Zty
	UJzY1on/iHYeUQm5FmFBNsIuI1hOmQvxGZ0fdFrLVs9CHj7PT4trUMUVoVre0ZTWFOdk
	q1bHgZMs8asXQo4rM+hX30Ao4wykj4oUXdgz7S7enfGoSNaZnctB0Ff+AR7pCwhV8Wvv
	fjAbedHDVmhQKjFHa7T1E32K/0Bu07bUar/1/8l20t0D7SxAFSmWuNjj3jCPQZqBPk7i
	bOzA==
X-Gm-Message-State: AKwxytebLGmuWqzjnDI1trQaqwonIkCG4LoGs/cceEVrUuJg+1RWgUQp
	f/7lJ0u6GwgenKB/Jq3Mb5Ghj7cfk/UHpBvSq1agng==
X-Google-Smtp-Source: AH8x226BWOHuQoTAq8hemtZx7MNVFtpAdDyjgwJirqa1qJ4rIAbLrjN2Sml9KAwq9gyLURPCCt6r00aG/6QzppxFZXg=
X-Received: by 10.36.86.20 with SMTP id o20mr31782726itb.53.1517317155187;
	Tue, 30 Jan 2018 04:59:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Tue, 30 Jan 2018 04:58:54 -0800 (PST)
In-Reply-To: <cover.1517286478.git.raj.khem@gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jan 2018 12:58:54 +0000
Message-ID: <CAJTo0La+B4-LxA1_0QzBBssNO-wq50HMeuDPyU5S3iPXQAsyKg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/8] Update to binutils 2.30, glibc 2.27 initiated fixes, musl update
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
X-List-Received-Date: Tue, 30 Jan 2018 12:59:14 -0000
Content-Type: multipart/alternative; boundary="001a1144d5ea0bfa320563fdee10"

--001a1144d5ea0bfa320563fdee10
Content-Type: text/plain; charset="UTF-8"

On 30 January 2018 at 04:31, Khem Raj <raj.khem@gmail.com> wrote:

>
> - Add proper sign-offs and Upstream-Status as reported by patchtest
> - Backport another fix for pulseaudio memfd issue done upstream
>

v1 was merged after v2 was sent so I just split these fixes out and they
just got merged as follow-up patches.  Sorry but I managed to drop your
authorship.

Ross

--001a1144d5ea0bfa320563fdee10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 30 January 2018 at 04:31, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><br>
- Add proper sign-offs and Upstream-Status as reported by patchtest<br>
- Backport another fix for pulseaudio memfd issue done upstream<br></blockq=
uote><div><br></div><div>v1 was merged after v2 was sent so I just split th=
ese fixes out and they just got merged as follow-up patches.=C2=A0 Sorry bu=
t I managed to drop your authorship.=C2=A0</div><div><br></div><div>Ross</d=
iv></div></div></div>

--001a1144d5ea0bfa320563fdee10--
