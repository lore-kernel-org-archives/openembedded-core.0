Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SppZs-0002C4-Sp
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 01:47:16 +0200
Received: by wgbdq10 with SMTP id dq10so3283619wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4sf/WHg19QuN6S/zdJkO/4If1tQtJAOm7DQW7obGV5o=;
	b=Erdf3rVs5HXDjWNNKPPGQO4CL2nUcY4BEQzDNWPy5vEY650018WbeRJuxze6eSif34
	zHJ4j8hA3WV/bKcA1O7RAEAlLP//fDUU/sugLXye5fu5zZDVz0NrrXN+dgIHHl1mP7Xk
	ML01YqXqwL1At4ghhh3SoBq6syxGPaVC/J10RBadrdKzretlHD0jRFxsJ3IyVv0CADZJ
	Gw54XdPVyKhhOPFdQyyz+gR5Uypg/6SATDDmLphDoTETD/XFuI2DqlR82Q4PPXOmX1Nl
	lrzz6xlS3I5slzfgv5P1j/+hRQKMws5r3WsdxwxfGEhyZh7hSAC4gAor7Q0DmKT+PPWr
	7cBg==
MIME-Version: 1.0
Received: by 10.216.158.134 with SMTP id q6mr1407134wek.161.1342222562106;
	Fri, 13 Jul 2012 16:36:02 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 13 Jul 2012 16:36:02 -0700 (PDT)
In-Reply-To: <CAEsOVNe-kKT9jP5XSTaskrr3sp5omoYd4Suw3ZZ3nKtNe2UWcQ@mail.gmail.com>
References: <1342210017-26817-1-git-send-email-msm@freescale.com>
	<CAMKF1sokTHtYziStdSsGvdh4HnhJs3KAYecs-dJ1UXeBGN_sUg@mail.gmail.com>
	<CAEsOVNdHzFoc6m_yAiUk97iFxuDsr-MDL=M19hvci-oxAAcnOg@mail.gmail.com>
	<CAMKF1sr_jLKLoRRP-p9aZEvd=mKxoDdmgjv4=iHwwzAz5TDmzg@mail.gmail.com>
	<CAEsOVNe-kKT9jP5XSTaskrr3sp5omoYd4Suw3ZZ3nKtNe2UWcQ@mail.gmail.com>
Date: Fri, 13 Jul 2012 16:36:02 -0700
Message-ID: <CAMKF1spcQoQ-my+zazfdcfs9bC2exvrx-B5Q=xa5a3=iE6DOPQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Jul 2012 23:47:17 -0000
Content-Type: multipart/alternative; boundary=00163683200c061c0304c4be8b8a

--00163683200c061c0304c4be8b8a
Content-Type: text/plain; charset=UTF-8

On Friday, July 13, 2012, McClintock Matthew-B29882 <B29882@freescale.com>
wrote:
>
> On Jul 13, 2012 6:24 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Friday, July 13, 2012, McClintock Matthew-B29882 <B29882@freescale.com>
wrote:
>> > On Fri, Jul 13, 2012 at 3:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> On Fri, Jul 13, 2012 at 1:06 PM, Matthew McClintock <msm@freescale.com>
wrote:
>> >>> This prevents kexec from building for this part since it does not
work
>> >>>
>> >>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> >>> ---
>> >>>  meta/recipes-core/tasks/task-core-tools-testapps.bb |    1 +
>> >>>  1 file changed, 1 insertion(+)
>> >>>
>> >>> diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bbb/meta/recipes-core/tasks/
task-core-tools-testapps.bb
>> >>> index b5847f8..bdd0d05 100644
>> >>> --- a/meta/recipes-core/tasks/task-core-tools-testapps.bb
>> >>> +++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb
>> >>> @@ -22,6 +22,7 @@ KEXECTOOLS ?= "kexec"
>> >>>  KEXECTOOLS_mips ?= ""
>> >>>  KEXECTOOLS_mipsel ?= ""
>> >>>  KEXECTOOLS_powerpc ?= ""
>> >>> +KEXECTOOLS_e5500-64b ?= ""
>> >>
>> >> you should use arch override here this is not machine specific recipe
probably
>> >>
>> >> KEXECTOOLS_powerpc64 ?= ""
>> >>
>> >> is better
>> >
>> > I thought about that at first, but there are plenty of powerpc64
>> > machines that do support kexec ;) It's really just the Freescale
>> > variant.
>>
>> OK I see I thought PowerPC 32 bit is ignored already so chances of 64
bit working are even less but as you say it works on some of them so be it
>
> Actually some freescale 32 bits parts work with kexec as I did some of
that enablement. I just need to test it out and change the other line.

So will ppc64 get fixed some time soon ?

>
> -M
>
>>
>> >
>> > -M
>> >
>> >>
>> >>>
>> >>>  RDEPENDS_${PN} = "\
>> >>>      blktool \
>> >>> --
>> >>> 1.7.10
>> >>>
>> >>>
>> >>>
>> >>> _______________________________________________
>> >>> Openembedded-core mailing list
>> >>> Openembedded-core@lists.openembedded.org
>> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >>
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>

--00163683200c061c0304c4be8b8a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, July 13, 2012, McClintock Matthew-B29882 &lt;<a href=3D"=
mailto:B29882@freescale.com">B29882@freescale.com</a>&gt; wrote:<br>&gt;<br=
>&gt; On Jul 13, 2012 6:24 PM, &quot;Khem Raj&quot; &lt;<a href=3D"mailto:r=
aj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; On Friday, July 13, 2012, McCl=
intock Matthew-B29882 &lt;<a href=3D"mailto:B29882@freescale.com">B29882@fr=
eescale.com</a>&gt; wrote:<br>&gt;&gt; &gt; On Fri, Jul 13, 2012 at 3:43 PM=
, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt; &gt;&gt; On Fri, Jul 13, 2012 at 1:06 PM, Matthew McClintock &lt;<=
a href=3D"mailto:msm@freescale.com">msm@freescale.com</a>&gt; wrote:<br>&gt=
;&gt; &gt;&gt;&gt; This prevents kexec from building for this part since it=
 does not work<br>
