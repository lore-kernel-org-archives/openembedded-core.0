Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id DA1FF7831C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 15:22:39 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id g33so6039559ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QMZg4o9NxiaHooaCfSFGrAu9RLTf6dPV8Vrpd2kbvbQ=;
	b=Y0MAbSEu9S19YhCQ+wSgdM6IcoZosFELWuFB8HXlRhdFkMXf/DPIr/gxdvb8EnTSRg
	l6X16SVd6ThbIdT+p+n3HeMM9OUmK11Nmzb9Rp1OEXIePCBwP7L29qCk6glyGuJq2t2i
	BRzJtvf4LaHtZozSxZxTP/fx+GJ9PGSQmAq3mfIxhIqZj8VeBlu23wBfb3H/wjpXLlpl
	qfSzbFKF2FlI6IH6rGzptG1kKr5K1I3rkxXrFCpo48woMRmzVzsYgvVZpkuFXQWaPXg+
	NZBcot2zdbsJwamrbSHULMafXmAYzCBSDg3hyPpF0hj2eHKPb8Prv+XEA26rcfE3aUrn
	DEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QMZg4o9NxiaHooaCfSFGrAu9RLTf6dPV8Vrpd2kbvbQ=;
	b=s9MqNZcRgXT615yEihvJkPHk4+gqykMmDj0beD7MsJXeGfqdS5XWN6Jdf1KX1M5oOM
	ONMtdONkftBk76P/4ZqDdbUISKapMDc5h8YGIB18pRSYFJ4Whhjj3xWVOIFo4A5OSmao
	1u04OQG8k6ICk97SjmHFibt/HDWNlzVjI4xIrGkrs+P/taeGr9XtUAFS7Ai1SRXtAF1Y
	xU6U5EKHdzjc/U8U/kSogLe5RlO/+b6Vg5eERkDof74Wb74TyzL4wsGU1GLYXaubSjHE
	IUk6vbi4WugJ3OK3Dkvym5geTIUlmXfBcAPqbVBG1ynAHTZnx7cmUtYgvkMiJGRuEfwU
	47CA==
X-Gm-Message-State: AHPjjUj8g3XaJHKZ06xUdW2hJYlXP7sN6gcxvV5P6hQO04ZlslyQS5cw
	23HhocXnFSx5o1TmL5wLOuJicWy+NRbr
X-Received: by 10.107.9.137 with SMTP id 9mr888945ioj.196.1504106560918; Wed,
	30 Aug 2017 08:22:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Wed, 30 Aug 2017 08:22:20 -0700 (PDT)
In-Reply-To: <CAHUNapQKyAK7F3TSf4Mi4xkGdjt99QL=j_+3nhYUUiuuA7UXRw@mail.gmail.com>
References: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LYAddb5=Lm8tfX8E4SHTeHRsUfv=HV1Civ7ak9G8M4sAg@mail.gmail.com>
	<CAHUNapQKyAK7F3TSf4Mi4xkGdjt99QL=j_+3nhYUUiuuA7UXRw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Aug 2017 16:22:20 +0100
Message-ID: <CAJTo0LaLmLLHErE4oE5_ivO87jZh71mX7BQbXTWdim1hyJV3fw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libmnl: add recpie
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
X-List-Received-Date: Wed, 30 Aug 2017 15:22:40 -0000
Content-Type: multipart/alternative; boundary="001a113f8f1444cd730557fa1974"

--001a113f8f1444cd730557fa1974
Content-Type: text/plain; charset="UTF-8"

On 30 August 2017 at 16:13, Trevor Woerner <twoerner@gmail.com> wrote:

> On Wed, Aug 30, 2017 at 6:53 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > Note that we've reached feature freeze for 2.4 so this will have to wait
> for
> > 2.5.
>
> A lot of my builds failed last night because I'm not including
> meta-networking (which pulls in meta-python) because they weren't
> needed previously for what I was building. But with libmnl now being
> needed by iproute2, maybe this is a stronger argument for needing it
> in oecore for this release? oecore should stand on its own, unless
> there's a way to make this dependency a non-default packageconfig?
>
> It's not a big deal, I can just add meta-networking and meta-python
> and "solve" the problem.


How and why does oe-core need libmnl?

Ross

--001a113f8f1444cd730557fa1974
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 30 August 2017 at 16:13, Trevor Woerner <span dir=3D"lt=
r">&lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gma=
il.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Aug 30, =
2017 at 6:53 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">=
ross.burton@intel.com</a>&gt; wrote:<br>
&gt; Note that we&#39;ve reached feature freeze for 2.4 so this will have t=
o wait for<br>
&gt; 2.5.<br>
<br>
</span>A lot of my builds failed last night because I&#39;m not including<b=
r>
meta-networking (which pulls in meta-python) because they weren&#39;t<br>
needed previously for what I was building. But with libmnl now being<br>
needed by iproute2, maybe this is a stronger argument for needing it<br>
in oecore for this release? oecore should stand on its own, unless<br>
there&#39;s a way to make this dependency a non-default packageconfig?<br>
<br>
It&#39;s not a big deal, I can just add meta-networking and meta-python<br>
and &quot;solve&quot; the problem.</blockquote><div><br></div><div>How and =
why does oe-core need libmnl?</div><div><br></div><div>Ross=C2=A0</div></di=
v></div></div>

--001a113f8f1444cd730557fa1974--
