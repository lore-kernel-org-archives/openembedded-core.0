Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8A28F619B9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 14:38:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p9so3488914wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kQAHuM9DnvLZwsj+2EPWt1tbrPI7JuOdrWEagEUu5MA=;
	b=AuEnj2Wl+Dl/w8lvBnCc9ryO85uaWLl0pGwp/61GRvIH2NoIQp0S42v70YwzqzkCQH
	FK32t2kViZ4gFLJlW8VTZ6e/TVrAt9/osE0TPPOWNON6GhuXiIUcp5hFlvyu3OR+79cb
	W9fCKl1aDxauvN17kwwR7YsCKvjBDeWGblOgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kQAHuM9DnvLZwsj+2EPWt1tbrPI7JuOdrWEagEUu5MA=;
	b=T7QNJxLM7eZjWrAW7QC3z+X4A30vHAebYgIgywmgclnqGETGEam8l8bN2/8Q2L+PX6
	w+2OxX11KvTmVhBg17zJvtIXkxxVXpnepXKZWeVS627KOZuwxJ86FIDfRJtyM8a1iirL
	6l42b/hedFgXG1pDailTvDlLROtkhOWLhhok4GJRWE+BroT6rcYLcX3aVnQYHdH46VF+
	nL3wlSUPyy3fR5EuvvpISa2yqQDzwiJBFeb7fRTCo9kNnY46qY/dv4aYdK7TZF9m8ta8
	z/ZxnF/IoaaEk9WWp2dL6JQDB/DEDaBBe5J1xCSTjAB1qJf0wVqG7/GCSP4Bmf0pDspu
	uGwA==
X-Gm-Message-State: ANhLgQ1Uq9qjoADzDpt/02PhtAGS8GbGicRE/561iqI3YMQLZdZGAR/e
	REtQBgEAed46LoJrM47oYrI5cw==
X-Google-Smtp-Source: ADFU+vvD02IXzGdH/PTReDNF6rEv2bMMpFiSQO3nNpg8Htec8eU0AewsNvFQX7x+vZaSAcZkNMiZmg==
X-Received: by 2002:a1c:2d88:: with SMTP id t130mr4951944wmt.68.1583246310998; 
	Tue, 03 Mar 2020 06:38:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j205sm4767358wma.42.2020.03.03.06.38.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 06:38:30 -0800 (PST)
Message-ID: <c2e7a031d09edec6cb85fedf49b9afc3f55ac821.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
Date: Tue, 03 Mar 2020 14:38:29 +0000
In-Reply-To: <CANx9H-Ci4Rsw3WDkYdwzw1AYeZMhiHrZWkiTkHp7WG1j5hhFUQ@mail.gmail.com>
References: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
	<52350a7bd080413c9dbc6e1783f14e2c@XBOX03.axis.com>
	<CANx9H-Ci4Rsw3WDkYdwzw1AYeZMhiHrZWkiTkHp7WG1j5hhFUQ@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to cleanly centralize a zillion BBCLASSEXTEND += "nativesdk" settings?
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
X-List-Received-Date: Tue, 03 Mar 2020 14:38:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-03 at 06:25 -0800, Tim Orling wrote:
> 
> 
> On Tue, Mar 3, 2020 at 4:32 AM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-core-
> > > bounces@lists.openembedded.org> On Behalf Of 
> > rpjday@crashcourse.ca
> > > Sent: den 2 mars 2020 13:41
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] how to cleanly centralize a zillion
> > BBCLASSEXTEND +=
> > > "nativesdk" settings?
> > > 
> > > layer i'm currently perusing has many, many bbappend files, of
> > which
> > > quite a number are nothing more than the single line:
> > > 
> > >    BBCLASSEXTEND += "nativesdk"
> > > 
> > > literally, at least a hundred append files are like that. so
> > rather
> > > than clutter up the layer with all those trivial .bbappend files,
> > > can one cram all that into a single .conf file? as i read it, can
> > i
> > > do something like:
> > > 
> > >    BBCLASSEXTEND_append_pn-pkg1 = " nativesdk"
> > >    BBCLASSEXTEND_append_pn-pkg2 = " nativesdk"
> > >    ... and on and on ...
> > > 
> > > and toss all that into a distro.conf file or something?
> > > 
> > >    and even if that works, is it considered good coding style?
> > > 
> > > rday
> > 
> > Sounds perfectly fine. We do something similar, but in our case we
> > need 
> > to add "native" to BBCLASSEXTEND for a whole bunch of recipes.
> > 
> 
> Should patches be sent to add native and nativesdk? Drop the
> technical debt by upstreaming...

I'm torn on this since adding these does have performance impact. We've
talked about adding them as defaults but it does increase parsing time
and so on...

Cheers,

Richard


