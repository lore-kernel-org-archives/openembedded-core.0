Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8D7AF7D840
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:00:54 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id x7so2030255ioh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Ln/dgjF+6t61xBlLSe/+K4oZkPKvujNpt3MGxXzCmbs=;
	b=2J6/TfS5z+QeBW0PvgGPdoBNqt6ZGAYDqqLIwmFGFwbUX7OzqQnm0D/Sop1PASiLXU
	4Wv6fzWQJeNqB9q8UGyPmipQK69x+td+5/a5kQ4jl16LuS0w1MTttYwQFGFIqEi8eyR+
	XKrirIslFUaUbDzll9veeGSdv+t5e7weEZsyUjhocfVzwd+cS8yOK/gxKJKmStTjr95Q
	aBE8ImqAKYmQtIcUpG/09yXTk3oBRiacIa4Iwgg8mjVT3L/+17Vbh2TpzoY+rEYBWBy0
	GWWaAYW55e6Qd4lQ+xZyf32EKt2CisZt24abfH+ZcOjnb4qq76Eu1zMcn4gL5Z6g9rQr
	V1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Ln/dgjF+6t61xBlLSe/+K4oZkPKvujNpt3MGxXzCmbs=;
	b=fBEleuznWWyoWptcu3iNDw1FbZTZ2yxo86xTDSX3nlawhY+Z84pfDaKxWdWoN6WfL6
	QdkQFCCAJsgYl35NPUwWgPp3NipvUMtcdB87eSCFgt71994HQPpOXMujnaUBhwZWHKGX
	V+ySH8xIbaJglb1Kf/R4RbSRyUWgr0qCKcHKb8O4MXSg6ElFm+u+kEfh6XU1IMzgeENm
	YJ3MCVs0Io2nG0mhw8WVPVhZ/U8OH3ixZAVmwuc4N6c7C9o2eioILsuKO0lXMJW/rVkf
	l6lNeV4i73BOAozQczvGSEcrqzfc6vK5cLd+7J5bEE+Ce6bv9VwFQKRx8X6YXn02CLhX
	d8UQ==
X-Gm-Message-State: APjAAAUMMGC0aFc6Jt5ycv87MpfKXgY+hhNnxZylz7FtcHVVcy1d5pTB
	zvzrOrubwWKWieGRjvzPtbRhM5yBpUl/n+DcThqN6A==
X-Google-Smtp-Source: APXvYqxZECiMaqWjdwdUViPW5oKlybc45ssarRrMv8FZqIYtCz92/uMPru/DVAezvS6R7bRrUnRazjC76GUn/qtGeWo=
X-Received: by 2002:a5d:8d88:: with SMTP id b8mr18754384ioj.58.1554901255616; 
	Wed, 10 Apr 2019 06:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRT1ng9=Gfd8m9g=L4BnyvsF6qE_rL79DxdDNZ8yKaEtDA@mail.gmail.com>
	<CAJTo0LaSMUzctZU-hXvA4DpuqubBY3GNPGrFJM6Etd-96NxZ5A@mail.gmail.com>
	<CALbNGRSeHpT2xFrJkPUEey-BbXZnBnNZC96cZ_9joUN2UWeTkA@mail.gmail.com>
In-Reply-To: <CALbNGRSeHpT2xFrJkPUEey-BbXZnBnNZC96cZ_9joUN2UWeTkA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2019 14:00:43 +0100
Message-ID: <CAJTo0Lbe62V5M4gtyDexboyraoX1RLAt-Q2AQvYzw1Di=1_NqA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build broken with current master
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
X-List-Received-Date: Wed, 10 Apr 2019 13:00:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Apr 2019 at 22:41, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:
> > The recipe that depends on docbook-xml-dtd4-native also needs to
> > depend on libxml2-native.
>
> Do I have to go through recipes failing - or is there a chance for a
> common solution?

Very few recipes should be depending directly on docbook-xml and
docbook-xsl, and they'll need the depends added.

A common solution would be great but would mean adding new dependency
support into the staging code.

Ross

