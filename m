Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42D0E7FD82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:24:33 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so1951495wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=T8TXCsZPGy+cP3dSS6vW8LfArUoh/NxdmIkeLHiSs0Q=;
	b=bY7cLKZqZXSvCGcqG5j4wRr6xVyYYmGEutH6AEAzaEvFeeqjTWPwVuRf4hNGDKscd1
	VpxK94lcL1uA9ljvcylI55Bo5cXXHF2XtMisiVZYySF25mPAQFA8BOWaAlTvFzSDG3D7
	0X3oPsIZFx11qJJpyp0lO4lb+0Qd306fmFLZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=T8TXCsZPGy+cP3dSS6vW8LfArUoh/NxdmIkeLHiSs0Q=;
	b=ROiF99vGh7Q/uMdKTRyIjVghC9CyyJRmVtCjHIGDMPfUdcqZpVNTJX8301JHBnTKpk
	wWnjd3AW12eLz9R8uViCNQG9ruZJlRc94MzizEn+eLkHAUhXPAtTEQIcED0H+7fIOrHZ
	mT89JpDjz2fSoCVFfB8vKTOm/TuhYP2Coo+VEETXJfccFZOd+xomH0CTT20JZZ6BQxKp
	NTRfe6WG5tVeg/kg72x59yrNebmdc/jjKNPcBQcZXVibqzTa5UnujF6hQp2G6X6um4vK
	BDi5NCT683+TdbBdAmag53nuLVOz7+aCNIwonr6W8IGbBvQGOG3rQuglvW66HGts5D43
	iVjg==
X-Gm-Message-State: APjAAAXU6ygA5yTrsWiTDoB/esKytHsvOmiApkvWp2NKaxKxmH4hHkVu
	td8ezB+LnVnNPKuOVNRUb4CmHjF9e7w=
X-Google-Smtp-Source: APXvYqzEFk7syfa8CCtCSlMEI1s22UFbO4gTRDvgzfR2b7maEKmuZuJPuYFSibQoMNhjZS0Vw4Qojw==
X-Received: by 2002:a7b:cbc8:: with SMTP id n8mr3065368wmi.35.1579595074050;
	Tue, 21 Jan 2020 00:24:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s8sm49944577wrt.57.2020.01.21.00.24.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 00:24:33 -0800 (PST)
Message-ID: <10e0708a02a233d7783396822faee4f7f445a76a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 08:24:32 +0000
In-Reply-To: <20200120172510.22648-24-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-24-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 24/24] meson: update 0.52.1 -> 0.53.0
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
X-List-Received-Date: Tue, 21 Jan 2020 08:24:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-20 at 18:25 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/meson.bbclass                       |  9 ++++++++-
>  meta/recipes-devtools/meson/meson.inc            |  4 ++--
>  .../0001-Make-CPU-family-warnings-fatal.patch    | 12 ++++++------
>  ...-do-not-manipulate-the-environment-when.patch | 16 ++++++++--------
>  ...-Support-building-allarch-recipes-again.patch |  6 +++---
>  .../meson/meson/0003-native_bindir.patch         | 16 ++++++++--------
>  .../meson/{meson_0.52.1.bb => meson_0.53.0.bb}   |  0
>  ...meson_0.52.1.bb => nativesdk-meson_0.53.0.bb} |  0
>  8 files changed, 35 insertions(+), 28 deletions(-)
>  rename meta/recipes-devtools/meson/{meson_0.52.1.bb => meson_0.53.0.bb} (100%)
>  rename meta/recipes-devtools/meson/{nativesdk-meson_0.52.1.bb => nativesdk-meson_0.53.0.bb} (100%)

This breaks something in the SDK which then fails testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1475

(but many other similar failures).

Cheers,

Richard


