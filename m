Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id D7EF465CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 12:42:46 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id ABD6368A01D; Wed, 13 Apr 2016 13:42:46 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id C011D68A019;
	Wed, 13 Apr 2016 13:42:43 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 750126740343;
	Wed, 13 Apr 2016 14:42:43 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1460448862-16134-1-git-send-email-jussi.kukkonen@intel.com>
	<570E2F11.4070308@mlbassoc.com>
	<CAHiDW_GLpb20KWeHX4s6BmcbmX4tAv9ORvbBqzbfaK5CMYQ8JA@mail.gmail.com>
	<570E37F7.3020309@mlbassoc.com>
	<20160413122411.GA11999@mbabyjoh-desk.ger.corp.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <570E3EC3.9080307@mlbassoc.com>
Date: Wed, 13 Apr 2016 14:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160413122411.GA11999@mbabyjoh-desk.ger.corp.intel.com>
Subject: Re: [PATCH] matchbox-keyboard: Hide desktop launcher
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
X-List-Received-Date: Wed, 13 Apr 2016 12:42:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-13 14:24, Maxin B. John wrote:
> Hi,
>
> On Wed, Apr 13, 2016 at 02:13:43PM +0200, Gary Thomas wrote:
>> On 2016-04-13 14:08, Jussi Kukkonen wrote:
>>> On 13 April 2016 at 14:35, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
> <snip>
>>>
>>> Have you checked that your /etc/formfactor/machconfig contains "HAVE_KEYBOARD=0"? This value is used by
>>> /etc/matchbox/session to decide whether to load the keyboard panel or not, and by .the Xsession script to decide whether
>>> to start the daemonized keyboard or not.
>>
>> Has this or any of the files it depends on (/etc/formfactor/*) changed recently?
>> As I said, as recently as mid February everything worked as expected, no longer.
>> If something changed that I need to track, I'm happy to adapt.
>>
>
> Yes, there was a change in Keyboard related logic in formfactor with this recent commit:
>
> commit 463fd5ee26c5037b0f4ecfe4bc6ed48945b3b07e
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Thu Mar 3 16:56:43 2016 +0000
>
>   formfactor: assume a keyboard is plugged in
>
>   A sensible assumption is that BSPs have a USB keyboard and mouse connected
>   unless told otherwise, so flip the logic in the formfactor config script that
>   previously assumed that a keyboard was not connected by default.
>
>   [ YOCTO #9174 ]
>
> (From OE-Core rev: a82ce3e477a475dccea3837eabacd9e93b873ee6)

Wow, what an assumption!  Anyway, adding the correct machconfig for
my target fixes the problem.

Thanks for the pointer

>
>   Signed-off-by: Ross Burton <ross.burton@intel.com>
>   Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>   <snip>
> if [ -z "$HAVE_KEYBOARD" ]; then
>   -    HAVE_KEYBOARD=0
>   +    HAVE_KEYBOARD=1
>
>
> Best Regards,
> Maxin
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

