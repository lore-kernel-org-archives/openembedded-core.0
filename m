Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0JO5-0007kT-TK
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 22:06:09 +0100
Received: by lahc1 with SMTP id c1so594676lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 12:57:49 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.145.137 as permitted sender)
	client-ip=10.152.145.137; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.145.137 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.145.137])
	by 10.152.145.137 with SMTP id su9mr24198503lab.23.1329944269428
	(num_hops = 1); Wed, 22 Feb 2012 12:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Oi1VwikenkIBaYnztr0gbmGrTUCdxIROasnnosG4tLM=;
	b=b92Fte4bgcUJwvR+WUXWTuyec28mU2+yctLnLBg4tt7Qi1+36v3QHaOo75b4p1G86h
	rYTsyWj5qfv6O1AI48g98f2UuNG2sZaJpCLUIupXsEFojAM32KWMvcmVAVUpJU9B3mLi
	Z3svFNz9J4SCOG7AOfakR1eoXHYp/wzfAIx9w=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr20299158lab.23.1329944269341;
	Wed, 22 Feb 2012 12:57:49 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 22 Feb 2012 12:57:49 -0800 (PST)
In-Reply-To: <CALbNGRSt8==s56Ef4EHKDx5i1WP6ww8gb9T7XBzi2G879DPRNw@mail.gmail.com>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CALbNGRSt8==s56Ef4EHKDx5i1WP6ww8gb9T7XBzi2G879DPRNw@mail.gmail.com>
Date: Wed, 22 Feb 2012 21:57:49 +0100
Message-ID: <CALbNGRSXmsD9+A_bCXBzCwMv_wOyUYmY-TWZOdeNU+LdAxZNHw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: gcc-cross-initial patching fails
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
X-List-Received-Date: Wed, 22 Feb 2012 21:06:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 9:56 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Feb 22, 2012 at 9:13 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> At build from scratch I get
>>
>> ERROR: Command Error: exit status: 1 =A0Output:
>> Applying patch gcc45-no-add-needed.patch
>> patching file gcc/config/alpha/elf.h
>> patching file gcc/config/ia64/linux.h
>> patching file gcc/config/linux.h
>> Hunk #1 succeeded at 89 (offset -12 lines).
>> patching file gcc/config/rs6000/sysv4.h
>> Hunk #1 FAILED at 908.
>> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
>> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
>> ERROR: Function failed: patch_do_patch
>> ERROR: Logfile of failure stored in:
>> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/te=
mp/log.do_patch.5367
>> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Faile=
d
>> ERROR: Task 2829
>> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-=
devtools/gcc/gcc-cross-initial_4.5.bb,
>> do_patch) failed with exit code '1'
>>
>> git log does not help me much - =A0what goes wrong?
>>
> After looking around a bit I think this one is better on oe-core list.
> Maybe it is related to the last two patches:
>
> commit 6546096d068b51cc9cf4557cdb35aee6f62838d5
> Author: Lianhao Lu <lianhao.lu@intel.com>
> Date: =A0 Tue Feb 14 10:57:52 2012 +0800
>
> =A0 =A0gcc: Excluding the DATE/SRCDATE from do_patch dependency.
>
> =A0 =A0Corrected the error introduced by commit afb400e of dropping
> =A0 =A0DATE/SRCDATE out of the vardepsexlude list of do_patch.
>
> =A0 =A0Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc
> b/meta/recipes-devtools/gcc/gcc-common.inc
> index 57668f9..df6021a 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -109,4 +109,4 @@ do_headerfix[vardepvalue] =3D "PATH"
> =A0# We need to ensure that for the shared work directory, the do_patch
> singatures match
> =A0# The real WORKDIR location isn't a dependency for the shared workdir.
> =A0src_patches[vardepsexclude] =3D "WORKDIR"
> -should_apply[vardepsexclude] =3D "PN"
> +should_apply[vardepsexclude] +=3D "PN"
>
> commit afb400e9c3ddac604906bde44df5da29a6c134d9
> Author: Lianhao Lu <lianhao.lu@intel.com>
> Date: =A0 Fri Feb 10 11:42:18 2012 +0800
>
> =A0 =A0gcc: Ensure same sstate hashes for shared soruce directory
>
> =A0 =A0Ensure do_patch have the same sstate hashes for nativesdk variants=
 of
> =A0 =A0gcc family recipes, since they share the same source directory.
>
> =A0 =A0Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc
> b/meta/recipes-devtools/gcc/gcc-common.inc
> index e89a7c0..57668f9 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -109,3 +109,4 @@ do_headerfix[vardepvalue] =3D "PATH"
> =A0# We need to ensure that for the shared work directory, the do_patch
> singatures match
> =A0# The real WORKDIR location isn't a dependency for the shared workdir.
> =A0src_patches[vardepsexclude] =3D "WORKDIR"
> +should_apply[vardepsexclude] =3D "PN"
>

AArgh wrong list - sorry

Andreas


