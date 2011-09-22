Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1R6jPV-0005DX-MA
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 15:33:53 +0200
Received: by wwf27 with SMTP id 27so1847692wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oFS4XviiZryxU3TKRD+YHBHBZ3Ybi2qsjZkQXJHE5yI=;
	b=jwB6uvpg1cP07sVxMP1L7JOoJh1PKbkZhILs8YJ2CEM7E2f2QNgbO8Z+ovc5wbAV1b
	FzChvmg/PrDD3HyOfyw0cFRxsM5hLYT+RcxWGtsatvidBsd/NkyjJqA73DluNbr5uFkG
	nwDByXbr6OSnmugO730yzsHpD0oLB2kipw0MM=
MIME-Version: 1.0
Received: by 10.227.19.195 with SMTP id c3mr626349wbb.39.1316698113393; Thu,
	22 Sep 2011 06:28:33 -0700 (PDT)
Received: by 10.180.100.165 with HTTP; Thu, 22 Sep 2011 06:28:33 -0700 (PDT)
In-Reply-To: <C9AF5103-2487-4DA1-A348-1E28411FAD29@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<CAP9ODKqwxc7TcZhgNtuZfan_Kbdn2hJ7UELfy=BeFtGS3iGKGQ@mail.gmail.com>
	<j5f9i0$9uf$1@dough.gmane.org>
	<95C58349-35C4-4027-BDEA-7841ED3B4A16@dominion.thruhere.net>
	<j5fbi7$opp$1@dough.gmane.org>
	<C9AF5103-2487-4DA1-A348-1E28411FAD29@dominion.thruhere.net>
Date: Thu, 22 Sep 2011 09:28:33 -0400
Message-ID: <CADkTA4Pn7enn_ocpzwAeX7si=u-+UAabjrJDwBDoC1ODQqiQZg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
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
X-List-Received-Date: Thu, 22 Sep 2011 13:33:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2011 at 9:17 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 22 sep. 2011, om 15:00 heeft Dmitry Eremin-Solenikov het volgende gesc=
hreven:
>
>> On 09/22/2011 04:35 PM, Koen Kooi wrote:
>>>
>>> Op 22 sep. 2011, om 14:25 heeft Dmitry Eremin-Solenikov het volgende ge=
schreven:
>>>
>>>> On 09/18/2011 02:23 AM, Otavio Salvador wrote:
>>>>> I have sent this in July and it was nacked. See at
>>>>> https://github.com/OSSystems/oe-core/commit/5c53cbf951a11ed92fb2ad083=
7991db256c11489
>>>>
>>>> Answering the original question by Saul:
>>>> A possible better question is why perf-dbg is getting generated and wh=
at's in it?
>>>>
>>>> perf and perf-dbg are generated to contain perf tool if it's not direc=
tly enabled (AFAIK), but you can compile it by running make in tools/perf. =
It has some additional depends (like binutils-dev, elfutils-dev, news-dev, =
etc., so it's not enabled by default. Probably we should enable it though.
>>>
>>> the oe core kernel.bbclass builds perf by default
>>
>> according to kernel.bbclass: "perf must be enabled in individual kernel =
recipes"
>
> And pretty much everything uses recipes-kernel/linux/linux-tools.inc, whi=
ch enables it. I had to add do_compile_perf() { : } to my old kernel recipe=
s that have a broken perf, so it's opt-out, not opt-in.

We can always flip this around if required. When I initially did the kernel
tree based builds for perf it was right in a specific kernel recipe, and th=
en
pulled it out into linux-tools.inc for easier reuse it was the intention th=
at
just including/requiring that .inc file would trigger a build of perf.

I'm open to inhibiting this via the blacklist or via some other suitable
mechanism.

But did we get some include creep (or maybe I'm just missing it) ?
When I just checked my tree, I only see a handful of places that linux-tool=
s.inc
will be pulled in and trigger a build.

Cheers,

Bruce

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


