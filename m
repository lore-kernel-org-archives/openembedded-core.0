Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 55E4C71C14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 21:30:25 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id x129so1428308iod.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 13:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aKu3lzZDa9QHn2HM1917kSo0X8Edv6fg1ird2bBJ1Fc=;
	b=jbyJFtI/Gukhm7EXqCW0WJlsbGteTBvBKL2LGJEHvcRE0hV4Q4ckgTNImCognuS8db
	x8aQ5ZaoyDpGIOAAWg0l0Bhgz/akenn49wlwJ7mHD+2B7CpW5y+UB6s3lavNN7HgaVrL
	gEekyB8TneU+gKxmPeiD/tROmm7Wt0158eaMhe3qv+lMLhU1ikN58qupvkP3GP+wJFo1
	gqvgISP5qNgtfunRpLANoUpqqUG6sxTZF0YkgolIUSQh6iWkFn1knmHMxKMjI76TDBuK
	UyBQi0b+VR0ZY9YWn06ZV4xJzUe3aO8+elteGD3NW7MXIKTGuB3EeNjWJBMvsgKfdl1j
	LAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aKu3lzZDa9QHn2HM1917kSo0X8Edv6fg1ird2bBJ1Fc=;
	b=X1Yk/FM5X4La3ftKbpeKY5/v5DNAt0jvzHp5ZPwKpeOcdn1uursRpShl9Xl9sbR8mB
	Jk3doUs8KMaPRJmbQCkm7ut4zWL6pF+wceo8Cc26liC2/m1/YK1JXZbmpFK+mtk2vvK8
	n392+4/sE3J4+AJMcNPrzLajHQsxPuxHCSUW5BOO/DjYUneOV8inyE0YNimc9qekOkxJ
	bTzuvImRkn623lp+XJZdBKxjTEMQPptQxUaROKuxjW5lkwA+L08tSyZnll4cMY7iPD5z
	mWBIlJiyjC3ZI6MZ1Y3VnPW7Kj0YOW5C/HmzpYPVyxodVDgV5wcjdM8tSqIWZ760jYFv
	gk3w==
X-Gm-Message-State: AJaThX5oNdNqCJUTBMtwdeiYZbsL6oFOG7bP1hh47uP6e9mZ2QAMW0yd
	LxPq3vZADd+DnCtFlkIISi7qmnVI2e04a0FOrl3yxA==
X-Google-Smtp-Source: AGs4zMYA+Wm7s+aCEQKN6CZZr7m52ojjDBf+RCZbJd9aH92VqVg8GCn9lGNgNanRopa/Ns+jcmYAC7VCEMqmEBwddFo=
X-Received: by 10.107.178.145 with SMTP id b139mr792459iof.52.1511904626500;
	Tue, 28 Nov 2017 13:30:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Tue, 28 Nov 2017 13:30:06 -0800 (PST)
In-Reply-To: <CAEQ58sgvjUMZK8VfmRmgs2+G7VGQ9rL71NgTxmUg=S832_ANvg@mail.gmail.com>
References: <CAEQ58sgvjUMZK8VfmRmgs2+G7VGQ9rL71NgTxmUg=S832_ANvg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Nov 2017 21:30:06 +0000
Message-ID: <CAJTo0LaN6s0YJETfvXkWLf77j_+Ssu1UyH=3V-4OHt1MLPBgTA@mail.gmail.com>
To: Francesco Giancane <francescogiancane8@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: connman-wait-online is not behaving properly
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
X-List-Received-Date: Tue, 28 Nov 2017 21:30:25 -0000
Content-Type: multipart/alternative; boundary="001a114ca162328fb1055f11ba97"

--001a114ca162328fb1055f11ba97
Content-Type: text/plain; charset="UTF-8"

We just ship what upstream connman provides, so you'll probably have more
luck talking to the connman list.

Ross

On 28 November 2017 at 17:22, Francesco Giancane <
francescogiancane8@gmail.com> wrote:

> Hi everyone,
>
> I am doing a build on the Raspberry Pi 3 for an University project. I
> included in the core-image-minimal image the connman packages, so that
> I have connmanctl, connman.service and connman-wait-online.service
> enabled.
>
> Wired network is set up properly and so is wifi using connmanctl. I
> can successfully connect to the board using ssh.
>
> What bugs me is the fact that connman-wait-online is not signaling
> properly systemd that the network is configured.
>
> systemctl status network.target yields that the target network has
> been reached so far.
> On the same side, network-online.target is not even started (no one
> notified it of the network being online).
>
> Also, connman-wait-online.service seems to not be even started
> (reports inactive (dead)).
>
> What is happening? Can someone tell me what I am missing in order to
> connman-wait-online to correctly signal network being online?
>
> Many thanks,
> Francesco
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114ca162328fb1055f11ba97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We just ship what upstream connman provides, so you&#39;ll=
 probably have more luck talking to the connman list.<div><br></div><div>Ro=
ss</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
28 November 2017 at 17:22, Francesco Giancane <span dir=3D"ltr">&lt;<a href=
=3D"mailto:francescogiancane8@gmail.com" target=3D"_blank">francescogiancan=
e8@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi eve=
ryone,<br>
<br>
I am doing a build on the Raspberry Pi 3 for an University project. I<br>
included in the core-image-minimal image the connman packages, so that<br>
I have connmanctl, connman.service and connman-wait-online.service<br>
enabled.<br>
<br>
Wired network is set up properly and so is wifi using connmanctl. I<br>
can successfully connect to the board using ssh.<br>
<br>
What bugs me is the fact that connman-wait-online is not signaling<br>
properly systemd that the network is configured.<br>
<br>
systemctl status network.target yields that the target network has<br>
been reached so far.<br>
On the same side, network-online.target is not even started (no one<br>
notified it of the network being online).<br>
<br>
Also, connman-wait-online.service seems to not be even started<br>
(reports inactive (dead)).<br>
<br>
What is happening? Can someone tell me what I am missing in order to<br>
connman-wait-online to correctly signal network being online?<br>
<br>
Many thanks,<br>
Francesco<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114ca162328fb1055f11ba97--
