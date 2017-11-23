Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id BD9F1786DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:00 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id w127so26420882iow.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 04:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4PpsLOJgRfOYlXUG1+cAbz2Di591biVPlRn5Ufka16w=;
	b=FpgkPvdZ6657nPGKmE3rT2jvRH+t3vb0gZ4IW5vP4JdxZKsX5fkqUkIhv3Z2YDheRh
	fXA7SB4Vnf9uHx6GhRRXI052mvKcKolUO8rknOr6IOf7CteGYFlHf6pdvnm/V9D5oG39
	dKgJGgFxxwmY6IUEwsMu9qMXErxedMMq0TEMW0hOMy13mPnj6SlIpmnVwHmNHSKG9p+B
	I7zXvyH7a9XLBnhf7AeXXYRj9a4mY99k/VgtwtnXPq6ryzejSAKeY+hmtXlIWJ//Rlvi
	Xws0Duslj41NtEWDc56K5IACAp9b+LTFuPNGZsiHp43KVYN6a6xdM5Xk6J/9TFjvcfAh
	VB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4PpsLOJgRfOYlXUG1+cAbz2Di591biVPlRn5Ufka16w=;
	b=lKQyarkhGfa6H+AfwMWi3oTyGN+lVHg0CK7HnBx9gvsQOU3r1n6S3thPWczIFsNrQe
	U9rFnIjQyTxMrBTGvneP6VLFV0x3xp0ZRYjMVWO+p7U+4fcJ+s6bgFN6FqsSopb82bLw
	ZJuH+pz/SId1T1jUhVgw62VmlUuwE2kI9OQlyxBIQcdMJqrOKB2Ezcj/7nTcOxgdX3KF
	qrVd01Q3rlmiU0mvd2QqpCg1KZ/j6eN/Vbly5tAGpBZbPloCHMzYx61D15a6kU8syi7Q
	80zhHmEpwNko+31ajwMfivS+XTZTtn0tW/f39PodKzF9W+sJURhmWnOXCvHQKtoMwzQp
	aV+Q==
X-Gm-Message-State: AJaThX5s44NPA11fS6/D0XX5IZeT370wTPE2OqzH6Q0lypxo34C/5FG4
	k0Ad8oJeMJFVVKj3/zOf3dPwA9cBFLrAbUaQ4SqbqA==
X-Google-Smtp-Source: AGs4zMZEGiSMlKUTPvYt358MQAMytQtOq0GOHTiYhMVj+KTbCPF55bdTYyek7xoVB82HWwMGyVOJpEVZoG9cCNVD4zk=
X-Received: by 10.107.32.18 with SMTP id g18mr25789054iog.227.1511438941850;
	Thu, 23 Nov 2017 04:09:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Thu, 23 Nov 2017 04:08:41 -0800 (PST)
In-Reply-To: <CAJTo0LY1LBR5XyVERkDiPJBokCeLLKxH4X38D4x1tuj+eZFTPA@mail.gmail.com>
References: <20171122160414.14093-1-ross.burton@intel.com>
	<20171122160414.14093-3-ross.burton@intel.com>
	<35dc23c8-a8af-65ca-8cdf-5152b76d98c0@linux.intel.com>
	<CAJTo0LY1LBR5XyVERkDiPJBokCeLLKxH4X38D4x1tuj+eZFTPA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Nov 2017 12:08:41 +0000
Message-ID: <CAJTo0Lb3jJfybQDAwX1nruJtDP+jtOhB08ZmoSaOv2p_LotKhQ@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oeqa/selftest/runtime_test: simplify postinst testing
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:01 -0000
Content-Type: multipart/alternative; boundary="001a1141b4983a9cc5055ea54d58"

--001a1141b4983a9cc5055ea54d58
Content-Type: text/plain; charset="UTF-8"

On 23 November 2017 at 10:21, Burton, Ross <ross.burton@intel.com> wrote:

>
>> The indentation doesn't look right here?
>
>
> That would be Atom "helpfully" doing smart intentation.  I'll fix it up in
> something else, thanks.
>

Can't see any problems, what didn't look right?

Ross

--001a1141b4983a9cc5055ea54d58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 November 2017 at 10:21, Burton, Ross <span dir=3D"lt=
r">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burt=
on@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D""><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1e=
x"><div><div class=3D"m_8341726617125964381gmail-h5"><br></div></div>
The indentation doesn&#39;t look right here?</blockquote><div><br></div></s=
pan><div>That would be Atom &quot;helpfully&quot; doing smart intentation.=
=C2=A0 I&#39;ll fix it up in something else, thanks.</div></div></div></div=
></blockquote><div><br></div><div>Can&#39;t see any problems, what didn&#39=
;t look right?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1141b4983a9cc5055ea54d58--
