Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id B8CBF65C98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 23:00:43 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id q107so3386470qgd.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 16:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qq/ZezbmPaDOWZd8EXpLopqlam5NgQ3LxMsd4tCF1WM=;
	b=hn1rz+P4c9ezMtU2jI6IPR0oXiSneUEJhJyStWvCjUUlxZUpcPRulj3fL0i8eywEnw
	DR1RJlFtkQszKSXBkkkru8eMm9KYX6o0mAWS0U2jAlFH+FeDNqtwYXlqk/CLqSV1v+E3
	8jP1NHc1oiqdb/zHbyvhfKKcv2jTDCqF+sMTpn9ITpAJUj8wjsYXvrxoD4G8NX7Rdw5y
	HQ9OTUPgL1At0TF3XgmNk4VjYrHWmrRK8p+WgxEt8ZCwfJ25P8HMo7MyGmPGTtfx3pII
	gZv6vsWteWABrQkbljCDzFVBcC4L63igeoqe0b7QQIOg6/IP6x2ELV7PdQK4vVH8K0Kn
	YtMg==
X-Gm-Message-State: ALoCoQmLewjTQy4iqvuSnwK9qKdmbIbZI0MOhMi1sculcIKYxqxos2x3nMYu9AS6pAbvzZO22x9i
X-Received: by 10.224.2.135 with SMTP id 7mr1997006qaj.64.1414018843859; Wed,
	22 Oct 2014 16:00:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 22 Oct 2014 16:00:23 -0700 (PDT)
In-Reply-To: <1410761131-18885-1-git-send-email-rongqing.li@windriver.com>
References: <1410761131-18885-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Oct 2014 00:00:23 +0100
Message-ID: <CAJTo0LYZZ_Te26THOzN74WekkjKHQamajtfs0_Q1SG_yC6npkw@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] irda: add systemd service file
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
X-List-Received-Date: Wed, 22 Oct 2014 23:00:53 -0000
Content-Type: multipart/alternative; boundary=001a11c3defae4ed6e05060aeac9

--001a11c3defae4ed6e05060aeac9
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 07:05, <rongqing.li@windriver.com> wrote:

> +[Unit]
> +Description= irda
>

Leading whitespace.


> +After=syslog.target network.target
>

Is the default value of After=basic.target sufficient?


> +EnvironmentFile=-/etc/sysconfig/irda
>

Hard-coded /etc, sed in sysconfdir.


> -inherit autotools-brokensep update-rc.d
> +inherit autotools-brokensep update-rc.d systemd
>

Dizzy doesn't have this line (autotools was removed as irda isn't
autotools), please refresh.

Cheers,
Ross

--001a11c3defae4ed6e05060aeac9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
5 September 2014 07:05,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing.l=
i@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">+[Unit]<br>
+Description=3D irda<br></blockquote><div><br></div><div>Leading whitespace=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+After=3Dsyslog.target network.target<br>
</blockquote><div><br></div><div>Is the default value of After=3Dbasic.targ=
et sufficient?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+Enviro=
nmentFile=3D-/etc/sysconfig/irda<br>
</blockquote><div><br></div><div>Hard-coded /etc, sed in sysconfdir.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">-inherit autotools-brokensep=
 update-rc.d<br>
+inherit autotools-brokensep update-rc.d systemd<br></blockquote><div><br><=
/div><div>Dizzy doesn&#39;t have this line (autotools was removed as irda i=
sn&#39;t autotools), please refresh.</div><div><br></div><div>Cheers,</div>=
<div>Ross=C2=A0</div><div>=C2=A0</div></div><br></div></div>

--001a11c3defae4ed6e05060aeac9--
