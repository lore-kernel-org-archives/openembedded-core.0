Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id C31BC719E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 14:30:18 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id h186so9573897oia.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=PagCEkoGhR0DYe/HPbrGv834iOdfO07L1wldatZUCIg=;
	b=EADvyRpH1G2eg5SpdyPa59BIq+BldJRp7puotx0F0jbpneMF7PnpArDAYoV0d33MAH
	bnX5NFQibote3Y+CyYb/4aTXWFGz8eEguc59IyuE78ikSlNEz0C298Rzer1Xa1CcjrS9
	u3JPZzwt5LZUa07HcanOsJV6TCwrfVxSYPUneAp7yuKDM2Z8iWFXa4ODJYBz9ny53AzP
	5Kf+cerFU9Qza+pJt2T08petM7XUccb0OoYOYqL1oqnOEn3p7tX3dKVjB64o/ilHiy2l
	qvMoOhaoCTz758UCa7AmT2hXSimf6wYfeyNHAWcuyT4SxENGwoUwo+19IQjEzFviZf6+
	bgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=PagCEkoGhR0DYe/HPbrGv834iOdfO07L1wldatZUCIg=;
	b=ft4Iy+CZGh8jqbqUlCwtUr/hKIRw6r0Elg1SzvNzbP7FjyWMKhuMovk1uPrLGNmZjO
	sIUHAROpIaPlVoOzVWaZtj/WmGrItfcxVsc0J/uKQoKkKHkAD0yjNlVMG1cWnvb7am0P
	/A+BrlQdf/Gn8y2cUBZgbkJcFsdoEIhGgaZaFZI53pncrwNhuK4NuePFVXmMWtfcl3gI
	NWKOl7djLhyLnLIQOeD7xaxYuh9xsx+UOXozDKEantmnEq0Cb578suD56LrI0d7SyECa
	fsO4tQst2z7txzGBxpDzfm7io5T0EvGKv9Yo0uYs1NLaNtfK7gbXAYZjoRfKl2XvFezI
	yM8w==
X-Gm-Message-State: AA6/9RmATCj7DhpA3mjSkgrJckw6WbWp9G5DRGVCXkemEIgxX1ZWZzRQkeElydcPelqO/HhFuV/wfj1HiMSFEA==
X-Received: by 10.202.222.133 with SMTP id v127mr663138oig.22.1475591419885;
	Tue, 04 Oct 2016 07:30:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Tue, 4 Oct 2016 07:29:59 -0700 (PDT)
In-Reply-To: <CABcZANnNaQrd9x4=vZuBjkogUDGU81Ft08bJ+AJAVpH+Qh-RjQ@mail.gmail.com>
References: <1475574064-30613-1-git-send-email-sujith.h@gmail.com>
	<CABcZANnNaQrd9x4=vZuBjkogUDGU81Ft08bJ+AJAVpH+Qh-RjQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 4 Oct 2016 07:29:59 -0700
X-Google-Sender-Auth: rzLneVU2GaisZFcUT9Pfv0IgHoU
Message-ID: <CABcZANnbd84phqLgQWn4rtzfDCSfvGFn6d9OxOGg_X7tq5UHGg@mail.gmail.com>
To: Sujith H <sujith.h@gmail.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Fix to obey LD failure
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
X-List-Received-Date: Tue, 04 Oct 2016 14:30:18 -0000
Content-Type: multipart/alternative; boundary=001a11440d066a8376053e0ae619

--001a11440d066a8376053e0ae619
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2016 at 7:27 AM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> On Tue, Oct 4, 2016 at 2:41 AM, Sujith H <sujith.h@gmail.com> wrote:
>
>> From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>>
>> When built on minnowmax ( machine name: intel-corei7-64),
>> an error is noticed during the do_compile:
>>
>>  /home/sujith/codebench-linux-install-2015.12-133-i686-pc-li
>> nux-gnu/codebench/bin/i686-pc-linux-gnu-ld:
>> Relocatable linking with relocations from format elf64-x86-64
>> (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor
>> ei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/array.o)
>> to format elf32-i386 (/home/sujith/MEL/dogwood/buil
>> d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/
>> perf-1.0/fd/libapi-in.o)
>> is not supported
>>
>> This change help fix the issue.
>>
>> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>> ---
>>
>
> What=E2=80=99s with the redundant submission? You submitted the fix from
> meta-mentor for this last week, and it was merged. http://git.
> openembedded.org/openembedded-core/commit/?id=3D
> 0ce06611068e74e6ea2e226e3f967aaa91fecd25
>

Ah, nevermind, this adds another sed to the other Makefile. Why does this
commit message say nothing about that? You should really indicate that the
previous fix was incomplete. This basically just pulls in the last bit from
meta-mentor we didn=E2=80=99t apply in the previous submission, correct?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11440d066a8376053e0ae619
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Oct 4, 2016 at 7:27 AM, Christopher Larson <span dir=3D"ltr">&l=
t;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote=
">On Tue, Oct 4, 2016 at 2:41 AM, Sujith H <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div id=3D"m_-3066872493293455395gmail-m_-2=
27703748311286951:2vu" class=3D"m_-3066872493293455395gmail-m_-227703748311=
286951a3s m_-3066872493293455395gmail-m_-227703748311286951aXjCH m_-3066872=
493293455395gmail-m_-227703748311286951m1578f11f932cc27a">From: Sujith Hari=
dasan &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com" target=3D"_blank">=
Sujith_Haridasan@mentor.com</a>&gt;<br>
<br>
When built on minnowmax ( machine name: intel-corei7-64),<br>
an error is noticed during the do_compile:<br>
<br>
=C2=A0/home/sujith/codebench-linux-<wbr>install-2015.12-133-i686-pc-li<wbr>=
nux-gnu/codebench/bin/i686-pc-<wbr>linux-gnu-ld:<br>
Relocatable linking with relocations from format elf64-x86-64<br>
(/home/sujith/MEL/dogwood/buil<wbr>d-minnowmax/tmp/work/intel_cor<wbr>ei7_6=
4-mel-linux/perf/1.0-r9/<wbr>perf-1.0/fd/array.o)<br>
to format elf32-i386 (/home/sujith/MEL/dogwood/buil<wbr>d-minnowmax/tmp/wor=
k/intel_cor<wbr>ei7_64-mel-linux/perf/1.0-r9/<wbr>perf-1.0/fd/libapi-in.o)<=
br>
is not supported<br>
<br>
This change help fix the issue.<br>
<br>
Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan@ment=
or.com" target=3D"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
---</div></blockquote></div><br></span>What=E2=80=99s with the redundant su=
bmission? You submitted the fix from meta-mentor for this last week, and it=
 was merged.=C2=A0<a href=3D"http://git.openembedded.org/openembedded-core/=
commit/?id=3D0ce06611068e74e6ea2e226e3f967aaa91fecd25" target=3D"_blank">ht=
tp://git.<wbr>openembedded.org/openembedded-<wbr>core/commit/?id=3D<wbr>0ce=
06611068e74e6ea2e226e3f967a<wbr>aa91fecd25</a></div></div></blockquote><div=
><br></div><div>Ah, nevermind, this adds another sed to the other Makefile.=
 Why does this commit message say nothing about that? You should really ind=
icate that the previous fix was incomplete. This basically just pulls in th=
e last bit from meta-mentor we didn=E2=80=99t apply in the previous submiss=
ion, correct?</div></div>-- <br><div class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div>
</div></div>

--001a11440d066a8376053e0ae619--
