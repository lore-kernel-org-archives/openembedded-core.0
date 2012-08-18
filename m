Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2qmJ-0006Vt-0O
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 23:41:55 +0200
Received: by eaad12 with SMTP id d12so1255289eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 14:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wmAz+oeboP8x1aEipwvVbewRh7Yw9RafzAUqekmiuBQ=;
	b=xnuHMlWITrw9qZVvHYIks4rZMVLQAag0O3NaEuiKBtmZpavxyhYTe9PiZ2qq0rU3Wp
	BZ/GeJRjaSEO8t+Ef8acbZxwHhSfzXhLbgukKAsf7ULG+BYPLYNGe8ydNcBcrE1Dl2Iw
	AxKGAzOqTX2Rnn9iSJf1FXl3BTW3xheEeXkmgzTElEh60mWqVBNyoJnAQuu1OqJ36Kjn
	e6F8HGHtdLMVsNlgkXfEcpWa0wCgmNrXR51ziBedJyxYMs8ng9Ur++3Bf1OnKbIth0J4
	+P+CXKwjGsDFOc0CzjnKpJwdYd/s/eLgrBNe6LdaS5r0vHF1UDNzQKmgTp5ooFO8ugyA
	vteA==
MIME-Version: 1.0
Received: by 10.14.4.201 with SMTP id 49mr2592844eej.0.1345325394666; Sat, 18
	Aug 2012 14:29:54 -0700 (PDT)
Received: by 10.14.2.5 with HTTP; Sat, 18 Aug 2012 14:29:54 -0700 (PDT)
In-Reply-To: <3365994.Ze6JgaDIRU@helios>
References: <1345309553-12079-1-git-send-email-raj.khem@gmail.com>
	<3365994.Ze6JgaDIRU@helios>
Date: Sat, 18 Aug 2012 14:29:54 -0700
Message-ID: <CAMKF1sq3aVyCCAnQ5mG-ZCZZMvEBA_e_ev4L=NmOKYB8bqMZKQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] unifdef-native: Correct LICENSE
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
X-List-Received-Date: Sat, 18 Aug 2012 21:41:55 -0000
Content-Type: multipart/alternative; boundary=047d7b66f1cd41a59d04c790fa58

--047d7b66f1cd41a59d04c790fa58
Content-Type: text/plain; charset=UTF-8

On Saturday, August 18, 2012, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:
> On Saturday 18 August 2012 10:05:52 Khem Raj wrote:
>> The header in sourcefile says its BSD licensed
>> not GPL therefore make the correction
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../unifdef/unifdef-native_2.6.18+git.bb           |    4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
>> b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb index
>> 1b93816..141b891 100644
>> --- a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
>> +++ b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
>> @@ -1,6 +1,8 @@
>>  DESCRIPTION = "Kernel header preprocessor"
>>  SECTION = "devel"
>> -LICENSE = "GPL"
>> +LICENSE = "BSD-3-Clause"
>
> It's 2-clause, according to the following:
>
>
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/unifdef/files/unifdef.c
> http://dotat.at/cgi/git?p=unifdef.git;a=blob;f=COPYING;hb=HEAD
>

Indeed it is clause 2 I will send a v3
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--047d7b66f1cd41a59d04c790fa58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, August 18, 2012, Paul Eggleton &lt;<a href=3D"mailto:p=
aul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt; wrote:<=
br>&gt; On Saturday 18 August 2012 10:05:52 Khem Raj wrote:<br>&gt;&gt; The=
 header in sourcefile says its BSD licensed<br>
&gt;&gt; not GPL therefore make the correction<br>&gt;&gt;<br>&gt;&gt; Sign=
ed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmai=
l.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0.../unifdef/unifdef-native_=
2.6.18+<a href=3D"http://git.bb">git.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A04 +++-<br>
&gt;&gt; =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>&gt;&gt;<b=
r>&gt;&gt; diff --git a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18=
+<a href=3D"http://git.bb">git.bb</a><br>&gt;&gt; b/meta/recipes-devtools/u=
nifdef/unifdef-native_2.6.18+<a href=3D"http://git.bb">git.bb</a> index<br>
&gt;&gt; 1b93816..141b891 100644<br>&gt;&gt; --- a/meta/recipes-devtools/un=
ifdef/unifdef-native_2.6.18+<a href=3D"http://git.bb">git.bb</a><br>&gt;&gt=
; +++ b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+<a href=3D"http=
://git.bb">git.bb</a><br>
&gt;&gt; @@ -1,6 +1,8 @@<br>&gt;&gt; =C2=A0DESCRIPTION =3D &quot;Kernel hea=
der preprocessor&quot;<br>&gt;&gt; =C2=A0SECTION =3D &quot;devel&quot;<br>&=
gt;&gt; -LICENSE =3D &quot;GPL&quot;<br>&gt;&gt; +LICENSE =3D &quot;BSD-3-C=
lause&quot;<br>
&gt;<br>&gt; It&#39;s 2-clause, according to the following:<br>&gt;<br>&gt;=
 <a href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/recipe=
s-devtools/unifdef/files/unifdef.c">http://cgit.openembedded.org/openembedd=
ed-core/tree/meta/recipes-devtools/unifdef/files/unifdef.c</a><br>
&gt; <a href=3D"http://dotat.at/cgi/git?p=3Dunifdef.git;a=3Dblob;f=3DCOPYIN=
G;hb=3DHEAD">http://dotat.at/cgi/git?p=3Dunifdef.git;a=3Dblob;f=3DCOPYING;h=
b=3DHEAD</a><br>&gt;<br><br>Indeed it is clause 2 I will send a v3<br>&gt; =
Cheers,<br>&gt; Paul<br>
&gt;<br>&gt; --<br>&gt;<br>&gt; Paul Eggleton<br>&gt; Intel Open Source Tec=
hnology Centre<br>&gt;

--047d7b66f1cd41a59d04c790fa58--
