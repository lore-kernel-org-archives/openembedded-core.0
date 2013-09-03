Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 76ED06BE32
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 10:18:02 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id ha12so3686148vcb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 03:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ohn2O0XguehjvrkLQ7enp1YLLyFSmyMaJZrikcU/ggc=;
	b=EPaGD7eXl/Y3S+w0ptBV2ICNGDclIV+G+chcVK0uIK2AuD0aPB9GAhfY6EfSE1Y/qP
	mb2hjh+BFfnu68GWi9s8vtTKolp2tZKMvGSlooLnQ8gesq6Rxqy+mDAGlVS+eeLPN0qg
	1pEJHwAvGW3N0EU8XRhY3LYoDEy+Z9mmAbwqGc9otXggv2Kykg2Cp/zMHI0t1n1BYRJo
	qX0sNS23TQEkXLrPRtvsgA1Z62rxgLnSCutSNM4+f34KgT5fg6OlKj1IeHGKr08vPk60
	h/VDV667c4lcgKKJrfQnHJR2qj0TxnSP68sQ+F5hXSD7DSm2f2cYXMiOAf64A1mevPK9
	IDUA==
X-Gm-Message-State: ALoCoQkVaJcnkGEkhEyiY5/QnrWSzAZJHDDgkXLImvxtR5zUDPkm6xd9rUy/nVnEf6gmN/Co9yam
X-Received: by 10.52.103.35 with SMTP id ft3mr22984784vdb.5.1378203482885;
	Tue, 03 Sep 2013 03:18:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 03:17:42 -0700 (PDT)
In-Reply-To: <1377874783.1059.98.camel@ted>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<e77564486cce8199bd317f1ee79adb4f8b508ffa.1377792006.git.Martin.Jansa@gmail.com>
	<521F898F.1060209@linux.intel.com> <1377874783.1059.98.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 11:17:42 +0100
Message-ID: <CAJTo0Lbs7L4aWDyPTYsgGZn8S2erE4HzDegvgya8uU9V06S_gg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 17/20] librsvg: Fix dependencies for PACKAGECONFIG gdkpixbuf
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
X-List-Received-Date: Tue, 03 Sep 2013 10:18:03 -0000
Content-Type: text/plain; charset=UTF-8

On 30 August 2013 15:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> I think this needs to be a target only PACKAGECONFIG, as it will try to
>> depend on gtk+-native when building the librsvg-native.
>
> Also do we really need gtk for the pixbuf loader? gtk2 theme engine
> pulls in gtk+ elsewhere?

gdk-pixbuf should be sufficient.

Ross

