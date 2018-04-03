Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 536F86004D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 13:59:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w33Dx9KZ030452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 3 Apr 2018 14:59:10 +0100
Message-ID: <1522763949.11431.235.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Jonathan Liu <net147@gmail.com>
Date: Tue, 03 Apr 2018 14:59:09 +0100
In-Reply-To: <CADkTA4PPm8GXxWAEk_yigy-7=xY1-ARfjKJW2CW__qbypDsizQ@mail.gmail.com>
References: <20180403042331.24524-1-net147@gmail.com>
	<CADkTA4PPm8GXxWAEk_yigy-7=xY1-ARfjKJW2CW__qbypDsizQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Tue, 03 Apr 2018 13:59:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-04-03 at 08:58 -0400, Bruce Ashfield wrote:
> On Tue, Apr 3, 2018 at 12:23 AM, Jonathan Liu <net147@gmail.com>
> wrote:
> > 
> > Set KBUILD_BUILD_VERSION=1 to avoid build version being incremented
> > on
> > every build. It is visible in the output of "cat /proc/version"
> > after
> > the hash character.
> It is possible that someone might actually want this feature, for
> debug or
> different build variants.
> 
> So this would be better as a variable that can be overridden.

Surely users can override it in this form (like the USER/HOST variants
already there)?

Cheers,

Richard

