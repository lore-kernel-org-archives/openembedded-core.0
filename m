Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3776D6FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 17:37:17 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id n204so294831058qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 09:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OWAjbB4TecQkg7G1vA/4X9QLVzPKcmAmyD1nYMWm+KE=;
	b=vPJQLQROzoYg+nvZeOiX1HQNpaD8QrjTcEdudD/94V4isWGRoRp5ipmSjzayy2utnR
	qbcMtBnuvfAvzZ2vgMmqRt3igCRGV0+XztAzx4SDMPIAKL5l/32OofVXQ8ubncTDVT7D
	1So+szEUJfOIlfefAVRP+3bcgSHhEAKXs6VMeqHQTwiY0DNCJXBk3lmZxaOrKUGS+mIy
	90fmVtRyYB9I0oUC/bWeuKGzLvBi20Iep7+xBJBJV7oKiILTQBUYh1xa4aofexyYwZhU
	93WcrtP7SMQEAjLWsz6bH3LasYgNUMXfdAdjuNiYCTf0wwgWfyEYB69FaercwHXn7m5W
	B0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OWAjbB4TecQkg7G1vA/4X9QLVzPKcmAmyD1nYMWm+KE=;
	b=LpZbcqrs8ffLrnGeJMjWn9d5EkuA9A1nrz2uSIS/1WA8I+/rsKmkSPB69RNnlm+lIQ
	jTDmY32idrhkLE0D2kUcpi8ehEU70JPcWDaIgW3LzDSd2xukI0sBFx7ox6SiYtT7ega4
	gHGi23VTyXNHDs7DF6U9NOLh4UfUw+enepY3kPi6+ZanooZ8pGJrUqpLUoVGYBYVC8sp
	jtmODUmR0LlNCs2JUcyh4HMjD6Ex6+wsfFIhagZ44utWWiMeJ1DmqBGm/DlRb9mLJ4fu
	Akn1kxpgZUKCAmJAtWhxiEvzcN2eq0GuBfy0nPCc0ekf1P6XhHi+DxqRBoBtiSMgm0vp
	ScLg==
X-Gm-Message-State: ABUngveaZuQ6uB6ie/KNQLqMbT/Iht0TTDQQM22Ssl1zsZdRvTYk5y38poR5p33wOXWWxRdao1OggkThJBGSgX65
X-Received: by 10.55.207.78 with SMTP id e75mr8049603qkj.36.1478799438654;
	Thu, 10 Nov 2016 09:37:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 10 Nov 2016 09:36:58 -0800 (PST)
In-Reply-To: <CAP9ODKoQNOgTWgsW=ZTDvU5hBgjCGaF_=YWcA+rjhxoy5wVXfg@mail.gmail.com>
References: <20161110121414.12937-1-otavio@ossystems.com.br>
	<CAJTo0LbQYQwY07evm3Re4x2_Bu-6AmcCW3_=GuAWGOJxGxFQ9A@mail.gmail.com>
	<CAP9ODKoQNOgTWgsW=ZTDvU5hBgjCGaF_=YWcA+rjhxoy5wVXfg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Nov 2016 17:36:58 +0000
Message-ID: <CAJTo0LY8HD_rLf-NbFnjvnTfjVfjMKnTTRt45JoCCC7=4h-ooQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-native: Extend RPROVIDES list
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
X-List-Received-Date: Thu, 10 Nov 2016 17:37:18 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b83c41090540f5d338

--001a1145b7b83c41090540f5d338
Content-Type: text/plain; charset=UTF-8

On 10 November 2016 at 17:29, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> I am fine in doing so but this fix is important for us and it is
> trivial enough to allow backport for krogoth and morty.
>

Absolutely.  I've marked this to merge, and will file a bug for extending
the manifest tool.

Ross

--001a1145b7b83c41090540f5d338
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2016 at 17:29, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":5bv" class=3D"a3s aXjCH m1584f4a246222c04">I am fine in doing=
 so but this fix is important for us and it is<br>
trivial enough to allow backport for krogoth and morty.<br></div></blockquo=
te><div><br></div><div>Absolutely.=C2=A0 I&#39;ve marked this to merge, and=
 will file a bug for extending the manifest tool.</div><div><br></div><div>=
Ross=C2=A0</div></div><br></div></div>

--001a1145b7b83c41090540f5d338--
