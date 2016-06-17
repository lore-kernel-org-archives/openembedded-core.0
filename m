Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id CC27F734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 02:59:17 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id 100so7987760ioh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 19:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3oxBt+Pmq40TXF3ho2Syg1j/0hvl0V8Eb3qckikdLpc=;
	b=s9uAa4hUzEYGWHQ5NjqA8NqeWNfAEPXEzg2eDkXQS38jgXdcvZLUpbWRxhbVfqXbZS
	RBDdNlM6hvxfpFmHZBwg3Mq+gZ3YXTTWyGfyMDkL2+AWSBVM9VKCAYBmDlSrX5IjgxDy
	RVckUjuPdMwhPrxHaoHAj2Jqkj8YQLutM7ecfNq0iYBoM++Sr+AFiljLOi2nlfr2Yj9o
	A1x2gMF3w1VEh8onvK9AJVzr5itOduJQ22AnJXvZvegZeTotYSvY+OzEi0UK+5Ub9Gr1
	nfpzRRsK5v2JAcqgYDlhdd2u2dw4k97iSfDuf5d146BnwME9vuuEwPFC6OJ+8XtjqQt2
	4y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=3oxBt+Pmq40TXF3ho2Syg1j/0hvl0V8Eb3qckikdLpc=;
	b=Qo0VApIUVEw8HGLmrcAxPZEcjXEp3WmRJmF9J+HGB74Rce09stJHasGCznOkaUwyYK
	E/cmTWN8Wg8XnZ+fsxwmfZP8Q/Z9GV7OwUGOQ2gIMv1jdYtG2Q/c4TU9Ehs3YHJy7Kpf
	uNpn//FFW6Z9fhs2lEAes047mOJI9vpKEPV4eqXO1Ze4iKj3Ls3ND2o3YrBn73+faKj+
	AvOZoNLTsEbJTdRwyiSUfjKRDL/qOnKstG915TCdRJyYw4Rz/71VQGrUIbFAxGpMXfgi
	wdszNLv++csa3NVOrPQnui0/68VnKS6NkLPHOkdfkWeahbhlVntj3/JuNHZQe2YpPDR5
	dRZQ==
X-Gm-Message-State: ALyK8tJaoqUmhcYqUwNZqoArWqUUL9sie1/8i7wj96IvdLxkRHDEcwmPWpBXE+T04NPYebAD5eXCxnwLwmdOUA==
X-Received: by 10.107.147.137 with SMTP id v131mr12909255iod.3.1466132357879; 
	Thu, 16 Jun 2016 19:59:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Thu, 16 Jun 2016 19:58:58 -0700 (PDT)
In-Reply-To: <CAJ86T=W1ZwM7j-OJUfBBj6eqMz08346xpvu2VKqeD1JWtob=jA@mail.gmail.com>
References: <1461870393-3545-1-git-send-email-dv@pseudoterminal.org>
	<1461870393-3545-2-git-send-email-dv@pseudoterminal.org>
	<CAJ86T=W1ZwM7j-OJUfBBj6eqMz08346xpvu2VKqeD1JWtob=jA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 16 Jun 2016 19:58:58 -0700
X-Google-Sender-Auth: OfbxmkbPv309MiKo0cMvjcKVXbE
Message-ID: <CABcZAN=PJ7m0jKUY1TnxiqBpC15Ahfr_f2=9fD+T24zGvLXJgQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/8] gstreamer1.0: upgrade to version 1.8.1
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
X-List-Received-Date: Fri, 17 Jun 2016 02:59:17 -0000
Content-Type: multipart/alternative; boundary=94eb2c003142629db60535708aac

--94eb2c003142629db60535708aac
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 16, 2016 at 7:46 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Apr 28, 2016 at 12:06 PM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
> > The gst-inspect patch no longer applies, and according to upstream, is
> > not needed.
>
> This patch series seems to be missing an update for
> gstreamer1.0-plugins-bad ?


gstreamer1.0-plugins-bad's upgrade was delayed due to the pending gtk3
switch for sato, which has recently happened, so I'd expect that upgrade to
come at some point in the near future. See
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9664.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c003142629db60535708aac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 16, 2016 at 7:46 PM, Andre McCurdy <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex"><span class=3D"">On Thu, Apr 28, 2016=
 at 12:06 PM, Carlos Rafael Giani<br>
&lt;<a href=3D"mailto:dv@pseudoterminal.org">dv@pseudoterminal.org</a>&gt; =
wrote:<br>
&gt; The gst-inspect patch no longer applies, and according to upstream, is=
<br>
&gt; not needed.<br>
<br>
</span>This patch series seems to be missing an update for gstreamer1.0-plu=
gins-bad ?</blockquote></div><br>gstreamer1.0-plugins-bad&#39;s upgrade was=
 delayed due to the pending gtk3 switch for sato, which has recently happen=
ed, so I&#39;d expect that upgrade to come at some point in the near future=
. See=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9=
664">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9664</a>.<br>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christo=
pher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedde=
d, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Gra=
phics</div>
</div></div>

--94eb2c003142629db60535708aac--
