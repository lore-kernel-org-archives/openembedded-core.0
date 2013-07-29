Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id D9EBA60629
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 11:05:43 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 5so23134pdd.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 04:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=r3IoA7LUqCC8gFZzi/oebRW0W83GtkRhuInoDPIb6Rs=;
	b=HePmFRP9m69U5UPvLRAiQEyg7hBhrarxxF+PU9QfT2kDm4X8hUmoUXh5+OdM82Mo5R
	80p5sNwRmiVtRZTzkRvGk/TZ/MeVIGQGJ9eYK6wL9zxr4LDhC/YB+j8n1nUFYjeGwPdb
	NkXuu/9C51XSH8/FtU8WXWbA7dehuki3+Tkf6a3ogy0o022U4VC857jOnUO27GwYEZ4R
	sncRmmLf1qdyAnjtUTPPfhYnWL+RN3P2TWFcQYTIT9O/77f4DsgUq0pr4hXbvI8hS0E0
	GZfBxoS6hrMBie1jVt35jXkvCElrbVhf2KNSQvIfEWyxW/Clca6WJ36zTUpgrusIhCGV
	zTlA==
MIME-Version: 1.0
X-Received: by 10.68.2.165 with SMTP id 5mr2663308pbv.105.1375095944649; Mon,
	29 Jul 2013 04:05:44 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 04:05:44 -0700 (PDT)
In-Reply-To: <CAOMwXhMKu6JikR5TRCEDorq2uZZ4kK=uiJ2LWkYsgg0kJh0S3A@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<CAOMwXhN556gDMxEGGSaFwYMJ7EU=Pvn+4mZcy0Q4eLyn7ShjqA@mail.gmail.com>
	<1375094306.13247.11.camel@phil-desktop.brightsign>
	<CAOMwXhNsgLaOtmCouNmB3d7wuACAt7iSLfO5zMq-ph0FBi8w0A@mail.gmail.com>
	<CANyK_8fu6VhVmKeTjD8DLt5DYnf-DfNG2PGzZSM83KougpOyBA@mail.gmail.com>
	<CAOMwXhMKu6JikR5TRCEDorq2uZZ4kK=uiJ2LWkYsgg0kJh0S3A@mail.gmail.com>
Date: Mon, 29 Jul 2013 12:05:44 +0100
X-Google-Sender-Auth: lQoefe1rmyWtC1aIcM1xhCSvIHo
Message-ID: <CAOMwXhMCpajTv9hjDvbKg13o+dr0upVbY1q1bHBPpoo2nyf_Eg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Paul Barker <paul@paulbarker.me.uk>
X-Gm-Message-State: ALoCoQlvmoaWXJfmPupnpk7l2mEzT1ETpdiZ9yNkEqer8jPux8/0SqXLWRQjaUjH4vrKngvLq80C
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 11:05:43 -0000
Content-Type: multipart/alternative; boundary=bcaec5215afb50265804e2a47956

--bcaec5215afb50265804e2a47956
Content-Type: text/plain; charset=ISO-8859-1

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4942


On Mon, Jul 29, 2013 at 11:48 AM, Laszlo Papp <lpapp@kde.org> wrote:

> Have you ever heard about project budgets and that updating a toolchain
> requires a lot of testing, and hence time, money, man power?
>
>
> On Mon, Jul 29, 2013 at 11:46 AM, Paul Barker <paul@paulbarker.me.uk>wrote:
>
>> On 29 July 2013 11:42, Laszlo Papp <lpapp@kde.org> wrote:
>> > Not to mention, you would cause a "runtime" issue which is pretty
>> simple to
>> > fix for a very minor portion compared to a *large* user base using older
>> > toolchains. There is a huge difference between a few people cannot use
>> > rfkill for those applications (2, ridiculous), and that a slightly old
>> > toolchain cannot even build the *whole* project.
>> >
>>
>> Is there any reason that you need to use such an old toolchain? We
>> can't expect everything we have to compile with every toolchain
>> release since the start of the GNU project so we need to draw the line
>> somewhere. I think the feeling is that we'd draw the line somewhere
>> after the toolchain you're using (from 2009 IIRC).
>>
>> --
>> Paul Barker
>>
>> Email: paul@paulbarker.me.uk
>> http://www.paulbarker.me.uk
>>
>
>

--bcaec5215afb50265804e2a47956
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D4942">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4942</a><br>=
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon,=
 Jul 29, 2013 at 11:48 AM, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Have you ever heard about p=
roject budgets and that updating a toolchain requires a lot of testing, and=
 hence time, money, man power?</div>
<div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><br>=
<div class=3D"gmail_quote">On Mon, Jul 29, 2013 at 11:46 AM, Paul Barker <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_bla=
nk">paul@paulbarker.me.uk</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On 29 July 2013 11:42, Laszlo Papp &lt;=
<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt; wr=
ote:<br>

</div><div>&gt; Not to mention, you would cause a &quot;runtime&quot; issue=
 which is pretty simple to<br>
&gt; fix for a very minor portion compared to a *large* user base using old=
er<br>
&gt; toolchains. There is a huge difference between a few people cannot use=
<br>
&gt; rfkill for those applications (2, ridiculous), and that a slightly old=
<br>
&gt; toolchain cannot even build the *whole* project.<br>
&gt;<br>
<br>
</div>Is there any reason that you need to use such an old toolchain? We<br=
>
can&#39;t expect everything we have to compile with every toolchain<br>
release since the start of the GNU project so we need to draw the line<br>
somewhere. I think the feeling is that we&#39;d draw the line somewhere<br>
after the toolchain you&#39;re using (from 2009 IIRC).<br>
<div><div><br>
--<br>
Paul Barker<br>
<br>
Email: <a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paul=
barker.me.uk</a><br>
<a href=3D"http://www.paulbarker.me.uk" target=3D"_blank">http://www.paulba=
rker.me.uk</a><br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--bcaec5215afb50265804e2a47956--
