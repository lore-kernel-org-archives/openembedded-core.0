Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 44BC97F969
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:34:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Nov 2019 02:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,292,1569308400"; d="scan'208";a="354737890"
Received: from unknown (HELO blackadder.local) ([10.252.44.81])
	by orsmga004.jf.intel.com with ESMTP; 11 Nov 2019 02:34:56 -0800
To: openembedded-core@lists.openembedded.org
References: <BN6PR0101MB291467F2D2FCD0A1803982F58F7B0@BN6PR0101MB2914.prod.exchangelabs.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <0d757964-4dc6-e322-bb9f-7704a85211eb@intel.com>
Date: Mon, 11 Nov 2019 10:34:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <BN6PR0101MB291467F2D2FCD0A1803982F58F7B0@BN6PR0101MB2914.prod.exchangelabs.com>
Subject: Re: How to enable x11 with intel-corei7-64 machine in meta-intel layer
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
X-List-Received-Date: Mon, 11 Nov 2019 10:34:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 08/11/2019 20:46, Muhlenkamp, Lewis wrote:
> This is a bare bone setup.  I am using the thud branch.  My 
> bblayers.conf file is as follows:

I quote you here: "bare bones setup".

> BBLAYERS ?= " \
> 
>    ${HOME}/oe-core/meta \
> 
>    ${HOME}/meta-openembedded/meta-python \
> 
>    ${HOME}/meta-openembedded/meta-gnome \
> 
>    ${HOME}/meta-openembedded/meta-filesystems \
> 
>    ${HOME}/meta-openembedded/meta-oe \
> 
>    ${HOME}/meta-openembedded/meta-networking \
> 
>    ${HOME}/meta-openembedded/meta-initramfs \
> 
>    ${HOME}/meta-openembedded/meta-webserver \
> 
>    ${HOME}/meta-intel \
> 
>    ${HOME}/meta-virtualization \
> 
>    ${HOME}/meta-cloud-services \
> 
>    ${HOME}/meta-cloud-services/meta-openstack \
> 
>    ${HOME}/meta-iot-cloud \
> 
>    ${HOME}/meta-secure-core/meta-tpm \
> 
>   “

That is not a bare bones setup.  To demonstrate that the problem is not 
your own doing, create a new build directory with just meta and 
meta-intel in bblayers, DISTRO set to nodistro, MACHINE set to 
intel-corei7-64, and then build xf86-video-intel.

If that fails then please report back with the full logs.  If that works 
then you know that the problem is in your configuration somewhere so 
start adding pieces back to determine what broke.

Ross

