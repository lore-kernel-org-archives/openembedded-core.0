Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T1UdR-0003BU-A4
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 05:51:09 +0200
Received: by qadc11 with SMTP id c11so3119307qad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 20:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yX7Ypv1DSSfn3TNjohZrOiHE4uz9PV6VFh182HLzjyg=;
	b=iT98ZFFZ/iLyqDYl/UXq7t6O1ybk1lGobZITn5cR0gtBDfU8FJCmXGvUI47bmqcg14
	eX0E9Zc2PWrpNko6i1oPJ5HoINpwrmuRDauL3eWF1UHIHT0gZ7akPO6V1wqaUgqYJfmr
	xjtgRj1WOHtueSshtQEmbP7HqgEfs8sYuRbj3O7o9u8EMWPo96HoktoW1UZdPM1vzMGM
	iVr9p38ULLqEJtFfvRITrpoBZFMmAa9GVhTM94lYBqYmybAKhYNzWj/q/U6PTx0HAwIL
	BAtMbrFUHu0aiPgApEGOorCHvgomTUGGmXfH3eIXl3oaWW3avDDUlQClQUAlvTK41hWt
	mlbw==
MIME-Version: 1.0
Received: by 10.229.136.82 with SMTP id q18mr10350708qct.108.1345001953377;
	Tue, 14 Aug 2012 20:39:13 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 14 Aug 2012 20:39:13 -0700 (PDT)
In-Reply-To: <CAEsOVNfh03y944-zeGVOrQ4bRnBc-EKoeyUbxtAKSppgTJ0n4A@mail.gmail.com>
References: <CAEsOVNcP1hf8OqHqDYmt1QJTQ2S557-HjHOa5ihNxVt-veaqOg@mail.gmail.com>
	<CADkTA4Ox5KqWoBFMa5k6HObyMYBK7jNThakNO6AKS04zLRPM4w@mail.gmail.com>
	<CAEsOVNfh03y944-zeGVOrQ4bRnBc-EKoeyUbxtAKSppgTJ0n4A@mail.gmail.com>
Date: Tue, 14 Aug 2012 23:39:13 -0400
Message-ID: <CADkTA4OFKLMy9kQZWKmGD1dnKvYfOyYG0jL8jVHwrApJf_96UA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: perf on older kernels
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
X-List-Received-Date: Wed, 15 Aug 2012 03:51:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 14, 2012 at 11:29 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>
> On Aug 14, 2012 10:11 PM, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>>
>> On Tue, Aug 14, 2012 at 6:39 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>> > I've had to fix / hack the perf_3.4.bb recipe to get it building on my
>> > older kernel. Should we add perf_3.0.bb recipes in oe-core or my own
>> > layer? Or try to keep one recipe working for all versions? I have no
>> > strong opinions.
>>
>> I'd prefer one recipe. Liang sent another proposal earlier for a fix
>> that should make
>> it work on all kernels. Just waiting to hear on that at the moment.
>
> I've actually got other issues...

Did you post the error and I missed it .. I block marked quite a few email read
earlier :) In that case, we can factor out common code to a .inc and keep the
changes between versions as small as possible.

Cheers,

Bruce

>
> -M
>
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > -M
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


