Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.8989.1614788191354299557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 08:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vg454Q/f;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id do6so43351812ejc.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 08:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6T+p45g5q9D2JpY5RB2GDDSbqxqqEYkmVXKXxOEAih8=;
        b=vg454Q/f609vylDZboIsXXQ5h1lLDEjV3kqH54wNj+JQJeER5cYMtlCS/4PCE2Xw10
         +WemKxBiffgyxvjUDlvUEsmpodPNSKCtGihnpd50W0s0+7NOVyCI9je96fPzVHMlCl69
         LR2DMfcmxjoLPx+NzOkeQaqDJ8poE7qTRbOOEhSybyaVYAlEjxsurrXTzJT7zjKJ8sol
         cLXyu/clp5sas1EhCAITT0FM/wwX1rNnwXHEKnb+ZljfR4x6HVflvPrzHDlybEnVjnF/
         /yw00UwPxEY+K1X+b25COO6+4s02txvhrC6XRr7zkHdrWfC9R982l5itAHZ3bMCEUexD
         bJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6T+p45g5q9D2JpY5RB2GDDSbqxqqEYkmVXKXxOEAih8=;
        b=b92UoLnznn4HwX09W2EiDlF1NJ4IV2+isPFlyNYWs50YGAUYOi77G9ywNUbaSWOMcK
         sfh2tgUKVyRNDI8k6ktDU2ASbh2DLHd7zxb+mkvrL+ETBZ2sTUFHJVYHOiOKBUPpd0XN
         exT5d4xjrJ9ZDkVtksqwmfTxTXL4dZ+/HaGSQm3pR9eHZBH+BQDGfS/wc6BfIllhgJXs
         EmDfLp0WO42f3DIg9G6PjZWU1qOovATlXcWDlx3adLLoDCIcxfJz+KERHdXJKH+WSmU6
         1P1IsJbaS4nC3eUOaEuiAR/JWHPI1s5UeFDhqr3ox4k11aMwRNyfCNSxiptU/QVZnlco
         uzow==
X-Gm-Message-State: AOAM532/rvy/m19oDFgPjrDjxU0WBx8FCZCSdPGPx+YxZYx+maRS9AkT
	KWiYMPNPHMvCVDK3wbaKIcRTDsocV6thbBvOzcw=
X-Google-Smtp-Source: ABdhPJxrImG55sTD69f8qywK3p0RdB6XLmHXOSzmc9GMjsq1BfYDZRteidTcwYrHGe2CbYKaM7cRb9tHwStc2dP4uUw=
X-Received: by 2002:a17:906:c0d7:: with SMTP id bn23mr26239846ejb.94.1614788189781;
 Wed, 03 Mar 2021 08:16:29 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
 <28099.1614691555012100324@lists.openembedded.org> <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
In-Reply-To: <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 3 Mar 2021 17:16:18 +0100
Message-ID: <CA+chaQfg4EKGfTu1d-ZXrfeE=eKwD=YYJFt7ydLP3ANZ7eWStw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Colin Finck <c.finck@enlyze.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="0000000000007082a805bca42cff"

--0000000000007082a805bca42cff
Content-Type: text/plain; charset="UTF-8"

Steve, Colin:

keep in mind that this version also introduces some new restrictions,
e.g. rpi-sdimg IMAGE_FSTYPE in meta-raspberrypi is now failing with:

mkfs.vfat: Label can be no longer than 11 characters

not sure how common this will be in other BSPs, but people might be
surprised with such failures in LTS (like they were from the need to update
oe-core/dunfell checkout to get python3targetconfig.bbclass recently when
other layers started to require it).

On Tue, Mar 2, 2021 at 2:43 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 2 Mar 2021 at 14:26, Colin Finck <c.finck@enlyze.com> wrote:
>
>> On Mon, Mar  1, 2021 at 05:58 PM, Alexander Kanavin wrote:
>> > Can you send a followup patch please, on top of master-next?
>>
>> Here we go:
>> https://lists.openembedded.org/g/openembedded-core/topic/patch_dosfstools_build/81024606
>>
>> Who decides about backporting or not backporting dosfstools 4.2 to
>> Dunfell?
>> I can only stress again that a large number of devices in the wild are
>> currently running on FAT boot partitions, and come with a dosfschk version
>> that likes to destroy these boot partitions.
>>
>
> That would be Steve. It's best if you cherry-pick the needed patches into
> current dunfell tip, and send them here with [dunfell] prefix, adding the
> rationale to the commit messages.
>
> Alex
>
> 
>
>

--0000000000007082a805bca42cff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Steve, Colin:<div><br></div><div>keep in mind that this ve=
rsion also introduces some new restrictions, e.g.=C2=A0rpi-sdimg IMAGE_FSTY=
PE in meta-raspberrypi is now failing with:</div><div><br></div><div>mkfs.v=
fat: Label can be no longer than 11 characters<br></div><div><br></div><div=
>not sure how common this will be in other BSPs, but people might be surpri=
sed with such failures in LTS (like they were from the need to update oe-co=
re/dunfell checkout to get python3targetconfig.bbclass recently when other =
layers started to require it).</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 2:43 PM Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, 2 Mar 2021 at 14:26, Colin Finck &lt;<a href=3D"mailto:c.=
finck@enlyze.com" target=3D"_blank">c.finck@enlyze.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Mar=C2=A0 1, =
2021 at 05:58 PM, Alexander Kanavin wrote:<br>
&gt; Can you send a followup patch please, on top of master-next?<br>
<br>
Here we go: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
topic/patch_dosfstools_build/81024606" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.openembedded.org/g/openembedded-core/topic/patch_dosfstools_=
build/81024606</a><br>
<br>
Who decides about backporting or not backporting dosfstools 4.2 to Dunfell=
?<br>
I can only stress again that a large number of devices in the wild are cur=
rently running on FAT boot partitions, and come with a dosfschk version tha=
t likes to destroy these boot partitions.<br></blockquote><div><br></div><d=
iv>That would be Steve. It&#39;s best if you cherry-pick the needed patches=
 into current dunfell tip, and send them here with [dunfell] prefix, adding=
 the rationale to the commit messages.</div><div><br></div><div>Alex<br></d=
iv></div></div>
<br>
<br>
<br>
</blockquote></div>

--0000000000007082a805bca42cff--
