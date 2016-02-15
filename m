Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 99EA06FF72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 14:20:53 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id g203so133776441iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 06:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Osf6sim9DqsOclmGnFS1QOd3C7r4O8CUIEoeMliQlpA=;
	b=d1wP6pWkvb4ItsCMXUH4M1xPliDY0M5U7M5RMSVJNqFnNHIi6sw4K6RR8/CGmvvVAC
	04Dbp27i+iN50HAoANMqpvtjvqTK/Y/Kv+lM0zLdvwjY0Xf7cdk8hDGPxunLHEUHcgvR
	9I3gyQtpJK9RNAFgmNuREPNUWMiMDxCkB1vRuRFEIcisCNWeAmLY0PgqA5YZpXCYx8I3
	B5OcTVLRJ1/xZlrK9vcGr2YwTiQcb3AHewbXx+eK4xd7vchq1312cOhTE8L3wKvOq0e/
	R3wKls5cEAiKt4RUR3XpJCS/jAOuosQbIx8cTVLJgQ3qRsHRgzuVfXoKvsni/PnNz0Bc
	ZShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Osf6sim9DqsOclmGnFS1QOd3C7r4O8CUIEoeMliQlpA=;
	b=PSQYYvjOGciy5QGZ9zM7mndkVkkDh6X5ra31mU9ewYo5h3p+W4Pr9mKPXMvzZ4pQgp
	gvW67WSfMu2vWDv9prMYI6fLXAM5fKnjpRHO/TGd2jgsREgD6WOUVA/00W4KqC8tpa8K
	73okxLBIwZaFyjalUVWF2LetuGJXTlkwBY6UdPa//eSEGvtGaEWYwhoj45Ib4yGqWdrU
	t+cdpkbKnYc6DMkU2xpIHjD4ff/j9BnGGjZkByxOsSKncXsRDGfEhFHYcY7UqGxQRovh
	9X7lQw3bLulNCJOqSHKIzhrioHhRtIJRxppna9VqrdMBJPPVAHjuuTkxRY8tNjipZ7Uj
	dfog==
X-Gm-Message-State: AG10YOTt1MkjYCOrpbx63n/7EQmLyUaUJ/zaLUnf19eZT/vxFQmxy69jA7PVOaSJVkM7/dSVQeQbdyQoOovZsXkN
X-Received: by 10.107.3.220 with SMTP id e89mr16492773ioi.99.1455546054027;
	Mon, 15 Feb 2016 06:20:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 15 Feb 2016 06:20:34 -0800 (PST)
In-Reply-To: <CAJTo0Lb0_2aArdo6BQ+ouGKzcsqqa+foaPHZsNDED1X3OUUcCA@mail.gmail.com>
References: <1455544180-29872-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0Lb0_2aArdo6BQ+ouGKzcsqqa+foaPHZsNDED1X3OUUcCA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 14:20:34 +0000
Message-ID: <CAJTo0LYQ+GxmUdB2+dfe5j6MfUomMrV=uxjC=0ZWSHmgkS6cbQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Ben Shelton <ben.shelton@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ruby: break out ri-docs and rdoc into separate packages
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
X-List-Received-Date: Mon, 15 Feb 2016 14:20:53 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c8141bb052bcfb9b6

--001a113f0e7c8141bb052bcfb9b6
Content-Type: text/plain; charset=UTF-8

On 15 February 2016 at 14:19, Burton, Ross <ross.burton@intel.com> wrote:

> Did you mean $libdir/ruby/*/rdoc/?  This package doesn't get created.
>

Also if you're splitting out rdoc, surely $bindir/rdoc would be a good
thing to move too?

Ross

--001a113f0e7c8141bb052bcfb9b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 February 2016 at 14:19, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_ext=
ra">Did you mean $libdir/<span class=3D"il">ruby</span>/*/rdoc/?=C2=A0 This=
 package doesn&#39;t get created.</div></blockquote><div><br></div><div>Als=
o if you&#39;re splitting out rdoc, surely $bindir/rdoc would be a good thi=
ng to move too?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113f0e7c8141bb052bcfb9b6--
