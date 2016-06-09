Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id C1F6A6612C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 16:36:51 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id i6so2670113ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nf2mA7/Da5idcen5RzOpq20fx0Vc4TwLkDKk4t/4bCo=;
	b=OtAQqgJNriWwrpuU0jR7J9DKJDYGODTlDjROevZKgkxHhWIhEDtfKzs/t3ONGx+ai3
	Dteg+9X0BJp9fke8JOlLeeHzCJgRLoCrXMXgIZzEdIwFGIjaky9tnB5mSUrv4ugwgrz3
	VegT69Y6bLaL8An64hoiTsFgG9mxgcDsoIw7aVsGOko+mRaf8MQou6wQYVUcdcz0ArG6
	63rdXE1butYaGsPsYEkn9rRW9sZTC6GopMCurRk3vBc+uez3GaxOzDxtEFXobpDZONXN
	rDdEK6bvdW5W/43m1T5PD/3w8JQZRxHd/f0CSRx4sqy2njzYELKehJgZD4sh/WG8ucaC
	s3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nf2mA7/Da5idcen5RzOpq20fx0Vc4TwLkDKk4t/4bCo=;
	b=cedmgat+O44jkcXy7iRaHzCS3uFQ/v3vXyJwP67UUPNxcDJI/bho9TBnauMQ11i/u/
	0hZwaa4/dMxh0nvocP0Y0E/3OUa30lZdhyRXKCGq1WIFMayLz5zFEzBowXJer6BG5Zdr
	utJmxd/V6Jj4V4vVFV0pEb/2qBV3OK8GcuDDvOKEHYNgrIizBWby84MK+sxH3HKvvBzp
	7v4bdhsK0mlpacDOAK+uZNbi8v/8g1n+FCvOWn5FSRhi3Gz9+4Fdra0xY4nPxWrqjefJ
	PCvx5ZhNOD16UAp520EOj/7uHnPtuYX8Q5FAEbno4z8HoqQX6Bg1mO8YF1E9nsVtZy7p
	hRwQ==
X-Gm-Message-State: ALyK8tImxYSoPL4rDiD0nDyqaXoXx8ZtLn1z5PzdGDo3JEzRqGjLvNfC6gYKIby6axtKWKwurMh9A4QEHCgCWbbu
X-Received: by 10.36.120.193 with SMTP id p184mr23945017itc.22.1465490211790; 
	Thu, 09 Jun 2016 09:36:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 9 Jun 2016 09:36:32 -0700 (PDT)
In-Reply-To: <CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jun 2016 17:36:32 +0100
Message-ID: <CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
To: Petr Nechaev <petr.nechaev@cogentembedded.com>
Cc: Konstantin Ripak <konstantin.ripak@cogentembedded.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 16:36:51 -0000
Content-Type: multipart/alternative; boundary=001a114aa4287ef6550534db07bc

--001a114aa4287ef6550534db07bc
Content-Type: text/plain; charset=UTF-8

On 9 June 2016 at 16:59, Petr Nechaev <petr.nechaev@cogentembedded.com>
wrote:

> We do use Vala for internal gstreamer-related projects so I would
> volunteer to support it in oe-core.
>

Would you volunteer to maintain it in a separate layer if possible?  If
nothing in core uses it and it can be maintained out of core then I think
it should be moved out.  Currently, vala support is in oe-core but nothing
in oe-core uses it... so the autobuilder can't tell if it works.

Ross

--001a114aa4287ef6550534db07bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2016 at 16:59, Petr Nechaev <span dir=3D"ltr">&lt;<a href=3D"mail=
to:petr.nechaev@cogentembedded.com" target=3D"_blank">petr.nechaev@cogentem=
bedded.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1j0" class=3D"a3s aXjCH m15535e4b18bbd338">We do use Vala for internal=
 gstreamer-related projects so I would<br>
volunteer to support it in oe-core.<br></div></blockquote></div><br>Would y=
ou volunteer to maintain it in a separate layer if possible?=C2=A0 If nothi=
ng in core uses it and it can be maintained out of core then I think it sho=
uld be moved out.=C2=A0 Currently, vala support is in oe-core but nothing i=
n oe-core uses it... so the autobuilder can&#39;t tell if it works.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a114aa4287ef6550534db07bc--
