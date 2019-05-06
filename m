Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id 972BE6B436
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 11:13:36 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id f23so11048956otl.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 04:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BFqzGixJixVfzp6RK9m+C1WKgTRQsYw3bDTW76QnB48=;
	b=A3knYuZ7gjME8HpyxPBRevFnk5XPDtKUJJexh5bZMtnFvrcvPkeSLULkb+a0lYek0X
	sh6HBhQt2X0gkBtYhrq6q23MqOrgfJC7avzH527ElVUyZKSBedXZfr7aNw0XZq+tHnSt
	nDzabuUSdJ+NjqMNe59eZToyBX4cDSE5Ygf6Usaz0vrgJzD0MdI/VuyccNONU7z8SWwC
	oxU2qD30xQxzaJW4RhEU7GW2cvEB+e9KKLUx9F2m4RQR+9sVe1xeB6b2miOuOqBDONCr
	iS0EJnaDFyBK+apZqxtSjU/BSUSXP/dO17UImA1yvvivDRyEQZoS0WodTl2FQqQ97ASA
	12cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BFqzGixJixVfzp6RK9m+C1WKgTRQsYw3bDTW76QnB48=;
	b=L7qdGXOVcKLYvsJwT3nk8Q8ILc3Wi8838q48CU440c7xS7DzWSFF7j3563OBr2D3Er
	CoDzBjpd6/YMh+fV3Spw1zrjU3+4aGOUpjgjSexnEY2kM954ENGOl8Qz4fMV+z15DrNA
	Tl4thsC7/n+3BFlXcljnmhnGfW/Mvk0USXa75m1vdL5Cz8zyi3zrcpd5OchvKKWOf7NW
	M8XZvVXoDQ/cply/hATVNKoUs/QoMwEcrB0r1R6LWBVHTWVkbB8xrP/rVU4j96IgVHHl
	2UeNGsNxG/zkHRNi18zriNtwNa02Ee+mNz/yeF3kMXv/oId2PDwUoPiTscu/AdrczNYo
	0YRQ==
X-Gm-Message-State: APjAAAVQ+Rp4MUKnrel50Y2viIc/gBcpPBoamXwDQty74l3K8glpEt/v
	CF/QermcjlEognLFmkgxfKrG3qZ1Xa1F7wre8zswP4j8
X-Google-Smtp-Source: APXvYqzPlrv3+0KdolbSN08Uvxv5WR+jJ5TZCHiUFpl8CMrvjJ6UByBlqGMgmqtw1xJ2FkHRKTiLH3kFcmtesty3u30=
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr7556341otf.326.1557141217578; 
	Mon, 06 May 2019 04:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <71a00e2c-0b65-f6c3-ae57-34a70a6f208e@pseudoterminal.org>
In-Reply-To: <71a00e2c-0b65-f6c3-ae57-34a70a6f208e@pseudoterminal.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 May 2019 13:13:26 +0200
Message-ID: <CANNYZj_8_n4ZX2at3q9e+9PsebRAO7Xr5gWpYiEdj9-YqgEUpg@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of meson cross compilation files in the SDK
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
X-List-Received-Date: Mon, 06 May 2019 11:13:36 -0000
Content-Type: text/plain; charset="UTF-8"

Looking at latest master, seems like nativesdk-meson recipe takes care
of this, via meson.cross template and meson-setup.py that runs at SDK
setup?

Alex

On Sun, 5 May 2019 at 20:29, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>
> Last I've checked, deploying meson cross compilation files with a Yocto
> SDK is tricky because that meson file has to be generated during SDK set
> up and because meson assumes that environment variables like $CC refer
> to the native host compiler.
>
> Has anything changed? I have some bits of code here that use meson, and
> cross compiling them with the SDK has been difficult at best.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

