Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5A56965CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 18:13:15 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so85567805igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l8geLhuoagRFF1pypOVTJ+3sxM4x0WSKc5H2JGfuFvE=;
	b=q1vwg0NS8cTOXplmPl9h9SF9+qS/UjSiIUqXXsvim7xj2S7RqBPfpkkWtdf7PYY2lt
	j8EnoCdrcitws8lFyz1PAeOtj5LfenfIXUHknzNE/ZeAaBtwYD9Nz6qpUh25PY1QpcHB
	l0lDrrpRpxic32ZXCvDX8M/mbcoyBRF5+R9cem8+tifTF7ixPXb3a8NxDaGAWBFP8yF/
	Hk51+Fv316mD7B30Ya+fW8F/1uegM4HWGpmPvx13eG9x9FBwyWkyliDgm3eoYjNga1hh
	wMpAKiRxEBdIQ1O0yjoT2eClG5/fvWvi/DGmtDWFe+GYxbo8U8ygCGqhmiTXiQMy7gI6
	AXVw==
X-Received: by 10.50.117.100 with SMTP id kd4mr41173500igb.75.1441735996051;
	Tue, 08 Sep 2015 11:13:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 8 Sep 2015 11:12:46 -0700 (PDT)
In-Reply-To: <CAJTo0LZL5H1uW7nZzyT5q51=2RxmiRr8vAAn4n0e1kKUjrN7ag@mail.gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
	<4A72FD2B-1B79-4827-B02E-E3B23A966AE7@gmail.com>
	<1441659401.24871.261.camel@linuxfoundation.org>
	<956735BC-7AA6-4513-AA09-3FBFD3250428@gmail.com>
	<1441660176.24871.268.camel@linuxfoundation.org>
	<E437DE0B-65F0-42B4-B061-BC30F27A24B8@gmail.com>
	<CAJTo0LZL5H1uW7nZzyT5q51=2RxmiRr8vAAn4n0e1kKUjrN7ag@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Sep 2015 11:12:46 -0700
Message-ID: <CAMKF1srhnB4fnWKrL9QkO19XdUuOQM_+bmbJ=zYAYSJ9Mfe_Rg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Tue, 08 Sep 2015 18:13:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 8, 2015 at 3:31 AM, Burton, Ross <ross.burton@intel.com> wrote:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=e67ab458ab2d67908d80f9aa1954dee05cb21fc1
> is the patch to run the tests in a nographics qemu.  The framework still
> checks that DISPLAY is set, but you can just set that to anything you want
> as it won't be used.

yeah, ideally the check should be removed now that it becomes useless
with this patch. May be you want to improve above mentioned patch to
account for that as well.

