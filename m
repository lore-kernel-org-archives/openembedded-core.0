Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id 877796AB7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:48:36 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-03.prod.phx3.secureserver.net with 
	id HZob1m0031mTNtu01Zobnh; Mon, 26 Aug 2013 14:48:37 -0700
Message-ID: <521BCD34.8090003@pabigot.com>
Date: Mon, 26 Aug 2013 16:48:36 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<CAOMwXhNWFicCJ1C4-Cd+9shAhTGuXkFu+885R8NfMurEZ+6rCQ@mail.gmail.com>
	<521B9698.7030803@linux.intel.com>
In-Reply-To: <521B9698.7030803@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Mon, 26 Aug 2013 21:48:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I can confirm this also works with the Gumstix Overo in a layer bbappend 
that used SRC_URI_append_overo for additional patches.  Thanks to you 
both for getting it merged.

I did come up with a question, though.  The recipe uses:

   PV = "v2013.07+git${SRCPV}"

which creates an informative but ugly ${BPN}.  I'd like to use something 
like:

   FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

in the bbappend to simplify updates, but I don't want to have a 
directory named u-boot-v2013.07+gitAUTOINC+62c175fbb8.  For linux-yocto, 
this is solved through introduction of ${LINUX_VERSION} allowing 
${PN}-${LINUX_VERSION}.

Is there reason to create a parallel UBOOT_VERSION?

Is there reason to have some way to access the default ${PV} inferred 
from the recipe name before the base recipe overrode it? (Is there 
already some way to get that value?)

Is there a better approach than bbappend-in-layer that I should use for 
adding patches required for a specific u-boot machine?

Peter

On 08/26/2013 12:55 PM, Saul Wold wrote:
> On 08/23/2013 09:57 AM, Laszlo Papp wrote:
>> Any update? It would be nice not to miss the freeze ... ;-)
>>
> This has been merged, and I was informed by the QA team that it works 
> correctly for the mpc8315e-rdb and beagleboard, but NOT the 
> beagleboard XM.


