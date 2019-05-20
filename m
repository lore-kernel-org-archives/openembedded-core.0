Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7851571CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 10:17:56 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w144so9507732oie.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T2qymNMFCqu06P/1jN2ISI/kWiPSSKu6m8vCHKDoC30=;
	b=SMLknu5979qcnePqYEqUyKJPJy3aHH5ciP8KvPTpZrHBLOr9Ov4LINfMczH2hiluXK
	yUQJxhkv+CE+NWHPlvIi7BztlwTllFoIfeJ65oUwN5mPnLyFDGw1j+5yrQCLzPX+Mz2D
	G6DrcCiHxd7QXZsnPYAueiNo4Y4Z2z20v5LIrV7W1ZMvw4Bc01Mw4WTgusx2ti+9ZBnQ
	ZghWDtDfY1kwjfQs0JaiGG82YUMAiDLxcvXO2P08mNZcPN7kBT6bEJX+Mxat2c+QnIX5
	ZS1DXOI9mQ0CWye422TvncBWGJvQtKpwSvdWcL9p7OgItz9MI3vqCvAFXSVjkncqrzsq
	fdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T2qymNMFCqu06P/1jN2ISI/kWiPSSKu6m8vCHKDoC30=;
	b=Y5bvJIe2GHROQQ38vul2fOTZIUiIuzY/0yd6GmlHWXnByf30aqjemSEcb14mRlU9nZ
	dsONUk53g9mNC3K0QMxmAmnzQ3UsZnMjz1xKYSexzgr4fdZkhrWF32OTsqpt6GiKXRzj
	p+kKLmuiCtG4T5P1d5dHywJk3ANMFwv91hkI2yyR3VywVkvO3/jB2u0b4sV5xosOnydH
	0TmYwoKNc6FHaK2UhNIFNDHyzu6VBs72IKw465hqU3FI6o+yLat1Kwg6lNSQBFXzaMgn
	UeGZX5E8RFqWtEszDFsHxdUp282SzXYZn4YkljMQIesFOs1Wjl1rzti+xYtfJODRWi9J
	cegQ==
X-Gm-Message-State: APjAAAX/FYYQzwH+gDTM/K1GxZZ0rtdYkDhX9usnuTwjSIzkjUWqfZg1
	gV/qlEfp4ffl5u3qCQELEzIHXUXfo6/FCGA4ruEcug==
X-Google-Smtp-Source: APXvYqyuizJ0uwDCaI0Qki9ONNQuEyGr72xqry/LXGzu5gZ6EMESRXm5D0s9MKyTAp70XseR9kZvX9d2iA2rVBpq+w0=
X-Received: by 2002:aca:d40b:: with SMTP id l11mr9090442oig.132.1558347477424; 
	Mon, 20 May 2019 03:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <3fbd04e5-296a-ad1c-6456-a33b7273dc66@pseudoterminal.org>
	<CANNYZj_akDX1GqRvVfAqLQeei5fOxTet_RrVh2wc4=ySETXGtA@mail.gmail.com>
In-Reply-To: <CANNYZj_akDX1GqRvVfAqLQeei5fOxTet_RrVh2wc4=ySETXGtA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 May 2019 12:17:46 +0200
Message-ID: <CANNYZj8xxwv+Ej+pgxM0TtkbVMXZwnBqUeGJFazXbi4ecPJXGg@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Switching GStreamer recipes from autotools to meson
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
X-List-Received-Date: Mon, 20 May 2019 10:17:56 -0000
Content-Type: text/plain; charset="UTF-8"

By the way, if you don't mind, I would like to reassign the
mainteinrs.inc entry for the gstreamer recipes to you. You'll be
getting notifications from AUH when a new version of gstreamer is out
(with patches if it can be trivially updated to).

Alex

On Tue, 14 May 2019 at 12:21, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 14 May 2019 at 10:19, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> > GStreamer recipe upgrades to 1.16.0 have been sent in as a pull request
> > to meta-gstreamer1.0 . Once these are in, I'm considering to switch the
> > recipes to meson. Are there any potential issues with that? For example,
> > anything special about meson and GObject introspection I should know about?
>
> Actually, yes. Unlike autotools, meson does not have a standard option
> to enable/disable gobject-introspection, or gtk-doc.
> So most of the time you need to inherit the class (as before), and set
> GIR_MESON_OPTION to the name of the meson option that controls g-i,
> and/or GTKDOC_MESON_OPTION to the name of the option that controls
> gtk-doc.
> There are plenty of example in oe-core for this.
>
> Also, gstreamer recipes have a few patches that deal with
> autotools-specific g-i support, I guess those can be dropped.
>
> Alex

