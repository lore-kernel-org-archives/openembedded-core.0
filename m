Return-Path: <raj.khem@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 561F86C403
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 17:06:13 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id u3so16845200ota.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aK616nzhN0ms8BBXsFr/vUGsQitfVfwTT92OmEALegc=;
	b=jTE7y7ixYGymJmbSTY8GWOvEpD5ay0lqHIJBecY4im+1saEW5C2u6wZvEa+G9/oC+F
	iJ+mXTj34z3xyNGMlnOI/ApJtzxUr+lqMUFvJAUdogAlkET7wxUZ4DfA9Jz/ert3DK7p
	Jk9jTONeJV257aUmPFThEc8ToJ7xhF5q8Ks6oqiaqc5GpRGxzbDQfT/HJE64klmS9WU/
	QVfj6CDr9E7yv8R/YjieIGU+yGd2rsMyIGYoE1Iva6YC9z5JmD2grZlouSTHxl7lTe1i
	NXmAxNDridGRF6Zc+QmiOHuuwAaj8SP6U20UbrYLmhcq3HPkhYL245NWCpA5Ex34S23l
	sY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aK616nzhN0ms8BBXsFr/vUGsQitfVfwTT92OmEALegc=;
	b=owo13piyeo1pfXGJe+o3jEjxrq3W559+BC315CaT+DZNWiKjB4oSEwCdW3+gMywlBn
	F7JgCzwrGt1yz7YQQihXgptlXdmPMyKIpBpfEFXH8UjqR/iXTVRYToRDKs+/3aGIkRju
	r7erG5fpMxDfMhckD1liP2zdyWlNsC+/oqwEFpDdohuzhoosy9e4EraefY2wisaBHEZv
	/Inabj7mHgGhK0I0RZRkqgF6611WA4tnNl+fTNBzYpyTzI7ZpJxG3v4l5quNStfII+Ky
	THql9xL0QrgSao7MYvphgEwiOpHZAmlVYWa5bAVT8ju8FTXj7khJRs6pwZqV0aI9eDxo
	nUPg==
X-Gm-Message-State: AGRZ1gJPpibUSHghmXySpzOA4vSsswxCNyMnbTMeGpIMHu3gqLa1vVVH
	TPQA15abPDQUFcF6ydzGm4ba+Lv3qrGgElixwms=
X-Google-Smtp-Source: AJdET5fXHQF9u+hAsq0rfrDOP8UeNixah0pjPpfAyeCF8pDMQOvS+OKPXb6byxhExsRyclTFM2p5uTe2Hh2UfzwJdaM=
X-Received: by 2002:a9d:7343:: with SMTP id l3mr7247694otk.204.1542387973678; 
	Fri, 16 Nov 2018 09:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20181114132336.71049-1-raphael.kubo.da.costa@intel.com>
	<5d7a7c30-0d55-da47-c6a2-1dc0fcddce5c@gmail.com>
	<871s7l6mx3.fsf@rkubodac-desk.ger.corp.intel.com>
In-Reply-To: <871s7l6mx3.fsf@rkubodac-desk.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Nov 2018 09:05:46 -0800
Message-ID: <CAMKF1sobx8ed6ncDifE-iCDyn=+NZpar2Wb4dXwbKzkmcphEWA@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] m4: Workaround gnulib's fseeko.c implementation
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
X-List-Received-Date: Fri, 16 Nov 2018 17:06:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 16, 2018 at 7:51 AM Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
>
> akuster808 <akuster808@gmail.com> writes:
>
> > On 11/14/18 5:23 AM, Raphael Kubo da Costa wrote:
> >
> >> From: Khem Raj <raj.khem@gmail.com>
> >>
> >> exposed by glibc 2.28 for details see
> >> https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
> >>
> >> (From OE-Core rev: acca7f964bf9c21f3777085563a7928b8246f17f)
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
> >
> > in in stable/rocko-nmut. Odd thing it, this is not in patchwork but the
> > sumo version is.
>
> Thanks. I need a few more patches to get host tools to build here on
> Fedora 29, but now I'm even more confused as to where to send them :-)
>
> What's the relationship between the -next, -nmut and -nmut2 branches in
> Yocto's poky-contrib? How do they interact with oe-core's -next
> branches? And what's the process for merging them into the actual stable
> branches?

they are staging private branches used by maintainers. Eventually they
should show up in <release>-next
and then into <release> branch

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

