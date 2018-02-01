Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id CD5B5786A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:17:35 +0000 (UTC)
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id 2EA0D27B0;
	Thu,  1 Feb 2018 09:17:36 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 2EA0D27B0
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 2EA0D27B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517494656;
	bh=yOX6NDS7YBHWY9amalttLcNtJmfvKpXmuwxSulAZu0s=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=i8h4dT0dLTT45LSPNfxMEAPdC4xaYEEKs0ewIeL/Ca0dFfpwtRdsUao3djjIiejfv
	QRWtK2tPnD4yyKIHWisYchGiJn1GpPZYfX2kzB7sxxuHUF8BlN5tmhIfbXqmfvfxLR
	1OAeXnmdH9vFTqVKWRkN0iIhbgiXpnpnpSyspMy4=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
To: "Burton, Ross" <ross.burton@intel.com>
References: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
	<CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
	<e6645328-4252-1a0b-d69c-37578461c5cf@thecshore.com>
	<CAJTo0LZyLzYWAWcR7WUY+e9u2c=LhdqQg6WU2p8dCsB7umiv2A@mail.gmail.com>
	<05c5c737-f5e5-8215-01b9-f6a1ef744063@thecshore.com>
	<CAJTo0LY3xrYA4AK6OkBOCAn+CiO4PAuE9xLOmRAu9MUM3TYjwA@mail.gmail.com>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <5afe874c-31b5-65eb-0f10-939b4a271902@thecshore.com>
Date: Thu, 1 Feb 2018 09:17:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY3xrYA4AK6OkBOCAn+CiO4PAuE9xLOmRAu9MUM3TYjwA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding a "tiny" DISTRO_FEATURE and having packages build smaller
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
X-List-Received-Date: Thu, 01 Feb 2018 14:17:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 01/02/18 09:12 AM, Burton, Ross wrote:
> On 1 February 2018 at 14:10, Daniel F. Dickinson <cshored@thecshore.com 
> <mailto:cshored@thecshore.com>> wrote:
> 
>     On 01/02/18 08:54 AM, Burton, Ross wrote:
> 
>         On 1 February 2018 at 13:44, Daniel F. Dickinson
>         <cshored@thecshore.com <mailto:cshored@thecshore.com>
>         <mailto:cshored@thecshore.com <mailto:cshored@thecshore.com>>>
>         wrote:
> 
>              I guess the question is would it be useful to have a flag
>         that chooses
>              a 'typical' tinyness but can be overridden (I'm think here of
>              avoiding having to specify huge numbers of PACKAGECONFIGs for a
>              typical tiny case, when really you want most of the 'normal'
>              tinyness with some
>              tweaks.  What I'm think is that "tiny" really should just
>         change the
>              defaults for PACKAGECONFIG etc, but like the defaults can
>         be easily
>              overridden.
> 
> 
>         Well in the idiomatic way the default would be "all the things
>         are on", so doing a "tiny" build would be just setting
>         PACKAGECONFIG="".
> 
>         When we're dealing with tiny configurations you can't really say
>         "and this is what people will want", because that's precisely
>         the problem: you don't know what someone else will want.
> 
>         Ross
> 
>     Fair enough.  Is there a way to distribute a set of package configs
>     and/or package selections (can a packagegroup do packageconfig or
>     does that need to be specified in a different scope (I'm still
>     getting used to openembedded)).  "tiny" is a bad choice because it's
>     too generic, but perhaps "meta-tiny-router" "meta-tiny-switch"
>     "meta-tiny-home-device" etc would make sense as mini-layers that
>     could take care of sane defaults for different use cases (assuming
>     the work of splitting packages up more and appropriate tinification
>     PACKAGECONFIGs are either submitted to the appropriate layer or
>     bbappended in various layers)?
> 
> 
> A distribution can set other recipe's PACKAGECONFIGs directly:
> 
> PACKAGECONFIG_pn-recipename = "foo bar"
> 
> And distributions are welcome to bundle groups of those into inc files 
> for the user to pull in as required at the distro level.
> 
> Ross
I wonder if it'd be useful to have some .inc's of this variety added and 
included (commented out) in the poky-tiny distro default local.conf?

