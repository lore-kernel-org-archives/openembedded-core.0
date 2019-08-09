Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id C42B37F340
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 15:19:54 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l9so96071038qtu.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M7Qbayrg3abzTUV4wijC+xAhwkrWsea1akWGVMKLOCk=;
	b=a4rFSHYEuuo7ooOnovjeMKduz2efBWYxmPV/rkzp4tsmgTlq66PFpdUGWb3ICyv7M4
	tQBmvCmeZeKfSDBV/GT03jaX8pdypq3GzYOskU7taq4HmvqusN4VLqiYq9s4crKA39/z
	E3mV+2S73VmDozh3JLjKTdfZZY3fnTfICxSOYCBpfNg1u5UG2mTtAeNxpNDNxqXK0s4p
	kjWQjU625IRoY7mZfH0aPYOpt0EPTyV45DAA+rKvWWVuEGnOqgFKOQ+YNpDGHMOPqg1G
	FIinne6taHPtEHOUbma4KPmrvNL36q5IrBXu6VX1EYemVu7+R+MOAQ/Dj8SXW1nsLOxr
	58+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M7Qbayrg3abzTUV4wijC+xAhwkrWsea1akWGVMKLOCk=;
	b=cUZehaRSDxGHdgFUj8944jhMn67bbP3ySfnAc3RzQP0NiElRF1L8Mgf7n9LSAKwF2I
	hTHbytPnACKEaKdbO0VYsyT8806J4eP6Y/2x6ndetF9HAB3bZHxrNviDbX18kiaYjQyl
	cM+5ufQ1YpSWCG/mEPI+QisEP2esM8JXTtuISxOY2La/jfwGcy3/ZZTQfbTBeI6jr//V
	60SB4w+XqH0PnYrtRkx3jNfeWDEXMwqKPsY/J8hpNBdu1brMGXw53vZVkuWDhqVHYd2K
	i1PrMuXrLLe2KPDBmXv2hAxSXxhUQPdwhkNCH3/9JUKBjwtFNFNmsir2ZDyyeJv7xN0Y
	/yDw==
X-Gm-Message-State: APjAAAXHFv78OoldrUVKoiJ1+m08Dmo21t1D4+ZeCAD60sAdUSDYHKWK
	zju/r29DHG05/+rGUcniTV2DxOc8AQwEhfeMkng=
X-Google-Smtp-Source: APXvYqyd1MyqsnyEwfSswRkYxkkvb0/35Vu+6PT2SEOfEnRZHFpa/h0zNlAtdeTO2lKviZWdZ0xM/CMkkrBUp9hLFU0=
X-Received: by 2002:ac8:1183:: with SMTP id d3mr18422520qtj.53.1565363995378; 
	Fri, 09 Aug 2019 08:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
	<CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
	<CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
	<CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
In-Reply-To: <CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2019 08:19:29 -0700
Message-ID: <CAMKF1soHd3dx9FVXiTwaDeBQz55hdFTCdmLRZjKDfAsduqWQ4Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 09 Aug 2019 15:19:55 -0000
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
>

a running musl world build did not show this issue but that was
rebased tree without this fix. I will have to do a new build for glibc
and see if it was my build system injected behavior. For this patch, I
would suggest it's tested across multiple layers before it's installed
to oe-core.

> Alex
>

