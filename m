Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QjXmz-0002p9-UZ
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:30:18 +0200
Received: by gwb11 with SMTP id 11so507599gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xxbpl/3IQtFJfHZRcL/zkLFdn6CNynRJGfyXeMqI0BM=;
	b=Ijb+5X4j9tW+7t7kg5EzT2bIkKF073pyoW15eILjMfqgPOW3Qkyq3/QhE8ixWdzwBP
	dMpm+IBHwu3Wx7OYv5V7Cds9Fc7/xQ5BGZwZliQnqdIlSsfnus+ozeIpxVT2okBLmLdM
	9WNoHHmAAuQ7zNnhbR/HYeRT5KRw7qEkLgEt4=
MIME-Version: 1.0
Received: by 10.91.186.19 with SMTP id n19mr8342832agp.48.1311171970237; Wed,
	20 Jul 2011 07:26:10 -0700 (PDT)
Received: by 10.90.223.19 with HTTP; Wed, 20 Jul 2011 07:26:10 -0700 (PDT)
In-Reply-To: <4E26D87A.5020808@gmail.com>
References: <1311154909.30326.51.camel@phil-desktop>
	<CACW_hTYXboQ+Zzkt3PXBuA_=uMDVovTgt7g7BNJSxbCdjuoS2A@mail.gmail.com>
	<4E26D87A.5020808@gmail.com>
Date: Wed, 20 Jul 2011 16:26:10 +0200
Message-ID: <CACW_hTb=t9hMoVc-3F538xn1kTwrGT7-wk7DW8FTmi6=Txmvpg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libiconv checksum wrong
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
X-List-Received-Date: Wed, 20 Jul 2011 14:30:18 -0000
Content-Type: multipart/alternative; boundary=0016e68db8828686e304a88103e9

--0016e68db8828686e304a88103e9
Content-Type: text/plain; charset=ISO-8859-1

2011/7/20 Khem Raj <raj.khem@gmail.com>

