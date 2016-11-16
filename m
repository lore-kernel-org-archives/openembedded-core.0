Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 022B36B6F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:29:53 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id w33so95262215qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 02:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=03gMzeSoXL0U9hrCpfB9GcSTaqihJoG9yqdJ6pyoZOA=;
	b=kfkPQsWdEhW33CL6L+1+drnluuF/qbxfZc5f+xraDPsUl2KiHrBW4CQUe8/Ha4uou7
	A8uW/ibu/Kgrr57/ZHbb+3cq/8GpjIEgOCgiDenZXuVTv11PJ6EQBWzOqZJX4Y3MP6TF
	8lHHwgusHcm0ou3zoKMJQGzS9zjKWlgKbmJik1abanPu9mZE54TfeeR+4SHc9A76vfYy
	rbqLkRKMrejat0xn6onPVLCvNNrqWwjsEI0Ua5md8Nn1/+xTqSn2LdJMQ9hrZFNp1ASB
	PSt+xtYEu6BJwflmun0vMmSY/SzOyhIg0biWZ89bHI3iOKYmbC2fzsFE6GO4MOUvMKaY
	mZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=03gMzeSoXL0U9hrCpfB9GcSTaqihJoG9yqdJ6pyoZOA=;
	b=WSyh8ZzziBQoIPDLScVtAj6CV8fcjF/3/aDsWN/3j4wJPYJly07nKcgMG2g2YX/ABy
	XQmh/C7yYxlywEsAIZJ0u3FdXobk+5gRwrpQIqQ7Nkoy+8dGl2Wqx10ALmB8D4F+geUh
	FMB6lxxzZa2syKpa/b2SOyl/F/pax1JqS8xQ7DBEK9+RAxPZaW2FPuxKd3KlacwbWsX2
	gfHf6EN0AuDnj0YjJChjQTkBsXewOndWKhdtJ4pVB80QQecVj9UdEoG+Nkhij4g6mT2B
	0beMKRRY7YHHjjH/z6BmPdTzgk9PDdDVkUPf0TK6SgCh1iIN1wp7csJUVsig+riOBSwe
	8JXA==
X-Gm-Message-State: AKaTC01QifjWbC3HoO1LduNOZ+mp26tZnls4ecFOSqFOLWGjxl3JGrGg9YYtDtRWdx5TfHxMVD2z2eZ7Gcvzzj99
X-Received: by 10.237.44.161 with SMTP id g30mr1195493qtd.144.1479292194997;
	Wed, 16 Nov 2016 02:29:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 16 Nov 2016 02:29:34 -0800 (PST)
In-Reply-To: <3c0307d1-0781-1d32-9a86-e5ff6fb44a2d@cisco.com>
References: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
	<2f612347-5351-fc20-956e-1cf84a5189ff@cisco.com>
	<3c0307d1-0781-1d32-9a86-e5ff6fb44a2d@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Nov 2016 10:29:34 +0000
Message-ID: <CAJTo0LaxnvCantysmr=36KNyKFtOYPmCoEyt+ci6901g1CnN=g@mail.gmail.com>
To: Andrii Bordunov <aborduno@cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: allow using EXCLUDE_FROM_SHLIBS for subpackages
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
X-List-Received-Date: Wed, 16 Nov 2016 10:29:54 -0000
Content-Type: multipart/alternative; boundary=94eb2c125848cd50090541688d81

--94eb2c125848cd50090541688d81
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 15:05, Andrii Bordunov <aborduno@cisco.com> wrote:

> Ping-2. Guys? Anything?
>

Sorry, missed this.  It looks reasonable and doesn't introduce any changes
to existing packaging, so it's in my queue now.

Ross

--94eb2c125848cd50090541688d81
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 15:05, Andrii Bordunov <span dir=3D"ltr">&lt;<a href=
=3D"mailto:aborduno@cisco.com" target=3D"_blank">aborduno@cisco.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3f6" class=3D"=
a3s aXjCH m1586890822338577">Ping-2. Guys? Anything?<br></div></blockquote>=
</div><br>Sorry, missed this.=C2=A0 It looks reasonable and doesn&#39;t int=
roduce any changes to existing packaging, so it&#39;s in my queue now.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--94eb2c125848cd50090541688d81--
