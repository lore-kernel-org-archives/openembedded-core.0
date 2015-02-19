Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB0C71F23;
	Thu, 19 Feb 2015 03:36:54 +0000 (UTC)
Received: by pabkx10 with SMTP id kx10so6154418pab.13;
	Wed, 18 Feb 2015 19:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=3mKpZQ3MNlkOYWULTZrfiLOiMOLQR+NiU4a5TWqh97Q=;
	b=XmFFQQRG6hWapwG9uqWVsmpqluMDGT6cSkAh4+OpPitH1BmZmqBP/SF9EgKAypXmJ8
	ROAgLbhQ6z0yr9vXiMJ0ZKSTkdyd7HwG4QD/oRdBu99030BdYw0TTSrT68mNxVwQSYWC
	ixNsMnfEs55QSQr7IR2r2suwN/aE3Pr4ZQLEhdxYkhalwyqZBxyMGrxcMoP7kTsulkYH
	QktBggah7B6z+WNb83RC7l7CvrZFxACB8WM19PaxLG6eZ+7lY8VGj2mSkc0xGcxCY5C+
	S0k54NxXu7E9EOZm2JrKpNE8oExy1+XrPN9qlRWmFRi5wAEIuk8nyWS7NY/Z0YhsDM1L
	qYIQ==
X-Received: by 10.70.88.39 with SMTP id bd7mr3883196pdb.83.1424317016055;
	Wed, 18 Feb 2015 19:36:56 -0800 (PST)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	mt4sm22115376pdb.55.2015.02.18.19.36.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Feb 2015 19:36:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3BF3C6CD-6241-4E56-B10F-20A733FE5B2B@gmail.com>
Date: Wed, 18 Feb 2015 19:36:54 -0800
Message-Id: <6CAA4038-63CD-4D66-BF68-211901C10329@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
	<CACS+7ZRNm2Y0SJn76imF6DNoEsL2+ppC1zG45iGspOmL0EN0BQ@mail.gmail.com>
	<CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
	<1423908404.20217.100.camel@linuxfoundation.org>
	<CAMKF1sofS7MteZnPsTYRNAcMwrrh=T3FP+ASmAOGDMhcwyXB4g@mail.gmail.com>
	<1424245575.25541.19.camel@linuxfoundation.org>
	<BCB8524E-91CB-41F6-83C0-7B90E60BC82D@gmail.com>
	<1424260309.25541.23.camel@linuxfoundation.org>
	<1424264807.11836.1.camel@linuxfoundation.org>
	<3F6EFBD4-AC35-4CE0-B52C-0ABDA0D17838@gmail.com>
	<1424295668.11836.19.camel@linuxfoundation.org>
	<E5ADEF30-DBC9-4250-ACA4-F889D8CFDA89@gmail.com>
	<AA599D04-C5B2-49A8-96FB-F9074D59EB03@gmail.com>
	<3BF3C6CD-6241-4E56-B10F-20A733FE5B2B@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Thu, 19 Feb 2015 03:36:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 18, 2015, at 4:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>> On Feb 18, 2015, at 4:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>=20
