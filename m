Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 728F7607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 13:20:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2013 06:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="365284467"
Received: from unknown (HELO helios.localnet) ([10.252.121.242])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2013 06:20:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 04 Jul 2013 14:20:03 +0100
Message-ID: <1511482.DTA2BPqVAC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAP9ODKrXD9MzMTdqXTWNFiShCPv9TsRXFPcP9AEwQcSPuQjmCQ@mail.gmail.com>
References: <1372871077-6363-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAP9ODKrXD9MzMTdqXTWNFiShCPv9TsRXFPcP9AEwQcSPuQjmCQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: disable qmeegographicssystemhelper
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
X-List-Received-Date: Thu, 04 Jul 2013 13:20:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 July 2013 10:10:52 Otavio Salvador wrote:
> On Wed, Jul 3, 2013 at 2:04 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > We don't want this enabled just because we have EGL and OpenGL ES 2.0
> > enabled.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Agreed; maybe this could be considered for dylan as well?

Sounds reasonable to me; once it's merged to master I will include it in my 
queue for dylan. 

To be honest it would be nice if it were fixed properly upstream; building it 
based on the conditional given seems wrong.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

