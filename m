Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C514F62135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:36:31 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id m184so237673689iof.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wJ+nVWLBVBDI5sopNAx0ZDbSGb8eD3ZHsrO3ArffneQ=;
	b=GQXseuqwwA1DUlUL2id3bUoTrEs9rSwoUXYdJJLdgZp3c+y5wvuZn/XtnKShz6YtB8
	UnbxGovlQ7Ai1etzTLoRyRj+Bp0dwgFHyKzi1VaWsFaV7YUnqM43us9AMdq73+7UDTOK
	nuthucn4AvOGTqJJrvxhB9fKIM3TY29B44TP9btlJ07eoiKPuQAzC9vy33p8okba6O0k
	+ElUchcmzzA/phfEfXSZT0DL98Px0fyvnMHpTVS/shr9UWR6gbq41TI+W91XN4On47kF
	r1wIiFSXQh0687/PIzZaSYmpS3iY9Cy5+iwcXQWbgTJYw+aV9U8/lVrOBeHSDwB6VoxJ
	ZOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wJ+nVWLBVBDI5sopNAx0ZDbSGb8eD3ZHsrO3ArffneQ=;
	b=WdmU2u7bJDs+tKxZA5e396xAKIaki37Vz7fvxPtn0VGeSCQk9rbVAbpVe9xV4FjFvT
	RFY8urzXqYQtBDXc2iSDvkYIX7qqOuiSqrJleBcRgFG7TgZIBVLKtvZjiXaRJm0ShXtH
	q/JqEjLQ9y/KDE+Wb5+7QHXiir1xiJLK32MKGiZ0xehEMNgLQ0Hv9cdcv/FyXV2FLOub
	RjDoA2i54wcJ+LXjLvkcXP7GjZuWzZtm331FSqt/yKqC2/wpVhfcFAk3igV23jil2+h+
	c2CFZBfVBqsBU9GzLPzH1Zs355UMraeBemdor7e2R6jMLzwqRfYCcWU/R1C14VqIcTup
	Ue7g==
X-Gm-Message-State: AD7BkJLfLlLVWJ5+Sje9ApiVCOaeoeF1cV6daemosiX0B7LhBXOFuWuJCgxoaCwpl2+mw5vecslOxZc0KYRa/9XN
X-Received: by 10.107.16.19 with SMTP id y19mr23841278ioi.148.1457987792166;
	Mon, 14 Mar 2016 13:36:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 14 Mar 2016 13:36:12 -0700 (PDT)
In-Reply-To: <CAP9ODKr7qDA42hdJA2J3ib3xKDxRCwT2oV-t8nhsn9YNoQG6-Q@mail.gmail.com>
References: <1456761746-419-1-git-send-email-ross.burton@intel.com>
	<56E32888.2000301@gmail.com>
	<CAJTo0LZCxp20cT-Te0mDW+X59Pgrr+MUtO1ArgOJoVzfc-rEmA@mail.gmail.com>
	<56E33A51.2020807@gmail.com>
	<1457738209.2804.259.camel@linuxfoundation.org>
	<56E385E8.8060105@gmail.com>
	<CAP9ODKr7qDA42hdJA2J3ib3xKDxRCwT2oV-t8nhsn9YNoQG6-Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Mar 2016 20:36:12 +0000
Message-ID: <CAJTo0Lb3KirMOugx9SJF9JZp-vyDA92KrHbz_YW=S9OWabdOLA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro][RFC 1/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Mon, 14 Mar 2016 20:36:31 -0000
Content-Type: multipart/alternative; boundary=001a113fd1ea707699052e083c86

--001a113fd1ea707699052e083c86
Content-Type: text/plain; charset=UTF-8

On 14 March 2016 at 18:40, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> The native flavour ought to enable X11 ONLY if it is in DISTRO_FEATURES.
>

Backport of the relevant fix - not workaround - submitted.

Ross

--001a113fd1ea707699052e083c86
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2016 at 18:40, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":23i" class=3D"a3s" style=3D"overflow:hidden">The native flavour =
ought to enable X11 ONLY if it is in DISTRO_FEATURES.</div></blockquote><di=
v><br></div><div>Backport of the relevant fix - not workaround - submitted.=
</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113fd1ea707699052e083c86--
