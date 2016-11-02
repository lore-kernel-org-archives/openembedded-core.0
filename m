Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1439771BB2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 13:00:32 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id t196so11748186lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yZujMs2DiTLfTKAZs7Lg6PJ+WqIwuh1yD1n0J5YjpOg=;
	b=TQKYZdWkxsfurWo5d0ZiUSzT5rv8MQURakmlKd+CT7ECA1L8kWgJM05PH82JOt2B80
	hu3f6NBjW/OJ4IrPO2UR5joogBSk5NtaptezIpae5ILU4h/89HMI6XBVHkhWkdmiyvLO
	110agm0a5FFH513Rg7H5Ie07uMJbBoFgwFun70JaJzzLr8wjmuf1Gp+56fQtba1HsoQO
	xTcVj75AXKfD0tijngApXHXV1+bVpjsI+SR+qsPUw4Y69NLwI7NjVOcb/rvNHO71JOln
	KhilM2Q1cPTY3tkfAZcH9l86wxg1kB2RHugW2Og7Xl/hAsZt7uwlpj0ArCkzFB7vsBMv
	dxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yZujMs2DiTLfTKAZs7Lg6PJ+WqIwuh1yD1n0J5YjpOg=;
	b=cAj/t231qSTHyn19Vuw27jvjf9sDzwwz0zsZWomTqW1qxpCmasRcjBA7AYeXc+pXjI
	6JL9cejHi9SmBir8yLLM6YMp2Vifg/rLOBIXdtfd1XUXqnzBmLF1xS+W/USfJI194kWD
	SMjqdvYb7lER0BdiBX2GOnk09Ue02BS0SN6HxZwJq3E9j+p+BKCvcO/FpldT7qzYoaSr
	TR8U/Vrr0MQ/P3qEbnVT0FIvc1cSkKQEhX35QSrzGJesTECZX0TwmQUl7pDhyyslo4Mh
	dj5MKW0/KCCQ7TVJm/be+IXzYU8cWaH5vVWWGtJKBMVpD0kYy6PTJEaaP6PAWJFUi7SM
	tBrA==
X-Gm-Message-State: ABUngvdupTxM5gfGuqdHePFfmq1VDDkuCM7WwYdSGs8nRHFURffVm63joYcMA1/Ocr1pNKqcm3pXFNFIR8eHAQ==
X-Received: by 10.25.28.143 with SMTP id c137mr2002222lfc.149.1478091633628;
	Wed, 02 Nov 2016 06:00:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.89.139 with HTTP; Wed, 2 Nov 2016 06:00:03 -0700 (PDT)
X-Originating-IP: [187.23.148.135]
In-Reply-To: <CAJTo0LbayQcAY1qGtiJWjfJ2X+kNHZAeC4cf43d-5rwWx-EEjA@mail.gmail.com>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-4-git-send-email-fabio.berton@ossystems.com.br>
	<CAJTo0LbZrrrcvMmqpb943oarTKY6B=UkmszpdFLv=3cWqCV9SA@mail.gmail.com>
	<1BF9A377-D1BB-467B-90F2-0E205B7CEF49@basmevissen.nl>
	<CAJTo0LbayQcAY1qGtiJWjfJ2X+kNHZAeC4cf43d-5rwWx-EEjA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 2 Nov 2016 11:00:03 -0200
Message-ID: <CAAPZna0XP4GOEg1gKCv2sdbw7H4FKkWTcTFWhVNh_rHAVL5FMA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] serf: Update to version 1.3.9
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
X-List-Received-Date: Wed, 02 Nov 2016 13:00:33 -0000
Content-Type: multipart/alternative; boundary=001a1140209ac4b18905405106cd

--001a1140209ac4b18905405106cd
Content-Type: text/plain; charset=UTF-8

Ok,

I'll send a v2 using https://archive.apache.org/dist/serf/

Thanks,

Fabio

On Wed, Nov 2, 2016 at 10:21 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 2 November 2016 at 11:39, Bas Mevissen <abuse@basmevissen.nl> wrote:
>
>> It looks like https://archive.apache.org/dist/serf contains all
>> releases, including the current one.
>>
>
> Perfect, can you send a v2?
>
> (just checked the history and it moved to snapshot.debian.org from
> googlecode)
>
> Thanks,
> Ross
>

--001a1140209ac4b18905405106cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Ok,<br><br></div><div class=3D"gmail_default" =
style=3D"font-family:monospace,monospace;font-size:small">I&#39;ll send a v=
2 using <a href=3D"https://archive.apache.org/dist/serf/">https://archive.a=
pache.org/dist/serf/</a><br><br></div><div class=3D"gmail_default" style=3D=
"font-family:monospace,monospace;font-size:small">Thanks,<br><br></div><div=
 class=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size=
:small">Fabio<br></div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Wed, Nov 2, 2016 at 10:21 AM, Burton, Ross <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton=
@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmai=
l_quote">On 2 November 2016 at 11:39, Bas Mevissen <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:abuse@basmevissen.nl" target=3D"_blank">abuse@basmevissen.n=
l</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"=
>It looks like=C2=A0<a href=3D"https://archive.apache.org/dist/serf/" targe=
t=3D"_blank">https://archive.apache.or<wbr>g/dist/serf</a>=C2=A0contains al=
l releases, including the current one.<div></div></div></blockquote></div><=
br></span>Perfect, can you send a v2?</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">(just checked the history and it moved to <=
a href=3D"http://snapshot.debian.org" target=3D"_blank">snapshot.debian.org=
</a> from googlecode)</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">Ross</div></div>
</blockquote></div><br></div>

--001a1140209ac4b18905405106cd--
