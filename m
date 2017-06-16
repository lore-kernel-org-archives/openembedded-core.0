Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id C22E878355
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:26:51 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id u19so76347614qta.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MFfqs+5c05t0VdxLxA/qVnkzeJ1q9nb4BuZgA23JP/A=;
	b=Xzuj2ImGA66pjnw+xgtoFJWZCrGF+txoT7XPe2/wz2IgHfHRC0V2H9RJvhTyBkClzY
	yRGIoQyHs7ATzk2VZE3zF/4IxM0Gp8/DcwMz2gvu3KP7k82Kl2BU3ayM2Nbmlzo555jE
	/rXRfjF+07CHlQQe4HuoPqfURx6v38k85zz0GJvj72bqay7EnTZlwI2ZOC3034BXTgGC
	xFZ1Ny2m/w3QTvGZo2Rbu9agE7EUJUYweO8Q6WhzT2emz8pXqv7v2ywO+Dx/KQw0u+y8
	6q7hE/dZam2GF8BIwqZnH5U5qHOzNTgsaA9u/WZ9KFCh1bqYFezgCG56+aqxeYRNGPE9
	iVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MFfqs+5c05t0VdxLxA/qVnkzeJ1q9nb4BuZgA23JP/A=;
	b=pOzFjfjLmMDeqOJ0cSK5nMQwg/15In0DzZLSNHeMLn1bHqChVBDhPzMc7nFLKgPenZ
	Af6Ps4iwvtUwUwceDNtlbu4SyL/6eM20AaIeYW7iQWXAUL49gaL67HWRlJBw5u3vYIP2
	9gq+qkwZmzGNr2LztPeHOm+VDFfSwlbWpIQwAi2H2M9plQYNFBA+dZheb+UaVzzU9jpD
	tA/W7G2WCEVlidz0mQnW1eZ9JzOI3bjHtj7RBBz/PGm7RNgpaVmrVN529DWkC8arfRG+
	BPDVP/7OCTkH7RVdJkTUxWf4XaTG9hz62bEeyqE6G+++PgUUcjz/lQmJU5iAFQ3Q+k8h
	WFiQ==
X-Gm-Message-State: AKS2vOy4Jr0XzQMsPETPdIwAzAMT0lQzt9/CJMSAej4juoCQl8JghtPQ
	Dzo77x8wo4vsQYdwBIlxGao17gS3Yfsn
X-Received: by 10.237.40.97 with SMTP id r88mr15593702qtd.27.1497641213307;
	Fri, 16 Jun 2017 12:26:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 16 Jun 2017 12:26:32 -0700 (PDT)
In-Reply-To: <00bb214ae7913ff1b6b95285c2945acb868012dd.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
	<00bb214ae7913ff1b6b95285c2945acb868012dd.1497615866.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Jun 2017 20:26:32 +0100
Message-ID: <CAJTo0LanhF0x4yvucSpffYdGB2CbKN9mQH_ppTbX+rts=P_m9Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 27/32] btrfs-tools: upgrade to 4.11
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
X-List-Received-Date: Fri, 16 Jun 2017 19:26:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b3485416c055218c4c3"

--94eb2c068b3485416c055218c4c3
Content-Type: text/plain; charset="UTF-8"

On 16 June 2017 at 13:28, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> From: Upgrade Helper <auh@auh.yoctoproject.org>
>

This and two others need to be re-authored by you (git commit --amend
--reset-author during a rebase will do it).

Ross

--94eb2c068b3485416c055218c4c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2017 at 13:28, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":6lv" class=3D"a3s aXjCH m15cb0e3b5910bc99">From: Upgrade He=
lper &lt;<a href=3D"mailto:auh@auh.yoctoproject.org">auh@auh.yoctoproject.o=
rg</a>&gt;<br></div></blockquote></div><br>This and two others need to be r=
e-authored by you (git commit --amend --reset-author during a rebase will d=
o it).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--94eb2c068b3485416c055218c4c3--
