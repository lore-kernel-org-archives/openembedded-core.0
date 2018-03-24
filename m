Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id A0B4277FF5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 15:35:12 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id u11-v6so9256784plq.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=a2B7WHmO5E0H4VqeqvGYzeJguDhQBJwY1U4wwTHPxL4=;
	b=LQG5BEyYJQKJY5HyvoJS+JjbDpmPRnl0YkhxzoPrX7E7qFq2hImeIdpc73HfIHuMdH
	ikkz67a88hIBFMJRJUtBYdZhbJsaO/C1sqxAM4OAxi18CePrMiS5PZFg0ijmcophjJes
	DLtgWxuzoUrwTALLjAdR6k2Estt3uBZBfyXJj0rdmblUDhI+93YNO8L4QHos62OoLnH1
	vcemzIxVcIrcm1LBJ0IFM9qjIcdrchD/ThTh+hNw0ZoWH0sA6+0nhsWKYMeLAZ8RiC/f
	WUKAVYirx3FcZsv+qhxppfpR422yWs0Lar0SqWT6wnGSoModdT2wJ1E2fOPq8XbVnn9P
	SoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=a2B7WHmO5E0H4VqeqvGYzeJguDhQBJwY1U4wwTHPxL4=;
	b=VTjvco9pQ2fjAVxQ5M1+PexB//FKefLK8OosKNEYNigrExyusa94tM7dCM8Sdbj7sF
	qBBXTmMKKiogQkC3J0Cr6lvyixNJnDRRezqUvJnEvly0qIX3C47kJ6ssBLNBCOIP6GLY
	bPNHBbtb4JJeJC9hb43FxnGMQluHo7TTMEq4Vp3HiJEVXS7z9lPbyWkEqsBox5xtmwz+
	c2hp7M+IF1CFSGSvY6OqmGhvaQklySYUCFNwGYeVfu9gVeSu2z1o76OLdijgbbcPyOsj
	nPkaaj7+vo3Xi7cSxG+yzxUr+iR9ZtztEhZvWbwQbMzC/EpY2ZOHozrTNvcoB1Hz4+45
	eAWw==
X-Gm-Message-State: AElRT7H1QEhHA1UYHjgwxePtFi/5ZUfGzfCvNHoRZxzfNkCFAADEobYp
	hFf2RpefEqSnPIeSEaW7vSw3QA==
X-Google-Smtp-Source: AG47ELsUo09J0btngp7cMcSp54NnrjFU2DsSDBmm6JYkCKNQbw/nDcqqApePEEGTI5ntS5k9Wl5bsQ==
X-Received: by 2002:a17:902:2a43:: with SMTP id
	i61-v6mr33866131plb.54.1521905713410; 
	Sat, 24 Mar 2018 08:35:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:310f:6de9:43b4:b287?
	([2601:202:4000:1184:310f:6de9:43b4:b287])
	by smtp.gmail.com with ESMTPSA id
	b73sm19222429pga.62.2018.03.24.08.35.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Mar 2018 08:35:12 -0700 (PDT)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <62e48d71-f219-2d7d-ea58-b99e1caaaecf@gmail.com>
Date: Sat, 24 Mar 2018 08:35:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: Bind update
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
X-List-Received-Date: Sat, 24 Mar 2018 15:35:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

While working on updating the current bind to the next patch level, I
noticed our current version 9.10.6 will EOL June 2018. I know we are
under feature freeze for the Sumo release.

Could we make an exception and allow an update of bind to the ESV
version 9.11.3 ?, it EOL's Dec 2021.

regards,

armin


