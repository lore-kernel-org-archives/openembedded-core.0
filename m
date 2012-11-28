Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TdZSz-00011Q-HC
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 05:41:45 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Nov 2012 20:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,175,1355126400"; d="scan'208";a="248280709"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.47])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2012 20:27:30 -0800
Message-ID: <50B592B2.1060903@linux.intel.com>
Date: Tue, 27 Nov 2012 20:27:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
In-Reply-To: <alpine.DEB.2.02.1211272315510.29858@oneiric>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is "packagegroup-core-nfs-server"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 04:41:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/2012 08:18 PM, Robert P. J. Day wrote:
>
>    poking around core-image.bbclass, and noticed this:
>
> PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
>
> except i don't see the corresponding packagegroup-core-nfs-server.bb
> recipe file.  there *is* a packagegroup-core-nfs.bb file; how is the
> above processed?
>
It's defined in recipes-core/packagegroups/packagegroup-core-nfs.bb

The line
PACKAGES = "${PN}-server"
provides the key you are looking for.

Hope that helps.

Sau!

> rday
>


