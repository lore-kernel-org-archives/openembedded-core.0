Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 077916B11A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 12:12:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	x2BCCkb7030396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 11 Mar 2019 12:12:49 GMT
Message-ID: <4dacf2835bc4af256257c7b9455b15bc1e2b6f15.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, Victor Kamensky <kamensky@cisco.com>
In-Reply-To: <CAMKF1sp9pjSGOgdv_+k-sqA-sghbxyixK3rb513aRCa5GEtiXA@mail.gmail.com>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190311031230.21497-4-richard.purdie@linuxfoundation.org>
	<CAMKF1sp9pjSGOgdv_+k-sqA-sghbxyixK3rb513aRCa5GEtiXA@mail.gmail.com>
MIME-Version: 1.0
Date: Mon, 11 Mar 2019 12:12:39 +0000
User-Agent: Evolution 3.31.90-1 
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] linux-yocto: Fix systemtap issue on armv7
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
X-List-Received-Date: Mon, 11 Mar 2019 12:12:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-03-10 at 21:27 -0700, Khem Raj wrote:
> On Sun, Mar 10, 2019 at 8:13 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Testing stap on armv7 machines was failing due to intermixing of
> > thumb/arm
> > instructions. Patch the kernel to always use the v7 march options
> > since
> > we know our gcc versions support it to avoid the failure and allow
> > systemtap to work.
> > 
> > [YOCTO #13153]
> > 
> 
> please use the fix that Victor submitted upstream, that way we dont
> need workaround.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-March/637809.html

I have a feeling that patch may get some discussion upstream. I was
going to say that the version we're working with is simpler and easier
to work with until upstream decide what the right approach is. Victor
as already pointed out that even then I messed it up slightly!

I certainly appreciate getting something upstream and that is the right
thing to do, I think a simpler workaround for us is fine until that
gets sorted out though.

I'm particularly conscious that we've not built M3 yet and that Bruce
has limited availability due to travel so we have a few constraints
here.

Cheers,

Richard


