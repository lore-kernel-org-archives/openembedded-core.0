Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTQEH-0005yD-HG
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 04:44:05 +0100
Received: by faat2 with SMTP id t2so2509327faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 19:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=YPLxWurbGUi4xHO92O5FQXKTLLnqafNIWJgo59h6gE4=;
	b=x2AGNvugnIh0X4NhckIpNU5SfDA7t/kS2wgNimm6pz98wbRVgtADG7YIaNBmoV4IJh
	pylhx6+LR9a8qTaBSpnGKzwj8MElJ42yZ3FeUTuBz6wJcjA66jHFekyQWJxodu4VVC+R
	Y3gmIc+rbiY199E8vQU1Y7DKkWnPD9IYGgFLM=
Received: by 10.152.132.39 with SMTP id or7mr16175666lab.14.1322105853060;
	Wed, 23 Nov 2011 19:37:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 19:37:02 -0800 (PST)
In-Reply-To: <CAEsOVNd+AuWWwHQAWmeyJ0jnNaVm2522pO_ykVdqzc1X9m96Tg@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAMKF1sqdUPP1=3wiAMTD+Jmf8mbJyDXq4GT7Ho06=mBee92pPw@mail.gmail.com>
	<CAEsOVNd+AuWWwHQAWmeyJ0jnNaVm2522pO_ykVdqzc1X9m96Tg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 19:37:02 -0800
Message-ID: <CAMKF1sov7U1oRZYDyBdWT3uYr1_P0+pAJxU7kLVsDfngJhG16Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Nov 2011 03:44:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 7:35 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Wed, Nov 23, 2011 at 9:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Nov 23, 2011 at 1:40 AM, Matthew McClintock <msm@freescale.com> =
wrote:
>>> Without some sort of dependency on the HOST arch this "fake"
>>> target package will be reused on a 32bit system even if it was
>>> built on a 64bit system.
>>>
>>> This new dependecy should prevent that from occuring.
>>>
>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>> ---
>>> Comments? I still this this is VERY BAD since it will trigger
>>> all TARGET cache to be rebuilt just because we changed ARCH.
>>> However, it should generate working sstate-cache. Might
>>> address this issue:
>>>
>>> | checking for /home/liut/poky/build_p4080ds_release/tmp/work/ppce500mc=
-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build=
.i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/home/liut/poky/build_p4080ds_re=
lease/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-=
r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/ -m32 -mhard-fl=
oat =C2=A0-mcpu=3De500mc -isystem/home/liut/poky/build_p4080ds_release/tmp/=
sysroots/p4080ds/usr/include -B/home/liut/poky/build_p4080ds_release/tmp/sy=
sroots/i686-linux/usr/powerpc-fsl-linux/bin/ -B/home/liut/poky/build_p4080d=
s_release/tmp/sysroots/i686-linux/usr/powerpc-fsl-linux/lib/ -isystem /home=
/liut/poky/build_p4080ds_release/tmp/sysroots/i686-linux/usr/powerpc-fsl-li=
nux/include -isystem /home/liut/poky/build_p4080ds_release/tmp/sysroots/i68=
6-linux/usr/powerpc-fsl-linux/sys-include --sysroot=3D/home/liut/poky/build=
_p4080ds_release/tmp/sysroots/p4080ds-tcbootstrap =C2=A0 option to accept I=
SO C89... none needed
>>> | checking how to run the C preprocessor... /home/liut/poky/build_p4080=
ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr17=
5454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/ho=
me/liut/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-i=
ntermediate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fs=
l-linux/./gcc/ -E
>>> | configure: error: in `/home/liut/poky/build_p4080ds_release/tmp/work/=
ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4_6-bra=
nch/build.i686-linux.powerpc-fsl-linux/powerpc-fsl-linux/libgcc':
>>> | configure: error: C preprocessor "/home/liut/poky/build_p4080ds_relea=
se/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10=
/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/./gcc/xgcc -B/home/liut/=
poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermedi=
ate-4.6.1+svnr175454-r10/gcc-4_6-branch/build.i686-linux.powerpc-fsl-linux/=
./gcc/ -E" fails sanity check
>>> | See `config.log' for more details.
>>> | make[1]: *** [configure-target-libgcc] Error 1
>>> | make[1]: Leaving directory `/home/liut/poky/build_p4080ds_release/tmp=
/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175454-r10/gcc-4=
_6-branch/build.i686-linux.powerpc-fsl-linux'
>>> | make: *** [all] Error 2
>>> | ERROR: oe_runmake failed
>>> | ERROR: Function 'do_compile' failed (see /home/liut/poky/build_p4080d=
s_release/tmp/work/ppce500mc-fsl-linux/gcc-cross-intermediate-4.6.1+svnr175=
454-r10/temp/log.do_compile.27393 for further information)
>>>
>>> =C2=A0meta/recipes-devtools/gcc/gcc-4.6.inc =C2=A0 | =C2=A0 =C2=A02 +-
>>> =C2=A0meta/recipes-devtools/gcc/gcc-cross.inc | =C2=A0 11 +++++++++++
>>> =C2=A02 files changed, 12 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devto=
ols/gcc/gcc-4.6.inc
>>> index f7bcf30..ee42fa7 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>>> @@ -1,6 +1,6 @@
>>> =C2=A0require gcc-common.inc
>>>
>>> -PR =3D "r10"
>>> +PR =3D "r11"
>>>
>>> =C2=A0# Third digit in PV should be incremented after a minor release
>>> =C2=A0# happens from this branch on gcc e.g. currently its 4.6.0
>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-dev=
tools/gcc/gcc-cross.inc
>>> index 5a796bc..9f6d6ad 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>>> @@ -10,3 +10,14 @@ do_compile () {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake all-host all-target-libgcc
>>> =C2=A0}
>>>
>>> +# gcc-cross is special since it builds a HOST binary on
>>> +# as a TARGET recipe. This is a hack to pull in the
>>> +# BUILD_ARCH to the recipe so the sstate-cache is
>>> +# different if the HOST ARCH has changed. By expanding
>>> +# right now we assure it's going to be in the sig
>>> +BUILD_ARCH_EXPANDED :=3D "${BUILD_ARCH}"
>>> +
>>> +# we also add this to the PV so its clear in filenames
>>> +# that this is arch specific even though it's labeled as
>>> +# a target package
>>> +PV .=3D "+${BUILD_ARCH_EXPANDED}"
>>> --
>>> 1.7.6.1
>>>
>>
>> isnt BUILD_ARCH in signature
>
> This is a TARGET recipe, so it should *not* be right?

no this is a cross recipe.

By doing what is
> above I've added it. Although I habe not =C2=A0extensively tested this
> modification...
>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


