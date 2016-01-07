Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 968CC60761
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u07GanX3003715; Thu, 7 Jan 2016 16:37:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SpdqelqxWDMm; Thu,  7 Jan 2016 16:37:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u07Gb7Aj003770
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 7 Jan 2016 16:37:08 GMT
Message-ID: <1452184627.7598.132.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Trevor Woerner <twoerner@gmail.com>
Date: Thu, 07 Jan 2016 16:37:07 +0000
In-Reply-To: <CAJTo0LaDS4+ETDGLc+Ja8Q+TjCOJ=xn6dSvO4UsNMnLUPhzkcw@mail.gmail.com>
References: <568DF5C6.90509@gmail.com> <568E1CB6.708@windriver.com>
	<568E86EF.5050408@gmail.com>
	<CAJTo0LaDS4+ETDGLc+Ja8Q+TjCOJ=xn6dSvO4UsNMnLUPhzkcw@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: invoking a native compiler (gcc)
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
X-List-Received-Date: Thu, 07 Jan 2016 16:37:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-07 at 15:46 +0000, Burton, Ross wrote:
> 
> On 7 January 2016 at 15:40, Trevor Woerner <twoerner@gmail.com>
> wrote:
> > I was surprised to find that BUILD_CC is being set to whatever
> > comes up
> > first in our build computer's PATH. But I guess the alternative
> > would be
> > to make our builds longer by compiling our own native compiler for
> > such
> > cases.
> > 
> You could always set BUILD_CC to explicitly point to the right
> compiler on your machine.  When I was trying to make OE work on
> Darwin I had to set BUILD_CC to point at brew's gcc binaries.

Or you setup PATH to include things in the right order as we do with
other native tools...

Cheers,

Richard

