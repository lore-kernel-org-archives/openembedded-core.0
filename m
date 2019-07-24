Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B552A7F080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 07:15:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tmpc0g1cz2M;
	Wed, 24 Jul 2019 09:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563952553;
	bh=E5lvlcuUbnoWAUZO4K9X3zy0BtcM1Mz5ZA/Cf+skkFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAGn/olJF3XCfqdS4L1vgKzAORiA0o+7T6kUu56cjsbz41ccWDPZusZRZTRCY7Zhd
	LdO87IpCW+LqPjzLjyCi95j9z0tvVOJeTAP6NV2/wXjwyP3VxA7IOl5muHu5HXTlRg
	0q8LjgldnX/VXniNUgYB6EObY6N3XeQ6RcO/RKorESXRoBLFSSH/OEnj1C4lsRlpX0
	KjdUfFq2AytEcUm5BCmeCegu3uCBeRonYnzqTMatdcfR9XgmwY6msvn2b1KTiT0mEq
	9noi0rsFVurq2bVmK+OCRk4vz15ZECIvyKNdw++RSKfZHqa2UUEYM5jBu7dEnpizZg
	v6yzraMYqAgCBSIShu59bKid6wxgjCBt5G5Ci4CkyJXIdOeadlZ3VXw7YI497CfGTs
	0u+Xsjt0dEp9pxRuOD2mx+kBTnGVeCrtf7UIX+VN9hwXILgD41dmh05GuHx+dV1UL1
	IxkwEnEMxIhCj32HDgoxDAGFbcxRZDMPNbQUu29HbHlwlDUimgLjC6ZteM2Sz6rANX
	ZmQOTHNSg0KPClC+zEBoiUPlgQmQPUBjH5y/hdikXU5HxlNCMivHnYtz9ZrYCcd5AU
	y+qFoiEcHYqGrcxoHFvQuN/XzLQHUryv4vutZzPkwnX7i1Ge3J/CGjVowfb8iurGIW
	tK86N99PaV2zbFFuZsTbgo/o=
Date: Wed, 24 Jul 2019 10:15:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190724071549.GA19385@localhost>
References: <20190724000313.26375-1-anuj.mittal@intel.com>
	<fb36e3dc-6246-914d-c427-974a1b167216@balister.org>
	<a38548e3-17a5-8007-80ec-77bca123d491@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a38548e3-17a5-8007-80ec-77bca123d491@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: remove
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
X-List-Received-Date: Wed, 24 Jul 2019 07:15:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 23, 2019 at 11:59:47PM -0700, Khem Raj wrote:
> 
> On 7/23/19 11:28 PM, Philip Balister wrote:
> > On 07/24/2019 02:03 AM, Anuj Mittal wrote:
> > > All the users in OE-Core have moved to libsdl2. It will be moved to
> > > meta-oe.
> > Are there any users in meta-oe? Can we just drop this completely? (Yes,
> > I've been afk so may have missed some email)
> 
> yes there are recipes asking for virtual/libsdl2

libsdl is the previous generation before libsdl2.
libsdl2 will stay in oe-core.

In meta-oe there's gegl that needs libsdl,
and in meta-multimedia libdc1394.

Plus various libsdl-* packages.

So yes, dropping it completely sounds feasible.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


