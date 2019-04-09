Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD887D72D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:22:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j9so21465836wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=AcFMop2cY0/XK6HKZGoQ9L7+G7wvxvo2PGU4aqKXUTc=;
	b=YOzN6vX44b1Mc7ZT3hSsAwYxvyZGlbXMeHhvM18EksUkyekpP5L3eSxvGoHPY3r9c9
	R/oavjdwGmgvRKGmtPiDR91sOoKJGnSQvAz9kZ5u7aQEVgkZhyfosrZKIqVxQqD+E5uF
	sD1oh+NUaUKwVgr2sRzGocSRCmBgulFVbe47k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=AcFMop2cY0/XK6HKZGoQ9L7+G7wvxvo2PGU4aqKXUTc=;
	b=aEWpEsUV5bHadMMaWzaUMCJx2WfJX+z+fXi2So/7O64wpLmR0gnFpMgSk76YhKn5bG
	4BikDc0XwUapAr308KpH34Q1q3kOuetUJE1yHorvA9rslYtxWYXtNzwi56DumRpQ4vtb
	W/sPXOujy3AThYP7PAciQsfYaEAfoyJGbeV1Sl6GA3MiyOPwx79SnmcdqFCVxnqJHobD
	Iti39ehvQdlBKkJGvSF2BKoIvaLa/1CX/Gbg0oYxPfwlEgiyUmqMK+KjbVsBOv6mU5DE
	fSWTpKWhvvNs3bicqMi+Uh8uh5MEeUCtooXNSjJ52JNvXmnp36jDK7fInUu+E0fyMTKt
	E6hQ==
X-Gm-Message-State: APjAAAWvJPs4d7oMWt0tLEdIn+yAIh7zwaAWngs6yAs2uvi34l/FDZ6D
	gDRznzqyrsfBwbk70mGUmcc5xA==
X-Google-Smtp-Source: APXvYqxgd+8kelJSrpZ4oUSqXm/md0TeTpftB9c3B0iv27rfRUU/zOt2ug5q8zqvTH7jHKSuaAeMAw==
X-Received: by 2002:adf:d84d:: with SMTP id k13mr23495390wrl.154.1554823374706;
	Tue, 09 Apr 2019 08:22:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x5sm31797502wrt.72.2019.04.09.08.22.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 Apr 2019 08:22:54 -0700 (PDT)
Message-ID: <90d55754e9381759c8b70ebca0b880e6013f17f0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yocto discussion list <yocto@yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Tue, 09 Apr 2019 16:22:50 +0100
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Eclipse support dropped with immediate effect
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
X-List-Received-Date: Tue, 09 Apr 2019 15:22:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm sorry to have to say this but the project is terminating its
official eclipse plugin support with immediate effect.

There is nobody willing to keep the builds going, fix bugs, port to new
eclipse releases or release the current plugin. This has been raised in
many forums, multiple times and nobody stepped up to help. With nobody
to do the work, we can't keep it going, it is that simple.

We'll be removing the automated testing of the eclipse plugin from the
autobuilder with immediate effect for all project releases.

Richard




