Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 308E16CFDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 21:46:44 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id ar20so227202iec.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 14:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DOuPHl+JzzhkgweuCW+NnCGgECLUrmjJ33qTOxtm3TM=;
	b=cB3lVeSE1qKZ3R4J87bhxL8Do54fdoyiXRa9D3SCPsmLHwVd1EVH1kw0j7XYbXJ8L/
	dyB9n6TK1+HC/Xp9O7PgcMAQpnur1Pqzicy9oNjepU0ShtWkmKwX3p7Bp24u8ZmYVwR5
	jcrs/qdD77xjnZ/UqH9JrFkQ9AjqODQH/LGVMJo+TceNeYuCxEjyEJl3WRi6FwMeZ7Yn
	UOeGYzSUKJmHGwo3eaM2iNtXd8E9ZiNr0e521DDmgZYpPuTnZrjzajZW/2XuItyL+TcC
	UMzxMnVUqekiSnmR77uU+j/rZ6j+lJFtx7JZ3J2WcOBwDyRqPqIacg05D1qCa1PqTFyg
	DcPw==
MIME-Version: 1.0
X-Received: by 10.50.23.103 with SMTP id l7mr10958763igf.3.1382392005739; Mon,
	21 Oct 2013 14:46:45 -0700 (PDT)
Received: by 10.50.5.225 with HTTP; Mon, 21 Oct 2013 14:46:45 -0700 (PDT)
In-Reply-To: <5265245A.2090201@emagii.com>
References: <1382345997-28170-1-git-send-email-ulf@emagii.com>
	<20131021111757.GE3709@jama> <5265245A.2090201@emagii.com>
Date: Mon, 21 Oct 2013 14:46:45 -0700
Message-ID: <CAMKF1sqHBp3H_byC-G1BKmDLqn+uzw0MLEUvW3_W62xqu32LDw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "ulf@emagii.com" <ulf@emagii.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add tune for Cortex-A5 chips
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
X-List-Received-Date: Mon, 21 Oct 2013 21:46:44 -0000
Content-Type: multipart/alternative; boundary=089e0158aaba714c7f04e9473896

--089e0158aaba714c7f04e9473896
Content-Type: text/plain; charset=UTF-8

On Monday, October 21, 2013, Ulf Samuelsson <ulf@emagii.com> wrote:
> On 2013-10-21 13:17, Martin Jansa wrote:
>>
>> On Mon, Oct 21, 2013 at 10:59:57AM +0200, Ulf Samuelsson wrote:
>>>
>>> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
>>> ---
>>>   meta/conf/machine/include/tune-cortexa5.inc |   24
++++++++++++++++++++++++
>>>   1 file changed, 24 insertions(+)
>>>   create mode 100644 meta/conf/machine/include/tune-cortexa5.inc
>>>
>>> diff --git a/meta/conf/machine/include/tune-cortexa5.inc
b/meta/conf/machine/include/tune-cortexa5.inc
>>> new file mode 100644
>>> index 0000000..69c945e
>>> --- /dev/null
>>> +++ b/meta/conf/machine/include/tune-cortexa5.inc
>>> @@ -0,0 +1,24 @@
>>> +DEFAULTTUNE ?= "cortexa5thf"
>>
>> wasn't cortexa5 added already in:
>>
>> commit 50bc63c5c377d9fbb87b3efefc8c6f5473ba642a
>> Author: Andy Voltz <andy.voltz@timesys.com>
>> Date:   Wed Jun 5 11:52:30 2013 -0400
>>
>>      tune-cortexa5.inc: Add tune file for cortex-a5
>>
>> I think that one was better, because it had optional neon support and
>> default DEFAULTTUNE should be something more generic (at least to stay
>> consistent with other tunes) it's DISTRO decision to select common
>> denominator (or more specific tunes for each MACHINE) for binary feeds
>> they want to manage.
>
> Looks like you are right.
> I looked at the openembedded-core in Angstrom master, and it wasn't there.
> (
>     because Angstrom master checks out
>     "openembedded-core/remotes/origin/angstrom-staging-yocto1.3"
> )
>

