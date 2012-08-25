Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T5Bgx-0004lb-No
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 10:26:03 +0200
Received: by eaad12 with SMTP id d12so615433eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Tsk7XpXdrHKWewyYmSqAotwLFZPV9xKE8AaA+Yo1BkA=;
	b=pVb+mAEYmRMPj/o4Vh70QGrdRuJYhV3B1fJ/bPWnhk7k+g5DjIneYKXa9JUD3YPHu+
	AeQJNDZsjlRqWjK8qczTxYLTpxusuY23feXtaz1iuhc9uSyWgJE6DlLmzONMEvAHr0Je
	rs4LAR9/UYsW/kh3KHNiwfk4eOF71GZDuPPXMIOJXvE6+ck4ewDJ4FdNd8avt2vvlUgu
	Em4CJ/14UC8HT9z7zbAqHRC5Il0dHJWaoH2j4GLXEwm8FjWMZJkM3a6ejOzYVeUBSnfO
	QLZyXlbQxJOONQ3OiDKjSu5mLAiqcdYcffp3+bvnUzKVDUPAdLfl7O6B7w2LJgm2uTUH
	NJEw==
MIME-Version: 1.0
Received: by 10.14.4.201 with SMTP id 49mr10632890eej.0.1345882435360; Sat, 25
	Aug 2012 01:13:55 -0700 (PDT)
Received: by 10.14.2.5 with HTTP; Sat, 25 Aug 2012 01:13:55 -0700 (PDT)
In-Reply-To: <3BDCB1BC-7393-4B42-BE04-3BE9A8C90123@dominion.thruhere.net>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
	<3BDCB1BC-7393-4B42-BE04-3BE9A8C90123@dominion.thruhere.net>
Date: Sat, 25 Aug 2012 01:13:55 -0700
Message-ID: <CAMKF1srk3toCstU+aL66uohw4CPmCZm6szB4f2qswkUsJjTr9g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Aug 2012 08:26:03 -0000
Content-Type: multipart/alternative; boundary=047d7b66f1cd78199b04c812acd4

--047d7b66f1cd78199b04c812acd4
Content-Type: text/plain; charset=UTF-8

On Saturday, August 25, 2012, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 25 aug. 2012, om 06:34 heeft tom.zanussi@intel.com het volgende
geschreven:
>
>> From: Tom Zanussi <tom.zanussi@intel.com>
>>
>> This is the ia32-base.inc moved over from meta-intel.  See meta-intel
>> for the complete history of contributions to this file.
>>
>> Here's the initial commit text that explains the purpose of this file:
>>
>>  The meta-intel BSPs currently have a number of machine settings common
>>  to all - factor these out into a common include file.
>>
>>  Also add several new intel-specific XSERVER variables for building
>>  XSERVER variables in BSPs.
>>
>> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
>> ---
>> meta/conf/machine/include/ia32-base.inc | 58
+++++++++++++++++++++++++++++++++
>>
>> +# glibc-related variables
>> +#
>> +GLIBC_ADDONS ?= "nptl"
>
> That's a distro setting

And its redundant
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--047d7b66f1cd78199b04c812acd4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, August 25, 2012, Koen Kooi &lt;<a href=3D"mailto:koen@=
dominion.thruhere.net">koen@dominion.thruhere.net</a>&gt; wrote:<br>&gt;<br=
>&gt; Op 25 aug. 2012, om 06:34 heeft <a href=3D"mailto:tom.zanussi@intel.c=
om">tom.zanussi@intel.com</a> het volgende geschreven:<br>
&gt;<br>&gt;&gt; From: Tom Zanussi &lt;<a href=3D"mailto:tom.zanussi@intel.=
com">tom.zanussi@intel.com</a>&gt;<br>&gt;&gt;<br>&gt;&gt; This is the ia32=
-base.inc moved over from meta-intel. =C2=A0See meta-intel<br>&gt;&gt; for =
the complete history of contributions to this file.<br>
&gt;&gt;<br>&gt;&gt; Here&#39;s the initial commit text that explains the p=
urpose of this file:<br>&gt;&gt;<br>&gt;&gt; =C2=A0The meta-intel BSPs curr=
ently have a number of machine settings common<br>&gt;&gt; =C2=A0to all - f=
actor these out into a common include file.<br>
&gt;&gt;<br>&gt;&gt; =C2=A0Also add several new intel-specific XSERVER vari=
ables for building<br>&gt;&gt; =C2=A0XSERVER variables in BSPs.<br>&gt;&gt;=
<br>&gt;&gt; Signed-off-by: Tom Zanussi &lt;<a href=3D"mailto:tom.zanussi@i=
ntel.com">tom.zanussi@intel.com</a>&gt;<br>
&gt;&gt; ---<br>&gt;&gt; meta/conf/machine/include/ia32-base.inc | 58 +++++=
++++++++++++++++++++++++++++<br>&gt;&gt;<br>&gt;&gt; +# glibc-related varia=
bles<br>&gt;&gt; +#<br>&gt;&gt; +GLIBC_ADDONS ?=3D &quot;nptl&quot;<br>&gt;=
<br>
&gt; That&#39;s a distro setting<br><br>And its redundant<br>&gt; _________=
______________________________________<br>&gt; Openembedded-core mailing li=
st<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Open=
embedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--047d7b66f1cd78199b04c812acd4--
