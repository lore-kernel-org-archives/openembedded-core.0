Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRpcJ-0004h5-E1
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:54:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jun 2011 10:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,304,1304319600"; d="scan'208";a="10459856"
Received: from unknown (HELO [10.255.13.41]) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2011 10:50:51 -0700
Message-ID: <4DE67BFB.2020705@linux.intel.com>
Date: Wed, 01 Jun 2011 10:50:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DE5CDA3.1020000@linux.intel.com>
	<4DE5D4AC.4090805@gmail.com>	<20110601061050.GA3281@jama.jama.net>
	<4DE5DA86.7040808@gmail.com>
	<1306925194.2529.38.camel@phil-desktop>
In-Reply-To: <1306925194.2529.38.camel@phil-desktop>
Subject: Re: [PATCH] tcmode-default: disable ARMv7 Optimization for qt4-x11-free
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 17:54:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2011 03:46 AM, Phil Blundell wrote:
> On Tue, 2011-05-31 at 23:21 -0700, Khem Raj wrote:
>> On 05/31/2011 11:10 PM, Martin Jansa wrote:
>>> On Tue, May 31, 2011 at 10:57:00PM -0700, Khem Raj wrote:
>>>> On 05/31/2011 10:26 PM, Saul Wold wrote:
>>>>> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
>>>>> error: output number 1 not directly addressable
>>>>
>>>> this is a coding error you can fix the source code I guess instead of
>>>> pessimising the whole package
>>>
>>> FWIW: I haven't seen it in my armv7-a builds (nokia900), but I'm using
>>> gcc-4.6 from meta-oe.
>>
>> this is because gcc 4.6 in meta-oe has fix for it its this patch here
>> http://gcc.gnu.org/ml/gcc-patches/2011-03/msg01477.html
>
> I'm a bit confused by this.  In the first quote above you said that this
> was a coding error and ought to be fixed in qt, but now you seem to be
> saying that it's a compiler bug and should be fixed in gcc.  If it's the
> latter, can we get that patch applied to the oe-core version of gcc?
>
> Either way, I agree, working around this by just frobbing the
> architecture options seems like a bad idea.
>
> p.
>
Khem,

Is there any chance that you would be willing to throw me a patch that 
address this issue based on the gcc patch?  If not. let me know and I 
will try to muddle my way through it ;-)!

Sau!

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


