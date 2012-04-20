Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SL7Ot-0001AN-V2
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 08:33:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Apr 2012 23:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="133231732"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by azsmga001.ch.intel.com with ESMTP; 19 Apr 2012 23:23:29 -0700
Message-ID: <4F9100E0.4090200@linux.intel.com>
Date: Thu, 19 Apr 2012 23:23:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334875218.git.sgw@linux.intel.com>
	<ad439be70f90f60d12d905c8c6546d373448ca6a.1334875218.git.sgw@linux.intel.com>
	<CABcZAN=aojEpwUEWj0wB=6OD7wkwOwteGAGvN9TQGS+HCs+DtA@mail.gmail.com>
In-Reply-To: <CABcZAN=aojEpwUEWj0wB=6OD7wkwOwteGAGvN9TQGS+HCs+DtA@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>, dvhart@linux.intel.com
Subject: Re: [PATCH 06/10] quilt: move empty quiltrc to native
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
X-List-Received-Date: Fri, 20 Apr 2012 06:33:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2012 09:17 PM, Chris Larson wrote:
> On Thu, Apr 19, 2012 at 3:44 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>> The package.bbclass uses the native sysroot /usr/bin/quiltrc as an empty quiltrc
>> to ensure that the user quiltrc does not affect our patching scheme. This ensures
>> the correct file is in the correct sysroot.
>
> I assume this was meant to be patch.bbclass? Aside: ${bindir} really
> isn't where that should go, as a point for future improvement :)
Yes, patch.bbclass references $STAGING_NATIVE_BINDIR (I think that's 
it), Yeah, I thought about moving it, which I could still do in a second 
patch to the native sysroot /etc or /usr/share/quilt, this might be the 
better place.

Thoughts?

Sau!


