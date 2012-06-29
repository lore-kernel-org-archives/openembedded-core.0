Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkjaL-0001rI-UM
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 00:22:41 +0200
Received: by eaal1 with SMTP id l1so1550160eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 15:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=z9D6YBJx+eKzSZX7QPUxzYjPuEqSc30jGxuoYlHqFY8=;
	b=jz6ul+GqOUxsB1t/1NXCsDNVBxe06uXgf4rtLuFecQW+81Ac747sb4HzeQvlK0nZUF
	mFwHZEx2uw1joq87Cb+a9dhhVJPDhihZ2boMzFQB1N85xXgOrA8NQkv7WZwJyIhUQXZF
	twzxkodBi5fxxLEhxPlsfeFHanN8gWjYeqv60fnx+dkVw1ZP+/aIzkUL1cF5CcMENMYQ
	VFAq8B0dLL+BUngWk/l5/e9NBuZJQrfJLaAA7U1VTm2p30yfzvayDkxg3INE8d1NxIP2
	3PQsin4qu8AdL5jUzjVDjaNhb7sIEi1psfWAoeb/uIn3tmbUJXt0SFu0CdIkb2NB2c4I
	NToA==
MIME-Version: 1.0
Received: by 10.14.97.16 with SMTP id s16mr959477eef.117.1341007905806; Fri,
	29 Jun 2012 15:11:45 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 15:11:45 -0700 (PDT)
In-Reply-To: <20120629220145.70BDC2026AF@gemini.denx.de>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
	<1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
	<CAMKF1srGhdr8kAQ+wyYPnVUW6nq_BHHup22YcGqrFrroW7WHhQ@mail.gmail.com>
	<20120629220145.70BDC2026AF@gemini.denx.de>
Date: Fri, 29 Jun 2012 15:11:45 -0700
Message-ID: <CAMKF1sp8=OreFKNds00t-rxoVVgWaraUTRzMNqVZdY13FXu2YA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Wolfgang Denk <wd@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] u-boot: Don't make the -Os removal part of global settings.
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
X-List-Received-Date: Fri, 29 Jun 2012 22:22:42 -0000
Content-Type: multipart/alternative; boundary=90e6ba476467dddb9304c3a3bb65

--90e6ba476467dddb9304c3a3bb65
Content-Type: text/plain; charset=UTF-8

On Friday, June 29, 2012, Wolfgang Denk <wd@denx.de> wrote:
> Dear Khem Raj,
>
> In message <
CAMKF1srGhdr8kAQ+wyYPnVUW6nq_BHHup22YcGqrFrroW7WHhQ@mail.gmail.com> you
wrote:
>>
>> > We don't want to force everyone to be stripping the -Os
>> > flags from their u-boot builds.  Remove it, since it pertains
>> > to an old toolchain issue that is no longer relevant, and it
>> > breaks the powerpc mpc8315.
>>
>> Its fixed that's right but I am curious how does it break with -O2
>
> -O2 causes much bigger memory footprint, so the code does not fit any
> more in the memory map and/or flash sectors that are reserved for it.

Hmm interesting so we are living on edge here
Thanks for the info

-khem

>
> Best regards,
>
> Wolfgang Denk
>
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> HANDLE WITH EXTREME CARE:  This Product Contains  Minute Electrically
> Charged  Particles  Moving  at  Velocities  in Excess of Five Hundred
> Million Miles Per Hour.
>

--90e6ba476467dddb9304c3a3bb65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 29, 2012, Wolfgang Denk &lt;<a href=3D"mailto:wd@de=
nx.de">wd@denx.de</a>&gt; wrote:<br>&gt; Dear Khem Raj,<br>&gt;<br>&gt; In =
message &lt;<a href=3D"mailto:CAMKF1srGhdr8kAQ%2BwyYPnVUW6nq_BHHup22YcGqrFr=
roW7WHhQ@mail.gmail.com">CAMKF1srGhdr8kAQ+wyYPnVUW6nq_BHHup22YcGqrFrroW7WHh=
Q@mail.gmail.com</a>&gt; you wrote:<br>
&gt;&gt;<br>&gt;&gt; &gt; We don&#39;t want to force everyone to be strippi=
ng the -Os<br>&gt;&gt; &gt; flags from their u-boot builds. =C2=A0Remove it=
, since it pertains<br>&gt;&gt; &gt; to an old toolchain issue that is no l=
onger relevant, and it<br>
&gt;&gt; &gt; breaks the powerpc mpc8315.<br>&gt;&gt;<br>&gt;&gt; Its fixed=
 that&#39;s right but I am curious how does it break with -O2<br>&gt;<br>&g=
t; -O2 causes much bigger memory footprint, so the code does not fit any<br=
>
&gt; more in the memory map and/or flash sectors that are reserved for it.<=
br><br>Hmm interesting so we are living on edge here <br>Thanks for the inf=
o<br><br>-khem<br><br>&gt;<br>&gt; Best regards,<br>&gt;<br>&gt; Wolfgang D=
enk<br>
&gt;<br>&gt; --<br>&gt; DENX Software Engineering GmbH, =C2=A0 =C2=A0 MD: W=
olfgang Denk &amp; Detlev Zundel<br>&gt; HRB 165235 Munich, Office: Kirchen=
str.5, D-82194 Groebenzell, Germany<br>&gt; Phone: (+49)-8142-66989-10 Fax:=
 (+49)-8142-66989-80 Email: <a href=3D"mailto:wd@denx.de">wd@denx.de</a><br=
>
&gt; HANDLE WITH EXTREME CARE: =C2=A0This Product Contains =C2=A0Minute Ele=
ctrically<br>&gt; Charged =C2=A0Particles =C2=A0Moving =C2=A0at =C2=A0Veloc=
ities =C2=A0in Excess of Five Hundred<br>&gt; Million Miles Per Hour.<br>&g=
t;

--90e6ba476467dddb9304c3a3bb65--
