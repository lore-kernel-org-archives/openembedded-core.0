Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4C11C6A3ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 11:14:21 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so5103419pde.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 04:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=2lOPW317K00mXGQRTTOkU3XGDQ9k7AUv7/OoQ9tbS1U=;
	b=haaUWPDk9vfO3EU6kuzrJ/FFacYEUNc8regcee0Q2sov5G6w+szRSXlniPCT/6BQLT
	97YQd1rl79z2LwvpQ3ypLVY2ZHR01fulBdmAUYgD7eQrCB3/kAIJ468jDeejoZBbLS/F
	gRs3RVC4TG/dp16OrN/8Qb1wUwzbtpn5jyVnQPhiC+PD122ble60rY0a26hkFUj40JWZ
	6DyiXjUmlHoWI2A8w0KOZsDldOgKEN4nZUEvu2LqtHDzrbW368i2lHrnwUX1tJMhw99L
	iXInNSsDE5/kT1uJyh/6lFpezUppg5UFLkn/WblSKmraWej3gVKJtlFkXGn+pU06sKBc
	CFdw==
MIME-Version: 1.0
X-Received: by 10.66.27.143 with SMTP id t15mr64085977pag.171.1375096461343;
	Mon, 29 Jul 2013 04:14:21 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 04:14:21 -0700 (PDT)
In-Reply-To: <51F64D75.60601@juszkiewicz.com.pl>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAJTo0LazaFL14=WbXSM4CnF0y=25VLt7m4cP9nU4B7Qs2kXEnQ@mail.gmail.com>
	<CAOMwXhPMi6cG858ZX9r+c310hdvGMRbNKLYEadyr0e9GVUuTqw@mail.gmail.com>
	<51F64D75.60601@juszkiewicz.com.pl>
Date: Mon, 29 Jul 2013 12:14:21 +0100
X-Google-Sender-Auth: klXuXNIv8HPUpidmzQAFicdBxE8
Message-ID: <CAOMwXhPkrbqr6QsALa+jetKxVbvCDtXwkDpvuCfuVfZwWEFpSA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
X-Gm-Message-State: ALoCoQmq6NkT2PnPNx07Sfx0PGMhqMNpuZXC4n3NQzYP5ZyYvi1RaswpF0sQWjkAtQ/mW6LbQHIy
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
X-List-Received-Date: Mon, 29 Jul 2013 11:14:22 -0000
Content-Type: multipart/alternative; boundary=bcaec52bea191c4e7904e2a498b3

--bcaec52bea191c4e7904e2a498b3
Content-Type: text/plain; charset=ISO-8859-1

"closed minded" is relative, and I have my personal opinion who could be
classified like that. So let us not do ping-pong "stop being closed minded"
games. :)

 As written several times already, it is just as simple action for the rare
"rfkill" people to do enable this as for me? So, the *real* question is
which people to help in the initial step: my answer is the bigger user
base. Why don't you just provide a change on top of mine as already
suggested if it is "that important" for you guys? As I mentioned, I am not
paid for this, so I have only a very limited time for Yocto compared to
several people in here.

Accordingly, I am not sure I follow your reasoning.


On Mon, Jul 29, 2013 at 12:09 PM, Marcin Juszkiewicz <
marcin@juszkiewicz.com.pl> wrote:

> W dniu 29.07.2013 12:44, Laszlo Papp pisze:
> > OK, I give up the contribution. I really cannot collaborate with
> > people who think it is acceptable to break *many* users' life for the
> > whole project without being able to use anything in favor of a very
> > limited (!) people with only two (!) applications.
>
> Stop being closed minded. OpenEmbedded provides many options for doing
> alterations and you got some suggestions in this thread how to make you
> happy without breaking setup for other people.
>
> If your toolchain is more then 4 years old then maybe stick with older
> versions of OE as well?
>
> Or just update linux-libc-headers part of toolchain and be happy with
> it? But it would require you to rebuild everything to check does it
> builds...
>
> Or do one simple change in your own layer to disable this config option?
> This would take you just 5 minutes and provide compatibility with
> probably even 2.4 kernels.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--bcaec52bea191c4e7904e2a498b3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;closed minded&quot; is relative, and I have my perso=
nal opinion who could be classified like that. So let us not do ping-pong &=
quot;stop being closed minded&quot; games. :)<div><br></div><div>=A0As writ=
ten several times already, it is just as simple action for the rare &quot;r=
fkill&quot; people to do enable this as for me? So, the *real* question is =
which people to help in the initial step: my answer is the bigger user base=
. Why don&#39;t you just provide a change on top of mine as already suggest=
ed if it is &quot;that important&quot; for you guys? As I mentioned, I am n=
ot paid for this, so I have only a very limited time for Yocto compared to =
several people in here.</div>
<div><br></div><div>Accordingly, I am not sure I follow your reasoning.</di=
v></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mo=
n, Jul 29, 2013 at 12:09 PM, Marcin Juszkiewicz <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:marcin@juszkiewicz.com.pl" target=3D"_blank">marcin@juszkiewic=
z.com.pl</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">W dniu 29.07.2013 12:44, Laszlo Papp pisze:<=
br>
<div class=3D"im">&gt; OK, I give up the contribution. I really cannot coll=
aborate with<br>
&gt; people who think it is acceptable to break *many* users&#39; life for =
the<br>
&gt; whole project without being able to use anything in favor of a very<br=
>
&gt; limited (!) people with only two (!) applications.<br>
<br>
</div>Stop being closed minded. OpenEmbedded provides many options for doin=
g<br>
alterations and you got some suggestions in this thread how to make you<br>
happy without breaking setup for other people.<br>
<br>
If your toolchain is more then 4 years old then maybe stick with older<br>
versions of OE as well?<br>
<br>
Or just update linux-libc-headers part of toolchain and be happy with<br>
it? But it would require you to rebuild everything to check does it<br>
builds...<br>
<br>
Or do one simple change in your own layer to disable this config option?<br=
>
This would take you just 5 minutes and provide compatibility with<br>
probably even 2.4 kernels.<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote></div><br></div>

--bcaec52bea191c4e7904e2a498b3--
