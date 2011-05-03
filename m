Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHJQj-0001SG-Jx
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 19:30:37 +0200
Received: by eye27 with SMTP id 27so98132eye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=UlpV8fV/c8EVEBRUtXzhMH8zELNt1R6dE1Bap4KGgH0=;
	b=PHXYvXacGO3bhUDSlHJKziDQlEdwajTL80HoSVaHFcm1fckXUYwiNTdKKL+gj5zGkx
	bTSkqimWOrFQNBO6ACIlwj28/3JT+bwtoVRTxdOP9JKdRsZedLw5S4uUqgsn5ot+IBzv
	y6aCiuV0oKPHVOfZJJa8PDQ8B94oXW9sn1oCw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=N8D4QE9v74molqLxXNjoIkYZvnu6eYhjZFSvKjMg5f0aLbFy/ZzRlTDfTKJM65DoKs
	QZbiXGktvi16eFYCtnrsdt01/LJhOo1XICS9xwMT6M4nWr5hCQO0blSv03vfShS5rDDs
	k40tS6pj46BQru3i23m2Th1FrtHq1MqS1afiU=
Received: by 10.14.4.32 with SMTP id 32mr31764eei.141.1304443679434; Tue, 03
	May 2011 10:27:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Tue, 3 May 2011 10:27:28 -0700 (PDT)
In-Reply-To: <4DBF4F26.90404@intel.com>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>
	<4DBF4F26.90404@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2011 10:27:28 -0700
Message-ID: <BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Tue, 03 May 2011 17:30:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 2, 2011 at 5:41 PM, Zhai, Edwin <edwin.zhai@intel.com> wrote:
> Did you installed Nvidia proprietary driver? Any error mesg from the runqemu
> script?

yes I did and I think that could be a culprit but then why would it
work with nfs boot.
there is no useful message from script it just collapses

> I can't figure out one case that nfs root works and ext3 image doesn't...
>
>
> Khem Raj wrote:
>>
>> Hi
>>
>> I am seeing qemu segfaulting when booting ext3 image. The same rootfs
>> boots fine over nfs. It does not give any useful message
>> as to what happened. I am using the runqemu script. Same used to work
>> fine 3 weeks back. I tried to blame compilers but the behavior
>> is same irrespective of gcc version I use or even eglibc/uclibc
>>
>> Its on x86_64/ubuntu 11.04 host.
>>
>> Anyone experiencing it ? bisecting can be a long excercise for this.
>>
>> Thanks
>> -Khem
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


