Return-Path: <openembedded-devel@urbanec.net>
Received: from mail13.tpgi.com.au (mail13.tpgi.com.au [203.12.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2368C6AD05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 22:34:28 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Thu, 16 Oct 2014 09:34:27 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail13.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9FMYPWe016949; 
	Thu, 16 Oct 2014 09:34:27 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XeX9D-0005PG-Mi; Thu, 16 Oct 2014 09:34:23 +1100
Message-ID: <543EF66F.7070809@urbanec.net>
Date: Thu, 16 Oct 2014 09:34:23 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <543ea179.e25bb40a.2c8a.1e34SMTPIN_ADDED_BROKEN@mx.google.com>
	<CANyK_8e3EV3dO72UJ6Bo=QodGS3A315j5E_i_7evPjrgGVqxgA@mail.gmail.com>
In-Reply-To: <CANyK_8e3EV3dO72UJ6Bo=QodGS3A315j5E_i_7evPjrgGVqxgA@mail.gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Wed, 15 Oct 2014 22:34:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/14 04:26, Paul Barker wrote:
> For the sake of future readers within OpenEmbedded, we need to make
> clearer here that this is opkg issue 104, not an OE issue number. This
> change isn't needed in the patch to opkg upstream though.
>
>> +
>> +Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
>
> Sorry to be pedantic but there's now 2 copies of the Signed-off-by
> line. If you resend this, I'd also bring the Upstream-status line down
> so that it immediately follows the Signed-off-by line. That's just a
> minor cosmetic point though, it may be possible for someone to make
> these edits as the patch is merged.

I resent the patch with your suggestions incorporated. Specifically, I 
mentioned that the patch is for an opkg issue and provided the URL to 
the relevant opkg issue tracker entry. I also rearranged the 
Upstream-Status and Signed-off-by lines as suggested.

> This looks fine. As I've said in reply to the patch on the opkg-devel
> mailing list, I'm busy this week but should have time to test this
> properly next week. It looks correct to me though, the logic is almost
> identical to the patch I prepared which covers prerm only.
>
> It probably doesn't need to wait for my test before going into OE though.

Thanks. Version 3 of the patch I sent out has no code changes, just the 
patch meta information and comments.

Cheers,

	Peter


