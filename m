Return-Path: <Jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.141])
	by mail.openembedded.org (Postfix) with ESMTP id 96E3A60721
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:41:55 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 440E5340159
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:44:50 +0000 (UTC)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10032) with ESMTP id QRPAQBwyiYo2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:44:44 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id E66213401AC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id 12g-Vy6jC_Dc
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:44:44 +0000 (UTC)
Received: from [172.16.0.165] (cable-192.222.218.157.electronicbox.net
	[192.222.218.157])
	by mail.efficios.com (Postfix) with ESMTPSA id CC88D340159
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 21:44:44 +0000 (UTC)
References: <2b581c5f-7199-7a0b-5288-cae9e8309a73@efficios.com>
To: openembedded-core@lists.openembedded.org
From: Jonathan Rajotte Julien <Jonathan.rajotte-julien@efficios.com>
Message-ID: <2bc5740d-4245-a666-d21a-e89940ebe2fc@efficios.com>
Date: Fri, 6 Jan 2017 16:41:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <2b581c5f-7199-7a0b-5288-cae9e8309a73@efficios.com>
Subject: Re: Babeltrace - Backport fix to fido (as-needed.inc: add babeltrace exception)
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
X-List-Received-Date: Fri, 06 Jan 2017 21:41:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Reposting to mailing list since I was not allowed without a subscription.

Both Alexander Kanavin (Babeltrace recipe maintainer) and Richard Purdie 
were CC on the initial message.

Original Message
--

Hi,

The following commit [1] is present since Jethro but the issue is also 
present in Fido.

Since the commit apply cleanly, could it be possible to backport it to Fido?

Cheers

[1] 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3006cb260004a7bd88cfd4ea3e2cbcac600347bc

-- 
Jonathan R. Julien
Efficios


