Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFC16C0CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 14:04:33 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t24so3680580ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jfk+OQxLwkmmPJq+gMDTsLSCbY0iSz2S/g/7i+L4Ws0=;
	b=D/q88kx3M3XewjJYri/LE8X2dZ0t7NvkD742zh+qzLA3XC0/8+R8eN5QBzcUo6Xny0
	9qYnQzljeiwFm0v0eH44nk86GoCd+lJoJZcEE0IjmNp8IPCOdI1qFjN2y7n0lsKrgEUf
	d6ckoPh3EZt93LcBSUWlZLaKzYKCZ+6tbd4WIbviebJ6TOpQUbntrLM+NT6nGFaj0RCa
	oEpEGjuxTVsIsm8jl3+vvuGMzhNz+gCLrnWbuT5GAfUcsIOnIggKKiNTMUoDhyBBD9Ty
	w0eqh+mbDDMz7OAqOzn1KwJK5ZSF0DtPlnfZGb3kn287DR0autEXIhB4CEs6vUyErvjD
	etTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jfk+OQxLwkmmPJq+gMDTsLSCbY0iSz2S/g/7i+L4Ws0=;
	b=r7qDqidwDobXE5fj6faJ/jsImyKsVwVBblGzqoJTi14OfMZQwiQj0PwhR9TFmjqeVs
	YkqQlzvCRj9sPUzRkCFgoiIf7dmzzbl71i9UUKo5K6JVmqLdA032n3ZIgS43LCBRmPQS
	sCgXeip28ViNyZGzSxY/9SXTZTypAgICVANv3I4zr8sRtPuLYN6nkMVxQjJsRu/LuRqC
	zfpZ00UwNfM5hBSNrjgO90Q/RbbZFEERafjfNsk3fCQUyVhiOqdiSxvLd4D3guTvdDti
	lKDoQyfqPhysP0s7K0aeTYOX9GQOMBEtxFZEMl5Hf+ya87l+6iOezGJmbPHdu7gKI949
	MUJA==
X-Gm-Message-State: AJcUukfZ9brwRs7sQOHGbxV8BGW9bu+IXgn0EBOutospxj0LTuyckc07
	FrvjagI72ujRAikViBjs/MycOQxrntleXbthQ7PR9A==
X-Google-Smtp-Source: ALg8bN6E4JXUVvhzc5XTqzMrpDL2rVRbIWdw3g+EapSRNe2xEfVsSjSq84hLBPUcng/Mt8eoKq4HrB2rJ4FvooX8Wyc=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr1447845iog.270.1545401074276; 
	Fri, 21 Dec 2018 06:04:34 -0800 (PST)
MIME-Version: 1.0
References: <1544525848-72525-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1BBD245@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0Lb+ibZRCJsumRqYACE9kdo1haoZA8kM2EaArwqP3WAufg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1BBE7D3@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1BBE7D3@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2018 14:04:23 +0000
Message-ID: <CAJTo0LZh_V-uPHp8NweDUGq62YP0h8UMRBfkXQ_+FTKLUzvOXg@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH v2] createrepo-c: Fix setup of logging (log domains)
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
X-List-Received-Date: Fri, 21 Dec 2018 14:04:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Dec 2018 at 09:19, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> Well, createrepo-c 0.12 has fixed this bug, and will this upgrade be merged to thud branch?

The upgrade won't be merged unless its critical, so please submit your
patch for thud.

Ross

