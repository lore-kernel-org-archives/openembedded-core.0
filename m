Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DCD4F77EE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:51:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8BCopH1016037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 11 Sep 2017 13:50:52 +0100
Message-ID: <1505134251.18640.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <mnhu@prevas.dk>, Paul Barker
	<pbarker@toganlabs.com>
Date: Mon, 11 Sep 2017 13:50:51 +0100
In-Reply-To: <a52ee58f-6ede-006d-750a-38b5d5f59b8a@prevas.dk>
References: <20170821083946.4493-1-mnhu@prevas.dk>
	<20170821092134.6329-1-mnhu@prevas.dk>
	<CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
	<20170908203726.GG26405@denix.org>
	<75F5325D-9BEC-49A6-AEF8-75448B46BCF7@prevas.dk>
	<CAPyrkgyzzfR7jmeyJURRyPra4Jd2CPKWMiJbEPR3a8W=h+4W+A@mail.gmail.com>
	<aa0e9f4b-bc55-8f25-ab72-efdeca0f7c17@prevas.dk>
	<1505122013.18640.1.camel@linuxfoundation.org>
	<a52ee58f-6ede-006d-750a-38b5d5f59b8a@prevas.dk>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-module-split: rrecommend kernel-image instead of rdepend
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
X-List-Received-Date: Mon, 11 Sep 2017 12:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-09-11 at 14:19 +0200, Martin Hundebøll wrote:
> 
> On 2017-09-11 11:26, Richard Purdie wrote:
> > 
> > On Mon, 2017-09-11 at 09:02 +0200, Martin Hundebøll wrote:
> > > 
> > > Reverting the patch is fine by me - sorry for the noise.
> > Are you sure? I can't imagine being able to influence this at all
> > from
> > an image recipe, either the dependency is present or its not and it
> > would be set from the global configuration, not from an image
> > recipe...
> Pretty sure, yes.
> 
> conf/distro/basic.conf:
> RDEPENDS_kernel-base = ""
> 
> recipes-filesystems/rootfs.bb:
> IMAGE_INSTALL += "kernel-image kernel-module-foo"
> 
> recipes-filesystems/rescuefs.bb:
> IMAGE_INSTALL += "kernel-module-foo"

Now I understand, I thought you meant adding in the RRECOMMENDS from an
image recipe.

Thanks,

Richard

