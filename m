Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 490AE719AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 22:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u93M9Lno010730; Mon, 3 Oct 2016 23:09:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QSMA0gFoFm2Z; Mon,  3 Oct 2016 23:09:21 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u93M9Igo010726
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 3 Oct 2016 23:09:19 +0100
Message-ID: <1475532558.30475.338.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Mon, 03 Oct 2016 23:09:18 +0100
In-Reply-To: <CADkTA4OTjXYScwAfUdjM8-LcRqbbX9g50OJ9ZAqfy+KDEF-nbQ@mail.gmail.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
	<CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
	<d5b8ad07-09f4-bb3e-46ed-3a93df33ba76@windriver.com>
	<CADkTA4OX5OYXTRaP_JxWhE6CNYq20LXA6e5X4OOEf9=7w3trew@mail.gmail.com>
	<CAJTo0LYmZcbyNDW-2smOhvgJv_xi=3mBjmVkrj+u0yYPwosEVA@mail.gmail.com>
	<CADkTA4MpPtH=-1sELLT9kO0ax-frVsagF5PjiccEZdMJ+DXduQ@mail.gmail.com>
	<CADkTA4OTjXYScwAfUdjM8-LcRqbbX9g50OJ9ZAqfy+KDEF-nbQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated (and hopefully final) pull request
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
X-List-Received-Date: Mon, 03 Oct 2016 22:09:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-10-03 at 12:55 -0400, Bruce Ashfield wrote:
> 
> 
> On Mon, Oct 3, 2016 at 12:07 PM, Bruce Ashfield <bruce.ashfield@gmail
> .com> wrote:
> > 
> > 
> > On Mon, Oct 3, 2016 at 12:03 PM, Burton, Ross <ross.burton@intel.co
> > m> wrote:
> > > 
> > > On 3 October 2016 at 16:57, Bruce Ashfield <bruce.ashfield@gmail.
> > > com> wrote:
> > > > Out of curiosity, what image type is this ?  built core-image-
> > > > sato, kernel-dev for
> > > > x86-64 and they all worked.
> > > > 
> > > net-tools (via core-image-full-cmdline -c populate_sdk) for
> > > intel-corei7-64.
> > > 
> > 
> > ok. I've reproduced the failure by building just that package, with
> > any luck I can spin
> > something for it in the next few minutes and then launch a full
> > build of that image.
> > 
> > 
> patch sent. I can now build net-tools, and I launched a full build of
> core-image-full-cmdline.
> The clock is ticking on me now .. but I'll be around for another hour
> to monitor things.=

I've been running builds and it seems things are looking much greener
now FWIW!

Cheers,

Richard

