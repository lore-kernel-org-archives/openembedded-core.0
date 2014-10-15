Return-Path: <openembedded-devel@urbanec.net>
Received: from mail9.tpgi.com.au (mail9.tpgi.com.au [203.12.160.104])
	by mail.openembedded.org (Postfix) with ESMTP id 796CF71801
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 16:39:34 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Thu, 16 Oct 2014 03:39:34 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail9.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9FGdWD1021399
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 03:39:34 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XeRbm-0004m0-T7 for openembedded-core@lists.openembedded.org;
	Thu, 16 Oct 2014 03:39:30 +1100
Message-ID: <543EA342.40003@urbanec.net>
Date: Thu, 16 Oct 2014 03:39:30 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OE Core <openembedded-core@lists.openembedded.org>
References: <543E5F54.9090907@urbanec.net>
	<CANyK_8ekCtKhA6Ps7tyP8PxerCpP_iDFqBbsCiuB1q_NTFJyaA@mail.gmail.com>
In-Reply-To: <CANyK_8ekCtKhA6Ps7tyP8PxerCpP_iDFqBbsCiuB1q_NTFJyaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Wed, 15 Oct 2014 16:39:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/14 00:17, Paul Barker wrote:
>
> This is still missing "Upstream-status:"
...
>> + }
>> + + static int
>
> I don't think the patch has been generated properly here. There
> shouldn't be a change to this line.

Patch resent. I moved the Upstream-status: from the header of the patch, 
into the header of the embedded patch. I hope I got it right!

As far as the patch corruption is concerned, that's Thunderbird 31 being 
helpful, even though I asked it not to interfere. I resent the patch 
using a webmail client, which seems to have done a better job.

Cheers,

	Peter


