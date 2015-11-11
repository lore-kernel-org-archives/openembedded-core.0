Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 59405770F4;
	Wed, 11 Nov 2015 14:59:54 +0000 (UTC)
Received: by wmww144 with SMTP id w144so162712432wmw.1;
	Wed, 11 Nov 2015 06:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=t+o8rBMTPBw0AjY56VxakjQ4mIXXvwaM6XLIzi6OOBE=;
	b=siTCQZ1a10GOrKOxJFKHbpWZ0Qxa6Z53+GGs6SvHhYnurdNVN2Vo1GFaaZLC1oZD0B
	K29NgewG5m6WPIn/uHp2i0NtVuW/Vr+FZb3xBRarng9vxlJvpWOnI8OaNRjCtvWkrkfw
	ImAiCLPMAb+4nzpKq9RnHnKpbhks2DRDAjbZTQgSK2UqAA884um/2TZTsgPi3GhRRu/i
	gXVga73ELePcMqgI6sz19CWMzYF3NXiOTUmNeTVcXhE4hYsxI3pUYF+NNdp+yQS1lfvO
	wP0ZvWs5zdPBXsiqVjIemJmbUq0PpKkWWPa+YbMsaXCgLUUZsS7DwyJtpPcQT54V5AV/
	YjLA==
X-Received: by 10.194.3.39 with SMTP id 7mr10592817wjz.20.1447253994791;
	Wed, 11 Nov 2015 06:59:54 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	w66sm9995378wme.11.2015.11.11.06.59.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 06:59:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CADkTA4Mx1uYVia7A76b0sbE7me2ALUDy=9sgBa9Yjh5Umxdx1Q@mail.gmail.com>
Date: Wed, 11 Nov 2015 15:59:52 +0100
Message-Id: <501449CC-496A-43B3-ABCF-7F7BDD6AA7F1@gmail.com>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<20151014193033.GD3552@dent.vctlabs.com>
	<CADkTA4MMRESA2E2H_0iruywU6AgzSwaZ8Sj03SBB25=ckGv41Q@mail.gmail.com>
	<E48EA04B-494B-4D42-999B-A99E70ED7A0C@gmail.com>
	<CADkTA4OWFTjTnHU7G0cgMeHosU6TvUOLz4xqK5RSJNHtajxX-w@mail.gmail.com>
	<A9347ED0-D839-4DD8-B710-52432690DA43@gmail.com>
	<CADkTA4Mx1uYVia7A76b0sbE7me2ALUDy=9sgBa9Yjh5Umxdx1Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [oe] kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Wed, 11 Nov 2015 15:00:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 13:49 schrieb Bruce Ashfield =
<bruce.ashfield@gmail.com>:
>=20
> On Wed, Nov 11, 2015 at 4:00 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> Am 11.11.2015 um 03:01 schrieb Bruce Ashfield =
<bruce.ashfield@gmail.com>:
>>>=20
>>> On Tue, Nov 10, 2015 at 4:33 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>=20
>>>>> Am 14.10.2015 um 21:48 schrieb Bruce Ashfield =
<bruce.ashfield@gmail.com>:
>>>>>=20
>>>>> On Wed, Oct 14, 2015 at 3:30 PM, S. Lockwood-Childs =
<sjl@vctlabs.com> wrote:
>>>>>> http://patchwork.openembedded.org/patch/99875/
>>>>>>=20
>>>>>> Apparently this patch is still not in master, and I just ran =
across the
>>>>>> problem with an externally built module (omaplfb from =
omap3-sgx-modules)
>>>>>> in meta-ti layer.
>>>>>>=20
>>>>>> What's the plan for getting a correct Module.symver into =
shared_workdir
>>>>>> for external modules to build against? Above patch, or does =
someone have
>>>>>> an even better idea?
>>>>>=20
>>>>> Richard and I sync'd on this while in Dublin @ ELCe, and the =
changes
>>>>> aren't missing
>>>>> from master by mistake .. but more because we are still working to =
come up with
>>>>> a comprehensive solution (tracked in bugzilla).
>>>>>=20
>>>>> The solution is pretty much what I described before, we are =
balancing
>>>>> applications
>>>>> and tasks that do not need kernel modules to be built, versus =
external modules
>>>>> that depend on symbols from other modules. The devil is in the
>>>>> details, and getting
>>>>> a non-racy, task locked solution that allows the recipe writer to
>>>>> explicitly decide
>>>>> whether they need modules built or not .. attempts at detecting =
the
>>>>> need, or forcing
>>>>> a one size fits all solution have all lead to dead ends.
>>>>>=20
>>>>> Since we are close to a release point, I'm still working on this =
out
>>>>> of the tree, and
>>>>> will propose some changes when the tree looks stable.
>>>>>=20
>>>>> For now, you can carry the patch locally, or you can append to the =
kernel module
>>>>> compilation task and do a second copy of the symvers file to the =
share
>>>>> directory.
>>>>>=20
>>>>> i.e. a variant of this:
>>>>> http://patchwork.openembedded.org/patch/94891/, done in a
>>>>> bbappend versus the class.
>>>>>=20
>>>>> Cheers,
>>>>>=20
>>>>> Bruce
>>>>=20
>>>> This is kind of insane to try a fix duplicating a job in a probably =
wrong way
>>>> (even a tiny) because of performance issue.
>>>=20
>>> I have a fix already queued for this,
>>=20
>> I've seen the fix you referred at =
http://patchwork.openembedded.org/patch/94891/,
>> this is broken.
>=20
> No that isn't it. But also, no, that isn't broken. It works, but there =
is a
> potential for a race, which is what we've been fixing.
>=20
> Can you elaborate on why you'd declare that broken ?

