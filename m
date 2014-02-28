Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBB96E8E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:44:55 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j107so1739054qga.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 03:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=F4TR2TViTtJNYKkIjKKthmbAYuRWskg14pvxSKQGtSE=;
	b=mXAgMcQ4T4yoIUXlLudATmH/KZg4LZNRkfmbXHwci4q3OjaRrrtPpcnWh54Rb1o93X
	HWlwRjIxiiBkqgLqOv7IQoR0/SxoBmHlGmTD3t4FxK8O+6s/Zpts2A6ohgyU/YC1G8qf
	BfHiBJko6rr3KbGmWosVgAZGWX2wEiAxYy5AimQw4eoBIplTbkbY1ACewhD5jG0nrbb/
	XoXmBKxR+HJTTBOtLM4hmZmOYswE1hLDUsU25FklvIVoBRZ//Q24ag1Ey1ULId0bNc/B
	1k3j6k/f+dj2p2w2c5cWeDuWgrcVmwGyUz/YFK5tRtdqfbZQGyLSJmCYOT2JFL+O2s2g
	saBw==
X-Gm-Message-State: ALoCoQm+lL+gBDHnynE7qcEcY7/lkoWIqkLDTqgie0vZZ3VaJ5t7KoUWAkL1NkVC61c+yrDk+rqh
X-Received: by 10.140.98.203 with SMTP id o69mr2654232qge.102.1393587896254;
	Fri, 28 Feb 2014 03:44:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Fri, 28 Feb 2014 03:44:36 -0800 (PST)
In-Reply-To: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
References: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Feb 2014 11:44:36 +0000
Message-ID: <CAJTo0LbhW_UfQkXXgNzf2H+xN4=ygaNQbih4=6mjY0Mp26OK0g@mail.gmail.com>
To: =?UTF-8?Q?David_Nystr=C3=B6m?= <david.c.nystrom@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: Add util-linux-libuuid to DEPENDS
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
X-List-Received-Date: Fri, 28 Feb 2014 11:45:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28 February 2014 11:33, David Nystr=C3=B6m <david.c.nystrom@gmail.com> w=
rote:
> -DEPENDS =3D "util-linux"
> +DEPENDS =3D "util-linux util-linux-libuuid"

That makes no sense: the value of DEPENDS is a list of recipes, and
util-linux is the recipe.

Ross

