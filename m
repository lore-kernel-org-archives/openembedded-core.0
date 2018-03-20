Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9513C7847B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 18:00:59 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id l12so3431677ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o+JhDEJrhIga5juxQYmRnYzkVEUwXO5Hz7aGMjkwwuI=;
	b=o6MvPGSrm+g+bhw4oiy7Skdc9C7U/w5nMr+U0DAf5KA+G8mmfWebDjroJZ1MHCqzI/
	E2cEAfjRBqMl/C5+tFr6p24D+AORKjwzBB7HBedYYRK1VO/Vvegd3jwGBA0qFLp/5VRA
	rxpWBBhoHIyh81Rj4kpY7TVaL4qhKLPfBpqHWmJbXzNiQGDtXPpgoOt2iVAyw5/nCJzs
	ldpbiwyzx6PmtUNx175K0e60kOYNnNE54m761qt/kGvwH14i3wYamnX+L7C/CqdxDoV4
	9MJKVdMwLCiMO3zyQEsE39/LnyhmmDEKDEk+sh73oLLEu06B9skX7/W70H19PkRYJa+B
	4kMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o+JhDEJrhIga5juxQYmRnYzkVEUwXO5Hz7aGMjkwwuI=;
	b=GwZkmUb1dt1zXzXPBsh9UdtCC9vQzm4acqBqSDXdZqkrqK1dGaP69K1TG4riq/i4Qq
	fT8SauI9pp8V/aWAISwRx9SKf/nT1rk2ZKunwjWMDsdiiipq8HICAR46IBvqLygPgFf5
	XxzYvQvk5DOUQwlFLsa/srs7IGZdAQ0bFfNff5S2Opb99gD1yGEFcRDJMXz52LCrLjbX
	o0m9JNMdaJcw8RTMsOJ29QnvmR9EZAJqy1th4NwVdM3RUYo3eXkeA6dCyjt+3eZagZXT
	bX3w9zS3we8xUN0sWNnV7vPyfM455G6rmqUkCxvDdAQjxTGZqug38vkwgOknlNJFEajz
	UNxA==
X-Gm-Message-State: AElRT7GiQJ91wdpKUTfA66MaEDgAMYYF60/S1eT5JJ5uG2eQVQ9BLxIx
	YFiqvQgxPiQcLtGnLF3j+o2wlqdH68DVy5vw5BAWvA==
X-Google-Smtp-Source: AG47ELsnjecDlHzC3KnKAqcIOM5wR0H2xse33iWrpRJJNMnjb6K8EeIQ5yG8xiROw3Wzs65emi+OMwMFWplqxyN60as=
X-Received: by 10.107.37.212 with SMTP id l203mr16652682iol.20.1521568860612; 
	Tue, 20 Mar 2018 11:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Tue, 20 Mar 2018 11:00:40 -0700 (PDT)
In-Reply-To: <CAMKF1srb-oT6pXiE+1db8E9+4j=Rp+PURe5bdBUnVF3zMANnag@mail.gmail.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<CAO5Uq5RBUztJ5uLdONZ0apJzCko_oXQ6L3D-9s-59Yvip9+BiQ@mail.gmail.com>
	<CAMKF1srb-oT6pXiE+1db8E9+4j=Rp+PURe5bdBUnVF3zMANnag@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Mar 2018 18:00:40 +0000
Message-ID: <CAJTo0Lba_b2Hgd27movji5BQ5yqCrt5bqmXbwrJYuwth_oKKvA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Tue, 20 Mar 2018 18:00:59 -0000
Content-Type: multipart/alternative; boundary="001a11405f1670674e0567dbdb8a"

--001a11405f1670674e0567dbdb8a
Content-Type: text/plain; charset="UTF-8"

On 20 March 2018 at 17:36, Khem Raj <raj.khem@gmail.com> wrote:

> >> @@ -80,7 +78,7 @@ PACKAGECONFIG ??= " \
> >>      polkit \
> >>      quotacheck \
> >>      randomseed \
> >> -    resolved \
> >> +    resolve \
> >
> > I guess this was deliberate, but does it need picking up in release
> > notes? Tripped up my builds off of master - clearly a trivial fix
> > though.
>
> hmm good catch but why change ?


Bah, didn't notice this.

Chen, can you submit a patch to change this back?

Ross

--001a11405f1670674e0567dbdb8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 March 2018 at 17:36, Khem Raj <span dir=3D"ltr">&lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt;&gt; @@ -80,7 +78,7=
 @@ PACKAGECONFIG ??=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 polkit \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 quotacheck \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 randomseed \<br>
&gt;&gt; -=C2=A0 =C2=A0 resolved \<br>
&gt;&gt; +=C2=A0 =C2=A0 resolve \<br>
&gt;<br>
&gt; I guess this was deliberate, but does it need picking up in release<br=
>
&gt; notes? Tripped up my builds off of master - clearly a trivial fix<br>
&gt; though.<br>
<br>
</span>hmm good catch but why change ?</blockquote><div><br></div><div>Bah,=
 didn&#39;t notice this.</div><div><br></div><div>Chen, can you submit a pa=
tch to change this back?</div><div><br></div><div>Ross</div></div></div></d=
iv>

--001a11405f1670674e0567dbdb8a--
