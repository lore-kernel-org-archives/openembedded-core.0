Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AB08F71B32
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:30:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 May 2017 02:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,313,1491289200"; d="scan'208";a="966204496"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 09 May 2017 02:30:07 -0700
To: Ian Arkver <ian.arkver.dev@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<be95c443-df9a-2c9a-394b-4b02c8710fdc@linux.intel.com>
	<931ee9bc-a5cb-fcc2-278b-20a07731524d@dynamicdevices.co.uk>
	<70344400-e36e-497e-e061-56821561c353@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <19df6b88-60e2-a188-550a-ac333ac153d7@linux.intel.com>
Date: Tue, 9 May 2017 12:30:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <70344400-e36e-497e-e061-56821561c353@gmail.com>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 09:30:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2017 12:18 PM, Ian Arkver wrote:
> They have their own meta-b2qt layer for that. See "Embedded
> documentation" and "Building Your Own Embedded Linux Image" from that
> page.
>
> It's not an OE-core thing, imho.

I digged a bit deeper, and meta-b2qt is in fact open source:

http://code.qt.io/cgit/yocto/meta-boot2qt.git/tree/README

"Boot to Qt (b2qt) is the reference distro used in Qt for Device 
Creation [1]. It combines Poky, meta-qt5 and various BSP meta layers to 
provide an integrated solution for building device images and toolchains 
with the latest Qt version."

Seriously, for those who say that qt5 should be in oe.core - this does 
the job far better than oe-core ever would.

Alex

