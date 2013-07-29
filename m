Return-Path: <djszapi@archlinux.us>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0AF6A3ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:48:29 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa1so5739927pad.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=m82GrtJjWYLBxfwwhzwdi3Z4faG78GCvqilU7gP1L1Q=;
	b=LuiotUSkRlkOdYHM1p3EpM2P7t8vkEQO70ME7KmWhPcbbh2R7s3FyOLInQcZicoj2A
	tiGAHzNBB+oDfqItzRVYhS3m51qohUSmYer1QFg+3oQ+XQOkpJiiSHJI5Q0sZkCBso3k
	hXMH8FtXXMX2LMPY0D5smR0jCNx4XFAW6Qi60/7pbewPs6NOiLhZcwcJ/cfm4C8eQCjZ
	VkBR0kejS79LXir/FXfphVB7QEuENzXSClOryOoXAOCBU4coFs3bClD+fKI/xCOWWwwG
	v2f+GKdxfpCLMhuqwQS6BJ9xT/23Fs/64hbnq91Mobo0FrpSBGhvseZTZVBXuebLrIHx
	sHWA==
MIME-Version: 1.0
X-Received: by 10.68.2.165 with SMTP id 5mr2583640pbv.105.1375094910596; Mon,
	29 Jul 2013 03:48:30 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 03:48:30 -0700 (PDT)
In-Reply-To: <CANyK_8fu6VhVmKeTjD8DLt5DYnf-DfNG2PGzZSM83KougpOyBA@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<CAOMwXhN556gDMxEGGSaFwYMJ7EU=Pvn+4mZcy0Q4eLyn7ShjqA@mail.gmail.com>
	<1375094306.13247.11.camel@phil-desktop.brightsign>
	<CAOMwXhNsgLaOtmCouNmB3d7wuACAt7iSLfO5zMq-ph0FBi8w0A@mail.gmail.com>
	<CANyK_8fu6VhVmKeTjD8DLt5DYnf-DfNG2PGzZSM83KougpOyBA@mail.gmail.com>
Date: Mon, 29 Jul 2013 11:48:30 +0100
X-Google-Sender-Auth: MsuK0ALhe8PzvItVHaBA0wqr-4A
Message-ID: <CAOMwXhMKu6JikR5TRCEDorq2uZZ4kK=uiJ2LWkYsgg0kJh0S3A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Paul Barker <paul@paulbarker.me.uk>
X-Gm-Message-State: ALoCoQl1YXdDp8Niisypevdcd4jdJORa59Nwxe6g3smnTyDnrqoZ4d2NtyI8Vj2wXp0Ty0I86akN
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
X-List-Received-Date: Mon, 29 Jul 2013 10:48:31 -0000
Content-Type: multipart/alternative; boundary=bcaec5215afbadbcbd04e2a43b0d

--bcaec5215afbadbcbd04e2a43b0d
Content-Type: text/plain; charset=ISO-8859-1

Have you ever heard about project budgets and that updating a toolchain
requires a lot of testing, and hence time, money, man power?


On Mon, Jul 29, 2013 at 11:46 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> On 29 July 2013 11:42, Laszlo Papp <lpapp@kde.org> wrote:
> > Not to mention, you would cause a "runtime" issue which is pretty simple
> to
> > fix for a very minor portion compared to a *large* user base using older
> > toolchains. There is a huge difference between a few people cannot use
> > rfkill for those applications (2, ridiculous), and that a slightly old
> > toolchain cannot even build the *whole* project.
> >
>
> Is there any reason that you need to use such an old toolchain? We
> can't expect everything we have to compile with every toolchain
> release since the start of the GNU project so we need to draw the line
> somewhere. I think the feeling is that we'd draw the line somewhere
> after the toolchain you're using (from 2009 IIRC).
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
>

--bcaec5215afbadbcbd04e2a43b0d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Have you ever heard about project budgets and that updatin=
g a toolchain requires a lot of testing, and hence time, money, man power?<=
/div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, =
Jul 29, 2013 at 11:46 AM, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mail=
to:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt;</=
span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 29 July 2013 11:42, Las=
zlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<=
br>
</div><div class=3D"im">&gt; Not to mention, you would cause a &quot;runtim=
e&quot; issue which is pretty simple to<br>
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
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Paul Barker<br>
<br>
Email: <a href=3D"mailto:paul@paulbarker.me.uk">paul@paulbarker.me.uk</a><b=
r>
<a href=3D"http://www.paulbarker.me.uk" target=3D"_blank">http://www.paulba=
rker.me.uk</a><br>
</div></div></blockquote></div><br></div>

--bcaec5215afbadbcbd04e2a43b0d--