>>> On Feb 18, 2015, at 4:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>=20
>>>=20
>>>> On Feb 18, 2015, at 1:41 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>>=20
>>>> On Wed, 2015-02-18 at 10:38 -0800, Khem Raj wrote:
>>>>>> On Feb 18, 2015, at 5:06 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>>>> On Wed, 2015-02-18 at 11:51 +0000, Richard Purdie wrote:
>>>>>>> On Wed, 2015-02-18 at 01:01 -0800, Khem Raj wrote:
>>>>>> The series needs:
>>>>>>=20
>>>>>> TUNE_CCARGS_x86 :=3D "${@oe_filter_out('-mfpmath=3Dsse', =
'${TUNE_CCARGS}', d)}"
>>>>>> +TUNE_CCARGS_x86-64 :=3D "${@oe_filter_out('-mfpmath=3Dsse', =
'${TUNE_CCARGS}', d)}=E2=80=9D
>>>>>>=20
>>>>>=20
>>>>> hmmm I assumed x86 was common across 32bit and 64bit x86 but seems =
not so I replaced the old patch instead of appending it=20
>>>>=20
>>>> Thanks, I'll update the patch for the next round.
>>>>=20
>>>>>=20
>>>>>> since the x86 override doesn't cover x86_64. I'll queue that and =
run yet
>>>>>> another build. We do have another poky-tiny issue too:
>>>>>>=20
>>>>>> =
https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/204
>>>>>>=20
>>>>>=20
>>>>> OK. I am creating a local config to use tiny config for libc and =
weed out remaining build issues for tiny config=20
>>>>=20
>>>> Cool, thanks.
>>>>=20
>>>> The next build is in progress and looking greener than the last. =
Next up
>>>> it appears we still have multilib issues:
>>>=20
>>> I have pushed a new patchset to same branch. That should fix the =
tiny build issues.
>>>=20
>>>>=20
>>>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds=
/201
>>>=20
>>>=20
>>> | dcigettext.c: In function '__dcigettext':
>>> | dcigettext.c:856:30: error: '__libc_setlocale_lock' undeclared =
(first use in this function)
>>> |         __libc_rwlock_unlock (__libc_setlocale_lock);
>>>=20
>>> is what I see.
>>>=20
>>> I have fixed this in the latest patchset. So lets start with the new =
patchset.
>>>=20
>>=20
>> in =
https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds=
/201/steps/BuildImages/logs/stdio
>>=20
>> | make: *** =
[/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/bui=
ld/tmp/work/core2-64-poky-linux/glibc-locale/2.21-r0/locale-tree/usr/lib64=
/locale/es_HN] Aborted (core dumped)
>>=20
>> thats new its probably a crash in localedef.
>>=20
>=20
>=20
> | checking for i586-pokymllib32-linux-gcc... =
i586-pokymllib32-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 =
--sysroot=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multili=
b/build/build/tmp/sysroots/lib32-qemux86-64-tcbootstrap
> | checking for suffix of object files... configure: error: in =
`/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/bui=
ld/tmp/work/x86-pokymllib32-linux/lib32-glibc-initial/2.21-r0/build-i586-p=
okymllib32-linux':
> | configure: error: cannot compute suffix of object files: cannot =
compile
> | See `config.log' for more details
> | WARNING: =
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/buil=
d/tmp/work/x86-pokymllib32-linux/lib32-glibc-initial/2.21-r0/temp/run.do_c=
onfigure.1095:1 exit 1 from
> |   =
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/buil=
d/tmp/work/x86-pokymllib32-linux/lib32-glibc-initial/2.21-r0/git/configure=
 --host=3Di586-pokymllib32-linux --build=3Dx86_64-linux --prefix=3D/usr =
--without-cvs --disable-sanity-checks =
--with-headers=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mu=
ltilib/build/build/tmp/sysroots/lib32-qemux86-64/usr/include =
--with-kconfig=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mu=
ltilib/build/build/tmp/sysroots/x86_64-linux/usr/bin =
--enable-hacker-mode --enable-addons
> | ERROR: Function failed: do_configure (log file is located at =
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/buil=
d/tmp/work/x86-pokymllib32-linux/lib32-glibc-initial/2.21-r0/temp/log.do_c=
onfigure.1095)
> NOTE: recipe lib32-glibc-initial-2.21-r0: task do_configure: Failed
>=20
>=20
> Can you post config.log ? here
>=20
> I don=E2=80=99t have multilib setup so hard to reproduce it here
>=20


Nevermind. I think I understood the problem. This tweaking of =
TUNE_CCARGS is resulting in premature evaluation in case of multilib and =
we are ending up with 64bit options when using 32bit gcc
Now, I have fixed this by patching glibc itself. see

=
http://git.openembedded.org/openembedded-core-contrib/tree/meta/recipes-co=
re/glibc/glibc/0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.p=
atch?h=3Dkraj/gcc-glibc-upgrade

as a result all CCARGS patches aren=E2=80=99t needed any longer.

This should be good with multilib now. Please try the latest patchset.

Thinking of TUNE_CCARGS pruning, I think mips multilib will have similar =
issues, probably that flag should also move into glibc build system but =
I will leave that for another day=

