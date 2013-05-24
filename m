Return-Path: <cazfi74@gmail.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8F5621E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 22:21:48 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id p12so2542068vbe.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 15:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Pq94lTGpBaknXBVAuRMyC+FZ2WDArOWejI3dCm5vnv8=;
	b=zqP1TrYBLPiPoOzuZqNBLp9OE0ITbi5fT62M4vMv9WYyUeW4bOD0w0Y5NKFgvrnbCO
	5yrWaoAL2P3d0bjUSfHGubzn6CiZEQsevwmaIWg/tISeY0MlULmqmJwJJTFoo+kGJ2uV
	zdFOuN4wLy5BaPHT7g9n6Efvx725Lou8SwDMC480xkTjtEmevtE9yHQSw/g5NEwaM5Az
	XPkx5S5p0S4J8lIlqyf2N/hrJgCKacIcxjG4VVxvbgxyBk/EFpba0PNrNrEPtvmT2gqC
	MMQJbtCOAjMOJkDLx8SQtPihUPWhui8q3neQrhzJhVRTc6kEirID1c7GMbjGzlbOw60I
	yCxA==
MIME-Version: 1.0
X-Received: by 10.52.69.200 with SMTP id g8mr8388669vdu.4.1369434109514; Fri,
	24 May 2013 15:21:49 -0700 (PDT)
Received: by 10.58.207.138 with HTTP; Fri, 24 May 2013 15:21:49 -0700 (PDT)
In-Reply-To: <519EA042.1@linux.intel.com>
References: <cover.1369298825.git.cazfi74@gmail.com>
	<519EA042.1@linux.intel.com>
Date: Sat, 25 May 2013 01:21:49 +0300
Message-ID: <CAF6bG8c7v4eFuw+QfjaE3HDsooYm9XOexx2wXQuaAM2W0OzM_Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Update automake to version 1.13.2
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
X-List-Received-Date: Fri, 24 May 2013 22:21:49 -0000
Content-Type: multipart/alternative; boundary=20cf307d0454a41cfc04dd7e399c

--20cf307d0454a41cfc04dd7e399c
Content-Type: text/plain; charset=UTF-8

 Confirmed. Automake update to (any) 1.13.x version breaks gtk-engines
build. I don't know yet if it's automake or gtk-engines bug.


