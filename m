Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 08BAE7F939
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:34:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so48864884wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 01:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=TBTNVvOL/QAHpF++GovfY6FmHjgIj9568n7yvrSNiPM=;
	b=d/58tS3sv34Rk+ZbMksPM2LtcPzMHcdDl1iuiRc3xDenXfI/btJst/uJmj4RpeUSPx
	o/RRdXzDtVY2kXNXDojz0u0MfKsQCc/1aowZWkUkagPuMY7uTRLQh+aJGmCKvXiBQ6Ny
	EFAqX1pi6ODPLBbChIXzjlInPZYPEy7h/rS40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TBTNVvOL/QAHpF++GovfY6FmHjgIj9568n7yvrSNiPM=;
	b=ujtd9z4c8gBCoIoAD5VwREcVCu+cug4fvr5+i65ykyN136sag/ieEeGYlTl2F2bZv1
	0dMo1UJ8CXrzef9M0kdJBcthK4FxFdPHzOo3a1pVa5aiAj7lo1phJ6ABoV+Anx56m53k
	eCAFvtwGoEdfj2fWa0XPpEekefpZRg1vqC9GuKWAjy42ERANKwbe6QISL10fErkR5mDw
	F1M6tp6Vrd5fZOH/yezl5MTG1O/bwYkSTKnFj8pZCI7JqAJg6Zlpbzps2Qmoiz8Mtn7q
	gYomTv1e/ek2cZ+Wrs7Amzdf8slsSq5jWndBMZmpAg2WGbAKc6qF3xdlXrY/KKRapxza
	fHvA==
X-Gm-Message-State: APjAAAU751D3XMV45j+ujNaUJslVhicVijUiCzDHQfR1Z4PV9cpuf9Yn
	AsVKiDsKU502zmJRp5ePk69deg==
X-Google-Smtp-Source: APXvYqwMod42X4uyvvH0L6bkcs95WF4K/uCS4QW4GqgO9O78uLS3gl3Eu+w7QAoU4JRYEw4iUTwH2Q==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr96018444wrt.136.1578303255777;
	Mon, 06 Jan 2020 01:34:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y20sm21917182wmi.25.2020.01.06.01.34.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 01:34:14 -0800 (PST)
Message-ID: <670633f2ce674dbc50222743d42ff7735e5d0e3c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Jan 2020 09:34:13 +0000
In-Reply-To: <893cf00cc129d1f61f1b535b74874496e76cd7e1.1578299099.git.liezhi.yang@windriver.com>
References: <cover.1578299099.git.liezhi.yang@windriver.com>
	<893cf00cc129d1f61f1b535b74874496e76cd7e1.1578299099.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] gnupg: Read GNUPG_BINDIR from environment variables for nativesdk
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
X-List-Received-Date: Mon, 06 Jan 2020 09:34:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-06 at 16:26 +0800, Robert Yang wrote:
> There is already a relocate.patch for native which is used for
> reading
> GNUPG_BINDIR from environment variables, now also enable it for
> nativesdk.
> Otherwise, command like the following one doesn't work for nativesdk:

This is a misleading commit message as its also enabled on target in
this patch. Do we need/want this enabled on target?

Cheers,

Richard



