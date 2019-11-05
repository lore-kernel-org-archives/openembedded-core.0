Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 978B17D97D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 11:01:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 476mtk645NzDF;
	Tue,  5 Nov 2019 12:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572951679;
	bh=LBofB/FylF4TQDcFoOfnqRZVF4odJm6UzvYQ82E+TUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHqTTh/hgYpY9gnxa+XvjS4eVLeTyA4WPtnRzmeh3XJ06dawG6xM512YyVZDOvrA3
	mUI6U0ssNoBN/O57/Y+1fbbs09ynLe3uZkVS0std/eoTAjIC1m1/kCzBB2ofK79ngq
	UNeg8Ryb2wgV2/vjhXmBoaMsTNZEPcxYSSG/nsEHRYaRPf9vb3jC7NIcN9e7EqueKd
	E9pdoCnJdzvzK/0Rzx+/EMj8bZobjmhSbmdP+FhVI2hRvAN6o52C//QUb/Ywt8+ztN
	IKuNUj+q29jt+hoA0kwmgewzw4tXjLkjDSfMxWCtYqEk/+TkB74/dPTH5iraKaTLmi
	3GNXYeV1UqoWEb0X3o0vkqVB9IyNUDJdjNOwIx41PD72wwmKIJH4/2MLeQeqj+UwCX
	KCrv89EMjDPm3OnWMtBKG3WqKghN2Q9nAEQZXqobQUvUOku5MxIOS9HXooq/i04eJx
	wqMGoym9PVKDLcoltwrOU6DEy3eBBHG3IAGpqnpUE/C4s1dt2ORxez2qKMdhkE2RLi
	fI1M0wZT25LBeMcctnpVCJofvHxiXPvXAdlzSeUfsaqA5JdIeXvP39W2wbrzQ1gmPp
	gP5V2a91hu0k6t6Jjy485RpFgBKpJJruQIvyDkz1+VlxqTvUkrRaFD9oU0wKVVdGaO
	VWDBvGgncwEU8BWolat0dX5A=
Date: Tue, 5 Nov 2019 13:01:16 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191105110116.GA20425@localhost>
References: <20191104205504.24428-1-bunk@stusta.de>
	<aa3aa480-65d5-789c-71c0-3997d742424e@intel.com>
MIME-Version: 1.0
In-Reply-To: <aa3aa480-65d5-789c-71c0-3997d742424e@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iputils: Whitelist CVE-2000-1213 CVE-2000-1214
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
X-List-Received-Date: Tue, 05 Nov 2019 11:01:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 05, 2019 at 10:38:32AM +0000, Ross Burton wrote:
> On 04/11/2019 20:55, Adrian Bunk wrote:
> > +# Fixed in 2000-10-10, but the versioning of iputils
> > +# breaks the version order.
> > +CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
> 
> So the problem is that our PV matches the upstream git tags, which don't
> match the naming convention in the CPE entries.
> 
> The tags are of the form s20190709, but the CPE uses 2010-10-10.
> 
> If we assume that the CPE version scheme will remain the same
>...

CVE-2010-2529 had an explicit list of affected versions of the
scheme 20100214.

These 19 year old ones from a time when CVE was new are outliers.
I would expect versions in new CVE to match the OE versioning,
except that the 's' might (or might not) be missing.

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


