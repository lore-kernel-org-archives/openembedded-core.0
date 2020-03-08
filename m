Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD8326063F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2020 08:18:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n7so7212814wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Mar 2020 00:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=NtwdoryS4Trw2XetIGgLlELqRCOeOMOuoPecxMeJlX0=;
	b=atTQZ6VVgQYt/c0o2EdlvtwPCWvCvpL7g0BmGg/pDM6K1dEz3VpkiMU+dT2rwvDSIN
	LEgew52UMGdhmA9+YGgFw0NlUbTk11sBgvrSRTrOPuSWzc8ZQppXobYWISeMNXc5Y4Jl
	ON6AwSAz2ttKoI6sFkcAiDASryIKt2xFuHTGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NtwdoryS4Trw2XetIGgLlELqRCOeOMOuoPecxMeJlX0=;
	b=VoHd1lg0xsM0at8Uf1RY7WFl5GHZfYW/fhAYH5eLa2J9CmeG4spoQX8Epesk2Jxsg8
	3LBhxZU76gUjJOVEnCokfjrZA1uEuW86UholI9tgc29uBFmSZouzApuxxDMpOj5kZX4g
	/hWjzdtRWgyiCxfhZqPzvx87dJ6rQLtbiEotUiO5xty89ez304RQTIgTuedx4GZRCR7d
	bibMlCF97TaeEUgWyV46rsozC0pQ8mP7ZqVr63+nwFVS2Tgz8ogPcXlVcjK2NslokYYv
	ag9pGfaoIDYhHs7zoCxXzpMnRQYD2tnX00y247367ERJrn52cNNU7xEqDRxpAGiKh84S
	isow==
X-Gm-Message-State: ANhLgQ0LdZ1/k6i+u77bYuJfWR8rsTfubB3QQwAxRhlPj0Whem0iloo/
	MKWvxTaKsx6eSq1nc9i+uRJHNg==
X-Google-Smtp-Source: ADFU+vv4Z3LwQ/lTyJwrYwiZYucxwg67kd9OuSuO/hJiL+WZz8JlMfs2AzEbr/ihfpCxFklMKJBbSQ==
X-Received: by 2002:a05:6000:1ca:: with SMTP id
	t10mr13643643wrx.75.1583655502508; 
	Sun, 08 Mar 2020 00:18:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i10sm50422177wrn.53.2020.03.08.00.18.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 00:18:21 -0800 (PST)
Message-ID: <c1b7a7ed56b4a8963fecf1c016b6ebb7d0781c76.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 08 Mar 2020 08:18:20 +0000
In-Reply-To: <CAMKF1spC7POwDTKYGVuAZdZDfYDfeGMz6qRsq4hB3hY-F1aN6Q@mail.gmail.com>
References: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
	<CAMKF1spC7POwDTKYGVuAZdZDfYDfeGMz6qRsq4hB3hY-F1aN6Q@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glibc: Explicitly disable msgfmt
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
X-List-Received-Date: Sun, 08 Mar 2020 08:18:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-07 at 20:17 -0800, Khem Raj wrote:
> On Sat, Mar 7, 2020 at 2:37 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > If configure is rerun it finds msgfmt from gettext-native which is
> > installed
> > during package_write_ipk|deb and means builds are not determinisic.
> > 
> > Whether msgfmt is needed is debatable (libc.mo files arne't
> > generated without
> > it) however we should at least be consistent which this patch
> > ensures.
> > 
> 
> I think we could turn it into a packageconfig and add depending on
> gettext-native in knob,  keep the knob disabled by default. While
> dont think translation files will be commonly installed on systems OE
> targets but its seems limiting if we simply disable it.

Keep in mind that currently in any build from scratch it is disabled.
This patch doesn't regress anything, it just ensures builds are
reproducible.

I agree if anyone wants it, we can add a PACKAGECONFIG.

Cheers,

Richard


