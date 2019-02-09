Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACD97C5C8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 19:23:46 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id i20so11499538otl.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 11:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pFCvkij3bBONWK1F1zo75/VA7zFfmGej43KUNLTNeWs=;
	b=sm3YxnqIdeIos3tF97GF5+Oe3H9XiJUlkqlFDMaNHepHDDSAb9cBNOMP6zHS7UN09v
	dZBcZX2vqOpFJD5O3HddD4mCUsbF4zdMZuGXYMDu0Fv5ml6G8TZn+OpHvWSkVzC4jeuV
	tmixHNygY03kIh8HG/4w3bpUKm8dKK9WI+C1Yu6xITO9Lm0mdraq+Nlowru6VRSjAPd6
	IkYFrV9dDSTOi/fBapC1YYv6HmFdTx3zk3cDE/J7/cvPHEHpJzSozqDFGeDeSl1spHYG
	UVakHxJ0lFLrmvos9CMhcIGmKXs0EKpRoWfmlUMgm5cit3msRWe654/SvBm3l6POH9Vj
	2LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pFCvkij3bBONWK1F1zo75/VA7zFfmGej43KUNLTNeWs=;
	b=so+/X6JMHV+qZu0Fn9w/AOXg0mSELn9NxIokEQvA7EsL6TnU3xmj1/MfUzi5d98JjS
	r0iO0r4TLAyJVTRq+oo2un07w2AoMN3GZcMcwZFqLEPZBpwxQyOJ0BYzrlshEkTNXQLe
	5zXODOkIY8ppqut3VRCstsw1y5jyp7FFrTgkS4QPZ8msksOKBeGyNBs1uYuTz2/iVkwS
	APYNzcHbMqBQh6U1iQX1GaLvqR4agJdFphLCEb7ekAMy0hvhuSZAt4wnX68PYFQT0GQh
	c+rN8nvXvo8J1bzGKb2hAsF2HyPp9Rw562EaEqrJ1D7kDZQephgjKzQJMeVGoNqf1SEC
	YJ3g==
X-Gm-Message-State: AHQUAubftuXjzcwLPyi29drc3BBpKR5vXPc4iiMtBbmYzZ4QQc9bJih2
	XNV8dh5a/2PgvE7fuwMWISsj2tuPTFbugoHoXnAmbA==
X-Google-Smtp-Source: AHgI3IajH5cYCxHurh/wI3BwS4217PYQDE2033LLH7KeQuz5VBYd/I+d26+MID+MP0CLE79rfEzdsEF1s7pZL3Fw93k=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr19537752otl.12.1549740227670; 
	Sat, 09 Feb 2019 11:23:47 -0800 (PST)
MIME-Version: 1.0
References: <VI1PR01MB51675AC59E6B6C4D17536D3F88690@VI1PR01MB5167.eurprd01.prod.exchangelabs.com>
In-Reply-To: <VI1PR01MB51675AC59E6B6C4D17536D3F88690@VI1PR01MB5167.eurprd01.prod.exchangelabs.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Feb 2019 20:23:36 +0100
Message-ID: <CANNYZj8NRcP=bFqy1oHY106V2=8d--HOFypBTWrpRnsnZe0kpw@mail.gmail.com>
To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with blocked signals in daemons started from rpm postinstall scriptlet
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
X-List-Received-Date: Sat, 09 Feb 2019 19:23:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 9 Feb 2019 at 19:55, Diego Santa Cruz via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
> I am having problems with daemons that get started from the rpm postinsta=
ll scriptlet, via update-rc.d, that they cannot be killed. Investigating I =
discovered that they have most signals blocked. My guess is that rpm blocks=
 almost all signals so that scriptlets do not fail, but as the signal mask =
is inherited across fork and exec the daemons end up being blocked. Looking=
 at update-rc.d it is a simple shell script which does not reset the signal=
 mask, so any daemons started from there inherit the signal mask.
>
> Even worse, things like ntp which rely on SIGALRM fail to work properly w=
hen started from the postinstall scriptlet.
>
> Any ideas on how could this be solved, I am considering tweaking update-r=
c.d to ignore the -s option as a workaround, at least it avoids the issue a=
nd anyhow in my setup I always reboot after installing or updating packages=
. Any other ideas?

I'd suggest you take this to rpm upstream. Obviously rpm is widely
used in Fedora, RHEL and other distros, so somehow people can find a
way around this.

Alex

