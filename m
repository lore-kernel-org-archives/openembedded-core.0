Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD68676294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 18:25:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAAIPPm9004362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Nov 2015 10:25:25 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 10 Nov 2015 10:25:24 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com>
	<CAJTo0LYEYg+1oP8WwBbNYfM2mWGrFNyM3LgOXQUdL3JPC5BTsQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56423693.5050207@windriver.com>
Date: Tue, 10 Nov 2015 12:25:23 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYEYg+1oP8WwBbNYfM2mWGrFNyM3LgOXQUdL3JPC5BTsQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 18:25:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 11/10/15 11:40 AM, Burton, Ross wrote:
> 
> On 10 November 2015 at 16:39, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     Let me rephrase.  Instead of calling out to qemu (or a real target) for a
>     gobject and result.  Can the result be cached (like we do with the config-site
>     info?)  This would allow me to run say a MIPS64 n64 gobject build, cache the
>     results and use it on my octeon3 build (which can't run in QEMU.)
> 
> 
> The metadata contains stuff like type sizes and alignment but wouldn't it be
> possible to have some sort of map from machine to close-enough qemu machine?  So
> for octeon3 is qemumips64 is close enough, run that.
> 
> (to be honest I thought the qemu runner support as used by the postinsts already
> did this)

That would work in many cases.. the problem is that it requires "yet another"
sysroot or whatnot to be able to build the runner.

(I think QEMU supports pretty much all of the major, and some minor
architectures these days... it just doesn't support many of the semi-specific
optimizations.)

--Mark

> Ross