thats default checkout of setup hopefully will change to 2013.12 release
soon which will be based on dora release
> Sorry.
>
> /Ulf
>
>>
>> see
>> commit a11bdc36a1be18cc5aa14682b2a2c9ee83141f51
>> Author: Martin Jansa <Martin.Jansa@gmail.com>
>> Date:   Tue Oct 2 13:21:08 2012 +0000
>>
>>      tune-*: define more generic DEFAULTTUNE to share feed between
>> machines
>>
>>> +# TUNE_FEATU4RES     = "armv7a vfp callconvention-hard"
>>> +# TARGET_FPU        = "vfp"
>>> +
>>> +require conf/machine/include/arm/arch-armv7a.inc
>>> +
>>> +TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor
optimizations"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa5",
"-mtune=cortex-a5", "", d)}"
>>> +
>>> +# Little Endian base configs
>>> +AVAILTUNES += "cortexa5 cortexa5t"
>>> +TUNE_FEATURES_tune-cortexa5 = "${TUNE_FEATURES_tune-armv7a} cortexa5"
>>> +TUNE_FEATURES_tune-cortexa5t = "${TUNE_FEATURES_tune-armv7at} cortexa5"
>>> +
>>> +PACKAGE_EXTRA_ARCHS_tune-cortexa5 =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
>>> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
>>> +
>>> +# VFP Tunes
>>> +AVAILTUNES += "cortexa5hf cortexa5thf"
>>> +TUNE_FEATURES_tune-cortexa5hf ?= "${TUNE_FEATURES_tune-armv7ahf}
cortexa5"
>>> +TUNE_FEATURES_tune-cortexa5thf ?= "${TUNE_FEATURES_tune-armv7athf}
cortexa5"
>>> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
>>> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
>>> +
>>> --
>>> 1.7.9.5
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Best Regards
> Ulf Samuelsson
> ulf@emagii.com
> +46 722 427437
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0158aaba714c7f04e9473896
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, October 21, 2013, Ulf Samuelsson &lt;<a href=3D"mailto:u=
lf@emagii.com">ulf@emagii.com</a>&gt; wrote:<br>&gt; On 2013-10-21 13:17, M=
artin Jansa wrote:<br>&gt;&gt;<br>&gt;&gt; On Mon, Oct 21, 2013 at 10:59:57=
AM +0200, Ulf Samuelsson wrote:<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; Signed-off-by: Ulf Samuelsson &lt;<a href=3D"m=
ailto:ulf@emagii.com">ulf@emagii.com</a>&gt;<br>&gt;&gt;&gt; ---<br>&gt;&gt=
;&gt; =C2=A0 meta/conf/machine/include/tune-cortexa5.inc | =C2=A0 24 ++++++=
++++++++++++++++++<br>
&gt;&gt;&gt; =C2=A0 1 file changed, 24 insertions(+)<br>&gt;&gt;&gt; =C2=A0=
 create mode 100644 meta/conf/machine/include/tune-cortexa5.inc<br>&gt;&gt;=
&gt;<br>&gt;&gt;&gt; diff --git a/meta/conf/machine/include/tune-cortexa5.i=
nc b/meta/conf/machine/include/tune-cortexa5.inc<br>
&gt;&gt;&gt; new file mode 100644<br>&gt;&gt;&gt; index 0000000..69c945e<br=
>&gt;&gt;&gt; --- /dev/null<br>&gt;&gt;&gt; +++ b/meta/conf/machine/include=
/tune-cortexa5.inc<br>&gt;&gt;&gt; @@ -0,0 +1,24 @@<br>&gt;&gt;&gt; +DEFAUL=
TTUNE ?=3D &quot;cortexa5thf&quot;<br>
&gt;&gt;<br>&gt;&gt; wasn&#39;t cortexa5 added already in:<br>&gt;&gt;<br>&=
gt;&gt; commit 50bc63c5c377d9fbb87b3efefc8c6f5473ba642a<br>&gt;&gt; Author:=
 Andy Voltz &lt;<a href=3D"mailto:andy.voltz@timesys.com">andy.voltz@timesy=
s.com</a>&gt;<br>
&gt;&gt; Date: =C2=A0 Wed Jun 5 11:52:30 2013 -0400<br>&gt;&gt;<br>&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0tune-cortexa5.inc: Add tune file for cortex-a5<br>&gt;=
&gt;<br>&gt;&gt; I think that one was better, because it had optional neon =
support and<br>&gt;&gt; default DEFAULTTUNE should be something more generi=
c (at least to stay<br>
&gt;&gt; consistent with other tunes) it&#39;s DISTRO decision to select co=
mmon<br>&gt;&gt; denominator (or more specific tunes for each MACHINE) for =
binary feeds<br>&gt;&gt; they want to manage.<br>&gt;<br>&gt; Looks like yo=
u are right.<br>
&gt; I looked at the openembedded-core in Angstrom master, and it wasn&#39;=
t there.<br>&gt; (<br>&gt; =C2=A0 =C2=A0 because Angstrom master checks out=
<br>&gt; =C2=A0 =C2=A0 &quot;openembedded-core/remotes/origin/angstrom-stag=
ing-yocto1.3&quot;<br>
&gt; )<br>&gt;<br><br>thats default checkout of setup hopefully will change=
 to 2013.12 release soon which will be based on dora release<br>&gt; Sorry.=
