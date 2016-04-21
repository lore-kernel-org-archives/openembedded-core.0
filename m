Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id E7CA060116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 08:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2B2523141F4E;
	Thu, 21 Apr 2016 10:11:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qBT7FHhPhxtu; Thu, 21 Apr 2016 10:10:57 +0200 (CEST)
Received: from [172.22.22.61] (55d441eb.access.ecotel.net [85.212.65.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id C450B3141DDA;
	Thu, 21 Apr 2016 10:10:57 +0200 (CEST)
To: yannick.gicquel@iot.bzh, openembedded-core@lists.openembedded.org
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
	<571640FF.4040000@opendreambox.org> <57173D88.5040102@iot.bzh>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <57188B11.6080106@opendreambox.org>
Date: Thu, 21 Apr 2016 10:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <57173D88.5040102@iot.bzh>
Subject: Re: [RFC PATCH 1/4] u-boot: basic support of device tree blob reassembly
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
X-List-Received-Date: Thu, 21 Apr 2016 08:11:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 20.04.2016 10:27, Yannick GICQUEL wrote:
> Le 19/04/2016 16:30, Andreas Oberritter a écrit :
>> On 19.04.2016 14:46, Yannick Gicquel wrote:
[...]
>>> +addtask assemble_dtb after do_deploy before do_install
>> The task do_deploy executes after do_install. Does it really work this
>> way? I think bitbake should try to detect this and error out.
> I confirm do_deploy is executed before do_install.
> It looks like it is schedule this way by the last line of the file:
> 
> addtask deploy before do_build after do_compile
> 
> (I attached the log.task_order for reference - FYI, behavior is the same on
> jethro or today's master branch)

You're right, Yannick. I should have looked at u-boot.inc, instead of
assuming the behaviour of kernel.bbclass was generic.

Regards,
Andreas


