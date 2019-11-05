Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 62E727FA16
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 15:30:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l24so11615920qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oV9F0dQ6ynB9bVJsGEbKDqBBIqi1cRX9miK5v1cpJA4=;
	b=MaXE4PD8m9kxcFVisDA96/LuiNUYq8k1UX19yGvuBMh+gncL8dSrilB/Z0A/yh+SKR
	QzuKqs9WeGFXJvpEYzCGcqhWUOJyTnv0hNbaGXAeoDwfyJi/ca0O4kDygT7jPy9/z7LG
	omQYsHkABU+c+INGg5OjR67TkryFSKLx6ao7GfQRJ2aTbBGO4zGr184QBjLfTTaYWbGa
	r1wYrcwert32PcBNuLh2Eqtk26JlIWjpQLp3boD1osTBWNo3veVJEtF70a6CJYTpppU4
	8/LXllvApz0D9LNT9203iGfV57SAVvzv3bxmpmygx/hWEozhTzyXlPyPppFWVCHZGFEf
	ULFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oV9F0dQ6ynB9bVJsGEbKDqBBIqi1cRX9miK5v1cpJA4=;
	b=UFsY+wN622379s+mu6MEY5KJaKfGv0I2rRMlgJm++6u3gGw8MahaIrva/njU3tOwTA
	fo8LCAG7Z7WTkrCUMzK2J1GGLRPvQWwQF6UVmob2qPaZm5au6iWmETfH893BBZjlpj9o
	6zRK2l3r9jNI2K75KEs/pD6+AFi+rCaNam1qxvY4s2nd6PmjQIZFR8PQ8wG8PQ3AuoRf
	zhQ4u5yuSR8cvodB5T87quLV7Z/ud95exlvUbgCACgEcNzRYY469YUJhsngMeKXi93DT
	L6vryzyN1cdyhaIPCwroD17CL/ELI9G8alzL0mq1KceyqS9pa24HPdfQ6+/Vv8lVdcXF
	Hoaw==
X-Gm-Message-State: APjAAAVDampCTGddNuMLlsBZwmNcdJ3uMzf+wta8hBeiTilleSEiahhJ
	BVVTByU2XdPG8bSkz6uC0QlxK9pUxXRIkmJLdSk=
X-Google-Smtp-Source: APXvYqzNH8WGWaI/Ac7NPe3uUpg2l7wma+gpo2v8VmS8EJ0mTgiF/Wy6h1ZOLaNCk0noO/o7Ev7OGmzpJdmAOfEKvqc=
X-Received: by 2002:ac8:2ddc:: with SMTP id q28mr18074918qta.88.1572967825845; 
	Tue, 05 Nov 2019 07:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20191031172303.31664-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sraV5pEF9UanBy3Rj7mQKs33Ke2Sr_+28ewDrgaJZ43TQ@mail.gmail.com>
	<eeb0831a-bca5-55c8-2ee1-6586684d774b@intel.com>
In-Reply-To: <eeb0831a-bca5-55c8-2ee1-6586684d774b@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 07:30:14 -0800
Message-ID: <CAMKF1sr7xPY4gctD88cP3U3-_h9RTa8eUQ6Vs2en-yeYEEc0=g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] ell: update to 0.26
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
X-List-Received-Date: Tue, 05 Nov 2019 15:30:25 -0000
Content-Type: multipart/alternative; boundary="00000000000080b43605969b1c8f"

--00000000000080b43605969b1c8f
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 2:39 AM Ross Burton <ross.burton@intel.com> wrote:

> On 04/11/2019 23:25, Khem Raj wrote:
> > This has API changes that will break iwd
>
> What version of iwd will break?  There's a 0.23 upgrade in flight and a
> 1.0 upgrade incoming right?


1.0 is fine with this version all prior versions will break


>
> Ross
>

--00000000000080b43605969b1c8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 5, 2019 at 2:39 AM Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 04/11/2019 23:25, Khem Raj wrote:<br>
&gt; This has API changes that will break iwd<br>
<br>
What version of iwd will break?=C2=A0 There&#39;s a 0.23 upgrade in flight =
and a <br>
1.0 upgrade incoming right?</blockquote><div dir=3D"auto"><br></div><div di=
r=3D"auto">1.0 is fine with this version all prior versions will break</div=
><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Ross<br>
</blockquote></div></div>

--00000000000080b43605969b1c8f--
