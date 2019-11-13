Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 490 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Nov 2019 21:41:25 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 686487F362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 21:41:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id ADBD022063
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 16:33:15 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Wed, 13 Nov 2019 16:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=klsiEndYgz+App4aVcus4jINP+6GIWx
	J8iK/Xq4UKDU=; b=qQwXJVw8iOiYG8E3v1Ut/rz96krOVVEtvH107/7vG+GLtj8
	bkSmfPP57ZbUN566LzWk3fOud/os1QSyX1JJGu203u0WIMCdaWVc84SZ78WzEcel
	zV7Ht2QAKZpHNvU7gAs2FDNPd+H590L/hYwZthGAOODsIoatp/HQe4ZjU4VouSCg
	famKm0RtoTnkdXU3yMaMqAzXrRyKHpUUd9yeOEC4PR7eb0eUSmltD5yMn5BvbDZ9
	gkaSwWj1t7XK/Wy396J4nbPFrsvabFQvEtn+4vbzfYVC9SKROEbyl2IN9KH2ZCYu
	5AyPO7kV+eGXu79dtpX78g10VwxGgIXXf+6iR9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=klsiEn
	dYgz+App4aVcus4jINP+6GIWxJ8iK/Xq4UKDU=; b=h0KbyP1lyGBjON9dEGizUS
	EzTRVICsHrcUvpLXoyN2wHRi94tPPhttp9zml5s40nlZ+3F51OZpUJtT7o9Xj954
	6ngdhMqNOMq3rRm/czKF5JfNh6mEkQ7ykkDKW6FtbRzD5rtKuh4P9W85nxKhLPjs
	IvoAkQ745kAtUkeFHGbHfQW5NcerwwiFuy1EUywpFxo3Rv5K1rkGUoQx+53zi8ek
	Ab5IlbnHAoAPfQ9RedZcziJMmP2yBzkHbzBRI0jqtDX8+zr3xnnrUAQSFAWUHRoD
	83vd1pO5B80Vey0Zyb1Juh960ngI8i5J/mePCBjTgHzZNmCu/dtjrS+WT+3SHs0Q
	==
X-ME-Sender: <xms:mnbMXRHSGZULOUuTr50vIyy4P1vM2AKJA4CDsjvh5R5P45WtzpcEOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudefuddgudehgecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfrfgr
	uhhluceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecurf
	grrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecu
	vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:m3bMXamsirVQTeRhi3v109w3VXPewVQtv-nMYhW3VZJIf1RokelMGw>
	<xmx:m3bMXeJGol62xn2OSxWDIfE-8qpwww03XiFFtZk76f3wpWQwqEJvVQ>
	<xmx:m3bMXbZDHnrEzuxz-tQjtoLPcqDCywG1clPBGvQRA6cTu-f3t-PKKg>
	<xmx:m3bMXZN5sZlgjZw0bvV0HeOAHlNkpxHxOOO1MHWUIRHh2nVQB_nboQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DFD90E00A3; Wed, 13 Nov 2019 16:33:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-557-g34fce02-fmstable-20191113v1
Mime-Version: 1.0
Message-Id: <5c59986d-75bf-4a7f-a5cb-830fbe491740@www.fastmail.com>
In-Reply-To: <b7cf9efa-6caf-c2f2-40ff-e84205f6e4ea@intel.com>
References: <20191112223119.47941-1-paul@betafive.co.uk>
	<20191112223119.47941-2-paul@betafive.co.uk>
	<b7cf9efa-6caf-c2f2-40ff-e84205f6e4ea@intel.com>
Date: Wed, 13 Nov 2019 21:32:54 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "OE Core" <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cdrtools-native: Don't set uid/gid during install
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
X-List-Received-Date: Wed, 13 Nov 2019 21:41:25 -0000
Content-Type: text/plain

On Wed, 13 Nov 2019, at 21:28, Ross Burton wrote:
> On 12/11/2019 22:31, Paul Barker wrote:
> > +++ b/meta/recipes-devtools/cdrtools/cdrtools-native/0001-Don-t-set-uid-gid-during-install.patch
> 
> ERROR: cdrtools-native-3.01a31+really3.01-r0 do_fetch: Fetcher failure: 
> Unable to find file file://0001-Don-t-set-uid-gid-during-install.patch 
> anywhere. The paths that were searched were:
>  
> /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools-3.01a31+really3.01/poky
>      /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools/poky
>      /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/files/poky
>  
> /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools-3.01a31+really3.01/
>      /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools/
>      /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/files/
>  
> /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools-3.01a31+really3.01/x86-64
>      
> /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools/x86-64
>      /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/files/x86-64
>  
> /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools-3.01a31+really3.01/
>      /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools/
>      /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/files/
>      /home/ross/Yocto/downloads/
> 
> Put it in /cdrtools/ not cdrtool-native.

Weird - I must have sent an out-of-date version of the patch.

> 
> > +Upstream-status: Inappropriate [native]
> 
> As the pedantic patchtest says, Upstream-Status.

I'll send a v2 tomorrow addressing both issues.

-- 
Paul Barker

