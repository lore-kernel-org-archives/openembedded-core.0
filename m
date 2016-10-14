Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4C271B54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 19:39:28 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id i202so131305566ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kjUMb790wqFTyE6TfS05aK7xNStTOZLjKYZIW9Kd8HE=;
	b=t4Sukmdvmfbi9eM9dwWQUQWG9Pu8YWmham0oLaF+Dx49EFQopWL4TS0OeU9DNo7NRx
	lk0L8GJ2VHac2z2KsLMFFVV01B+3Nrx7GLQvs8TEWsFBYWfpDpRCJuUWXLdeJyuUOLMb
	OifyZ9JukebjoDSy0i/GT7J1Tz0v07l/Iw8G6DAjEX91itHeWg/wAYz6g0uGz0g1/oC4
	muLKCD0dGw5ttTjjOHm5EfBo7PQ8h1XkwDhFamOYAsiq2h931kFALZ4tov5HDB0ehzC1
	gsGjepwpvrwLGUsL52ghsUUpf00y7rld2TP73a7cL1drr08VT/zyBNKZC8vxC6/kMRn4
	Ba8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kjUMb790wqFTyE6TfS05aK7xNStTOZLjKYZIW9Kd8HE=;
	b=MVffHixRFeD/ZDe+IcS7Ma/gABZ7jhpz6BlVSvKS4UElhnIl2ZVUdRSI3/mRb0k8o5
	ScFlI/o/2HUssxjVav19/KE0phTf3KSsUJ1/RaPEXqAl9mxRznqR1dQnlnkQ/aWsd9wR
	+7pB5io4hnDyjMRWD7WRV8qto6PDqxnEDUrj/utDi3M5piYT4j+vb5viO7tkrLn7RgMr
	M/BmDForduCPjimI0ca2nyEQiwOju2bhiPLTkKyFPnao48cHp4+8odAi+KIJJkTOO1Io
	b4r0uSra/e8+7JOg6VaI40UXLS5JPHkiWaG2TCitxwPxptpLVoSnslCJCC1ylWi1F+h6
	3rog==
X-Gm-Message-State: AA6/9RnXhbq6Fb1cc0qjwZPM1JIDDiRNb/I/W/l7ekurzS9br87BP3C+DTDPirWmIvirUFd6BjAHA5vBG5rMAjoJ
X-Received: by 10.107.17.32 with SMTP id z32mr13200842ioi.1.1476473969538;
	Fri, 14 Oct 2016 12:39:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Fri, 14 Oct 2016 12:39:09 -0700 (PDT)
In-Reply-To: <20161014183840.18056-1-jussi.kukkonen@intel.com>
References: <20161014183840.18056-1-jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Oct 2016 20:39:09 +0100
Message-ID: <CAJTo0LYK_+7dB4jUAq2PRuSZ=0Qqvw39xTOWPsiTU4k2a09inw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: Make tests non-executable
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
X-List-Received-Date: Fri, 14 Oct 2016 19:39:28 -0000
Content-Type: multipart/alternative; boundary=001a113f2676799004053ed8622d

--001a113f2676799004053ed8622d
Content-Type: text/plain; charset=UTF-8

On 14 October 2016 at 19:38, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> Let me know if do_configure_prepend() is not an appropriate place for
> a hack like this.
>

Anywhere is reasonable I guess, do_configure_prepend or do_install_append
will work just as well.

Ross

--001a113f2676799004053ed8622d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2016 at 19:38, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2a=
s" class=3D"a3s aXjCH m157c48b649c9e267">Let me know if do_configure_prepen=
d() is not an appropriate place for<br>
a hack like this.<br></div></blockquote></div><br>Anywhere is reasonable I =
guess, do_configure_prepend or do_install_append will work just as well.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a113f2676799004053ed8622d--
