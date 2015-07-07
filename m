Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 76AAF737F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 23:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t67N4r4M003897; Wed, 8 Jul 2015 00:04:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vM2dGsPxnCQj; Wed,  8 Jul 2015 00:04:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t67N4anW003893
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Jul 2015 00:04:48 +0100
Message-ID: <1436310276.27597.198.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 08 Jul 2015 00:04:36 +0100
In-Reply-To: <CAJ86T=Vb889E6fcJJyN93MRwUfbShLrSa1S-79sQyoSHChYnYg@mail.gmail.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com> <20150707053411.GA17548@ad.chargestorm.se>
	<CAJTo0Lb87w=NO5o-0_vcz29UO0JrVTahEg5c1VhQnVDNCma2wQ@mail.gmail.com>
	<559C320F.4020707@gmail.com>
	<CAJTo0LYLzjMAWYJQH3g0sGzZgdPtPXjthJCAgVuh=ux1mgm5Kw@mail.gmail.com>
	<CAJ86T=Vb889E6fcJJyN93MRwUfbShLrSa1S-79sQyoSHChYnYg@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Tue, 07 Jul 2015 23:04:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-07 at 14:03 -0700, Andre McCurdy wrote:
> On Tue, Jul 7, 2015 at 1:30 PM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 7 July 2015 at 21:09, akuster808 <akuster808@gmail.com> wrote:
> >>
> >> which recipe? 2.7.1 / 3.1 or both?
> >>
> >> - armin
> >> ( sucks at this licensing stuff)
> >
> >
> > So: 2.7.1 is "LGPL" (v2).
> >
> > 3.1.1 is GPLv2+ or LGPLv3+.
> >
> > An "interesting" choice to say the least. Because the v2 bit is not L, I'm
> > wondering if we will need to keep both versions.  But a 3.1.1 recipe with
> > GPLv2+ *or* LGPLv3+ would be a good start.
> 
> I'd vote YES to keeping the LGPLv2 version available.
> 
> GPL libraries are normally off limits for closed source apps, so the
> new licensing options would be a problem for anyone with a proprietary
> application using nettle in a distro which can't use [L]GPLv3. (I'm in
> that category...).

Surely if you can't use [L]GPLv3, you want the 3.1.1 version which is
GPLv2 (or other things)?

Cheers,

Richard




