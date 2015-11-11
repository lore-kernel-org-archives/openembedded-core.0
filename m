Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8063B76294
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 00:15:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAB0FNS1025705
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Nov 2015 16:15:23 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 10 Nov 2015 16:15:22 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Phil Blundell <pb@pbcl.net>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <1447197016.2907.2.camel@pbcl.net>
	<CAJTo0LZ9XcwwEhXwm0awgZ-cb9wDOC6XkiqShXyUYqG6Qi-Fhw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56428899.2080404@windriver.com>
Date: Tue, 10 Nov 2015 18:15:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ9XcwwEhXwm0awgZ-cb9wDOC6XkiqShXyUYqG6Qi-Fhw@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Nov 2015 00:15:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 11/10/15 5:40 PM, Burton, Ross wrote:
> 
> On 10 November 2015 at 23:10, Phil Blundell <pb@pbcl.net <mailto:pb@pbcl.net>>
> wrote:
> 
>     Why does gobject-introspection (presumably giscanner, right?) need to
>     run binaries on the target at all?  I thought it operated mostly on the
>     source code.
> 
> 
> Same reason gtk-doc's scanner executes code: vast amounts of relevant
> information can't reliably be extracted from source but is trivial to introspect
> at runtime (GObject hierarchy, properties, signals, etc).

I wonder if any of this could be 'discovered' via objdump or readelf.

In the past we did something like this by setting 'return' values as strings in
a program.  We let the compiler optimize the settings (ensuring only the real
value was retained) and then used objdump to read the string out of the binary.
 It worked really well for this type of thing.

Problem of course is when the binary is not self sufficient and requires others
to be linked so the optimization is not possible.

--Mark

> Ross


