Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF886FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 10:50:05 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l68so31188171wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 03:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=BdhvloxZxyYeNoIWbltgpE1suOGUkacLY/uUUcLKIU8=;
	b=r8ilO3r+Ikyxx3593pcqnxtrsOSrfJ7Jcgfc/93pb8NLOmf+0iI5nh/BbA4G163C++
	q/mYWVxre/K+YYrZ2WLy9kB9Qm9Ug0Q244rLrMvYGm1urlH/0OG5/nJe4g5A8kXk2MlO
	RgUzhIOeyZPaQxCLcRStJ/8B2gE45EFqtD7fbmFe1H9ZyqXrCNJmwywgJBECFgdXV40e
	M3e7qSl7aAdwFviH//7ifsoacUPP1jR6RwlpaKOSgtRfTw1phMG2B3561WlZt0SzagtK
	QRB2bAr843fp532xhO0MzjtGm5j6Ol63s/DKUb7vZsUUhN0GKo9fW/TMpHN1TlT4gNUh
	SwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=BdhvloxZxyYeNoIWbltgpE1suOGUkacLY/uUUcLKIU8=;
	b=A0K1d9O62hMQfo9zfTKI1cj6n4+A/drnOAyPTh2p1ULKwghMP1mO3ErW2XzZo6MiMK
	l9CZSRsbx11B9NMxa8DLUcGGoRUPvfxx6HJruOqKg8M4CtNlVO88tKiZnICsY0Vt/hqZ
	v1Sc1tNVqS9zk5fWRbdQ7HMxwkWTlU+e3bb2ECz5Gviw2YuOaF6CSxs0Io+IzT8ZwDW2
	BS3V8z80RGJMMe7gwx4LVbvRfiTBpt1hG6mEB7OkCsV+eqkcLzS9NJOw931F6UOntRrX
	jIvXIidic8KEmKlVFUD47sPM+WBUVzg0zGaZBqBscxl8AnUWoVUF/YOEbr3bZGotNjhB
	hy/Q==
X-Gm-Message-State: AD7BkJKdi9mmdKgvl7Yol2vErRLIO81Oi8e8CAi7KLeTyauxmhosYJa7bc7+ivpm/CuSN2q0RdGP2wczAFi3eA==
MIME-Version: 1.0
X-Received: by 10.194.63.242 with SMTP id j18mr17240385wjs.114.1458298205341; 
	Fri, 18 Mar 2016 03:50:05 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Fri, 18 Mar 2016 03:50:05 -0700 (PDT)
In-Reply-To: <CAJTo0LZND6-QdyFzQdo4v_-z6VcmYG8KjOSanAQ=SH=8eg0gUg@mail.gmail.com>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
	<1FC09834-DC8A-477D-9C9F-B6D469A7E90E@gmail.com>
	<CAJTo0LaoVn5ixhYy-2cHf-FGSthY3Fa9Z9ryg6j0hLp2KSLLtg@mail.gmail.com>
	<7AB4B008-780B-4619-A914-7A00D132FCF0@gmail.com>
	<95245B46D926B348AEB132E99037C59B36A9FE73@ULM-DC01.bmw-carit.intra>
	<CAJTo0LZND6-QdyFzQdo4v_-z6VcmYG8KjOSanAQ=SH=8eg0gUg@mail.gmail.com>
Date: Fri, 18 Mar 2016 03:50:05 -0700
Message-ID: <CAJ86T=UfaG49mYPPJH08MTHRROz8LEqXJ3Ge-ujaxLLCA_aSmA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 18 Mar 2016 10:50:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 9:01 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 March 2016 at 16:24, Helio Chissini De Castro
> <Helio.Castro@bmw-carit.de> wrote:
>>
>> If i change recipe scope, need to be on each gcc_${PV}.inc.
>> But they include gcc-common.inc on top, which states LICENSE = "GPL"
>>
>> So, gcc_${PV}.inc is already overriding the original license. If you think
>> is ok, i can do that on gcc_${PV}.inc
>
> No,you're right - your v2 is the best patch.

The patch which got merged isn't right.

gcc_${PV}.inc sets LICENSE="GPL-3.0-with-GCC-exception & GPLv3" and we
need to over-ride that (to remove the "& GPLv3") for each package
created by the gcc-runtime recipe. Over-riding LICENSE_gcc-runtime
only isn't enough.

With current oe-core master, libstdc++ is taking the "... & GPLv3"
license from gcc_${PV}.inc and is therefore being excluded from the
rootfs if GPLv3 is blacklisted:

  ...
  NOTE: SKIPPING the package libstdc++ at do_rootfs because it's
GPL-3.0-with-GCC-exception & GPLv3
  ...


> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

