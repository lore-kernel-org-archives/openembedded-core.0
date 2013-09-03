Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 114846BAAE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:57:53 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id ox1so4316273veb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 11:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=h+QUg1P736j6d3rheziyt0mb3PYd7U410fAhPSvZ860=;
	b=PSLXyzPkXy6kzrCv1fz9+Fp/n34VG/jEdRq1bzeK/GDjUrt3BUCW9Q/wFKAEtJbOGM
	defe7FeZmIDiAqdS2lARe4sqRdrLizja0I0RmBlDFXvtXjQWoQBNOEkV7wnDGP+OytWd
	opVGAnWPX/7oKwHd/BpfalK7vmPby6m1SUDJJ4cnujUAS6Y97TplTWV9M0J5HvnedISh
	mB+W+GA9sCCOEop6UcJ87yX5yMkz02oKq4HQmu2z4vGFe7Y6YH5EIGof8zSr2A6XtpcJ
	vn7zjELowNlqAQ3TOaV2ZNrOwBpBEMlGZZjw3bLvB9t9nxlHTj0bBWDKfWDwMmizDrDc
	EN+A==
X-Gm-Message-State: ALoCoQnbLMdlwXwuE/lMywh6vhj1zwXJDKEN8SK4s5tTsRUBMUgDZX5U5ZOZBKhBWaZ0rB2fmNOT
X-Received: by 10.52.119.228 with SMTP id kx4mr3883206vdb.12.1378234674753;
	Tue, 03 Sep 2013 11:57:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 11:57:34 -0700 (PDT)
In-Reply-To: <CAJTo0LbvXZ08r2AY1=_JUmeJ50rL25WP_6yM69f7WUXnmoiMKg@mail.gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<ec8f1bdec56b09ad884f0c19fb5e4eea256e846e.1377792006.git.Martin.Jansa@gmail.com>
	<CAJTo0LYV_0=7A93hdVnKK=hOm8BQJ_oNh7K0thEQZusPaDw1XQ@mail.gmail.com>
	<20130903180847.GC11500@jama>
	<CAJTo0LbvXZ08r2AY1=_JUmeJ50rL25WP_6yM69f7WUXnmoiMKg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 19:57:34 +0100
Message-ID: <CAJTo0LaB75_mQG7CP7gEmt1nwd2DxPkzGQsj_nQ9dQv=68biqg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 08/20] telepathy-mission-control: Add PACKAGECONFIG for upower and connectivity
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
X-List-Received-Date: Tue, 03 Sep 2013 18:57:54 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2013 19:51, Burton, Ross <ross.burton@intel.com> wrote:
> Ah, so mission-control is Doing It Wrong - that .pc file is for
> connman plugins.  I'll harass upstream but I do wonder what the script
> is detecting as there isn't anything like a libconnman.so to link
> against.

So upstream has already fixed this by deleting all of the code and
using GLib instead.  A worthy approach, and when they release we can
ditch the PACKAGECONFIGs.

Ross