On 24 May 2013 02:03, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/23/2013 01:52 AM, Marko Lindqvist wrote:
>
>> New upstream release, 1.13.2, has reverted some of the 1.13.0 backward
>> compatibility dropping changes, for the duration of 1.13 series. Unlike
>> earlier 1.13 releases, it can be used without breaking huge number of
>> packages.
>>
>>
> I have not dug into it too deeply, but I think this update is causing a
> problem with gtk-engines test Makefile, there is a section that has
> $(patsubst incomplete.
>
> From the Makefile.in that is generated from Makefile.am
>
> $(patsubst.log: $(patsubst
>         @p='$(patsubst'; \
>         b='$(patsubst'; \
>         $(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
>         --log-file $$b.log --trs-file $$b.trs \
>         $(am__common_driver_flags) $(AM_LOG_DRIVER_FLAGS)
> $(LOG_DRIVER_FLAGS) -- $(LOG_COMPILE) \
>
> That does not look right!
>
> Sau!
>
>
>
>  The following changes since commit aeb704fee8b4ffeaeddcdb36ae4e1d**
>> 62c264ce42:
>>
>>    scripts/bitbake: Handle the case where git isn't installed cleanly
>> (2013-05-21 10:06:11 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/**openembedded-core-contrib<http://git.openembedded.org/openembedded-core-contrib>cazfi/am13
>>    http://cgit.openembedded.org/**cgit.cgi/openembedded-core-**
>> contrib/log/?h=cazfi/am13<http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13>
>>
>> Marko Lindqvist (1):
>>    automake: update to upstream version 1.13.2
>>
>>   .../prefer-cpio-over-pax-for-**ustar-archives.patch  |   37
>> ++++++++++----------
>>   .../{automake_1.12.6.bb => automake_1.13.2.bb}     |    4 +--
>>   2 files changed, 21 insertions(+), 20 deletions(-)
>>   rename meta/recipes-devtools/**automake/{automake_1.12.6.bb =>
>> automake_1.13.2.bb} (90%)
>>
>>
>
>

--20cf307d0454a41cfc04dd7e399c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>=C2=A0Confirmed. Automake update to (any) 1=
.13.x version breaks gtk-engines build. I don&#39;t know yet if it&#39;s au=
tomake or gtk-engines bug.<br><div><div><br><br>On 24 May 2013 02:03, Saul =
Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D=
"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>
<div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div class=3D"im">On 05/23/2013 01:52 AM, Marko Lindqvist wrote:<=
br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
New upstream release, 1.13.2, has reverted some of the 1.13.0 backward<br>
compatibility dropping changes, for the duration of 1.13 series. Unlike<br>
earlier 1.13 releases, it can be used without breaking huge number of<br>
packages.<br>
<br>
</blockquote>
<br></div>
I have not dug into it too deeply, but I think this update is causing a pro=
blem with gtk-engines test Makefile, there is a section that has $(patsubst=
 incomplete.<br>
<br>
From the Makefile.in that is generated from Makefile.am<br>
<br>
$(patsubst.log: $(patsubst<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @p=3D&#39;$(patsubst&#39;; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=3D&#39;$(patsubst&#39;; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(am__check_pre) $(LOG_DRIVER) --test-name &quo=
t;$$f&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --log-file $$b.log --trs-file $$b.trs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(am__common_driver_flags) $(AM_LOG_DRIVER_FLAG=
S) $(LOG_DRIVER_FLAGS) -- $(LOG_COMPILE) \<br>
<br>
That does not look right!<br>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The following changes since commit aeb704fee8b4ffeaeddcdb36ae4e1d<u></u>62c=
264ce42:<br>
<br>
=C2=A0 =C2=A0scripts/bitbake: Handle the case where git isn&#39;t installed=
 cleanly (2013-05-21 10:06:11 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/openembedded-core=
-contrib" target=3D"_blank">git.openembedded.org/<u></u>openembedded-core-c=
ontrib</a> cazfi/am13<br>
=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-=
core-contrib/log/?h=3Dcazfi/am13" target=3D"_blank">http://cgit.openembedde=
d.org/<u></u>cgit.cgi/openembedded-core-<u></u>contrib/log/?h=3Dcazfi/am13<=
/a><br>
<br>
Marko Lindqvist (1):<br>
=C2=A0 =C2=A0automake: update to upstream version 1.13.2<br>
<br>
=C2=A0 .../prefer-cpio-over-pax-for-<u></u>ustar-archives.patch =C2=A0| =C2=
=A0 37 ++++++++++----------<br>
=C2=A0 .../{<a href=3D"http://automake_1.12.6.bb" target=3D"_blank">automak=
e_1.12.6.bb</a> =3D&gt; <a href=3D"http://automake_1.13.2.bb" target=3D"_bl=
ank">automake_1.13.2.bb</a>} =C2=A0 =C2=A0 | =C2=A0 =C2=A04 +--<br>
=C2=A0 2 files changed, 21 insertions(+), 20 deletions(-)<br>
=C2=A0 rename meta/recipes-devtools/<u></u>automake/{<a href=3D"http://auto=
make_1.12.6.bb" target=3D"_blank">automake_1.12.6.bb</a> =3D&gt; <a href=3D=
"http://automake_1.13.2.bb" target=3D"_blank">automake_1.13.2.bb</a>} (90%)=
<br>
<br>
</blockquote>
<br>
<br>
</div></div></blockquote></div><br></div></div></div></div>

--20cf307d0454a41cfc04dd7e399c--
