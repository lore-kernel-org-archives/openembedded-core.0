Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T6c9o-0000pp-W5
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 08:53:45 +0200
Received: by iaky10 with SMTP id y10so476602iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MfEzLUKL1NPIKIARGWhNDY53cotp/+k4Rry74iK1q7k=;
	b=Ga6PHJu8i/2MbpuJFU1Sbj6iJI4URQS98+plNJMhbh+wkIt5ELz3Q+2ZME9D0vs/pd
	ZkXp/W7XlhZAeCbddqAjLYABVhImzD5depxvfSwz5BO/s5vp2TsxqFeVxX9S5+9XFK36
	aO2pZJF46jP8dioP6P8bpedWDr7ZNnE17nSk2By65GN9497uBJwPCf4GatD7DFCKMwTF
	xG19ZdmyMEBp5gCX1H6EvZ7xd0/ScKDXd/qHAgtCd+UymPFnrTsvDJMcI5kcDK0XTbxB
	I9gvyFWQrr4C7NCpxwxDucOWC8ULuVBD3OjbYq9EaGOG28gPdtuLoe4XV1ZAV/2navOm
	UX7A==
MIME-Version: 1.0
Received: by 10.43.48.195 with SMTP id ux3mr476163icb.4.1346222490943; Tue, 28
	Aug 2012 23:41:30 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Tue, 28 Aug 2012 23:41:30 -0700 (PDT)
In-Reply-To: <EB7F39C1-4BA2-47F1-B736-8A5BB085335A@gmail.com>
References: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
	<EB7F39C1-4BA2-47F1-B736-8A5BB085335A@gmail.com>
Date: Wed, 29 Aug 2012 08:41:30 +0200
Message-ID: <CAGiJk9fkcm0QXOsCG=dH=R6kncwAqZRNV9r9xxbodToLcv4UUA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Package re-order fallouts?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 06:53:45 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/29 Khem Raj <raj.khem@gmail.com>:
>
> On Aug 28, 2012, at 12:37 AM, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>
>> after switching from the Denzil branch to next it seems that the
>> package order has been changed.
>> This causes failures with non symlink .so files in -dev packages for
>> various meta-kde recipes.
>>
>> What is the preferred way to fix this?
>> Currently done something like: unset FILES_SOLIBSDEV and add all
>> dev-libs by hand (there must be a better way to fix this).
>>
>
>
> yes if you have files ending with .so and are not symlinks then its better that you specify
> them by hand to go into packages you want them to be in presumably -dev and empty out FILES_SOLIBSDEV

OK thanks,
if this is the preferred way then it is alright.


-- 
Regards
Samuel


