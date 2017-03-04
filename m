Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BD4AC60069
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 10:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v24AsXr1025237; Sat, 4 Mar 2017 10:54:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c4yYirafZBjI; Sat,  4 Mar 2017 10:54:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v24AsT5n025234
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 4 Mar 2017 10:54:30 GMT
Message-ID: <1488624869.22968.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 04 Mar 2017 10:54:29 +0000
In-Reply-To: <CAMKF1sqB7A9m2osnv9bwywRF5hT4-oNgKU+rLNyA8SD70n8Mbg@mail.gmail.com>
References: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1soCXsibCK37Az9MV1HMUpAK2dtWoijOxoBW25RoMhU+8g@mail.gmail.com>
	<CAJTo0LYPwxx18CtjJ_Rng28UhQAmJbMCw5=ebW2WkZmcALznUQ@mail.gmail.com>
	<CAMKF1sqB7A9m2osnv9bwywRF5hT4-oNgKU+rLNyA8SD70n8Mbg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Add libmpx supprt for x86
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
X-List-Received-Date: Sat, 04 Mar 2017 10:54:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-03-03 at 14:58 -0800, Khem Raj wrote:
> On Fri, Mar 3, 2017 at 2:54 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > 
> > On 3 March 2017 at 21:39, Khem Raj <raj.khem@gmail.com> wrote:
> > > 
> > > 
> > > > 
> > > > Enabling building the Intel Memory Protection Extension library
> > > > for x86.
> > > > 
> > > hope this works on amd chips as well ?
> > 
> > https://en.wikipedia.org/wiki/Intel_MPX
> > 
> > It depends on new instructions, so you'll have to ask AMD. :)
> OK if its not so then perhaps a bbappend in meta-intel is more
> appropriate.

Well, its part of gcc, not something meta-intel is patching in and its
a standard which other arches can implement, maybe in their own library
so I believe the recipe is the better place for this to live. I just
copied the description from the code iirc.

Incidentally, this fails to build on musl so I've just disabled it on
musl for now.

Cheers,

Richard

