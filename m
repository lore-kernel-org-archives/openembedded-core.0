Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id D754E6E9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 14:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4DABF3148DD6;
	Thu, 30 Jan 2014 15:54:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id XMliBCrJSTx2; Thu, 30 Jan 2014 15:54:52 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.236.47])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4A1DB3148DD5;
	Thu, 30 Jan 2014 15:54:52 +0100 (CET)
Message-ID: <52EA67BC.7020908@opendreambox.org>
Date: Thu, 30 Jan 2014 15:54:52 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20140128192141.GA3640@mail.itconsulting-heinold.de>	
	<1390940874-11839-1-git-send-email-obi@opendreambox.org>
	<1391091111.24655.196.camel@ted>
In-Reply-To: <1391091111.24655.196.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] cogl: kms: include necessary header for size_t
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
X-List-Received-Date: Thu, 30 Jan 2014 14:54:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2014 15:11, Richard Purdie wrote:
> On Tue, 2014-01-28 at 21:27 +0100, Andreas Oberritter wrote:
>> Fixes compilation in cases where stddef.h is not already
>> included by EGL headers.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>> :-P
> 
> The sad thing is it appears this wasn't tested. We added it, it causes
> warnings during parsing and build failures.
> 
> I've pushed a fix but its frustrating.

I'm sorry about that. I build-tested it on dora with cogl cherry-picked
to master's version, and I verified that it applies cleanly to master.
But I missed cherry-picking commit cc41cb6 to dora, which changed cogl's
FILESPATH through clutter.bbclass.

Regards,
Andreas


