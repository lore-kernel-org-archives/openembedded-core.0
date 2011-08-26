Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwzBR-0001l9-Rw
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 18:23:06 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Aug 2011 09:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,285,1312182000"; d="scan'208";a="11401957"
Received: from unknown (HELO [10.255.13.251]) ([10.255.13.251])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Aug 2011 09:18:15 -0700
Message-ID: <4E57C747.2020104@linux.intel.com>
Date: Fri, 26 Aug 2011 09:18:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <201108261047.10782.paul.eggleton@linux.intel.com>
In-Reply-To: <201108261047.10782.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Core image recipes
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
X-List-Received-Date: Fri, 26 Aug 2011 16:23:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2011 02:47 AM, Paul Eggleton wrote:
> Hi all,
>
> Seems we have a few overlapping images in OE-core, with not especially obvious
> naming. The following two seem very similar in scope (basic X11 image):
>
> meta/recipes-core/images/core-image-core.bb

This contains X11_IMAGE_FEATURES

> meta/recipes-extended/images/core-image-basic.bb
>
This image should NOT contain any X11, this is supposed to be an 
extention of core-image-minimal with many of the busybox related 
commands substituted for the real command set.  The intention of this 
image is two fold, first it's the largest image that we test against 
non-GPLv3 and it's the non-graphical LSB image (I am not sure if there 
is a spec test defined for that.

> Maybe we could just have one of these and call it core-image-x11-base or
> similar?
>
So, no I do not think they can be merged.  But renaming core-image-core 
to core-image-x11-base might make sense, also renaming core-image-basic 
to core-image-lsb-basic may clear things up.

> Then, we have core-image-base, which whilst it doesn't remove package
> management files, does not have "package-management" in its features, so it's
> not a whole lot different to core-image-minimal AFAICT.
>
On this one I might agree, I know that we have not built that image, nor 
does it seem to be used by anything else.

Sau!

> Comments?
>
> Cheers,
> Paul
>
>


