Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9A446607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 13:55:49 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q62so12021776qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DF6+LJfqVY0DEH8wNBf655nq+BelSv1iK4TMoFplEfY=;
	b=w+TodkVyGTpRtmDz1ihPLjX2EalRseigCsqFi+V7bZWC5kh8xThEHgp/TJWKX/VmxL
	pkU5SGJs/pL56WQjwIsolReGOHQH2mXMHnn59xaec8c8+CYF8V8ZKkCIjDmkfovHA3R2
	rWVWW67vT5qGxm/RGuOHGreodAwMmISieS0XXEo6CccCOKg7XQX11eNnggUM0NYcFcS3
	Rf2ECNhTQI+baP6Hn26MvTDTbbmcs68dyjmBd8V/a1tgzoI7zjGHbXa6ORxLa2wGKczf
	TDEOKCQQjW5RP+rI7ZLyuARL2Bo47dGX7KyaVokeFag1Fer5GSP1hI+9m1weVK8//BYz
	jvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DF6+LJfqVY0DEH8wNBf655nq+BelSv1iK4TMoFplEfY=;
	b=A0OYFpZnGTdWpLxhZ7pxLFLWFRpiuScRPJAOCN31K/gu45YpB3yvpscIXExZeTF2Pn
	qS3CQolxmXiPLdcGvH3eaBs8Y7IPMl/phpHJkMa3tNvRoCk+58YmvesUPaQA8PjkGF+I
	N3mmkVeTCeEUo+LCZipid2MvuxHFJsO5an1vcBw/xlMPFnb2lDHOj54KguNyw0zwNg5R
	adxMZryMdsFLKAEgtNQHz/GmrUu0oQ97qULNQD2w4DWCXuBeedmP7P6ExwWz2Ly0yHG7
	qkkDHTHpf7s9CeMFAJTBEXbcwTWowpcNNIwqU7dvmae72fLHTBowk/tF0zk38Umb7CxZ
	IJdQ==
X-Gm-Message-State: AEkoousudTBrydZDLCx/yiJ9rn4fLkBLkA5+MNJZZq1A4UsrkFgekFiegmInHnTosNVv5Xk507WP3whGgnahjg==
X-Received: by 10.55.74.17 with SMTP id x17mr1777869qka.26.1470059749645; Mon,
	01 Aug 2016 06:55:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.215.13 with HTTP; Mon, 1 Aug 2016 06:55:19 -0700 (PDT)
In-Reply-To: <7603e18c-345c-ddcf-cd95-14df64b60077@gravedo.de>
References: <7603e18c-345c-ddcf-cd95-14df64b60077@gravedo.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Aug 2016 07:55:19 -0600
Message-ID: <CAMKF1sqhL-beKuV1bTb_srgEh_bj+mm3BkgwNY_JxTEe=d04nw@mail.gmail.com>
To: Simon Fels <morphis@gravedo.de>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Snaps on Yocto/OpenEmbedded
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
X-List-Received-Date: Mon, 01 Aug 2016 13:55:50 -0000
Content-Type: text/plain; charset=UTF-8

Simon

On Mon, Aug 1, 2016 at 5:32 AM, Simon Fels <morphis@gravedo.de> wrote:
> Hey everyone,
>
> I've worked on a new layer recently which brings snaps to any
> Yocto/OpenEmbedded based system.
>
> If you have never heard about snaps yet you will find most details at
> http://snapcraft.io/ but generally snaps are a new packaging format made
> with security and fast updates in mind and allows applications to be
> packaged once but run everywhere no matter of the distribution used or a
> particular device type.
>
> The layer is currently named meta-snappy and is available at
> https://github.com/morphis/meta-snappy
>
> It comes with some basic instructions how to get quickly started. A
> basic tour through the snap system and how to use it is available at
> http://snapcraft.io/
>
> If you have any questions, bugs or contributions feel free to get in
> contact with me.

Thank you for announcing your layer, I would also suggest that you
publish the layer
to layerindex as well. at layers.openembedded.org

since thats where most of folks go to find layers.

>
> regards,
> Simon
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

