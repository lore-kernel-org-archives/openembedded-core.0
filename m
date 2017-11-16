Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 5825071ABD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 16:56:12 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D59CD5C381F;
	Thu, 16 Nov 2017 17:50:51 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 16 Nov 2017 17:51:50 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <0658eacf-cf19-fd5b-6518-65e3f3f349e4@linux.intel.com>
References: <a316ea0c483e68f37d624e742472d248@agner.ch>
	<da5f7d07-f51c-e1f4-56dd-78e4febe9da7@linux.intel.com>
	<a4fcab328359fd5906f90c75d3d8cef0@agner.ch>
	<0658eacf-cf19-fd5b-6518-65e3f3f349e4@linux.intel.com>
Message-ID: <b675918a0d02bdcd7c9a87167a62ee2f@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510851051; bh=5ACVxA1kNXtS7RhLXcP57Fpjd/eA1tqUUc9npYZ/a+o=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=Jqmg7qdyUEwz0G27tNcQRt8dx8dVD3pjmGvGqSONYXkncDL0t+OkcE3uxJkB1hL6WBIkZ1IU/SIobY0ZbgzbJLeJuegtcVP20PKJuk14zYnx8pEdrPwXIo/IcolmgM8t1tyR4zOfOR5vUqfaFtShbDSWBWCQZ/h+ngrjgljFU7A=
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Error when connecting to OpenSSH server using rocko
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
X-List-Received-Date: Thu, 16 Nov 2017 16:56:13 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-11-16 16:06, Alexander Kanavin wrote:
> On 11/16/2017 04:51 PM, Stefan Agner wrote:
>> True, I cannot reproduce using qemuarm, but I created a ARMv7 qemu
>> machine and run that using qemu-system-arm -M virt -cpu cortex-a15, and
>> it did fail...
>>
>> So yeah qemuarm is not affected, but pretty much every relevant 32-bit
>> ARM machine out there...
> 
> openssl recipes have an architecture-specific configuration step where
> you need to specify the target machine by hand. I strongly *suspect*
> we do something incorrectly there in the 1.0 recipe for ARM machines.

Nothing really concerning has changed in that region between morty to
rocko from what I can tell.

I replaced libcrypto.so (OpenSSL 1.0.2j) from a morty build and I was
able to connect again... (while still using OpenSSH_7.5p1). So it seems
to be a OpenSSL issue.

> 
> I couldn't stand looking at that mess when writing 1.1, so rewrote the
> whole recipe from scratch, and it *probably* works correctly on ARM :)

Yeah it seems to work fine here, even on ARMv7 :-)

--
Stefan

