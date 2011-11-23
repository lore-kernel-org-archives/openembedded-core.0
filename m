Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RT0eh-0004MY-Db
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 01:25:39 +0100
Received: by faat2 with SMTP id t2so1148764faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 16:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=obcFVO+TqRtk8bXVW+s673sQbU3DBOL1m+bh+C54tcI=;
	b=KYoLdStHMdfJFPKCMUDAsRsmzznsFHu/0nLHiszplBmzS1iiFVhLrcUBZeTWE42z8L
	EXEaW6Yh1etb1A9JOQqNKlkYMKvM3q1v9e1PYVgkCrxxxqm7wzxPW/otNKOALNL4fuqr
	Xq4CCZAmMq619hgVX5yfIz6CFFxxsAP4oxt4s=
MIME-Version: 1.0
Received: by 10.152.106.38 with SMTP id gr6mr13603188lab.35.1322007548149;
	Tue, 22 Nov 2011 16:19:08 -0800 (PST)
Received: by 10.152.24.36 with HTTP; Tue, 22 Nov 2011 16:19:08 -0800 (PST)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E3BF4C7E@orsmsx504.amr.corp.intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
	<806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
	<839d81b7f8239d5c3fb01646653d3414ba03dd23.1321470758.git.nitin.a.kamble@intel.com>
	<CAMKF1srTzN83+xUVu3NJyNacFAXB9Tu82adE9XZwQ6yE_RC2pA@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E39E9243@orsmsx504.amr.corp.intel.com>
	<CAMKF1soWxtrLcydQVq6R5mpCke8tYgO3dzSB_6Jw7sc5W3LcLA@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3BF4C7E@orsmsx504.amr.corp.intel.com>
Date: Tue, 22 Nov 2011 16:19:08 -0800
Message-ID: <CAMKF1sq+LRMLMTeKK7Jd6prtkP_UGX8L_N5+ReXDu+iRvZ3oYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] libtool: upgrade from 2.4 to 2.4.2
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
X-List-Received-Date: Wed, 23 Nov 2011 00:25:39 -0000
Content-Type: multipart/alternative; boundary=f46d040716254c407304b25bde84

--f46d040716254c407304b25bde84
Content-Type: text/plain; charset=UTF-8

On Tuesday, November 22, 2011, Kamble, Nitin A <nitin.a.kamble@intel.com>
wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Wednesday, November 16, 2011 2:34 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 4/8] libtool: upgrade from 2.4 to 2.4.2
>>
>> On Wed, Nov 16, 2011 at 2:26 PM, Kamble, Nitin A
>> <nitin.a.kamble@intel.com> wrote:
>> >
>> > Khem,
>> >   I did not see that commit, and I find the oecore/yocto is still
>> behind for the version of libtool recipe. Any reason that commit is not
>> in oecore?
>> >
>> > Thanks,
>>
>> there were some feedback on the patch I have to look thru it.
>
>
> Hi Khem,
>  Any update on the libtool upgrade commit? Your and my changes are doing
same things, Richard also has some changes for 2.4. We need to merge all
these changes for the libtool upgrade.

I don't have much updates to the original patches I posted
If you have time look out for any differences that I might have missed

>
> Thanks,
> Nitin
>
>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d040716254c407304b25bde84
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, November 22, 2011, Kamble, Nitin A &lt;<a href=3D"mailt=
o:nitin.a.kamble@intel.com">nitin.a.kamble@intel.com</a>&gt; wrote:<br>&gt;=
&gt; -----Original Message-----<br>&gt;&gt; From: <a href=3D"mailto:openemb=
edded-core-bounces@lists.openembedded.org">openembedded-core-bounces@lists.=
openembedded.org</a><br>
&gt;&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembe=
dded.org">openembedded-core-bounces@lists.openembedded.org</a>] On Behalf O=
f<br>&gt;&gt; Khem Raj<br>&gt;&gt; Sent: Wednesday, November 16, 2011 2:34 =
PM<br>
&gt;&gt; To: Patches and discussions about the oe-core layer<br>&gt;&gt; Su=
bject: Re: [OE-core] [PATCH 4/8] libtool: upgrade from 2.4 to 2.4.2<br>&gt;=
&gt;<br>&gt;&gt; On Wed, Nov 16, 2011 at 2:26 PM, Kamble, Nitin A<br>&gt;&g=
t; &lt;<a href=3D"mailto:nitin.a.kamble@intel.com">nitin.a.kamble@intel.com=
</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>&gt;&gt; &gt; Khem,<br>&gt;&gt; &gt; =C2=A0 I did not see =
that commit, and I find the oecore/yocto is still<br>&gt;&gt; behind for th=
e version of libtool recipe. Any reason that commit is not<br>&gt;&gt; in o=
ecore?<br>
&gt;&gt; &gt;<br>&gt;&gt; &gt; Thanks,<br>&gt;&gt;<br>&gt;&gt; there were s=
ome feedback on the patch I have to look thru it.<br>&gt;<br>&gt;<br>&gt; H=
i Khem,<br>&gt; =C2=A0Any update on the libtool upgrade commit? Your and my=
 changes are doing same things, Richard also has some changes for 2.4. We n=
eed to merge all these changes for the libtool upgrade.<br>
<br>I don&#39;t have much updates to the original patches I posted<br>If yo=
u have time look out for any differences that I might have missed<br><br>&g=
t;<br>&gt; Thanks,<br>&gt; Nitin<br>&gt;<br>&gt;<br>&gt;&gt;<br>&gt;&gt; __=
_____________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>&gt;&gt; <a href=3D"mailto:Opene=
mbedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.o=
rg</a><br>&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listin=
fo/openembedded-core</a><br>
&gt; _______________________________________________<br>&gt; Openembedded-c=
ore mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org">Openembedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"h=
ttp://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http:=
//lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
&gt;

--f46d040716254c407304b25bde84--
