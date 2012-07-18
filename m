Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SrUrQ-0005Tp-Li
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 16:04:16 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 06:52:54 -0700
Received: by qcmv28 with SMTP id v28so848409qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=YqcGdoPbIpzC2ZyI02usSkTh2Vx9CSuNWhel4kaSmZg=;
	b=Ql2PyEPZD1EpnGo6qm7oYBIrz0HGx0Zegbl/E8z3XXTBQEH07tm/+r0+vp8Sd/3rqd
	kF+24XINZ2FuZjja88UJsCAJ6KBR2fpDAYxoKDfgoIAsmxXQwuZ9gZxXd2hq9fC/Cx8d
	d8vCGxqtJKM9HuASM3Gj/3bxA64t3rQqg2SmVzUCiaDH3k17G3ucBMNVnEnzfHUyE+Vu
	bdDIeRMFeHB6rNzmAxuVE6e3hZTKm+9zlgPdAlU38uUkZTE5xM2ZJ4QPMH2MZuYXhbN7
	/x2RYQAAQ4d1kguoes8yGri/A86Hhpw/674WK3JsMOCSkxOgRadOtsMYwXIgIuUCbEC3
	s5fg==
Received: by 10.229.135.13 with SMTP id l13mr1444064qct.98.1342619572412; Wed,
	18 Jul 2012 06:52:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.178.233 with HTTP; Wed, 18 Jul 2012 06:52:32 -0700 (PDT)
In-Reply-To: <1342619416.513.7.camel@ted>
References: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1sq_D4nDSSOctRRht=_93yacfMNfnO9AENCg-aTGyPNreg@mail.gmail.com>
	<CAMZjud0ZtRDiE-kpNw6mZz33BQEBJN3LzG5shHEzMn6wk5+sSA@mail.gmail.com>
	<CADkTA4OkYB6ZsA81mz1YUrYeukVjrtSTph8b5mJ9jiomPibMKg@mail.gmail.com>
	<CAMZjud1JPfU7pfd2C+gQEmEpY_8ePSvrsMiyUMOAH4SnMd-pqg@mail.gmail.com>
	<CADkTA4NTBME99-JMBy1+22iwqV7nxpsB=CSsLNuT8wDKgQY-eA@mail.gmail.com>
	<1342619416.513.7.camel@ted>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Wed, 18 Jul 2012 16:52:32 +0300
Message-ID: <CAMZjud1aPgxg8BPw+-iiyUL-W3d9jc6+5=L6UDiswwTqBOrCJw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmp0QMszb8Wos50ocwthXmTr1SjyLRf6/lnwZU0SX9QkUgsVCbOctEqWKZozlHGtBsiVWv+
Subject: Re: [PATCH] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Wed, 18 Jul 2012 14:04:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 18, 2012 at 4:50 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-07-18 at 09:23 -0400, Bruce Ashfield wrote:
>> On Wed, Jul 18, 2012 at 9:17 AM, Marinescu, Bogdan A
>> <bogdan.a.marinescu@intel.com> wrote:
>> > On Wed, Jul 18, 2012 at 4:03 PM, Bruce Ashfield
>> > <bruce.ashfield@gmail.com> wrote:
>> >> On Wed, Jul 18, 2012 at 7:30 AM, Marinescu, Bogdan A
>> >> <bogdan.a.marinescu@intel.com> wrote:
>> >>> On Tue, Jul 17, 2012 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>>> Why is recipe renamed
>> >>>
>> >>> Wasn't I supposed to do that when I upgraded the package from 3.4 to 3.4.3 ?
>> >>
>> >> No one replied to my other question (or at least no one replied that I
>> >> noticed), about
>> >> why we even bothered to bump it to 3.4.3 ...
>> >
>> > Quite simply, I'm the owner of the recipe and I'm supposed to upgrade
>> > it when a new version appears :)
>>
>> I must have missed that .. because I'd disagree with both counts.
>>
>>  - libc-headers does not need to be upgraded with every korg stable update
>>  - it is coupled to the kernel, and I've done it in the past, and had planned to
>>    leave it a 3.4.
>
> Bogdan: This is probably one of the cases we shouldn't automatically
> update just based on the output of the version checking scripts. We
> should only change the point release version here if there is a change
> to the kernel headers that we need.

Understood, thanks.

>
> As for the recipe owner, this one may be best owned by Bruce but I'm
> open minded on that.

I have absolutely nothing against that.

Thanks,
Bogdan

>
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