> On 07/20/2011 04:55 AM, Frans Meulenbroeks wrote:
>
>> 2011/7/20 Phil Blundell<philb@gnu.org>
>>
>>  Since updating this morning I'm getting
>>>
>>> | ERROR: Function 'File: '/home/pb/sources/libiconv-1.**13.1.tar.gz' has
>>> md5 checksum 7ab33ebd26687c744a37264a330bbe**9a when
>>> d42b97f6ef5dd0ba4469d520ed732f**ed was expected (from URL:
>>> 'ftp://ftp.gnu.org/gnu/**libiconv/libiconv-1.13.1.tar.**gz'<ftp://ftp.gnu.org/gnu/libiconv/libiconv-1.13.1.tar.gz%27>)'
>>> failed
>>> NOTE: package libiconv-1.13.1-r0: task do_fetch: Failed
>>>
>>> The offending commit appears to be
>>> bd1e627bef29830f9346b4b984905f**d8fcf2e716.  As far as I can tell from a
>>> quick inspection of the files, the checksum that was added for
>>> libiconv-1.13.1.tar.gz in that commit is actually the md5sum of the
>>> earlier version 1.11.1.
>>>
>>> This seems to indicate that the added 1.13.1 recipe has not been build by
>>>
>> neither the submitter nor the committer (let alone tested by someone).
>> is that the kind of quality we want to achieve in oe-core ?
>>
>>
> there is already patch sent to fix it.
> http://patches.openembedded.**org/patch/7933/<http://patches.openembedded.org/patch/7933/>
> libiconv is not default provider of virtual/libiconv on eglibc/glibc based
> systems and sometimes that can trip you over. It happens and as long as we
> find it and fix it quickly I don't see a problem. Do you ?

Some people seem to think differently about this. I still recall the pile of
shit Koen dumped upon me about a year ago when I accidentally removed a
version of openssh or so that was still used. Even though the problem was
fixed very quickly after it was brought to my attention. Ah well. As Orwell
already said "all animals are equal but some animals are more equal than
others".

>
> IMO we should not get so pedantic that people start getting scared of
> making changes
>

It was by no means my intention to be pedantic.

Then again I *do* think it is good practice if someone creates a new recipe
that (s)he tests it before submitting it.

And my impression was that one of the goals of YP and oe-core was to
increase the quality level.
One of the ways to increase quality is to do a build after pulling changes
and before committing them.
(at least I feel that is one of the ways to increase quality, and yes there
are other ways too).

And where people work, mistakes happen. One can accept that, but one can
also see if there are ways to improve and avoid that a problem re-occurs.

My two cents. Do with it whatever you want. And remember: have fun!

Frans.

--0016e68db8828686e304a88103e9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/20 Khem Raj <span dir=3D"ltr">&lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;</span><br=
><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; bord=
er-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
On 07/20/2011 04:55 AM, Frans Meulenbroeks wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
2011/7/20 Phil Blundell&lt;<a href=3D"mailto:philb@gnu.org" target=3D"_blan=
k">philb@gnu.org</a>&gt;<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
Since updating this morning I&#39;m getting<br>
<br>
| ERROR: Function &#39;File: &#39;/home/pb/sources/libiconv-1.<u></u>13.1.t=
ar.gz&#39; has<br>
md5 checksum 7ab33ebd26687c744a37264a330bbe<u></u>9a when<br>
d42b97f6ef5dd0ba4469d520ed732f<u></u>ed was expected (from URL:<br>
&#39;<a href=3D"ftp://ftp.gnu.org/gnu/libiconv/libiconv-1.13.1.tar.gz%27" t=
arget=3D"_blank">ftp://ftp.gnu.org/gnu/<u></u>libiconv/libiconv-1.13.1.tar.=
<u></u>gz&#39;</a>)&#39; failed<br>
NOTE: package libiconv-1.13.1-r0: task do_fetch: Failed<br>
<br>
The offending commit appears to be<br>
bd1e627bef29830f9346b4b984905f<u></u>d8fcf2e716. =A0As far as I can tell fr=
om a<br>
quick inspection of the files, the checksum that was added for<br>
libiconv-1.13.1.tar.gz in that commit is actually the md5sum of the<br>
earlier version 1.11.1.<br>
<br>
This seems to indicate that the added 1.13.1 recipe has not been build by<b=
r>
</blockquote>
neither the submitter nor the committer (let alone tested by someone).<br>
is that the kind of quality we want to achieve in oe-core ?<br>
<br>
</blockquote>
<br>
there is already patch sent to fix it.<br>
<a href=3D"http://patches.openembedded.org/patch/7933/" target=3D"_blank">h=
ttp://patches.openembedded.<u></u>org/patch/7933/</a><br>
libiconv is not default provider of virtual/libiconv on eglibc/glibc based =
systems and sometimes that can trip you over. It happens and as long as we =
find it and fix it quickly I don&#39;t see a problem. Do you ?=A0</blockquo=
te>
<div>Some people seem to think differently about this. I still recall the p=
ile of shit Koen dumped upon me about a year ago when I accidentally remove=
d a version of openssh or so that was still used. Even though the problem w=
as fixed very quickly after it was brought to my attention. Ah well. As Orw=
ell already said &quot;all animals are equal but some animals are more equa=
l than others&quot;.<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
IMO we should not get so pedantic that people start getting scared of makin=
g changes<br></blockquote></div><br>It was by no means my intention to be p=
edantic.<br><br>Then again I *do* think it is good practice if someone crea=
tes a new recipe that (s)he tests it before submitting it.<br>
<br>And my impression was that one of the goals of YP and oe-core was to in=
crease the quality level.<br>One of the ways to increase quality is to do a=
 build after pulling changes and before committing them.<br>(at least I fee=
l that is one of the ways to increase quality, and yes there are other ways=
 too).<br>
<br>And where people work, mistakes happen. One can accept that, but one ca=
n also see if there are ways to improve and avoid that a problem re-occurs.=
<br><br>My two cents. Do with it whatever you want. And remember: have fun!=
<br>
<br>Frans.<br><br>

--0016e68db8828686e304a88103e9--
