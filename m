Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFAC77D81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 09:27:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8B9QrJB028761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 11 Sep 2017 10:26:54 +0100
Message-ID: <1505122013.18640.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <mnhu@prevas.dk>, Paul Barker
	<pbarker@toganlabs.com>
Date: Mon, 11 Sep 2017 10:26:53 +0100
In-Reply-To: <aa0e9f4b-bc55-8f25-ab72-efdeca0f7c17@prevas.dk>
References: <20170821083946.4493-1-mnhu@prevas.dk>
	<20170821092134.6329-1-mnhu@prevas.dk>
	<CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
	<20170908203726.GG26405@denix.org>
	<75F5325D-9BEC-49A6-AEF8-75448B46BCF7@prevas.dk>
	<CAPyrkgyzzfR7jmeyJURRyPra4Jd2CPKWMiJbEPR3a8W=h+4W+A@mail.gmail.com>
	<aa0e9f4b-bc55-8f25-ab72-efdeca0f7c17@prevas.dk>
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
X-List-Received-Date: Mon, 11 Sep 2017 09:27:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-09-11 at 09:02 +0200, Martin Hundebøll wrote:
> 
> On 2017-09-08 23:29, Paul Barker wrote:
> > 
> > On Fri, Sep 8, 2017 at 10:07 PM, Martin Hundebøll
> > <martin.hundeboll@prevas.dk> wrote:
> > > 
> > > 
> > No, you'd need it to be set in a conf file so it takes effect when
> > the
> > kernel-base package is created.
> > 
> > I can see the issue here though. Can you set `RDEPENDS_kernel-base
> > =
> > ""` globally and explicitly install kernel-image into the
> > appropriate
> > image? If not then yes we'll need to find an alternative solution
> > to
> > simply reverting the change.
> > 
> Seems like the inverted approach of disabling install of kernel-
> image 
> globally, and enabling it per-image works just fine.
> 
> Reverting the patch is fine by me - sorry for the noise.

Are you sure? I can't imagine being able to influence this at all from
an image recipe, either the dependency is present or its not and it
would be set from the global configuration, not from an image recipe...

Cheers,

Richard