Because you fix one race condition by introducing another one. If there =
is
another word than broken for it, I'm happy to learn that,

>>=20
>>> but I'm currently out of the office ..
>>> I swear, every time I go on vacation, someone brings this up.
>>>=20
>>> I've been waiting for the smoke to clear on the 2.0 release before
>>> posting it .. so please, just a bit more patience and I'll send out
>>> that series.
>>=20
>> Maybe giving us an impression whether it's correct or just work for =
you(tm) :P
>=20
> For everyone. Richard wouldn't exactly take my series and kernel
> updates if they were only just for me. :)

I didn't talk about your work for the kernel, I'm just talking about =
your
patch to fix initially mentioned race condition.

>>>> Any 3rd party kernel module depends on do_shared_workdir - so =
do_shared_workdir
>>>> must wait for do_compile_kernelmodules - that's it by design (build =
is done
>>>> relying on dependencies ordered in a directed, noncyclical graph.
>>>>=20
>>>> Since compile_kernelmodules is between compile and strip, I vote =
for
>>>>=20
>>>> $ git diff
>>>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>>>> index 5e8b6cf..49d7561 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -253,7 +253,7 @@ kernel_do_install() {
>>>> }
>>>> do_install[prefuncs] +=3D "package_get_auto_pr"
>>>>=20
>>>> -addtask shared_workdir after do_compile before =
do_compile_kernelmodules
>>>> +addtask shared_workdir after do_compile_kernelmodules before =
do_strip
>>>> addtask shared_workdir_setscene
>>>>=20
>>>> do_shared_workdir_setscene () {
>>>>=20
>>>> But that's surely kind of smell, whether before do_strip and =
do_install is
>>>> preferred. Mandatory is, that do_shared_workdir must not be =
processed before
>>>> do_compile_kernelmodules finishes.
>>>>=20
>>>> There is no way to avoid it, and if those 5 seconds slow down your =
build,
>>>> there is probably another thing which should be fixed.
>>>=20
>>> It's not 5 seconds. It is much more on some machines and =
configurations.
>>=20
>> Depends on your build machine and much more, your sstate cache,
>> changes to kernel and why you do a full build after each kernel
>> change instead of just deploying the kernel.
>=20
> Sure. I've been at this for years now .. and I've seen and used lots
> of configs. We are trying to give a choice on what level of building
> triggers.
>=20
>>=20
>>> The point is that not everyone who is building modules depends on
>>> other modules and not everyone that is building against the kernel
>>> may even want modules built.
>>=20
>> That's only build time. How often do you recompile your kernel that
>> this dependency really matters?
>=20
> I rebuild the kernel a lot .. I'm doing kernel and kernel tools =
maintenance
> after all :)

Understood, so your primary tooling becomes slower.

>>> The fix is to just re-copy the symbols after kernel modules are
>>> built, and put the onus on the recipe writer to depend on the
>>> right task/variant. By default, do_shared_workdir won't have that
>>> dependency, but anyone with a recipe that does depend on other
>>> module symbols will get that extra copy and dependency created.
>>=20
>> This is simply wrong, period. Because (I already explained that)
>> module-base.bbclass adds a configure-stage dependency to =
do_shared_workdir.
>>=20
>=20
> And I explained that I didn't need that explanation.

I'm sorry - but I didn't got that. I still don't get that you
don't need that explanation. Even if you understand more and deeper
what's going on when building kernel and tools and 3rd party
modules around that - several people running into that race condition
and you disagree that moving the race keeps the thing broken.

> There's really no need to escalate your language. It isn't needed.
>=20
>> You can avoid the mistake by adding a sane stage for =
redo_shared_workdir
>> after do_compile_kernelmodules before do_strip and reassign the 3rd
>> party module bbclass to depend on redo_shared_workdir.
>>=20
>> OTOH I think, build performance isn't worth a however sophisticated
>> fragile patch. Let's apply Stefan's patch and be my guest for sending
>> an performance optimized one when you figured it out.
>>=20
>> @Richard - isn't it worth use the correct, even if slow, patch and
>> let Bruce anytime in not to distant future provide an optimized one
>> which can be settled and backported for 2.0.1?
>>=20
>> Isn't release time soon enough?
>>=20
>> @Stefan - would you agree to "addtask shared_workdir after =
do_compile_kernelmodules before do_strip"
>> instead of "addtask shared_workdir after do_compile_kernelmodules =
before do_install"?
>>=20
>=20
> I'm checking out of the conversation, since I'm on vacation and =
shouldn't
> be near a computer.
>=20
> I indicated months ago that RP has the final say, and he can merge any
> variants of the patches he wants, since they don't break anything and
> fix the problem.
>=20
> RP: I'll ack either patch that has been posted. I'll will revisit all =
of this
> when I'm working on my 2.1 kernel packaging changes anyway, so
> there's no need to wait.

Great! Thanks, Bruce.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


