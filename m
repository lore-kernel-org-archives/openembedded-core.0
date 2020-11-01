Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.21418.1604264950887390238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 13:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CUpOfjD7;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id cw8so2458018ejb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 13:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wr5zHiWDSB1QZLmCfjmfskAiHpJkA9F3Xtby5srr/PQ=;
        b=CUpOfjD7mCW+vSUNdthwFqS1CnEPk5l3rcEES8d9xA5n95Q7ALg88nGb8+WMfYUOAn
         75qM2D0E7XkRiAfsDrTTI8nC8XUb58ScqjBR3fwmkbIT6AV57mNetbA2rAtYU4hOS8b8
         jR2ny5DQlzG+VB/MG2jkcR4NHWnheymspcdEfaZGzOBf2JqEkwIwiZVh6jkBCx6HIWFK
         M/oGW5vvqds2CP4Z2Yu9buUxbgZ0eyjhxFFxrzTooGBCfmTGG3XXwO1XTz/zEEYEtdRS
         o5NeIYEbXgFO3ofAENIy7aTPZEJk8w643TG46jAXmNFeTuywn+oqtPZvPhw7UqkxpG5o
         4daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wr5zHiWDSB1QZLmCfjmfskAiHpJkA9F3Xtby5srr/PQ=;
        b=dLgKOXglrrYXsj2a+MeclAXeqoVQGWJhO/gtwBw5RFmAJAWS0VLJeOYWEoCcz82fQ/
         nvr66p2+L/wJK/mhP8S5Ptp6Bav7vNJC9M2y31/d91RGMoQhTc8+30S5PPE8pKullvDv
         FnGrwTkQ1/jrfH6nknrAvdier19kV7Bbw7WTSg+UY0Mdl2GtytoaNWIB0GxjK7Bc8QmF
         FGqfrjkVWO7+hUhddWVDaSoGk6ySoBHtu5Naf5mk90DdLsjyaCzyOBvrgyijnttazSwd
         TuoU+IvQId0fQbrwLscNpYZvfZpEbkha3oR9P3ZdXmThPFJYwbyMWOw1dhmgXmI6f/UU
         D2fg==
X-Gm-Message-State: AOAM532KnC7y047IGkf1EWSXxVWYHBAHV/DlN1hBE3YePDHdj0YKmfZ1
	3be6VWRh2od5mxXmuyJGA0zbY28bXq89We63pI4=
X-Google-Smtp-Source: ABdhPJxXAQOq+W7sJQh1BWmRhwmufL0IZC6qNqt1cd6VCstjnP364ZwIu9Rf53ROUAq+YPZUwry18csP72NR9qCZ6q8=
X-Received: by 2002:a17:906:a119:: with SMTP id t25mr13159192ejy.67.1604264949334;
 Sun, 01 Nov 2020 13:09:09 -0800 (PST)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
 <1642D6DB2EF0C3ED.10902@lists.openembedded.org> <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
 <3b12ced1f6625fe0a9bdeb9e5c0cd5a7ca004d50.camel@linuxfoundation.org>
 <b298f53a7fceab3d51ec69ab1b9356269074e712.camel@linuxfoundation.org>
 <CANPvuRn+ZOcnS+Mg_y5dcX+D1QJH__APYqLECGrBt8KVx0fU1Q@mail.gmail.com>
 <CANNYZj9VosotbYD_xF3u8qqiwKBkcN06f7itUasenXtbriONOA@mail.gmail.com> <CANNYZj8ZE4wXmyGbK7JZoY0V4K4xgdu-ePhUdJiDxxLV0+pzwg@mail.gmail.com>
In-Reply-To: <CANNYZj8ZE4wXmyGbK7JZoY0V4K4xgdu-ePhUdJiDxxLV0+pzwg@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 1 Nov 2020 21:08:57 +0000
Message-ID: <CANPvuRmzr4F-cwLf7uJRAtk23yRR2AvTM-D9KmkGpyD04TddJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia s=C3=A1bado,
31/10/2020 =C3=A0(s) 18:56:
>
> On Sat, 31 Oct 2020 at 19:54, Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>>
>> On Sat, 31 Oct 2020 at 12:49, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>>>
>>> There are great tools on the OE core to check this type of problems.
>>> Congratulations for the autobuilder infrastructure. I will try to
>>> setup it in near future
>>> because they are very useful.
>>
>>
>> I think there's also a ptest regression for gstreamer:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1472
>>
>> It's not a failure, and doesn't prevent merging version updates, but sti=
ll should be addressed.
>
>
> Here specifically:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1472/st=
eps/8/logs/step1c
>
> Alex

I will look at this when I have some time.
But I need to deepen my knowledge first about the OE ptest.

I think it can be very useful to run the gstreamer meson test infrastructur=
e.
I don't know why but I will try to do it.

--=20
best regards,
Jos=C3=A9 Quaresma
