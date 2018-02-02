Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id B878771951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 05:21:19 +0000 (UTC)
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id 39FA92657
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 00:21:17 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 39FA92657
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 39FA92657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517548879;
	bh=YUpLxyBoPqW0tKna6q7I9mDBcwvYl2j1ngbzcwCcJiI=;
	h=Subject:References:From:To:Date:In-Reply-To:From;
	b=t7NofIx/1NAIC+CkyQT2mAUQqsiADmsLWslx6TGVhAxBvhbggn92zQIytphcaOk61
	r4jTwev/FxWNxreUUvxdiBNzsQgP7R1Udb0E1/qp4HGppW76BhOFpnv8/HeQrnQSaQ
	IRWGxOkId9EUEx26WRso3Crf2ZMtvSQk7GPDNPIw=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
References: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
	<CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
	<e6645328-4252-1a0b-d69c-37578461c5cf@thecshore.com>
	<CAJTo0LZyLzYWAWcR7WUY+e9u2c=LhdqQg6WU2p8dCsB7umiv2A@mail.gmail.com>
	<05c5c737-f5e5-8215-01b9-f6a1ef744063@thecshore.com>
	<CAJTo0LY3xrYA4AK6OkBOCAn+CiO4PAuE9xLOmRAu9MUM3TYjwA@mail.gmail.com>
	<5afe874c-31b5-65eb-0f10-939b4a271902@thecshore.com>
	<CAJTo0LZ1tDquYwyHzLjp7c4ft6Zg+Qbnz+5+EK1uX1BUosso1w@mail.gmail.com>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <4ffd5c90-c610-3295-2890-b0e83136723a@thecshore.com>
Date: Fri, 2 Feb 2018 00:21:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ1tDquYwyHzLjp7c4ft6Zg+Qbnz+5+EK1uX1BUosso1w@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 Feb 2018 05:21:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 01/02/18 09:19 AM, Burton, Ross wrote:
> On 1 February 2018 at 14:17, Daniel F. Dickinson <cshored@thecshore.com 
> <mailto:cshored@thecshore.com>> wrote:
> 
>     On 01/02/18 09:12 AM, Burton, Ross wrote:
> 
>         On 1 February 2018 at 14:10, Daniel F. Dickinson
>         <cshored@thecshore.com <mailto:cshored@thecshore.com>
>         <mailto:cshored@thecshore.com <mailto:cshored@thecshore.com>>>
>         wrote:
> 
>              On 01/02/18 08:54 AM, Burton, Ross wrote:
> 
>                  On 1 February 2018 at 13:44, Daniel F. Dickinson
> 
>                  wrote:
> 
>         A distribution can set other recipe's PACKAGECONFIGs directly:
> 
>         PACKAGECONFIG_pn-recipename = "foo bar"
> 
>         And distributions are welcome to bundle groups of those into inc
>         files for the user to pull in as required at the distro level.
> 
>     I wonder if it'd be useful to have some .inc's of this variety added
>     and included (commented out) in the poky-tiny distro default local.conf?
> 
> 
> Included and enabled if they make sense, sure.  poky-tiny is, like 
> everything poky-specific, just an example.
> 
> It already has one:
> 
> PACKAGECONFIG_remove_pn-opkg-utils = "python"
> 
Sorry, apparently I wasn't clear.  What I meant was having (either in 
poky or in a more appropriate place) .inc or classes that do 
PACKAGECONFIG for common sets of packages for various "tiny" use cases 
(e.g. router, nas firmware (v.s os on data disks), ap, small iot devices 
, etc), which may involve a lot of partitioning of existing packages to 
allow for smaller (tiny) builds that include only the relevant 
functionality.  I'm not sure what the situation is for oe-core, but when 
I look at meta-openwrt it is much less partitioned than say actual 
openwrt base system, and makes a number of 'bigger' choices than 
openwrt.  What I'd like to work on is making it easier to build pared 
down OE systems (whether poky-tiny reference design 'flavours', 
meta-openwrt/oe hybrids, or (basically) openwrt build with oe/meta-openwrt).

In the case of the .inc's etc I'm thinking of this as 'pre-cooked' 
references designs like poky-tiny itself;  Perhaps a better place for 
this is as comments in poky-tiny's distro .conf? (Or as proof-of-concept 
distro layers based on poky-tiny and and listed in the layers index?)

Regards,

Daniel

