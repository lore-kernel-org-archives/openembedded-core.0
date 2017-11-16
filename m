Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E76847865E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 14:55:44 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B08A45C0DBA;
	Thu, 16 Nov 2017 15:50:23 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 16 Nov 2017 15:51:22 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <da5f7d07-f51c-e1f4-56dd-78e4febe9da7@linux.intel.com>
References: <a316ea0c483e68f37d624e742472d248@agner.ch>
	<da5f7d07-f51c-e1f4-56dd-78e4febe9da7@linux.intel.com>
Message-ID: <a4fcab328359fd5906f90c75d3d8cef0@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510843823; bh=pys371rfSGY8GwPGLMT+XQA7e/kfW4QmwwCLAxsbKMg=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=jrDtMfx1WyBnQ6V9GAzzuiLOSPqafhmVoFhwvuVdiM0vSVeDLjwD08TvnjI2S7M92XXYFpHCYuSfWLeP2Hk6vNaFTKe31ySpqW98ZeFuyOL/nzl5z2o085agVRdqMoZR0GwqnQtu41sYIsZ05gqrtgWYcEjFg6ApmXgH24vNA4E=
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
X-List-Received-Date: Thu, 16 Nov 2017 14:55:45 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-11-16 11:39, Alexander Kanavin wrote:
> On 11/16/2017 11:48 AM, Stefan Agner wrote:
>> In a quick test I removed the PREFERRED_VERSION_openssl to get 1.1.0f,
>> removed openssl10 DEPENDS in the openssh recipe and added the ArchLinux'
>> openssl-1.1.0.patch:
>>
>> # ssh -V
>> OpenSSH_7.5p1, OpenSSL 1.1.0f  25 May 2017
>>
>> With that I could login.
>>
>> User nayfe on IRC reported the same issue.
>>
>> I guess moving rocko to OpenSSL 1.1 is not really an option at this
>> point? Thoughts?
> 
> Openssl 1.0 is what the openssh upstream officially supports. All the
> 1.1 patches are vendor hacks.
> 
> Can you try to bisect the issue with the rocko branch? Find some
> commit in the past where it still works, and take it from there. And
> do everything you can to enable additional diagnostics on the server
> side when it fails. Note that we use ssh on the autobuilder to run
> commands on test images, and this surely would've been noticed if it
> was a common issue.

True, I cannot reproduce using qemuarm, but I created a ARMv7 qemu
machine and run that using qemu-system-arm -M virt -cpu cortex-a15, and
it did fail...

So yeah qemuarm is not affected, but pretty much every relevant 32-bit
ARM machine out there...

--
Stefan

