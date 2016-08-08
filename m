Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D919771C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 20:45:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2016 13:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,491,1464678000"; d="scan'208";a="1031976814"
Received: from kwang27-mobl8.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.179.174])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2016 13:45:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 09 Aug 2016 08:45:51 +1200
Message-ID: <4180524.BjivrXu0U0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.4-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1470643460.8166.35.camel@linuxfoundation.org>
References: <cover.1470627445.git.brian.avery@intel.com>
	<db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
	<1470643460.8166.35.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Mon, 08 Aug 2016 20:45:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 08 Aug 2016 09:04:20 Richard Purdie wrote:
> On Mon, 2016-08-08 at 08:27 +0200, Jacob Kroon wrote:
> > On 08/08/2016 05:43 AM, bavery wrote:
> > > The openssh-sftp-server was already part of the pakagegroup. Adding
> > > the openssh-server
> > > lets the sftp server start up correctly.
> > 
> > If openssh-sftp-server cannot run without openssh, shouldn't it
> > RDEPEND
> > on it instead ?
> 
> I suspect you are right and that it needs an RDEPENDS if it doesn't
> work without it. It also needs a comment explaining the dependency so
> someone doesn't remove it.

Using openssh-sftp-server with dropbear used to work, so it would be 
interesting to know when it broke and if it's possible to fix it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

