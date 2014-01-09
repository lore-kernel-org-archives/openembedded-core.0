Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 99DA560D2D;
	Thu,  9 Jan 2014 15:12:51 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id db12so2435401veb.8
	for <multiple recipients>; Thu, 09 Jan 2014 07:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xPlNPJBRYwrmb25EScyYJqKTsub8aYxXtzxKWnrF0Wg=;
	b=TKo0voDp20W1fWqHFZDiTppkpsd683ryqN6BsibNBN183x0pRLr42+wNSdMSni0FOp
	JL7TVebNnzrhwPL4HoDc1kCPPuK1SMmBugP1SIC/wLDiqHv4UCRMt3cUPXU9IO24Sd3b
	e1u4eck2wGNcXX2EuUnYgicypn5AxmANN//vFMUspu+wZSuzDp4LxZfFVmQVphSa1mST
	J5fAmgqGHV4HjrSfy0ofmnpuI7+oC0u6jPnRvTrw/EaQeGwHDJWuprVAhP6GBCSGm3ad
	xD4MkFPeGst+mMODOR3JtVxjO6VWSmXflP5CL3EbRoMMsziiSAzMC5bYoqP9xFaKP+pF
	0w5g==
MIME-Version: 1.0
X-Received: by 10.52.66.205 with SMTP id h13mr2202110vdt.11.1389280372217;
	Thu, 09 Jan 2014 07:12:52 -0800 (PST)
Received: by 10.52.106.202 with HTTP; Thu, 9 Jan 2014 07:12:52 -0800 (PST)
In-Reply-To: <20140109144626.GG3709@jama>
References: <20140109144626.GG3709@jama>
Date: Thu, 9 Jan 2014 16:12:52 +0100
Message-ID: <CALbNGRQ5jDLUA80jmXeoHU8g-0k04UwgXGtdjL3xTJdG6heSKg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2014-01-09
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
X-List-Received-Date: Thu, 09 Jan 2014 15:12:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 9, 2014 at 3:46 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2014-01-09 ==
>
> === common (6) ===
>     * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_fetch
>     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compile
>     * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile

I have problems with qtwayland too and think that I am close to
understand what's going on (on 5.2 branch). Where do I find logs for
this error?

Andreas

