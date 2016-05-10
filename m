Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF0D605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 13:46:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 10 May 2016 06:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,604,1455004800"; d="scan'208";a="976616949"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.30.34])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2016 06:46:14 -0700
Message-ID: <1462887973.4358.13.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 14:46:13 +0100
In-Reply-To: <573100BD.9020907@gmail.com>
References: <1461867811-7837-1-git-send-email-akuster808@gmail.com>
	<1462355553.6485.5.camel@linux.intel.com> <572A0450.10100@mvista.com>
	<1462400231.6485.19.camel@linux.intel.com> <572CBC7E.9080407@gmail.com>
	<572CBD85.8040500@linux.intel.com> <573100BD.9020907@gmail.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [master][krogoth][PATCH 1/2] qemu: Security fix CVE-2016-2857
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
X-List-Received-Date: Tue, 10 May 2016 13:46:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-09 at 14:27 -0700, akuster808 wrote:
> On 5/6/16 8:51 AM, Alexander Kanavin wrote:
> > 
> > On 05/06/2016 06:47 PM, akuster808 wrote:
> > 
> > > 
> > > I can not reproduce this issue. I have used two different build
> > > systems.
> > > I have another I will try.
> > > 
> > > so the testcase be?
> > > 
> > > 1) bitbake core-image-sato
> > > 2) runqemu qemux86
> > 3) verify that you have a bunch of .gir and .typelib files on that
> > image (or in target sysroot)
> yeah. they are there. wonder how to reproduce this issue?? host os
> release??

I discovered this issue on an Ubuntu 14.04.4 host (gcc 4.8.4) where
neither qemu-native nor gobject-introspection were available in the
sstate-cache. I can revert the qemu upgrade and attempt to reproduce
again if it would help?

Joshua

> 
> - armin
> > 
> > 
> > 
> > Alex
> > 

