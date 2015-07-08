Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id D2E4075D3C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 11:20:47 +0000 (UTC)
Received: by qkei195 with SMTP id i195so160119782qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 04:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=C+9lOGv7CG3sGp53o48vB9BUnhXtlmcVRT/QS/H6lBk=;
	b=dHIO+TeA6wY+Hza+L1PMNzrb+BGXPEokyCiZC4RXNLJo1/SkyLMJAzGpI8viDyZmYT
	hJsPeQAoHpBaBeTS8cK4GqhySBrmZD5jjPQHGCaHaQniCofedujVq7KdO7wgKtyeDgZS
	MVWuvksgVhRVdKzumyC+bvqgny9vCrCdsxySz63h9yBtHXFOxu0s6SdH9OyW2li9/ocM
	uNcqrQPdEtROb9oe3jExnYsBLgUd7S5mKhhfIcmnjmZmqgTZLhqX8QuB146WEe6IoSF9
	70DmKR/vVaXFZ9NqRWu4nxMykcn+75zLo09b8wCh5R/2sC3qDtyOegtHLXbrZZaHib8s
	5tUA==
X-Gm-Message-State: ALoCoQnjqWNMnyoUTU3wUGvnFdVSK65EDe5fR6/TFGAwa8BCcg8F+h/CFXj9Gf5gmld0+kDYoi3e
X-Received: by 10.55.53.193 with SMTP id c184mr14437069qka.62.1436354447735;
	Wed, 08 Jul 2015 04:20:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 8 Jul 2015 04:20:28 -0700 (PDT)
In-Reply-To: <1436304174-24460-1-git-send-email-ashcharles@gmail.com>
References: <1436304174-24460-1-git-send-email-ashcharles@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jul 2015 12:20:28 +0100
Message-ID: <CAJTo0LZBZ8rWUZF3MfUkm9MkZdaZwhDo4c+2ay1Peb_A05iGGw@mail.gmail.com>
To: Ash Charles <ashcharles@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-io: Add runtime dependency on contextlib
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
X-List-Received-Date: Wed, 08 Jul 2015 11:20:51 -0000
Content-Type: multipart/alternative; boundary=001a11476f14a10fe4051a5b54e3

--001a11476f14a10fe4051a5b54e3
Content-Type: text/plain; charset=UTF-8

On 7 July 2015 at 22:22, Ash Charles <ashcharles@gmail.com> wrote:

> This applied to Python 2.7.9 but not 3.3.
>

Do you mean this isn't applicable to python 3.3 or you haven't checked with
3.3?

Ross

--001a11476f14a10fe4051a5b54e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2015 at 22:22, Ash Charles <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ashcharles@gmail.com" target=3D"_blank">ashcharles@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":3e0" class=3D"a3s" =
style=3D"overflow:hidden">This applied to Python 2.7.9 but not 3.3.<br></di=
v></blockquote></div><br>Do you mean this isn&#39;t applicable to python 3.=
3 or you haven&#39;t checked with 3.3?</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a11476f14a10fe4051a5b54e3--