&gt;&gt; &gt;&gt;&gt;<br>&gt;&gt; &gt;&gt;&gt; Signed-off-by: Matthew McCli=
ntock &lt;<a href=3D"mailto:msm@freescale.com">msm@freescale.com</a>&gt;<br=
>&gt;&gt; &gt;&gt;&gt; ---<br>&gt;&gt; &gt;&gt;&gt; =C2=A0meta/recipes-core=
/tasks/<a href=3D"http://task-core-tools-testapps.bb">task-core-tools-testa=
pps.bb</a> | =C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;&gt;&gt; =C2=A01 file changed, 1 insertion(+)<br>&gt;&gt; &gt;=
&gt;&gt;<br>&gt;&gt; &gt;&gt;&gt; diff --git a/meta/recipes-core/tasks/<a h=
ref=3D"http://task-core-tools-testapps.bb">task-core-tools-testapps.bb</a> =
b/meta/recipes-core/tasks/<a href=3D"http://task-core-tools-testapps.bb">ta=
sk-core-tools-testapps.bb</a><br>
&gt;&gt; &gt;&gt;&gt; index b5847f8..bdd0d05 100644<br>&gt;&gt; &gt;&gt;&gt=
; --- a/meta/recipes-core/tasks/<a href=3D"http://task-core-tools-testapps.=
bb">task-core-tools-testapps.bb</a><br>&gt;&gt; &gt;&gt;&gt; +++ b/meta/rec=
ipes-core/tasks/<a href=3D"http://task-core-tools-testapps.bb">task-core-to=
ols-testapps.bb</a><br>
&gt;&gt; &gt;&gt;&gt; @@ -22,6 +22,7 @@ KEXECTOOLS ?=3D &quot;kexec&quot;<b=
r>&gt;&gt; &gt;&gt;&gt; =C2=A0KEXECTOOLS_mips ?=3D &quot;&quot;<br>&gt;&gt;=
 &gt;&gt;&gt; =C2=A0KEXECTOOLS_mipsel ?=3D &quot;&quot;<br>&gt;&gt; &gt;&gt=
;&gt; =C2=A0KEXECTOOLS_powerpc ?=3D &quot;&quot;<br>
&gt;&gt; &gt;&gt;&gt; +KEXECTOOLS_e5500-64b ?=3D &quot;&quot;<br>&gt;&gt; &=
gt;&gt;<br>&gt;&gt; &gt;&gt; you should use arch override here this is not =
machine specific recipe probably<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; =
KEXECTOOLS_powerpc64 ?=3D &quot;&quot;<br>
&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; is better<br>&gt;&gt; &gt;<br>&gt;&g=
t; &gt; I thought about that at first, but there are plenty of powerpc64<br=
>&gt;&gt; &gt; machines that do support kexec ;) It&#39;s really just the F=
reescale<br>
&gt;&gt; &gt; variant.<br>&gt;&gt;<br>&gt;&gt; OK I see I thought PowerPC 3=
2 bit is ignored already so chances of 64 bit working are even less but as =
you say it works on some of them so be it<br>&gt;<br>&gt; Actually some fre=
escale 32 bits parts work with kexec as I did some of that enablement. I ju=
st need to test it out and change the other line.<br>
<br>So will ppc64 get fixed some time soon ?<br><br>&gt;<br>&gt; -M<br>&gt;=
<br>&gt;&gt;<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; -M<br>&gt;&gt; &gt;<br>&gt;&=
gt; &gt;&gt;<br>&gt;&gt; &gt;&gt;&gt;<br>&gt;&gt; &gt;&gt;&gt; =C2=A0RDEPEN=
DS_${PN} =3D &quot;\<br>
&gt;&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0blktool \<br>&gt;&gt; &gt;&gt;&gt=
; --<br>&gt;&gt; &gt;&gt;&gt; 1.7.10<br>&gt;&gt; &gt;&gt;&gt;<br>&gt;&gt; &=
gt;&gt;&gt;<br>&gt;&gt; &gt;&gt;&gt;<br>&gt;&gt; &gt;&gt;&gt; _____________=
__________________________________<br>
&gt;&gt; &gt;&gt;&gt; Openembedded-core mailing list<br>&gt;&gt; &gt;&gt;&g=
t; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded=
-core@lists.openembedded.org</a><br>&gt;&gt; &gt;&gt;&gt; <a href=3D"http:/=
/lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lis=
ts.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; ____________________________________=
___________<br>&gt;&gt; &gt;&gt; Openembedded-core mailing list<br>&gt;&gt;=
 &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/lis=
tinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>&gt;&gt; &gt;<br>&gt;&gt; &gt; _________________=
______________________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>&gt;&gt; &gt; <a href=3D"ma=
ilto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.open=
embedded.org</a><br>&gt;&gt; &gt; <a href=3D"http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin=
/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;<br>&gt;&gt;<br>&gt;&gt; _____________________________________=
__________<br>&gt;&gt; Openembedded-core mailing list<br>&gt;&gt; <a href=
=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@list=
s.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core</a><br>&gt;&gt;<br>&gt;

--00163683200c061c0304c4be8b8a--
