Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id E5A606CB9B;
	Mon,  2 Feb 2015 10:55:07 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id vy18so16667574iec.5;
	Mon, 02 Feb 2015 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l/xS5tMIfJbZMGyid3dC1cuNl6dg7NCqnFnXLg6YL8A=;
	b=n0sr2LJXubNPt34ssTh0daK7/g2uuTIisUCUBC5JpKXpwdZD6K1xjpfmITz5mJ6grI
	dODXgpC3EIv2hNCBlAZ+tnGZ7VqsHMddHQyV9HIF/+D5RvhjtblWGay5TozcMaWfcuH+
	npyYjsYYyIKymV+Vz8fxLIqx8W22+JdAz7xVamABPHOEWg6b4cM/rrscpKHXTLi02VxA
	5qjOSE1zOjMc7Bj/zhwQwl1E6aqZDUw0OSgtdn7Nk+9ReuudFblCZgldzPbVz3Twa2ut
	bUUE4zGXtzC/R3HBYpbt/40kEoEAxUVkXQtdSqMF9Njjf6OBgUiPV9usEobv6PIUhrcv
	kmeQ==
X-Received: by 10.50.137.99 with SMTP id qh3mr10889108igb.7.1422874504303;
	Mon, 02 Feb 2015 02:55:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Mon, 2 Feb 2015 02:54:34 -0800 (PST)
In-Reply-To: <CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Feb 2015 02:54:34 -0800
Message-ID: <CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 10:55:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 2, 2015 at 2:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
> cross-localdef-native:
>
> | In file included from glibc/locale/programs/locarchive.c:696:0:
> | glibc/locale/programs/../../intl/l10nflist.c: In function
> '_nl_normalize_codeset':
> | glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing binary
> operator before token "("
> | glibc/locale/programs/../../intl/l10nflist.c:313:9: error:
> '_nl_C_locobj_ptr' undeclared (first use in this function)
> | glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each undeclared
> identifier is reported only once for each function it appears in


gcc would work with latest tree but I did not run into this error. So
wait a while until I get to it.

