Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id DB08571CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 13:32:02 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id n6-v6so5874668qtl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/TrF/upK9NWlol/+MNH8nen0hfr76UzUen2wINgFgR8=;
	b=QRVPAfCb2Y7RRLlNMm/jFVRyO0ZrWl1zx/6XDXKox+u4uWg/nb3srh6SdQmQqYMSFy
	nXwy3E+I1k69ZFTgJDJHxtM0dpfOlqx3bM+V7JyHtcOHrrC+wdMyw1f3yMdvghHa8ewP
	D7ohwxw60iNUJsWbYOvO7TMu3CSIjYe+Z+E7z7mBXsCW3Fr+oBmJ2lleAdP0FPx4va9H
	N4AAFln8plfjUuA3cnVUTc1Xy7jPl1b3f3LXXL9s1rJECK9PGZxFaIVm/6ni/ropucnn
	j2yLd+Vc4WfHVz5TAejNxknbYkWL+VRxRgyvPqKQ81pq4/gbx6n9aGR5f8nS5vln2yMy
	E0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/TrF/upK9NWlol/+MNH8nen0hfr76UzUen2wINgFgR8=;
	b=ckFC5sKCHJ8kyA/W4VGjf43MvDHlHW7OF4jI3cXzfZHPMBrP7FCxQ8XVy8vRrcCrJ1
	umHZLk0sUhfd/PllHzMWM9A37DUB5o9XQPMChA7LzGmMKnV7rngnDnREJvSA9JmHdlsr
	2ftzN5a9kXM217uhqLMfqLusHH1nJuJGsMPTuNk4S/vvQ8zxbjA0cnbxI69pSF5Mx1nA
	vu19JOM8X6hxwwfkg6c4Yx/MdkCFiE9ledhxUOTIKgnP/g9yAFJZ3aMJOl0tjiJ+ZdiQ
	g41Lvypld51uttU7s6ONPMJh7EoasC1yMmC1PQnc27D8DIR+zL0NE4wXy5g2DJ6L90g+
	Ya5A==
X-Gm-Message-State: ABuFfohaFzdlVgbvy9TIMUHTyUoUJgY2/ZkCsVmkbg+zm2rAyxfw2V7b
	pY2jVxuUSDKnjs1M43ycFOI2zANtAzXAtBexPKg=
X-Google-Smtp-Source: ACcGV604513ded3lHzR7pYyW8RVuDYMLmXdoEKQhbqsvfS+9SWhBmU2tKSaPKDTaBArANLpIdUwqXLWnK8HvPSC54do=
X-Received: by 2002:ac8:4912:: with SMTP id
	e18-v6mr1252737qtq.34.1538573523394; 
	Wed, 03 Oct 2018 06:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
	<c5a520ffbff2e4b1f12355b7605b5f5988228101.camel@linuxfoundation.org>
	<4f206827-9c6e-608a-409f-a66edcfcec2d@taitradio.com>
	<8738d389-5361-272b-f329-63c6538bb9ed@taitradio.com>
	<5a57b59fc05db0260d1257692161ebcd5443aa2f.camel@linuxfoundation.org>
In-Reply-To: <5a57b59fc05db0260d1257692161ebcd5443aa2f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Oct 2018 06:31:37 -0700
Message-ID: <CAMKF1sqrb496Wh=BGaw2tRjLtrQcPrEXL0vCBSdbtKQ4rtdRdw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: glibc binary reproducibility
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
X-List-Received-Date: Wed, 03 Oct 2018 13:32:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 3, 2018 at 4:25 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I don't think your patch will fix all the cases sadly. I did find
> another technique that works:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=21bc0c2fe6e9d2ae1d08d3de5f2a6d75d4ba108b
>
> basically by injecting a STT_FILE entry into the underlying assembler
> files, the linker then doesn't need to add its own.
>
> The patch above fixes aarch64 but will need additions for the other
> arches which break...
>
> Khem: Any thoughts on this?

this is right fix

>
> Cheers,
>
> Richard

