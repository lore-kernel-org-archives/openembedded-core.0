Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SppO5-0001wp-TQ
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 01:35:05 +0200
Received: by weyr6 with SMTP id r6so2468362wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 16:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YF2Tp9KsM5zMISHCNba7CYKHZITkUPoydGVLK4eQHoI=;
	b=jLpEIzKQOVhchDyQ1i8riYWIaT6IRz6L/NP0+iQzs3Sl/U8IZeOxuqeJzHGpFPb10I
	Oo/cBjA/x9pKthcntEE7AKtyK5ojhW7VtDGVL1+sAVqY5Et7Obq4+hGNxYEgDt4ijFm9
	jpazeuPkOp7Ef8Hjh1oQkfeRl/K94KvkG7aZohYVRHobBRt1kUEyufBX3JB+RWvWpFQD
	nHdIPlDX6nugkjgxh6qQGASQUA9GeFD3Re0kWk1sXgjNlzRiU825UGG4n6Hw3Qe9dXeT
	QM3ifkG4acADpmZ8GHOiBiIiK4mwdcRtzAos9vnsSwa5fuKBGBvEXrro1M1P3fxiOuQS
	1K4A==
MIME-Version: 1.0
Received: by 10.216.158.134 with SMTP id q6mr1390374wek.161.1342221830715;
	Fri, 13 Jul 2012 16:23:50 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 13 Jul 2012 16:23:50 -0700 (PDT)
In-Reply-To: <CAEsOVNdHzFoc6m_yAiUk97iFxuDsr-MDL=M19hvci-oxAAcnOg@mail.gmail.com>
References: <1342210017-26817-1-git-send-email-msm@freescale.com>
	<CAMKF1sokTHtYziStdSsGvdh4HnhJs3KAYecs-dJ1UXeBGN_sUg@mail.gmail.com>
	<CAEsOVNdHzFoc6m_yAiUk97iFxuDsr-MDL=M19hvci-oxAAcnOg@mail.gmail.com>
Date: Fri, 13 Jul 2012 16:23:50 -0700
Message-ID: <CAMKF1sr_jLKLoRRP-p9aZEvd=mKxoDdmgjv4=iHwwzAz5TDmzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] task-core-tools-testapps.bb: kexec-tools does not work on e5500-64b parts
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
X-List-Received-Date: Fri, 13 Jul 2012 23:35:06 -0000
Content-Type: multipart/alternative; boundary=00163683200c6dfa0504c4be5f65

--00163683200c6dfa0504c4be5f65
Content-Type: text/plain; charset=UTF-8

On Friday, July 13, 2012, McClintock Matthew-B29882 <B29882@freescale.com>
wrote:
> On Fri, Jul 13, 2012 at 3:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Jul 13, 2012 at 1:06 PM, Matthew McClintock <msm@freescale.com>
wrote:
>>> This prevents kexec from building for this part since it does not work
>>>
>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>> ---
>>>  meta/recipes-core/tasks/task-core-tools-testapps.bb |    1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bbb/meta/recipes-core/tasks/
task-core-tools-testapps.bb
>>> index b5847f8..bdd0d05 100644
>>> --- a/meta/recipes-core/tasks/task-core-tools-testapps.bb
>>> +++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb
>>> @@ -22,6 +22,7 @@ KEXECTOOLS ?= "kexec"
>>>  KEXECTOOLS_mips ?= ""
>>>  KEXECTOOLS_mipsel ?= ""
>>>  KEXECTOOLS_powerpc ?= ""
>>> +KEXECTOOLS_e5500-64b ?= ""
>>
>> you should use arch override here this is not machine specific recipe
probably
>>
>> KEXECTOOLS_powerpc64 ?= ""
>>
>> is better
>
> I thought about that at first, but there are plenty of powerpc64
> machines that do support kexec ;) It's really just the Freescale
> variant.

