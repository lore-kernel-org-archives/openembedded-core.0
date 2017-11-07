Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 050F971C70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 20:33:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z3so6559440wme.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 12:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=68NBWoB6MIN2c/dS7/PJ+BvgZbqE6j4oZ6/nFcpZMxA=;
	b=ZrNOiI9hIsQkKceVL/9NwYkQLExsARAt7WFyQqS3v1pOR2VHVt+jciAvDuNAnZSFsg
	wKKnSA7uj3aXGlavGUE79TTD08dBStX5uu6YtHeJIdyLWlZdSfz+lWci++sjHc6q2rgN
	gXliyBWeeMj7ntbohO5oIOOV9ofMubWeMdKeMcbrslr6dxu8o+rSsNmj1Vkad0JBSWnR
	VPaA7quUFOR1oieFbERzE8T7IcpXxTQezPIMb1VoF4lLODopdSbPPeixf8aUAacVOe2d
	ZF6lNx6/xWUf2Jy06IQtiV91/zbim6IhkWaURPunC61QrB7VKnlqRfU6il+drhN1zU9z
	Ut7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=68NBWoB6MIN2c/dS7/PJ+BvgZbqE6j4oZ6/nFcpZMxA=;
	b=AYKFmu38B5MGpDYrMGC4kr+QKMp8m2kvZnz6VANisZpR8FjHKwQXZC5iEsHGVIheAo
	HMKPHwMLi+7Q4Ysldjuk/X6JavJmxcxxNsufryZVjCXKSySCAK7tXwJt33BHmjtxtiwT
	GpP+uR7iZYo2PVrSUHKHvTUVVi175t/bMvVUnyAzDjWqKxUzv2SPnDNEBsKm8iscOXui
	tEtecE8eDJFAdWQj+Yr1zKYx3lMWJB8x9uMlej58uk2LV11pLHEUKdBwPl2aYlx4YJv/
	bbrLtR4tiYb0zurDbMPgdjkhpXbiIyZkuxKDIaN7NPMb9BN6tjYWmGQHxZZXQ6VOfuGy
	nHwg==
X-Gm-Message-State: AJaThX6nJbHi7NzfC4cR8MxUq0jE/x+Sb3/mrcPQ3mDMGqV4hV7OOWM2
	1syvdBsmHfRblgY4/jDRClehY25c8L7T/OZtQwY=
X-Google-Smtp-Source: ABhQp+Tx9S7b34Y1b6XTEU/iXfCxZuxAmRXrcgIsnD2kQEM1EgplTjDNiT0HwAFc/1YbYLBa1X8KuJkyhcpa7WJhSxY=
X-Received: by 10.28.237.18 with SMTP id l18mr291504wmh.136.1510086824523;
	Tue, 07 Nov 2017 12:33:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Tue, 7 Nov 2017 12:33:44 -0800 (PST)
In-Reply-To: <1506996960-17686-1-git-send-email-armccurdy@gmail.com>
References: <1506996960-17686-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 7 Nov 2017 12:33:44 -0800
Message-ID: <CAJ86T=Wj17LjaAQZ2rfx9=4rXPFOxa6bBtJf7qJwYxGWmM8rZQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [morty][PATCH v2 0/2] coreutils: musl build fix for gplv2 coreutils recipe
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
X-List-Received-Date: Tue, 07 Nov 2017 20:33:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2017 at 7:15 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Two minor patches backported from meta-gplv2 for the gplv2 coreutils
> recipe in oe-core morty.

Ping. CCing Armin.

> v2: Add Signed-off-by's to both patches + reference upstream
> meta-gplv2 commits and add _6.9 suffix in both commit messages.
>
> Andr=C3=A9 Draszik (1):
>   coreutils_6.9: fix musl compilation
>
> Richard Purdie (1):
>   coreutils_6.9: Disable broken man pages
>
>  ...-need-charset.alias-when-building-for-mus.patch | 46 ++++++++++++++++=
++++++
>  .../coreutils/coreutils-6.9/no-man.patch           | 21 ++++++++++
>  meta/recipes-core/coreutils/coreutils_6.9.bb       |  2 +
>  3 files changed, 69 insertions(+)
>  create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/build-don-t=
-need-charset.alias-when-building-for-mus.patch
>  create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/no-man.patc=
h
>
> --
> 1.9.1
>

