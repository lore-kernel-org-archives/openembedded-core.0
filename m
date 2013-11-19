Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 907146D437
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:29:21 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so2563975pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 14:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UNnK3iwIVSwIzRWdBEou6HEIfrrmyE2ZAI+TPRiXDtg=;
	b=GJSZlSKhCmiBq7ld2cNdWZDD8Nie7p1fpE7Q7quFBZ7jdBf5VBQ+2CXefz7JD0WaQa
	LmIsAp7pEC/3VB6yMZLLG7w27bs0f/n+q69YqjraWfQet4nr13xMn1h8TRGVhBkGMO/e
	rPy/0hD5UfNwp0Ze18zfhAu2AvEs0t+pxJ4Ga5xuCPNjXtDSWcFlYheawkfcqxQ9wqpU
	8hXPfZ63/i7+ILZLxG2NUy7Ut8u/vIo0HAjTnQy1c6UpgkEmBAzml0c9lezuitcVIKUi
	93soViTEPnkQG7oOC+9B52/ZD66Bb4Pf/26EqEV3CwZVdVgLvoWtyv5+Wxx3srUrELbq
	Hrrw==
X-Received: by 10.66.157.165 with SMTP id wn5mr3338769pab.169.1384900163148;
	Tue, 19 Nov 2013 14:29:23 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net ([66.129.239.12])
	by mx.google.com with ESMTPSA id gh3sm32934576pbb.2.2013.11.19.14.29.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Nov 2013 14:29:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
Date: Tue, 19 Nov 2013 14:29:20 -0800
Message-Id: <5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.1822)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Tue, 19 Nov 2013 22:29:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Nov 19, 2013, at 10:17 AM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:

> Adding Khem.
>=20
> Khem .. see below.
>=20
> On Tue, Nov 19, 2013 at 12:54 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Tue, Nov 19, 2013 at 12:46 PM, Phil Blundell <pb@pbcl.net> wrote:
>>> On Tue, 2013-11-19 at 17:37 +0000, Mike Crowe wrote:
>>>> On Tuesday 08 October 2013 at 17:12:54 -0400, Bruce Ashfield wrote:
>>>>> When building against the sysroot, out of tree modules can require =
modpost
>>>>> and other utilities normally found in the kernel's scripts =
directory. For
>>>>> the kernel source in the staging dir, these scripts have been =
removed to
>>>>> avoid mixing archiectures when packaging kernel-dev (among other =
things).
>>>>>=20
>>>>> Rather than further complicate the kernel's install rule, or its =
packaging,
>>>>> we can restore the scripts by building them in the kernel staging =
directory
>>>>> after the sstate is installed, making them available to packages =
that need them.
>>>>>=20
>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>> ---
>>>>> meta/classes/kernel.bbclass | 11 +++++++++++
>>>>> 1 file changed, 11 insertions(+)
>>>>>=20
>>>>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>>>>> index 4acfb7e..d5fa801 100644
>>>>> --- a/meta/classes/kernel.bbclass
>>>>> +++ b/meta/classes/kernel.bbclass
>>>>> @@ -292,6 +292,17 @@ kernel_do_install() {
>>>>> }
>>>>> do_install[prefuncs] +=3D "package_get_auto_pr"
>>>>>=20
>>>>> +
>>>>> +SSTATEPOSTINSTFUNCS +=3D "kernelscripts_sstate_postinst"
>>>>> +kernelscripts_sstate_postinst () {
>>>>> +   if [ "${BB_CURRENTTASK}" =3D "populate_sysroot" -o =
"${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" ]; then
>>>>> +           (
>>>>> +             cd ${STAGING_KERNEL_DIR}
>>>>> +             oe_runmake scripts
>>>>> +           )
>>>>> +   fi
>>>>> +}
>>>>> +
>>>>> sysroot_stage_all_append() {
>>>>>    sysroot_stage_dir ${D}${KERNEL_SRC_PATH} =
${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>>>>> }
>>>>=20
>>>> This sstate_postinst fails for me when the compiler isn't already =
present
>>>> in the sysroot.
>>>>=20
>>>> Also, I notice that the environment and parameters passed to =
oe_runmake are
>>>> not the same as those used by kernel_do_compile etc.
>>>=20
>>> Also note that module.bbclass already does "make scripts" before
>>> do_compile() so out-of-tree modules should already have access to =
all
>>> the files that they need.
>>=20
>> Ah, but they didn't. Otherwise we wouldn't have mucked about in the =
routines.
>> Khem was building out of the sysroot and the support scripts weren't =
present,
>> something which we were able to consistently reproduce.
>>=20
>> Perhaps the whole problem was just a misordering of the tasks. I'll =
take another
>> look.
>>=20
>> But yes, we need one way or the other .. not both. I'd prefer to not =
fiddle with
>> sstate, so I'll go back and see why the module.bbclass code wasn't =
working
>> for the reported error.
>=20
> Khem: I wasn't working from a bugzilla when making these changes, so I
> can't find your original reproducer for the missing recordmcount =
script.
>=20
> Do you recall what it was ? I'm revisiting this and would like to =
understand
> why the make scripts in module-base.bbclass wasn't properly restoring
> the support scripts for your build.
>=20
> I'm leaning towards reverting the whole mess, but without the =
reproducing
> case, I can't be sure that I'm not breaking you again.

Well reproducer case is that build from sstate but such that an external =
module needs to be rebuilt
if external module also comes from sstate then it all is fine. Its only =
when everything is coming from
sstate except this external module which needs to be rebuilt then you =
see this problem.

now, I see the code in module-base.class

#
# Ensure the hostprogs are available for module compilation. Modules =
that
# inherit this recipe and override do_compile() should be sure to call
# do_make_scripts() or ensure the scripts are built independently.
#
do_make_scripts() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS=20
        make CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" AR=3D"${KERNEL_AR}" =
\
                   -C ${STAGING_KERNEL_DIR} scripts
}

so it expects that, do_make_scripts is explicitly called by external =
module recipes

and my recipes did override module_do_compile task but not do_compile =
like below

module_do_compile() {
        oe_runmake
}

so, is comment wrong there should it say module_do_compile instead ?

will it work with sstate always ?

it will be OK to revert it if thats the case.

>=20
> Bruce
>=20
>>=20
>> Bruce
>>=20
>>=20
>>>=20
>>> If we're going to make a policy decision that the kernel is =
responsible
>>> for making scripts then I guess that's fine (modulo the =
implementation
>>> problems that Mike describes) but in that case the code in
>>> module{-base}.bbclass is redundant and ought to be removed.
>>>=20
>>> p.
>>>=20
>>>=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>>=20
>>=20
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"


