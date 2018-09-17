Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 925E1745AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 10:27:30 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id y207-v6so18349489oie.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 03:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=W6EnWmaoos5JsjMoBoVQ0bh1+4ak6rcuT23+/Fpt5oM=;
	b=ZR7wFwRknfBnIMAjlW6EX+FjPm4BUjpIBUPhvqrzD+Wvd97h6oyqUz1KeVf8fC0JR6
	xeLCRJTd9NWxJ01dTwFu/QY75YtTB2/YPFpzHjJmTH6Op7vW5qS92yQf4WHtHk550Cpl
	KUA6AEoLm1eplYmLFcQGs0MaGGXv1w+WUUHewETEAsNevj0+YRk6L7n9Ubv6K/CMSSbe
	grO3KJsfAD4p1002j94lWzTNsWnzsjDzRLxLifiUW4+pLzan5AVruUc52+WEqaLIOIod
	UqpTIVLaqkcjDHHzRqANAwYi2NFyBeZwg0ANKsG7KXCed305h+SxelrxzUaJ5Ilq7kn/
	Ij6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=W6EnWmaoos5JsjMoBoVQ0bh1+4ak6rcuT23+/Fpt5oM=;
	b=Yhmyls1B8ZP06EYP6wLglQfSLJLffXiujtercAMRKzsGXLRLMGmyvKFY7w6E7ixH1F
	e7J/yWz+W75ACgOSQcsmpbWgykflVCrE8yafuZPKv/b7kO1H3H5gmuhHEMG4E8MQUirh
	r/1JEV7kzHs7kjEUXtFeyTcd6OiRX+cuOV45LMAYvxewRDch2F2/WaKQGHFzEbAktHXA
	mRXmo3BPp0wc/0ONFWMxE5fr1nnT5yBo5Ri5C8JZAvuSRu/2REiHgf3ytTkgmaEa7xBx
	0J1TfpAQq5Mtrk9UwhGIkPf+5Gdd2tPo31AFl/1/gQ5Kam+t0tlPj+0h6/dlBgJ+Bx/Z
	VSbw==
X-Gm-Message-State: APzg51DHfhAHbSf2GuLROtLGElBWSlEO/xAcpPmUZSP4vib2VoTAPDYZ
	T+TjKoNryc2q2l7RKM0/+HszzzPhgFTgJx8HIX6efw==
X-Google-Smtp-Source: ANB0VdZGxyVglLeASLoOGKqRDL7mBpG2wT5d8corWRJYML4XyP6W3qUwcgZprfy3uksw2uXW7Ump544M9vKgtCMt7nY=
X-Received: by 2002:aca:4455:: with SMTP id
	r82-v6mr17495343oia.260.1537180051238; 
	Mon, 17 Sep 2018 03:27:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Mon, 17 Sep 2018 03:27:30
	-0700 (PDT)
In-Reply-To: <20180916135629.BD4D0440003@auh.yoctoproject.org>
References: <20180916135629.BD4D0440003@auh.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Sep 2018 12:27:30 +0200
Message-ID: <CANNYZj_x-zz83xHc787KCuehG5a11_MqMiqz2OEihXTDtEAGXw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-09-16
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
X-List-Received-Date: Mon, 17 Sep 2018 10:27:30 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-16 15:56 GMT+02:00  <auh@auh.yoctoproject.org>:
>     * Failed(other errors): 20
>         vte, 0.54.0, Maxin B. John <maxin.john@intel.com>
>         build-appliance-image, 19.0.1, Richard Purdie <richard.purdie@linuxfoundation.org>
>         u-boot, 2018.09, Marek Vasut <marek.vasut@gmail.com>
>         gtk+3, 3.24.0, Maxin B. John <maxin.john@intel.com>
>         gdk-pixbuf, 2.38.0, Maxin B. John <maxin.john@intel.com>
>         dnf, 3.5.1, Alexander Kanavin <alex.kanavin@gmail.com>
>         libdnf, 0.19.1, Alexander Kanavin <alex.kanavin@gmail.com>
>         binutils, 2.31.1, Khem Raj <raj.khem@gmail.com>
>         at-spi2-atk, 2.30.0, Maxin B. John <maxin.john@intel.com>
>         epiphany, 3.30.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         atk, 2.30.0, Maxin B. John <maxin.john@intel.com>
>         webkitgtk, 2.22.0, Alexander Kanavin <alex.kanavin@gmail.com>
>         puzzles, 0.0-new-commits-available, Maxin B. John <maxin.john@intel.com>
>         connman, 1.36, Changhyeok Bae <changhyeok.bae@lge.com>
>         ghostscript, 9.25, Hongxu Jia <hongxu.jia@windriver.com>
>         libsoup-2.4, 2.64.0, Maxin B. John <maxin.john@intel.com>
>         gsettings-desktop-schemas, 3.28.1, Maxin B. John <maxin.john@intel.com>
>         at-spi2-core, 2.30.0, Maxin B. John <maxin.john@intel.com>
>         python3-pygobject, 3.30.1, Derek Straka <derek@asterius.io>
>         gst-examples, 0.0.1-new-commits-available, Anuj Mittal <anuj.mittal@intel.com>

These all failed due to stale binutils recipe in devtool workspace.
I've now removed that, so next time (mid-october) there should be a
better outcome.

Alex

