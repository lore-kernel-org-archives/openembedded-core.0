Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 40C3F7FCDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 14:12:05 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id n11so9910631iom.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wbCX/vANrRS9qbHw/jhJnT/bjzLSuaVYRl/kKh0JnoA=;
	b=ngmzmnmAD8gnur3rShQZX4OwVBqYWAlpZi7yizHs87T7blcAHcN+AXxJjim3fI7qy+
	mN13uuLra1B2j99CxOlnfR32+GWTljxXuPnifz4vVPKzhb8srOwSfbvlTjRRyHv4tVbJ
	nLi+TiQlf59i1axXDqa86ZV6D/vDxXuVt7cNNtOOvsbFN5Yo2f8om/wGMfsZnnQlvgPc
	LwkglRO+xlnDYOIP+PXKJl7HKMOqjXqOjJi+/OIK/PZzm1YmuLJ3vP86Zrn6+cWMOyyf
	h01OVQnizhnjDtyf+52TuToDJJK4SNma5Y63Uu+oboNOHnyJ7MAfxRmFhpHEMcMbEGUq
	DhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wbCX/vANrRS9qbHw/jhJnT/bjzLSuaVYRl/kKh0JnoA=;
	b=ubpdwW7HVmbvQEtxajLMT9W8A3kZLkuc8e0lApRH7s2oVFHyC3cS+XROS5AxXe/7PP
	t6odCSJtGSVfyp6OUNq6Uhx7/vfgLHBdXJxYjt63epnBn7tvOb0pfLlHiYH1vXYFTuva
	wDch5xO3wIZrvjwIxxwWkoi+HisgkBWb7M9HW8q87vHT0Mfj08qH1Jt6Tf01bm/Iclog
	2iIamU4IJ64QbNWHamnpmbjBQ7+P4IbIjKLMvVgFJTovTiaCL1MMSOIaWJwiQW3MgocD
	ikkD7LId4iaH08pWOVGPpJ/8PUIhtWpHuoZ+W8SKMiCTd0C7UOK3YPaeSZGcYGLXgmF6
	/bUg==
X-Gm-Message-State: APjAAAV7tqGv3PmzRV7kW+k9Ve8AIgCyx6cp/VIeE5nt7ojSjwvs4LVt
	MtTITtQNjFWKVCyygcgHcBC6GCqXItf8iWIPDixgryR+
X-Google-Smtp-Source: APXvYqwbCEfBYOWG8WiHWqO4AunnN16CEpaMpnn0ACz1r+ucJkJDlGb88LVCat30oqOFM7cChXX33ZsMWLfUNJF8sD0=
X-Received: by 2002:a02:c773:: with SMTP id k19mr14035160jao.61.1578924726244; 
	Mon, 13 Jan 2020 06:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20200113130827.7409-1-maxim.uvarov@linaro.org>
	<CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
	<CAD8XO3a66v27ohEbrjEC=+XanfD1Fo_zXXo9TaFYSr+C+9+jDQ@mail.gmail.com>
	<CAM9ZRVut=Wu37sJ5A8fi3be-Bm3vWYepK4Sp2x=r7Et0xoy3WA@mail.gmail.com>
In-Reply-To: <CAM9ZRVut=Wu37sJ5A8fi3be-Bm3vWYepK4Sp2x=r7Et0xoy3WA@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Mon, 13 Jan 2020 17:11:55 +0300
Message-ID: <CAD8XO3bz8S2S5LzNpJgNuOrQB__LqdWNt2-k0rn8+sdxG3UcLA@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] wic: fix images build in parallel
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
X-List-Received-Date: Mon, 13 Jan 2020 14:12:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2020 at 17:00, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Mon, 13 Jan 2020 at 13:57, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > On Mon, 13 Jan 2020 at 16:31, Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > >
> > > > OE wic plugins create temporary file with the index of the line
> > > > tmp file name. This causes race in case several builds run in time.
> > > > Add more entropy as timestamp to remove this race.
> > >
> > > How would two wic images to be built in parallel with the same work
> > > directory? To my understanding an image recipe only supports building
> > > a single wic image.
> > >
> > > Thanks,
> > > Paul
> >
> > bitbake image1 image2 image3
> > all images build .wics and use about the same files, like firmware.
> > Issue is similar to that:
> > https://www.yoctoproject.org/pipermail/yocto/2018-June/041373.html
>
> Each image has its own work directory though.
>
> I'll take a look in more detail later today or tomorrow, if wic is
> writing temporary files outside of the work directory then that's a
> bug and should be fixed.

Thanks. I saw bug in rawcopy plugin. All other places were patched due
to the same code.  I guess then for rawcopy temp files are in
DEST_IMAGE_DIR (which is common) instead of WORKDIR.

Maxim.

