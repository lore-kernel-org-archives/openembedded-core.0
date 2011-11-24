Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTTjI-0007EC-SQ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 08:28:20 +0100
Received: by faat2 with SMTP id t2so2616781faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 23:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=G4dX9Eb+RnMpZrbxZ0zDlAytPe4STU2qifN4g1+RRlo=;
	b=Eln6ncKhEo+KnpzS2Vd5muNHGGsZ/nRSinZoWrgMVpo7bntbU6wImPowTWIQrdtof8
	57txCotJpsuWr3M1O5Dz+cN/1tIL3FpzCYAnVNtbMOpFFVv/UD25n9bweOKWpCxx0ZOV
	wa7mkGaoSg2Ik/RByugWONKYivJOW8HYVM1g8=
Received: by 10.152.132.39 with SMTP id or7mr16489628lab.14.1322119308104;
	Wed, 23 Nov 2011 23:21:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 23:21:18 -0800 (PST)
In-Reply-To: <CAEsOVNe-AvQ-DXUH-TMZFtmmAJ0oqSRveh+ovC-qvttrpguARg@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAMKF1sqdUPP1=3wiAMTD+Jmf8mbJyDXq4GT7Ho06=mBee92pPw@mail.gmail.com>
	<CAEsOVNd+AuWWwHQAWmeyJ0jnNaVm2522pO_ykVdqzc1X9m96Tg@mail.gmail.com>
	<CAMKF1sov7U1oRZYDyBdWT3uYr1_P0+pAJxU7kLVsDfngJhG16Q@mail.gmail.com>
	<CAEsOVNe22kPLsNn0pmkuSycHwNfO6AFgJGxqMb=ex+VamAK9hw@mail.gmail.com>
	<CAEsOVNe-AvQ-DXUH-TMZFtmmAJ0oqSRveh+ovC-qvttrpguARg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 23:21:18 -0800
Message-ID: <CAMKF1sr8RdXbS3po2fz+e_Q9oKt133QmdJzs=+idSdeQ7MEWnQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
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
X-List-Received-Date: Thu, 24 Nov 2011 07:28:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2011 at 7:55 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Wed, Nov 23, 2011 at 9:54 PM, Matthew McClintock <msm@freescale.com> wrote:
>> On Wed, Nov 23, 2011 at 9:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> isnt BUILD_ARCH in signature
>>>>
>>>> This is a TARGET recipe, so it should *not* be right?
>>>
>>> no this is a cross recipe.
>>
>> This is built in tmp/work/ppce5500-fsl-linux/gcc-cross-*
>>
>> That's a TARGET package, even though it run on on the HOST... changing
>> from x86 to X86-64 causes problems - hence the whole problem?
>
> Actually the reverse causes the problem: x86-64 to x86... because the
> packages won't be recompiled and the 64bit stuff won't run on 32bit
> host?
>

hmmm I guess cross recipes are special they should not have been built
under target recipes. Adding build arch to package name would be ok
too but may be if they were built under directory of their own which
was something like <build>-<host>-<target> then it would also solve
the problem i think
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


