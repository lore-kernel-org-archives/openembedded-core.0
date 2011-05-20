Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QNFS4-0007zJ-7q
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 04:28:32 +0200
Received: by gwb11 with SMTP id 11so1259944gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 19:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=jFvtYoAm1iibG/64xNCdyZPT36zmGPeGCZ7yT/7w+fA=;
	b=k48d9EyQSrbpP+FW+cfxQRZ+xyhPWbaAJPQCWnZKHQqaEf58FOWmuOjr8B1Sk68uSp
	AOcDZANhEtosdBmIB4sux9mt+IgcvCf1DJOaH+DrklGK2N9yyyw7HhwYd7hC1Vevaw5W
	3Kvy2Y0Nls80kdzKhmlnvGm6kmWGEPsUk1HmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=kA81nWVMS2AkUig+eF1R6qquhqreYCB7hSHzawzlQNxm6rLjbXMOoBcrE5lzAG0X9N
	49mhczK9P/698TrDJmJVm/nUbSEhVdWvcf6gamEhXDuAaOHpd7ln13FdRBZieSYDQjp3
	P06G5t6Dhejpd1m9k+F0X4ejgzGc91fEX+67w=
MIME-Version: 1.0
Received: by 10.91.67.7 with SMTP id u7mr344673agk.103.1305858335330; Thu, 19
	May 2011 19:25:35 -0700 (PDT)
Received: by 10.90.7.20 with HTTP; Thu, 19 May 2011 19:25:35 -0700 (PDT)
In-Reply-To: <4DD5BE3F.4010606@linux.intel.com>
References: <cover.1305736112.git.bruce.ashfield@windriver.com>
	<4DD5BE3F.4010606@linux.intel.com>
Date: Thu, 19 May 2011 22:25:35 -0400
Message-ID: <BANLkTimVv_YwrbdSoqWfEk9YRJ1QHp5qVw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: yocto@yoctoproject.org
Subject: Re: [PATCH 0/2] linux-yocto: fix gcc 4.6.0 compilation failures
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
X-List-Received-Date: Fri, 20 May 2011 02:28:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2011 at 9:05 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/18/2011 09:32 AM, Bruce Ashfield wrote:
>>
>> Repeating the patch contents here, since that's the
>> whole story:
>>
>> Fixes bug: [YOCTO #1035]
>> Fixes bug: [YOCTO #1036]
>>
>> Fixes gcc 4.6.0 compliation issues by importing the upstream change:
>>
>> Author: Michal Marek<mmarek@suse.cz>
>> Date: =A0 Mon May 2 12:13:01 2011 +0000
>>
>> =A0 =A0 kbuild: Fix passing -Wno-* options to gcc 4.4+
>>
>> =A0 =A0 Starting with 4.4, gcc will happily accept -Wno-<anything> =A0in=
 the
>> =A0 =A0 cc-option test and complain later when compiling a file that has=
 some
>> =A0 =A0 other warning. This rather unexpected behavior is intentional as=
 per
>> =A0 =A0 http://gcc.gnu.org/PR28322, so work around it by testing for sup=
port
>> of
>> =A0 =A0 the opposite option (without the no-). Introduce a new Makefile
>> function
>> =A0 =A0 cc-disable-warning that does this and update two uses of cc-opti=
on in
>> =A0 =A0 the toplevel Makefile.
>>
>> =A0 =A0 Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
>> =A0 =A0 Signed-off-by: Michal Marek<mmarek@suse.cz>
>> =A0 =A0 Tested-by: Stephen Rothwell<sfr@canb.auug.org.au>
>> =A0 =A0 Integrated-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>>
>> :100644 100644 0ef00bd... 1d8e7e9... M =A0Documentation/kbuild/makefiles=
.txt
>> :100644 100644 7bd863e0.. 74bac80... M =A0Makefile
>> :100644 100644 ed2773e... ba25c44... M =A0scripts/Kbuild.include
>>
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>> =A0 Branch: zedd/460
>> =A0 Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd=
/460
>>
>> Thanks,
>> =A0 =A0 Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>>
>>
>> Bruce Ashfield (2):
>> =A0 linux-yocto: fix gcc 4.6.0 compilation failures
>> =A0 linux-yocto/meta-yocto: fix gcc 4.6.0 compilation failures
>>
>> =A0.../recipes-kernel/linux/linux-yocto_git.bbappend =A0| =A0 10 +++++--=
---
>> =A0meta/recipes-kernel/linux/linux-yocto_git.bb =A0 =A0 =A0 | =A0 12 +++=
+++------
>> =A02 files changed, 11 insertions(+), 11 deletions(-)
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> Merged into oe-core and poky as appropriate!
>
> In the future, can you split these into 2 pull requests one for oe-core a=
nd
> the other for poky, it will make tracking these changes easier and one wo=
n't
> get lost.

Sure. Personally I prefer the 2 patches, one pull request, but when in Rome=
 ...

Cheers,

Bruce

>
> Thanks
> =A0 =A0 =A0 =A0Sau!
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


