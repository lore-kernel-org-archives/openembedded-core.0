Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 601B8719D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 03:00:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAO302RM003341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Nov 2016 19:00:04 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 23 Nov 2016 19:00:01 -0800
To: Christopher Larson <clarson@kergoth.com>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
	<20161123174209.211349-2-mark.hatle@windriver.com>
	<20161123181039.GF3265@jama>
	<c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
	<20161123185617.GH3265@jama>
	<f2e7d5d6-7094-10b6-16bc-9398c8bb828e@windriver.com>
	<CABcZANkiNi_+p3p67YLJr_pcxQLrTWzoFfVDNgrFneUHPvyeBg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <41839f84-c22d-04c6-94d5-1612379017bc@windriver.com>
Date: Wed, 23 Nov 2016 21:00:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <CABcZANkiNi_+p3p67YLJr_pcxQLrTWzoFfVDNgrFneUHPvyeBg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Thu, 24 Nov 2016 03:00:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 11/23/16 7:16 PM, Christopher Larson wrote:
> On Wed, Nov 23, 2016 at 12:42 PM, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 11/23/16 12:56 PM, Martin Jansa wrote:
>     > On Wed, Nov 23, 2016 at 12:38:42PM -0600, Mark Hatle wrote:
>     >> On 11/23/16 12:10 PM, Martin Jansa wrote:
>     >>> On Wed, Nov 23, 2016 at 11:42:09AM -0600, Mark Hatle wrote:
>     >>>> This is a Wind River specific patch and not generally applicable.
>     >>>
>     >>> Then why is it sent to oe-core ML?
>     >>
>     >> As noted in the cover letter, I'm required to by Yocto Project compliance
>     >> requirements.
>     >>
>     >> As indicated LAST time I got scolded, I was told to indicate this in the patch
>     >> summary email -- which I did.
>     >
>     > Sorry I've noticed the cover letter only after the response.
>     >
>     > So it's only because of this requirement from Yocto Project compliance?
> 
>     yes.
> 
>     > "Have all patches applied to BitBake and OpenEmbedded-Core (if present)
>     > been submitted to the open source community?"
>     >
>     > Shouldn't the wording be change to something like "all applicable
>     > patches" or "all generally useful patches"?
>     >
>     > It seems strange to send project specific patches together with cover
>     > saying that they aren't generally applicable and shouldn't be merged,
>     > just because of this requirement.
> 
>     It was done this way to prevent people from cheating and claiming something was
>     (effectively) not useful/applicable/etc when it some special secret sauce.
> 
>     Even these patches while not generally applicable could give someone else the
>     idea to duplicate (or improve) on our approach at providing layer specific
>     download layers.
> 
> 
> More of an implementation question, but presumably you could have your setup
> scripts add the LAYERRECOMMENDS to bblayers.conf, rather than having it in your
> oe-core fork/branch, as an alternative.

The recommends need to be indexed by the layer index program.  The layer index
program processes one layer at a time, and there is no way to inject things.

I can manually add dependencies, however the next time I create a branch -- I
have to do this again... and again... and again....   For our product we need to
have the layer.conf setup properly so that the layer index will index the
dependencies (including the recommended layers.)

--Mark

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


