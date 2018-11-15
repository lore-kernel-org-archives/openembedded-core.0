Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 07E656C190
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 12:48:08 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id m15so29019952itl.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 04:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VDtn7ySi5feLePkvY2WbFbqwOfs+pp943/9QqAIeg1I=;
	b=DiU66KhAjdrA/VTDNA+h+jSFB4V51Csh2ZBFT13lKtEPH34cZXw6U0jV1QGCuiYYVm
	Jm7tWZpe7PwaXSCXY65Q+s8AsdlJLyMhHH1pdLQmUuvga5Uzwg7rpFSgoJUqMD6/txMb
	uB65i0aI3chFsx64QAxQdYqj5JixN7W6c7kuJchLMOaLVC3XZLxSWU1TBbdhAXpf7rh6
	gzZBHSP7cubAD1+8khXaSwgOp5leSV1qGoIuFfpG0CgZzYj16J0ENa+FV8RK81yBpKtA
	eMBjnxDUTiZNfoWf479JsqWnsG//5TAP1aHFuLUq023pYtcmm0++RGWy6OMhPkZDnhLH
	rHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VDtn7ySi5feLePkvY2WbFbqwOfs+pp943/9QqAIeg1I=;
	b=anTm9NMvrlUy7Z9nloG1Xzg2f0vKQHNYi4MJ7kc+Td159dZzevrIIl0hNvV+hG9EXm
	Mt1R0cwoh/NIrmntbulTlwZmfWua7RMHPMo6ceNntK3+Y5MJQQy6XCUz6Cls0sLfyfhE
	Ogc6bR45S+iLgOZN2m7i2LVgAW2dZValwgGnQsHtCii8wxCW9TVulXGFRqkcnwFRzpSb
	Q1Mia2A+2nZN5Kl2p0nPhWE0jgm0dR6Qqa20u+2Zaj5wihh8iG0wY8WRDz1FOCuUW+86
	fXOvjHpWvkpuVJo8CfJqAGbWSJVGa5Ovu3XV28yWNeanmE+Df99YC3b4hiVUVvrlwcfY
	tysg==
X-Gm-Message-State: AGRZ1gJtL053fp3oElavSxP+K6g2GE1s4x4EJkrZMfszJefs9ANFUUBn
	16oCRDiDrb/rdDmPB9IW6Pp6jZhja0ug2OlmZFZLjTYyKHE=
X-Google-Smtp-Source: AFSGD/XPwSQ8sP9e0W5tv2DVRLaH45+ugvpEa58hMgU7eKc+j5o008EuGjC+4UCLcum5Pgdv1UPtrm9qv4kvga9Xzo0=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr6119651ite.130.1542286090041; 
	Thu, 15 Nov 2018 04:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20181017004016.7897-1-hongl.fnst@cn.fujitsu.com>
	<CAJTo0LZagwhbhSRvmwEb4hK3cQwV03Sd8dKoN=cAZfMF4SAN3A@mail.gmail.com>
In-Reply-To: <CAJTo0LZagwhbhSRvmwEb4hK3cQwV03Sd8dKoN=cAZfMF4SAN3A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2018 12:47:59 +0000
Message-ID: <CAJTo0LbwHQ3ywuTeXBySWwyvmX4yJbB4U_PAR+EVeKMojUcmng@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] e2fsprogs:1.44.3->1.44.4
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
X-List-Received-Date: Thu, 15 Nov 2018 12:48:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Nov 2018 at 12:35, Burton, Ross <ross.burton@intel.com> wrote:
> This appears to break if musl is being used:
>
> In file included from ../../../git/lib/ext2fs/ext2fs.h:97,
>                  from ../../../git/lib/e2p/feature.c:20:
> ../../../git/lib/ext2fs/hashmap.h:20:19: error: missing binary
> operator before token "("
>  #if __GNUC_PREREQ (4, 8)
>                    ^
> ../../../git/lib/ext2fs/hashmap.h:25:19: error: missing binary
> operator before token "("
>  #if __GNUC_PREREQ (4, 8)

https://github.com/tytso/e2fsprogs/commit/98c6113b414782eb5bfcb67c33d09950ed203f20

Whilst there https://github.com/tytso/e2fsprogs/commit/1aa0d8a2e4165010463c5243fa78c2fd9cc04a38
is probably good too.

Ross

