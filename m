Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49D0860670
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 16:03:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0JG35lS026636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jan 2016 08:03:05 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jan 2016 08:03:03 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <5643497F.1080106@linux.intel.com>
	<5645EB64.4020200@windriver.com>
	<60657.10.252.13.130.1447431170.squirrel@linux.intel.com>
	<56461044.2020202@windriver.com> <5649A752.2060308@linux.intel.com>
	<564A0051.2080005@windriver.com> <564B346F.2000407@linux.intel.com>
	<564B4193.7060104@windriver.com> <564CA303.9040700@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <569E5E36.8000300@windriver.com>
Date: Tue, 19 Jan 2016 10:03:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <564CA303.9040700@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 19 Jan 2016 16:03:08 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

I know it's been about 2 months at this point, but I wanted to follow up and
make it clear to people I've not ignored this.

I still plan on following up on this, hopefully within about the next 3 weeks.

--Mark

On 11/18/15 10:10 AM, Alexander Kanavin wrote:
> On 11/17/2015 05:02 PM, Mark Hatle wrote:
> 
>>> So the bottom line, to generate introspection info, you have to run the
>>> code of the library that you introspect, either with QEMU, or on target
>>> hardware, and I don't see a way to avoid this, short of complete rewrite
>>> of the entire glib ecosystem. If someone wants to have this feature, but
>>> doesn't have a working QEMU, they should get their act together and fix it.
>>
>> Can you put together a small piece of test code with instructions on how to
>> compiler it, generate the '.gir' file and anything else?  I can take a look at
>> this and see if there is a way to inspect the intermediate objects for the type
>> information we need.
> 
> Alright. Here you go:
> 
> https://github.com/kanavin/gi-library-boilerplate
> 
> In there you have a library that provides:
> 
> 1) A simple class called MamanBar that is final (i.e. cannot be derived 
> from) and has one public method and some internal state.
> 
> 2) An interface called MamanIbaz which specified two methods and one 
> property.
> 
> 3) A derivable (can be subclassed) class called MamanBaz which 
> implements the above interface, and also adds a virtual method and a signal.
> 
> When you run 'make', you'll get both the library and the introspection 
> data - .gir and .typelib files.
> 
> All of the above is written using best current knowledge from the 
> GObject manual:
> 
> https://developer.gnome.org/gobject/stable/index.html
> 
> Regards,
> Alex
> 


