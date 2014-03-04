Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCDD6EEF3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 11:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 387FE3149CAF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 12:02:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id IbQFFXdJC5hX
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 12:02:41 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.119.172])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id C36333149AA8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 12:02:41 +0100 (CET)
Message-ID: <5315B2D1.2020804@opendreambox.org>
Date: Tue, 04 Mar 2014 12:02:41 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>	<CALmOhgm_ScJQNZecKUQS-ki4+YkX_nYuZUDpYZcsLqjYSsECZg@mail.gmail.com>	<53159295.9060600@enea.com>
	<1742132.ri7Qh8tc7U@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1742132.ri7Qh8tc7U@peggleto-mobl5.ger.corp.intel.com>
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
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
X-List-Received-Date: Tue, 04 Mar 2014 11:02:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 04.03.2014 11:29, Paul Eggleton wrote:
> On Tuesday 04 March 2014 09:45:09 David Nyström wrote:
>> On 2014-03-03 21:41, Trevor Woerner wrote:
>>> Does this resolve issue 5407?
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5407
>>
>> This patch satisfies a small part of 5407, when this patch has been
>> reworked into a recipe and merged
> 
> I'm still confused as to why reworking this into a recipe is beneficial... ?

Because if the feed info is stored in a package, it can be updated
without reflashing.

We used this once to stop updates for selected machines from a shared
feed (due to memory constraints), but allowed other machines to continue
to receive updates by pointing them to a new feed location.

Regards,
Andreas

