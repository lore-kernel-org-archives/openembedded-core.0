Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 79BC9731C2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 08:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u258msYY002427; Sat, 5 Mar 2016 08:48:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rJg0KCOQJ3Ng; Sat,  5 Mar 2016 08:48:54 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u258mokB002424
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 5 Mar 2016 08:48:51 GMT
Message-ID: <1457167730.2804.67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Sat, 05 Mar 2016 08:48:50 +0000
In-Reply-To: <CAJ86T=W42JcOp1_qDPFnFoipGO8qDTbg_XxVT528foXPT97itQ@mail.gmail.com>
References: <1457130807.2804.59.camel@linuxfoundation.org>
	<CAMKF1sqY+rsv8Hu5pi1tdvybQLp9Ro-HgZ3NZktvSiWhmVM00Q@mail.gmail.com>
	<CAJ86T=W42JcOp1_qDPFnFoipGO8qDTbg_XxVT528foXPT97itQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: uninative stdc++ abi
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
X-List-Received-Date: Sat, 05 Mar 2016 08:48:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-04 at 15:55 -0800, Andre McCurdy wrote:
> On Fri, Mar 4, 2016 at 3:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Sat, Mar 5, 2016 at 6:33 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > +# https://wiki.debian.org/GCC5
> > > +# We may see binaries built with gcc5 run or linked into gcc4
> > > environment
> > > +# so use the older libstdc++ standard for now until we don't
> > > support gcc4
> > > +# on the host system.
> > > +BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
> > > 
> > > Is this the right way to try and fix this? Any better ideas?
> > 
> > yes thats the best option we have given the myriad of build OSes we
> > have to support.
> 
> An alternative would be to configure our uninative gcc5 libstdc++
> with:
> 
> EXTRA_OECONF_append = " --disable-libstdcxx-dual-abi
> --with-default-libstdcxx-abi=gcc4-compatible"
> 
> Not sure if that's better though. Just a different approach to
> achieve
> the same thing.

We don't actually build our own gcc-native with uninative though, we're
trying to keep it small/fast and adding our own gcc doesn't really do
that.

I'm going to test the above and some other fixes on the autobuilder,
see how it looks.

Cheers,

Richard

