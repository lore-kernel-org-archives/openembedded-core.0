Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D10757707B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:54:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Nov 2015 05:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,276,1444719600"; d="scan'208";a="847900768"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 11 Nov 2015 05:54:53 -0800
Message-ID: <564348EE.6020604@linux.intel.com>
Date: Wed, 11 Nov 2015 15:55:58 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <56434723.5090605@linux.intel.com>
	<CAPybu_13B8Y8z4dZv0HgCHjHCpPX9oBu2+PNuew9bdYAD0JVbw@mail.gmail.com>
In-Reply-To: <CAPybu_13B8Y8z4dZv0HgCHjHCpPX9oBu2+PNuew9bdYAD0JVbw@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 11 Nov 2015 13:54:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2015 03:50 PM, Ricardo Ribalda Delgado wrote:
> Can you point to a .git file with architecture-dependent data.

Gir files do not contain architecture-dependent data. Typelib files do.

> I would love to help on this issue. I want to use the python api for gstream.

You can checkout my branch on poky-contrib (see the original message in 
the thread), and then follow the instructions to build an image and try 
out the python gobject introspection in it (again, see the original 
thread message for instructions).

Alex