OK I see I thought PowerPC 32 bit is ignored already so chances of 64 bit
working are even less but as you say it works on some of them so be it
>
> -M
>
>>
>>>
>>>  RDEPENDS_${PN} = "\
>>>      blktool \
>>> --
>>> 1.7.10
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--00163683200c6dfa0504c4be5f65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, July 13, 2012, McClintock Matthew-B29882 &lt;<a href=3D"=
mailto:B29882@freescale.com">B29882@freescale.com</a>&gt; wrote:<br>&gt; On=
 Fri, Jul 13, 2012 at 3:43 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Fri, Jul 13, 2012 at 1:06 PM, Matthew McClintock &lt;<a href=3D=
"mailto:msm@freescale.com">msm@freescale.com</a>&gt; wrote:<br>&gt;&gt;&gt;=
 This prevents kexec from building for this part since it does not work<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; Signed-off-by: Matthew McClintock &lt;<a href=
=3D"mailto:msm@freescale.com">msm@freescale.com</a>&gt;<br>&gt;&gt;&gt; ---=
<br>&gt;&gt;&gt; =C2=A0meta/recipes-core/tasks/<a href=3D"http://task-core-=
tools-testapps.bb">task-core-tools-testapps.bb</a> | =C2=A0 =C2=A01 +<br>
&gt;&gt;&gt; =C2=A01 file changed, 1 insertion(+)<br>&gt;&gt;&gt;<br>&gt;&g=
t;&gt; diff --git a/meta/recipes-core/tasks/<a href=3D"http://task-core-too=
ls-testapps.bb">task-core-tools-testapps.bb</a> b/meta/recipes-core/tasks/<=
a href=3D"http://task-core-tools-testapps.bb">task-core-tools-testapps.bb</=
a><br>
&gt;&gt;&gt; index b5847f8..bdd0d05 100644<br>&gt;&gt;&gt; --- a/meta/recip=
es-core/tasks/<a href=3D"http://task-core-tools-testapps.bb">task-core-tool=
s-testapps.bb</a><br>&gt;&gt;&gt; +++ b/meta/recipes-core/tasks/<a href=3D"=
http://task-core-tools-testapps.bb">task-core-tools-testapps.bb</a><br>
&gt;&gt;&gt; @@ -22,6 +22,7 @@ KEXECTOOLS ?=3D &quot;kexec&quot;<br>&gt;&gt=
;&gt; =C2=A0KEXECTOOLS_mips ?=3D &quot;&quot;<br>&gt;&gt;&gt; =C2=A0KEXECTO=
OLS_mipsel ?=3D &quot;&quot;<br>&gt;&gt;&gt; =C2=A0KEXECTOOLS_powerpc ?=3D =
&quot;&quot;<br>&gt;&gt;&gt; +KEXECTOOLS_e5500-64b ?=3D &quot;&quot;<br>
&gt;&gt;<br>&gt;&gt; you should use arch override here this is not machine =
specific recipe probably<br>&gt;&gt;<br>&gt;&gt; KEXECTOOLS_powerpc64 ?=3D =
&quot;&quot;<br>&gt;&gt;<br>&gt;&gt; is better<br>&gt;<br>&gt; I thought ab=
out that at first, but there are plenty of powerpc64<br>
&gt; machines that do support kexec ;) It&#39;s really just the Freescale<b=
r>&gt; variant.<br><br>OK I see I thought PowerPC 32 bit is ignored already=
 so chances of 64 bit working are even less but as you say it works on some=
 of them so be it<br>
&gt;<br>&gt; -M<br>&gt;<br>&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; =C2=A0R=
DEPENDS_${PN} =3D &quot;\<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0blktool \<br>=
&gt;&gt;&gt; --<br>&gt;&gt;&gt; 1.7.10<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&=
gt;&gt;&gt;<br>&gt;&gt;&gt; _______________________________________________=
<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>&gt;&gt;&gt; <a href=3D"mail=
to:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openem=
bedded.org</a><br>&gt;&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bi=
n/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/ma=
ilman/listinfo/openembedded-core</a><br>
&gt;&gt;<br>&gt;&gt; _______________________________________________<br>&gt=
;&gt; Openembedded-core mailing list<br>&gt;&gt; <a href=3D"mailto:Openembe=
dded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org<=
/a><br>
&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core</a><br>&gt;<br>&gt; ____________________________________________=
___<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/opene=
mbedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembed=
ded-core</a><br>
&gt;

--00163683200c6dfa0504c4be5f65--
