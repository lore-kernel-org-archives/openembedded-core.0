Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 051797846A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 11:39:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7IBb5Fd032764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 18 Aug 2017 12:37:06 +0100
Message-ID: <1503056225.32591.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 12:37:05 +0100
In-Reply-To: <1503056025.32591.10.camel@linuxfoundation.org>
References: <cover.1502989095.git.alejandro.hernandez@linux.intel.com>
	<1503051783.32591.9.camel@linuxfoundation.org>
	<1503056025.32591.10.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 18 Aug 2017 12:37:07 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/3] Restructure python2 and python3 packaging system
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
X-List-Received-Date: Fri, 18 Aug 2017 11:39:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-08-18 at 12:33 +0100, Richard Purdie wrote:
> On Fri, 2017-08-18 at 11:23 +0100, Richard Purdie wrote:
> > 
> > On Thu, 2017-08-17 at 10:11 -0700, Alejandro Hernandez wrote:
> > > 
> > > 
> > > The reason we have a manifest file for python is that our goal is
> > > to
> > > keep python-core as small as posible and add other python
> > > packages
> > > only when the user needs them, hence why we split upstream python
> > > into several packages.
> > > 
> > > There are many problems with our current implementation of the
> > > manifest file, this patch tries to deal with all of them along
> > > with
> > > adding several other features.
> > > 
> > > This patch adds a new task to python recipes, which is meant to
> > > create a new manifest file every release.
> > https://autobuilder.yocto.io/builders/build-appliance/builds/416/steps/BuildImages_1/logs/stdio
> https://autobuilder.yocto.io/builders/nightly-packagemanagers/builds/68/steps/Running%20Sanity%20Tests/logs/stdio
> 
> (no fcntl module)

https://autobuilder.yocto.io/builders/buildtools/builds/409/steps/BuildImages/logs/stdio

Cheers,

Richard



