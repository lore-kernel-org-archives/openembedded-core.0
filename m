Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 132FE606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 13:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7HDTNm1007580; Mon, 17 Aug 2015 14:29:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2DZaFdndvu13; Mon, 17 Aug 2015 14:29:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7HDT7gw007574
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 17 Aug 2015 14:29:18 +0100
Message-ID: <1439818147.1218.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 17 Aug 2015 14:29:07 +0100
In-Reply-To: <55D1DBA7.800@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
	<993511190b981cc8f6dfbffca61b5d8c56a891a4.1439548737.git.alexander.kanavin@linux.intel.com>
	<1439730631.1218.25.camel@linuxfoundation.org>
	<55D1DBA7.800@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] rpm: update to 5.4.15
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
X-List-Received-Date: Mon, 17 Aug 2015 13:29:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-17 at 16:03 +0300, Alexander Kanavin wrote:
> On 08/16/2015 04:10 PM, Richard Purdie wrote:
> > Not sure what this was tested with but a simple "bitbake
> > core-image-minimal" breaks after this (and the db) change with licensing
> > failures.
> >
> > The autobuilder exploded with failures like:
> >
> > https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/430/steps/BuildImages_1/logs/stdio
> >
> > which are due to the installed manifest file listing installed packages
> > being empty.
> 
> I tested by running 'bitbake world' (which completed fine), but I wasn't 
> aware that 'world' doesn't include any images (why not?).

Rightly or wrongly we explicitly exclude images from world since in most
use cases the images take an age and are annoying in that context.

> I'll investigate what is happening.

Thanks,

Richard


