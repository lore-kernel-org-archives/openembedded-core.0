Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1Q2tbG-00076F-OU
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Mar 2011 00:05:54 +0100
Received: by wyb40 with SMTP id 40so476427wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=hwxVZDvJiObPR6fDSK5eJo6JhtfwgRQRrsAE4Tdw7Uk=;
	b=oYGJ/yMCdoNAjcecmDlh7mDz3akvK/1mpqSnSJdjyIcpZ0jkfir9c/zzc4MJAG42ti
	LQNEazQ1ImeMxFrT5vcgD3QMBp2zYo8C7zMkzjpqiohpc2WnVwBMmdLUqzZvMMsxg8G/
	4nRN1nK/jEQs7YLi3l4JFfzsfsmhH2UaFDLgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=WZ68TXt1f+tHXQBtFmpsXTowuc/kT6bWGhDrhRJQriNHVZJtgdHI+PWxuO1quIL1sI
	MoP9lIwDeEVyVhnPED6NrNAPhAkyc36lyk/YyCMzZVjfIcCblusbzuvOxvCLfKvV4c95
	9rgYqpgek17VKRXFJ4RLjlb+zT9eevs7ra0z8=
MIME-Version: 1.0
Received: by 10.227.130.78 with SMTP id r14mr50409wbs.101.1301007842074; Thu,
	24 Mar 2011 16:04:02 -0700 (PDT)
Received: by 10.227.13.82 with HTTP; Thu, 24 Mar 2011 16:04:01 -0700 (PDT)
In-Reply-To: <20110324163410.GA12992@sakrah.homelinux.org>
References: <20110324034537.GA31158@sakrah.homelinux.org>
	<20110324163410.GA12992@sakrah.homelinux.org>
Date: Fri, 25 Mar 2011 09:34:01 +1030
Message-ID: <AANLkTikh-rJszAW0f2KNQTOwoNtxK2tUnTQCj=OZ8jFe@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Parsing error when adding a python function in .inc file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2011 23:05:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 25 March 2011 03:04, Khem Raj <raj.khem@gmail.com> wrote:
> On (23/03/11 20:45), Khem Raj wrote:
>> Hi
>>
>> I am facing a strange problem. I am trying to add a small python function to qemu.inc and bitbake keeps telling me this
>>
>> NOTE: Out of date cache found, rebuilding...
>> ERROR: Error parsing
>> /home/kraj/work/newoe/sources/openembedded-core/meta/recipes-devtools/qemu/qemu_git.bb:
>> Failure expanding variable EXTRA_OECONF, expression was
>> ${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls
>> --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370
>> which triggered exception NameError: name 'get_qemu_target_list' is not
>> defined
>> ERROR: Command execution failed: Exited with 1
>>
>>
>> Now if I move this function into a separate file say qemu-targets.inc
>> and require qemu-targets.inc inside qemu.inc then it works correctly
>>
>> There is similar kind of code in gcc-common.inc which is used in
>> different inc files in gcc. I tried to use the python function defined
>> in gcc-common.inc in same gcc-common.inc file and it worked so I dont
>> know why qemu.inc case is special.
>>
>> Any insights ?
>
> Forgot to attach the patch. Here it is this time
>

Still ENOPATCH.

Is the mailing list stripping it?


