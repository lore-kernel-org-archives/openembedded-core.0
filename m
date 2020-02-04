Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 46C2261155
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 10:12:22 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id c84so2799898wme.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 02:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=F+ihX/3qzvmMSIUu/zh3fHBeiT+iQea7RMfhtx5jets=;
	b=FJjtwJIOGfzV5UT2k0SFAeKA1gv9HiSeb15KuCAJMpljYXV/x4n6QMXBqvj1ZXyx1u
	hdStJz1S5ZbeGFs6NCsH0W9LAKsHXQYpyg1uyzPDDNLZNyaAPYPjIX1st8VLNvCXPvah
	9pO6tg/MQQLd3WM3FSwuEakcJAyQJGJMadytgGRU9zCmakB25TJJ4dCNtjBajhJjNAjY
	ixxuDY08WhKw2KiZJlZxf/W9dRCgAWMRynmKCDkX0rp89EzdZ0aw1e4Gt5oCtGmlN7v9
	ahLTqWq0y/VyZ802D61tsZorCyXSWUZca3ckbwAiS9T2/9/IKkbMTBURy3heIzrkpfOE
	w1Eg==
X-Gm-Message-State: APjAAAUlviqV12Ca+Na6lWdf0PMtzPmLXdY99uq/31miLkLhky1Uin44
	lyw3U9rlY0KzQJvFh8/Brav6XjFe
X-Google-Smtp-Source: APXvYqwwnNQ7D55P3U90jmyNzNrTmznE14reIBS0f7pJpK5QXwJ7sw3V3OpSWS8/Tos3DcU4hDVAYg==
X-Received: by 2002:a05:600c:218a:: with SMTP id
	e10mr4881581wme.6.1580811142820; 
	Tue, 04 Feb 2020 02:12:22 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c74sm3185131wmd.26.2020.02.04.02.12.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 02:12:22 -0800 (PST)
Message-ID: <7ac1f42722323cd35a7e0a875944350c6c65cfd9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 04 Feb 2020 10:12:21 +0000
In-Reply-To: <edb7d26f5a7a2edfdde15409818bed954ec27dfd.camel@andred.net>
References: <edb7d26f5a7a2edfdde15409818bed954ec27dfd.camel@andred.net>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: nondeterministic -c testimage (python3 from hosttools vs recipe-sysroot-native)
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
X-List-Received-Date: Tue, 04 Feb 2020 10:12:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Answering my own question here...

On Tue, 2020-02-04 at 08:43 +0000, André Draszik wrote:
> 1) Should testimage remove the recipe-sysroot-native from PATH (for the duration of the
> test) so that everything runs in the same environment? Or 
> 2) should my image update TESTIMAGEDEPENDS and depend on python3-native and all the extra
> python3 native module recipes from OE.
> 
> 
> I'm inclined to send a patch to update PATH for the testimage run, but wanted to gauge
> opinions first?

Option 1) probably won't work, as things like native apt/opkg/rpm etc. are being added to
recipe-sysroot-native via TESTIMAGEDEPENDS, so PATH can not be changed.

I'll have to use option 2).


Cheers,
Andre'