<br>&gt;<br>&gt; /Ulf<br>&gt;<br>&gt;&gt;<br>&gt;&gt; see<br>&gt;&gt; commi=
t a11bdc36a1be18cc5aa14682b2a2c9ee83141f51<br>
&gt;&gt; Author: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com"=
>Martin.Jansa@gmail.com</a>&gt;<br>&gt;&gt; Date: =C2=A0 Tue Oct 2 13:21:08=
 2012 +0000<br>&gt;&gt;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0tune-*: define more=
 generic DEFAULTTUNE to share feed between<br>
&gt;&gt; machines<br>&gt;&gt;<br>&gt;&gt;&gt; +# TUNE_FEATU4RES =C2=A0 =C2=
=A0 =3D &quot;armv7a vfp callconvention-hard&quot;<br>&gt;&gt;&gt; +# TARGE=
T_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp&quot;<br>&gt;&gt;&gt; +<br>&=
gt;&gt;&gt; +require conf/machine/include/arm/arch-armv7a.inc<br>
&gt;&gt;&gt; +<br>&gt;&gt;&gt; +TUNEVALID[cortexa5] =3D &quot;Enable Cortex=
-A5 specific processor optimizations&quot;<br>&gt;&gt;&gt; +TUNE_CCARGS +=
=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;cortexa5&qu=
ot;, &quot;-mtune=3Dcortex-a5&quot;, &quot;&quot;, d)}&quot;<br>
&gt;&gt;&gt; +<br>&gt;&gt;&gt; +# Little Endian base configs<br>&gt;&gt;&gt=
; +AVAILTUNES +=3D &quot;cortexa5 cortexa5t&quot;<br>&gt;&gt;&gt; +TUNE_FEA=
TURES_tune-cortexa5 =3D &quot;${TUNE_FEATURES_tune-armv7a} cortexa5&quot;<b=
r>
&gt;&gt;&gt; +TUNE_FEATURES_tune-cortexa5t =3D &quot;${TUNE_FEATURES_tune-a=
rmv7at} cortexa5&quot;<br>&gt;&gt;&gt; +<br>&gt;&gt;&gt; +PACKAGE_EXTRA_ARC=
HS_tune-cortexa5 =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a}&quot;<br>&gt;=
&gt;&gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa5t =3D &quot;${PACKAGE_EXTRA_ARCH=
S_tune-armv7at}&quot;<br>
&gt;&gt;&gt; +<br>&gt;&gt;&gt; +# VFP Tunes<br>&gt;&gt;&gt; +AVAILTUNES +=
=3D &quot;cortexa5hf cortexa5thf&quot;<br>&gt;&gt;&gt; +TUNE_FEATURES_tune-=
cortexa5hf ?=3D &quot;${TUNE_FEATURES_tune-armv7ahf} cortexa5&quot;<br>&gt;=
&gt;&gt; +TUNE_FEATURES_tune-cortexa5thf ?=3D &quot;${TUNE_FEATURES_tune-ar=
mv7athf} cortexa5&quot;<br>
&gt;&gt;&gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf =3D &quot;${PACKAGE_EXTRA=
_ARCHS_tune-armv7ahf}&quot;<br>&gt;&gt;&gt; +PACKAGE_EXTRA_ARCHS_tune-corte=
xa5thf =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf}&quot;<br>&gt;&gt;&gt=
; +<br>
&gt;&gt;&gt; --<br>&gt;&gt;&gt; 1.7.9.5<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; ___=
____________________________________________<br>&gt;&gt;&gt; Openembedded-c=
ore mailing list<br>&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.=
openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-=
core</a><br>&gt;<br>&gt;<br>&gt; --<br>&gt; Best Regards<br>&gt; Ulf Samuel=
sson<br>
&gt; <a href=3D"mailto:ulf@emagii.com">ulf@emagii.com</a><br>&gt; +46 722 4=
27437<br>&gt;<br>&gt; _______________________________________________<br>&g=
t; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-co=
re@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>&gt;

--089e0158aaba714c7f04e9473896--
