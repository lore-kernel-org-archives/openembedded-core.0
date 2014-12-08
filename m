Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC2F7226C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 11:24:55 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id c9so3262340qcz.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 03:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qbkjoqGAAz5UTt2dCivZRa0ObCejJRBYxwaLvjnpzN4=;
	b=LbRmXIfcbNl77L9zpg6PflEt4RD5G35KUdje4ftkRXYvFErweeuveFZ+9a2Gz4LzpG
	Zfi/ie3q+9ezIieaShWquRXJMHbHLh2tdohYlqglWs+bzPVcXpN52jOspEDXdOb4TeLq
	Ebas1XO1ib/p1g0Qi5i3GytQOEfzunIOVgoA8gFWo94Dgy7dgqKS5JWeeTS0vX/OwVhY
	ADrIMFw4FLKr4pk7EtWVBnXAh9cP+AxxQ7isyLGR43eMGnyEmkPT1HZlboCXiHo8Qbv5
	Xx5vtp/uJVLJW0bDa3UxF9bJ/WZR6atPc81MTl8ambkkcb3PKAFDjsEqKrWQlHCYGztG
	F4bw==
X-Gm-Message-State: ALoCoQl2oRMsrJLFf3kKmJ3UBRZuRpCp3YLMCmsoMpDeg/kkH3YMVJjUyNA6Z/lRucuTLXR51N/1
X-Received: by 10.140.96.101 with SMTP id j92mr49836481qge.87.1418037895631;
	Mon, 08 Dec 2014 03:24:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 8 Dec 2014 03:24:35 -0800 (PST)
In-Reply-To: <CABcZAN=y7exSY-8x=iXo_-g9nL5zzRL3yYSa+7NR0m11fwmGOA@mail.gmail.com>
References: <1417812364-14923-1-git-send-email-ross.burton@intel.com>
	<C1929A84-C95C-4584-B64F-D09C7F71D656@dominion.thruhere.net>
	<CABcZAN=y7exSY-8x=iXo_-g9nL5zzRL3yYSa+7NR0m11fwmGOA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Dec 2014 11:24:35 +0000
Message-ID: <CAJTo0La3X+mjz-6SJ+-g=n2eukQUM8KEuVQzxeHpYrpLHHjoGA@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dtc: don't use autotools as this doesn't use autotools
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
X-List-Received-Date: Mon, 08 Dec 2014 11:25:00 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8a0c462d0509b2ad21

--001a113a9d8a0c462d0509b2ad21
Content-Type: text/plain; charset=UTF-8

On 7 December 2014 at 01:38, Christopher Larson <clarson@kergoth.com> wrote:

> The problem with that is DESTDIR is an automake convention.
>

Yes, outside of automake there's just too much variety to make providing
defaults useful.

Ross

--001a113a9d8a0c462d0509b2ad21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 December 2014 at 01:38, Christopher Larson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_ex=
tra">The problem with that is DESTDIR is an automake convention.</div></blo=
ckquote><div><br></div><div>Yes, outside of automake there&#39;s just too m=
uch variety to make providing defaults useful.<br></div><div><br></div><div=
>Ross</div></div></div></div>

--001a113a9d8a0c462d0509b2ad21--
