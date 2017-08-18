Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C295C7848E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:56:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 03:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,392,1498546800"; d="scan'208";a="125117462"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 18 Aug 2017 03:56:46 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
Date: Fri, 18 Aug 2017 13:53:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 10:56:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/18/2017 08:56 AM, Khem Raj wrote:

> I was trying nodejs and it seems its also broken by this openssl
> upgrade. Meta-oe alone has amost 50 recipes that are broken. there are
> hundreds of other layers.
> Many large packages in external layers are now broken, and the fact
> that openssl10
> is almost useless since some package will pull in openssl11 and cause
> conflicts. This
> is not a a good solution at least it seems to early for release. It
> might take a bit for packages to get working with openssl11, We should
> have carefully thought and considered postponing using it as default
> until next release ( april 2018). Its fine to keep it in if needed but
> keep openssl 1.0 as default preferred version, I don't think whole
> ecosystem is ready for it and we don't have man power to fix
> everything. This alone has a potential to make
> October release quite weak as far as external layers are concerned

FWIW, nodejs from meta-oe does build just fine with openssl10 
dependency. So it's not exactly useless. And no one has established how 
many of the other 50 packages can be fixed by either doing that, or 
updating them to latest upstream releases.

I'll send a patch that renames openssl10 recipe back to openssl and sets 
that as a preferred version, so anyone can experiment with 1.1 without 
widespread breakage.

But at the start of next development cycle this will be reverted back; 
no more complaining then please, we have to do this at some point, and 
just after a new cycle has started is as good time as it gets.


Alex

