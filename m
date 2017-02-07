Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD626FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 20:42:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v17Kgqqw006412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Feb 2017 12:42:52 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.60.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Tue, 7 Feb 2017 12:42:52 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Feb 2017 15:42:51 -0500
Message-ID: <3297179.xx9JVsYUTI@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.8.0-37-generic; KDE/5.26.0; x86_64; ; )
In-Reply-To: <2301139.i2tsUjesZx@peggleto-mobl.ger.corp.intel.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAMKF1sqJSgjLMOPo7pkpfNDUOWLu4R0F9BNzbPFzWYgha5gwHw@mail.gmail.com>
	<2301139.i2tsUjesZx@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Tue, 07 Feb 2017 20:42:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, February 8, 2017 9:17:48 AM EST Paul Eggleton wrote:
> On Tuesday, 7 February 2017 9:44:46 AM NZDT Khem Raj wrote:
> > On Tue, Feb 7, 2017 at 9:35 AM, Burton, Ross <ross.burton@intel.com> 
wrote:
> > > On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
> > >> This is converging the recipes for go from
> > >> meta-virtualization and oe-meta-go
> > > 
> > > I'm still of the opinion that this should be in meta-go, not oe-core...
> > 
> > I think we have to make multiple layers agree on using one layer
> > I find atleast 3 which carry go recipes along with, if its in OE-Core
> > either these layers become redundant or layers which are housing go
> > recipes for
> > different purpose like meta-virtualization can then drop the compiler
> > recipes it will be easier from consolidation point of view.
> > 
> > if we dont want to take it into OE-Core, we should create a new layer
> > meta-golang on yp git and then help request community to converge to
> > it, it still can be ignored by layers.
> 
> Have we tried asking all of the various people involved if they'd mind
> working together? If not, I have my doubts as to whether putting it in
> OE-Core is going to entirely resolve the situation.

I have done a bunch of the work for go support in meta-virtualization. I am 
currently doing some updates around issues which per recipe sysroots 
uncovered. I think we would be fine moving our support out of meta-virt if 
support was somewhere where our changes would be taken/considered and merges 
would be done in a timely manner, something that hasn't always been the case 
with the previous attempts to centralize go.

Feel free to ping me on this, I will try to find time to try it out and will 
work to get it to the point where we can consider removing parts/all from 
meta-virt.

MarkA 

> 
> Cheers,
> Paul



