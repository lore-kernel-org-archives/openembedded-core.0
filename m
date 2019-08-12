Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD2E27EADD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 19:01:07 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id y26so103946200qto.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MdbkOEXqhhUIPmrwtSRHVQgFND2mXp28FIyInUBgCMQ=;
	b=j+deo3FiKe2/wG39+1IBculCGMvyKcLh9nxWwm1XEbW94Ld+Yx8vQwugZwPNQjeQp8
	SVPAE4eNXtO+do/NhLxezY3NF7rG8tMD1MtYJL4TfSOvaKoI6swW/YKd5NzTvNQ81LO6
	mtcRAqBG1LM6EEqsonMNnrNODIJjhKwo4nlUTS1zfq5GYLRc2pLSDRimX2vZ+nT3VELP
	5dBvJvfomHmOhX3+5U5cnUbIMSSM0L5xxW3X+nAqPpltT6bhGukUn8ZhDzrTqbQX4eWE
	ICVeiPvmAdBouLK1t5mi8AoQD3jrZL5wSaXFpRsfF/O+l/gWP85CkPQQU3nuHG6boSjt
	3l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MdbkOEXqhhUIPmrwtSRHVQgFND2mXp28FIyInUBgCMQ=;
	b=QlWl+4zTkhY3/MFDBr2u0X/WfKt9UaadXQKOrnUJm5rBOlrRxOYkg0zjvEmcWth8wL
	ZN8egm6YanJB3qx6IB6TESigtKfREgeDdZQoagmt9dMx7brYIny9ZepefJi0gNdS7n4u
	Wbqenujkk0PKL93TsIHtWyeOouFNGHoWR7YCObtDhTrge+jXKN8ZPu+BaS7ogEdbtyL9
	bUe/JXSPFwS/kJl9RjrdcAjPhey07OJr7rC7wv8Ss3mTxTMmvoI7tNV3Si7n/5u1ptXm
	L8fkbHw9Vo0EWW2V6Y4uUdXQSFXFs2n43BNUB26A5ScnY9aVNCqff+XviESXgHZJaU2S
	XMVw==
X-Gm-Message-State: APjAAAUIgMDCaa6yHAgG2KbklXGVZn4yUu9v/L2TPPNqqw4S23d6jtrd
	lt5nTi4ndwcRbfYmukaht3LXhbGDI43nqNP7w+o=
X-Google-Smtp-Source: APXvYqwTOMmYofXJYQAKqHFgiYKbLFjT0WjrPwfh9Zdl4BebBhnPRby5wpP52mhhcfINlvwlCx+Cj2t5cwMzBnlgTpU=
X-Received: by 2002:a0c:ae5a:: with SMTP id z26mr30799575qvc.65.1565636467916; 
	Mon, 12 Aug 2019 12:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
	<CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
	<CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
	<CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
In-Reply-To: <CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Aug 2019 12:00:41 -0700
Message-ID: <CAMKF1sqRZGqR7pquRdqjfqs0=PAKB_5C2W6p_uwM9uTHZeD2GQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Mon, 12 Aug 2019 19:01:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 9, 2019 at 2:45 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Fri, 9 Aug 2019 at 03:34, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > There are several packages in meta-openembedded which are showing these errors one that I see is net kit-rusers seems to be failing for wrong reason
>> >
>> > I will send full list once I am close to computer
>>
>> here is full list
>>
>> https://errors.yoctoproject.org/Errors/Build/86513/
>> all do_package_qa are due to this change.
>
>
> There are plenty of recipes in that list that come from oe-core (not meta-oe), and do not show errors on the AB, e.g. glib-2.0:
>
> ERROR: QA Issue: /usr/lib/libgio-2.0.so.0.6000.6 contained in package glib-2.0 requires libz.so.1(ZLIB_1.2.2)(64bit), but no providers found in RDEPENDS_glib-2.0? [file-rdeps]
> ERROR: QA Issue: /usr/lib/libgio-2.0.so.0.6000.6 contained in package glib-2.0 requires libz.so.1()(64bit), but no providers found in RDEPENDS_glib-2.0? [file-rdeps]
> ERROR: QA Issue: /usr/lib/libglib-2.0.so.0.6000.6 contained in package glib-2.0 requires libpcre.so.1()(64bit), but no providers found in RDEPENDS_glib-2.0? [file-rdeps]
> ERROR: QA Issue: /usr/lib/libgobject-2.0.so.0.6000.6 contained in package glib-2.0 requires libffi.so.6()(64bit), but no providers found in RDEPENDS_glib-2.0? [file-rdeps]
>
> Can I see the configuration where this happened? Might be some other setting that breaks shlib resolution (that was previously unnoticed due to recursive qa RDEPENDS).

well, this seems to go away once I disable hash equivalency

#INHERIT += "reproducible_build"
#BB_HASHSERVE = "localhost:0"
#BB_SIGNATURE_HANDLER = "OEEquivHash"

Richard, another issue I saw was slowness in world builds when I had
this enabled
I was on master-next for both core and bitbake. It was spending a lot
of time in ensuring
the build is not needed so much that the build took almost same time
than the build with
out it where the build without it will build everything.

