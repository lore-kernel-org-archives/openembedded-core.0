Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 0B70E71A18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 12:32:23 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 62B6368A01C; Tue, 28 Feb 2017 12:32:23 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 1816D68A019;
	Tue, 28 Feb 2017 12:32:23 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id D81486740350;
	Tue, 28 Feb 2017 13:32:22 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
	<1488284875.7785.41.camel@intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <c784e8d2-afd8-b4d3-1cd3-75d1d398dea8@mlbassoc.com>
Date: Tue, 28 Feb 2017 13:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488284875.7785.41.camel@intel.com>
Subject: Re: how to *securely* do a remote install of an OE image?
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
X-List-Received-Date: Tue, 28 Feb 2017 12:32:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-28 13:27, Patrick Ohly wrote:
> On Tue, 2017-02-28 at 05:28 -0500, Robert P. J. Day wrote:
>>   my immediate reaction was to use SSH keys, where the
>> newly-installed system would require SSH logins, and would have to
>> match the corresponding private key.
>
> That would also be my preferred approach.
>
>>   as an alternative, perhaps don't worry about such a situation, but
>> when the authorized user logs in for what is *supposed* to be the
>> first time, it will be flagged that someone else has already logged in
>> earlier, and a warning will be printed, "Previous login to root
>> detected, you have been compromised, please re-install!"
>
> Or, along the same lines, set an empty root password and force the user
> to set a password on the first login. There are ways to do that with
> PAM, but I don't have anything at hand.
>
>>   i'm sure there are plenty of ways of doing this, anyone have any
>> pointers?
>
> For ssh keys, there's rootfsdebugfiles.bbclass. In local.conf:
>
> INHERIT += "rootfsdebugfiles"
> ROOTFS_DEBUG_FILES += "/home/pohly/.ssh/id_rsa.pub ${IMAGE_ROOTFS}/home/root/.ssh/authorized_keys ;"
>
> This copies my id_rsa.pub into authorized_keys and thus let's me log
> into images that I create via ssh.
>

Does this work for dropbear or only openssh?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

