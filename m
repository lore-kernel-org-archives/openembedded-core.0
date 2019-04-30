Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4867D9E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 10:49:08 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k6so10851306oic.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YSz2FAG0MVSkoe3GhTpakNmsYzNCdykF4JKPmtfK5Hs=;
	b=N8ax4mOMvOIG7Lam7G+07S1YYOVTx0PMBPKR4SuDfd5pawO1eOutHcxG0AtrhrXk72
	oHvS2YoaMCjFIjN+l0ReRSPiTuWFH9miZElm+GxM2siAIkMlthkiCN/9my2M//EM+xJ6
	snJrzla8/gbnIxAape70DedCr3U63FeCMjf1fL42g6ApHVsHizvUhpjMjbpbW4C0gAo7
	6/Fpx2fM3Eq/EeAeoVu00Ur86W9Wj3scSpWLEy0Jusgn5YO4OYeTqNZB0Ty2MG9hv52g
	cxpxTdwI+stf2XUgjQrrTJV26dv2NmR9VQdmfD7jog41oYMIuogIFdat3pysn5H3wyQM
	0bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YSz2FAG0MVSkoe3GhTpakNmsYzNCdykF4JKPmtfK5Hs=;
	b=bCM43K6jqmS2s3mjdwuoOCmytE/G7dYenfcPLjwb1HUWcBVSMUFkpQptY/2jjwWrlE
	9lghqAJsREHtbfhBdZqt2FkHCws9bPbrxebx+9pKEld3aDAZayhMpTVL7SNKcCTjNEs2
	ftuYR9dzIV/3/AyJyanxIggjd7WilbbS6+8ahcVChJNb74YnoQ6fjm4bCn32C1n7xrCR
	wmhrPA//7TuP4qYMbNeMorABNVtez+FmVtEzfd/ZJKlyyufWCz+VPTM8Sn8LD/a6c1GA
	9Q6LQMw/eA99rfaWg4Phz8idLsT+hm/l1l2uGcLwGw9VneyuVs/vBoA+emmRMqNClun8
	1RZw==
X-Gm-Message-State: APjAAAVa06Dkc7CzLdMElpjVeFVMzGFg1mHT55FlDi07TLiKDXNq9I8V
	jgIpTOHk1cBKFrKmvXH5hSsq4ERf5E6F8S3aLVk=
X-Google-Smtp-Source: APXvYqw4LqSh33/yGmLmLIJj9P+qIuM7+f3j0Uk0ai1F3FEvQRNMsz4y+3myfbDb+c+Nwu+DFzAJYrij5hXMFSvUq+A=
X-Received: by 2002:aca:e689:: with SMTP id d131mr2630972oih.132.1556621349564;
	Tue, 30 Apr 2019 03:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190429140730.2899-1-schnitzeltony@gmail.com>
	<20190429140730.2899-2-schnitzeltony@gmail.com>
	<323098102d47a837b953a3c399f8db65b1c43349.camel@linuxfoundation.org>
	<CALbNGRRuLKUfornkTS6e2PBskpyxuWo-XnLrd=boHYPJMkDhhQ@mail.gmail.com>
	<19fa74d55f965241b227fd1e63241be600f93b5a.camel@linuxfoundation.org>
In-Reply-To: <19fa74d55f965241b227fd1e63241be600f93b5a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Apr 2019 12:48:58 +0200
Message-ID: <CANNYZj9VG3Ty8OLyft2Hn67AvYYUeqknaU1kdBgb1zeRW+o3Dw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] vte-native: reduce c++ requirements from c++17 -> c++14
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
X-List-Received-Date: Tue, 30 Apr 2019 10:49:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Apr 2019 at 23:22, <richard.purdie@linuxfoundation.org> wrote:
> > Let's decide some option: I really would like to close this and I
> > have no problem with either way - gnome-terminal can wait. Gnome
> > stuff just hobby to me and for test I can add recent vte in my
> > personal meta-verse.
>
> Agreed, we need to make a decision, I'm just making sure we have all
> the options and then we "just" need to figure out which one to go for.
>
> vte-native of an older version is looking like the best option unless
> Alex says I'm mis-remembering...

I checked what --enable-vte actually does in combination with the gtk
UI in qemu, and it makes the serial console tab in the gtk ui behave
like a real gnome-terminal tab (selection, scrolling etc). In the
absence of vte support, the serial console tab is still there and you
can still log in and issue commands, but it is more "dumb" regarding
terminal capabilities. This serial console is an addition to the main
tab where the output from the virtual graphical card goes.

So to conclude: we can split the vte option into its own
PACKAGECONFIG, and leave it disabled for native. I would rather do
this, than make vte and vte-native versions diverge.

Alex

