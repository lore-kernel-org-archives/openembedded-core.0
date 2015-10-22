Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5DB770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 11:20:33 +0000 (UTC)
Received: by qgeo38 with SMTP id o38so53053500qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 04:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u2W6gAwsNV9xM6hZAthF72AIHBUgtn7RnQsrqJcB2co=;
	b=LqPPB5UrZxa8EvPSqQ+7UUsRFavIDJXMqsXrj3KdknEeVR6bpfMG02bnCZpM9JCxKG
	S4GTfQb9nSypxvT7q1nibGqrxEw+ITLij1rQRT343MjuyFPHjrzQTB10PFKTgoZ2GuAC
	SVu7rPQUV9S0WxHq3tavWlzOn7e/yRkIL31NAcHoSbcPX0t1G1Nrp/Zj6gM94ymKM4DP
	r98Q5ayuEhhCnUpU74MLOWJovz8QIzLT17hrZ6vxnaxRoZIQSRO56qaYiIBhDEyU2R6t
	XQWrMheX9TpLS8wRt6jyrNhsAZ9c4GJ2xPN9YvQksAR6N0oVa8uVtRjDmKlFo9aYoEFD
	yVOg==
X-Gm-Message-State: ALoCoQkxT3WI7U/GGbhACaWcbL1M7Q7MZFlaoq0tncGhXsPpkqxQwgc815ngS7o5+SJe2kcv1wcj
X-Received: by 10.140.132.11 with SMTP id 11mr18799775qhe.64.1445512833632;
	Thu, 22 Oct 2015 04:20:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 22 Oct 2015 04:20:14 -0700 (PDT)
In-Reply-To: <94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
References: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Oct 2015 12:20:14 +0100
Message-ID: <CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cups: explicitly configure with systemd when needed
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
X-List-Received-Date: Thu, 22 Oct 2015 11:20:34 -0000
Content-Type: multipart/alternative; boundary=001a113502d0f7a0aa0522afaef5

--001a113502d0f7a0aa0522afaef5
Content-Type: text/plain; charset=UTF-8

On 22 October 2015 at 12:06, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:

> >This isn't needed as systemd.bbclass handles it for you.
>
>
> Well, that's what I thought too, but no, in fact it doesn't.
>

That would be because SYSTEMD_SERVICES doesn't list the extra units that
using --enable-systemd installs, because SYSTEMD_SERVICES is set up to use
the local units that were added before cups had native units.

If you're going to use the integrated units, please remove the redundant
copies.

Ross

--001a113502d0f7a0aa0522afaef5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 October 2015 at 12:06, Andrew Shadura <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura=
@collabora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D"">&gt;This isn&#39;t needed as systemd.bbclass handles it for =
you.<br>
<br>
<br>
</span>Well, that&#39;s what I thought too, but no, in fact it doesn&#39;t.=
<br></blockquote></div><br></div><div class=3D"gmail_extra">That would be b=
ecause SYSTEMD_SERVICES doesn&#39;t list the extra units that using --enabl=
e-systemd installs, because SYSTEMD_SERVICES is set up to use the local uni=
ts that were added before cups had native units.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">If you&#39;re going to use the i=
ntegrated units, please remove the redundant copies.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113502d0f7a0aa0522afaef5--
