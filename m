Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web08.2498.1604163313346235743
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 09:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MydMRpZa;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id 23so10326506ljv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6R6JNl8taCdowWVpT3QAByDuVnEXDvH09w+V0JakIrc=;
        b=MydMRpZab+I9Wt1UPvygDEDj4K0XsBw1N3WJgsODRBO0wIFhIAoUyxXlNceZ6Rv2g+
         thecnGVSpWnz+ILtTqs6hIwTZqpRsuedL62sPP7ji9O6USzH3HMjQaTlLsLkAIgCHL20
         rEb7EUo4q0t2/kHGGVxcat8VKivBzLkknxYcDqFjFfkJTZ2CQhLoLLlxVdoNqAO1m00D
         kcmhhJW2KDdoBbtBYlwZdJHwFMP8DcH3jaIKw2RglPb/zrjHg/WlgWHRBRkFkaOO/5nl
         K12mOBNKx0JfLhxo3FfwnFxkMAUR5+PBZWGoG8AJymmeDO3x6iKjU2kKSZmjHU9wSm9e
         GuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6R6JNl8taCdowWVpT3QAByDuVnEXDvH09w+V0JakIrc=;
        b=r2BI9Qxg3n6hbZl2yUBKH6HQl0gl5tKi/EFONJV3DfRkADQ661t8jqP8cbWWml4Ji9
         PQRnodcHjxPW19UC6fY1/qIMsvQVKKeoDWMuucqfzy4tLZcslETQR0Nt0q71A1C1iDpq
         Md3u+CKzAbMB2kD64f05uIzldr2LSb4P8/Z7f1r7l168mvivcMFnWThjFF7RELCd6cF5
         ftEkxtQPYomyXUgIVgtg13XoD4nS01N0dwfaozDlIMB1dc1aQiVLkV8rvVrE5qbHJrGi
         evv2Wth+MmHuQ5eZZWHokazrkIyemZytHggHUyIy2rF7Aacw/Jk2TXB5SToT5nVK+g71
         U/zw==
X-Gm-Message-State: AOAM533tu9BlHbfScKw5rswIia/0brwiVz4SDRHgDSTul5ynIFOIWMQV
	NZN0kY2kVkKZ5yoiNuU2YBAFMspB4JqTdlA/n2Y=
X-Google-Smtp-Source: ABdhPJwKAUJiz/uuoRfD87Gsq8Bsr9yEmZIoGcUs21GMlQTRRmgkXbs+yBKeEDg0z8TsVm5VjTmngyPpoGD4P9G+agA=
X-Received: by 2002:a05:651c:33c:: with SMTP id b28mr3570667ljp.365.1604163311161;
 Sat, 31 Oct 2020 09:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201030232256.624297-1-quaresma.jose@gmail.com>
 <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org>
 <CANPvuRk3P=9Ho7w=PzdUVKQpVgoechnSX0cTY3TaTdcOaqiHHw@mail.gmail.com>
 <CAHtQpK41tvJ3w0DTu=p431crPm_66n3c-9t4BHhX7iwJAmxCuQ@mail.gmail.com> <CA+chaQcx3pcrnZpgtd8nzh=AqeBS-D0qEp96z+hURf=1_wrcTw@mail.gmail.com>
In-Reply-To: <CA+chaQcx3pcrnZpgtd8nzh=AqeBS-D0qEp96z+hURf=1_wrcTw@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sat, 31 Oct 2020 17:54:59 +0100
Message-ID: <CAHtQpK5b_SY1gZY3+4Vk1FmPyE0KYF7z7XgypxOLnCq1bwna6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer: use git to fetch the sources
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2020 at 2:15 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> Are you sure _generated_ tarballs from gitlab are better?

Not at all! I was just pointing out that insane.bbclass checks for
github.com archives and totally missing gitlab.com. I guess I would
come up with the patch here to include gitlab.com as well, it makes
total sense.

>
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/m=
sg73109.html

Interesting reading, and honest reply from GitLab.

So far (if my grep does not lie to me), there is only one recipe in
meta-openembedded [meta-oe/recipes-support/remmina/remmina_1.4.7.bb]
uses that combination, and I guess at the upgrade it should be
switched (new version is available).

>
> On Sat, Oct 31, 2020 at 1:29 PM Andrey Zhizhikin <andrey.z@gmail.com> wr=
ote:
>>
>> On Sat, Oct 31, 2020 at 12:40 PM Jose Quaresma <quaresma.jose@gmail.com=
> wrote:
>> >
>> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
>> > s=C3=A1bado, 31/10/2020 =C3=A0(s) 00:32:
>> > >
>> > > On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:
>> > > > gstreamer has the code hosted on [1] and this repo as tags.
>> > > > manage code with git its more convenient than with tarball archiv=
es.
>> > > >
>> > > > [1] - https://gitlab.freedesktop.org/gstreamer
>> > > >
>> > > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> > >
>> > > I'm not 100% sure about this. Tarballs tend to be less overhead for
>> > > fetching and make for easier source archiving. The git repos are ea=
sier
>> > > for day to day dev work but tend to be harder for the AUH to handle=
 and
>> > > slower to fetch for the users taking up more space to download and
>> > > unpack. I'm therefore torn. I know where we have used git for other
>> > > core components it has caused performance issues.
>> >
>> > I have the same opinion that tarballs have less overhead, It's much s=
maller.
>> > In this specific case the git repos are very big because the gstreame=
r project
>> > started a long time ago and it contains the full evolution of the pro=
ject.
>> >
>> > However I sent this patch because I think it is easy managing patches=
 with
>> > git but with the devtool we can achieve a very similar workflow.
>> > With the difference that more steps are needed, to do a backport for =
example.
>> >
>> > >
>> > > We do also have the option of the devupstream class although I know
>> > > that doesn't quite work for the native cases yet sadly.
>> >
>> > I don't understand this sentence. What is the opinion of devupstream =
class?
>> >
>> > >
>> > > Cheers,
>> > >
>> > > Richard
>> > >
>> > >
>> > >
>> >
>> > Someone on the mailing list has suggested that git is preferred over =
the archive
>> > but now I understand that this is only for github and it's mainly
>> > because of the inconsistency
>> > of the archives that they generate.
>>
>> I believe that was me and Alex, and this applies currently to GitHub
>> only. There is a QA warning about using tarballs from GitHub since
>> they tend to be unstable, GitLab seems to be better in this regard.
>>
>> >
>> > --
>> > best regards,
>> > Jos=C3=A9 Quaresma
>> >
>> >
>> >
>>
>>
>> --
>> Regards,
>> Andrey.
>>
>>=20
>>


--=20
Regards,
Andrey.
