Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 969CD6041F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:06:00 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id m17so3037556vca.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=S0YDAoYDEZIdRa2yJK9lHgMgmGOS8JK7qAdrWObJqPY=;
	b=O6yTPrU0VpJ6Am95NukIJxgmFHkuumbsvenRSqUH0NNNRnHrTs1RCN14YvUhujpnHf
	sIDZNvEJ1796Yl/5q/xcebyNMxIGHMqX68Z3nzXEYPD/lkSjj6jFoxGM+6aHXEqjg7Ji
	UTSXkA/pPmDbA8T5FjkdoSladdAMgYLD+TohXggbDKEwpF4d14LkuwGIWWYDhQKfTXSl
	tQsdQu1bIc6D+735ATBJDivNLOT/WX28E3rsJCgSibF646w+HFy1OwpH53pZYN5t2Hmj
	eVmJQQOObbj/2oEReABH8VLbhPI4K5+yqDiRG8Aj+eOl7oN6N5Dva6glYVs3ZJlTcQak
	VApQ==
X-Received: by 10.52.29.106 with SMTP id j10mr1615787vdh.77.1371567961398;
	Tue, 18 Jun 2013 08:06:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 18 Jun 2013 08:05:41 -0700 (PDT)
In-Reply-To: <1371567621.3466.16.camel@localhost>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
	<CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
	<1371567621.3466.16.camel@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 16:05:41 +0100
Message-ID: <CAJTo0LbT7ZbbmbibLCzOvv4a2939-Hr8uGEoUqg2sRVgEOCqmQ@mail.gmail.com>
To: Colin Walters <walters@verbum.org>
X-Gm-Message-State: ALoCoQk+JZazjJBZ12u6CJ936R+FdQLlCPdF/l7Kf6VziQVSXkDGIqf1pCx0tdWWSMW3ftZ0gxc1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 15:06:01 -0000
Content-Type: text/plain; charset=UTF-8

On 18 June 2013 16:00, Colin Walters <walters@verbum.org> wrote:
> The relevant data I have on hand are:
>
> https://bugzilla.gnome.org/show_bug.cgi?id=654013
> https://git.gnome.org/browse/jhbuild/commit/?id=965c8d5ceda9d1c5d6021ef2c534e0a7f68ca976
>
> I think the executive summary is that libltdl knows how to load .so
> files directly (at least currently), so there's no reason to have even
> ${libdir}/modulename/plugins/foo.la.

Thanks Colin.  Let's ignore the "libdir" option so this is a
per-package keep-or-wipe option.  I'd like to default it to removing
all by default after a verification that the build results are
identical.

Ross

