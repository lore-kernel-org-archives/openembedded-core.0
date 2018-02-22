Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id CC80871AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:19:13 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id e64so4024966ote.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=+lvnrkJC+78+H93eGOHjGHoVGdYBHPK5knyl4Dnr97g=;
	b=jPA8Fy6n45DpUG29UdysldhZBM1Xd6eeqIyCn/eNzCE6IAChF4ZZRZGnbNMlSNOLNg
	h+6iQB9qufO572xWFnfTfnd6PUWhglh8vJ4gzvwt2MLTIlxNv46NUT0Nx/1iEEHg1eeW
	bFL6eWF382+BSsCguXT6P73XfFUUBoIis2sAeNjvJlAjXv973OJuHjAip/wSWLhfyQ63
	3CfNCnH++GyguYgrogK7o5vZ+T5/K2ZrplrAIuJHuxdtRDd4JWz0qQZHGvPMb36jXSUd
	5YfdMDQdKJmCg8bcN12P63GSDD2JlU3Xo5rT4cu1OpQhVPlhrL3I4cB/1p+rM5/q9pKT
	2mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=+lvnrkJC+78+H93eGOHjGHoVGdYBHPK5knyl4Dnr97g=;
	b=sEXuh+6wOMgMv2p14Rq2sN8pAQqY3Lr8BkwtmtZVMOKJM2ScZnWgUSJCk02nakdw02
	RbiwhgIiU3mfbrt+9FH8DP+gUsr+IkYe8zts2cGxcOt6dG6Oj4IClPW82NsWHwOeT3LV
	Mu2eOo8zXbj9wFo9B6Kgc9/E1JTYOhoX10hQb2IP1I/vagHwxnDUNPpgV5WJ/DBGCxMI
	3DepeJVGE/jOLRk589SIEGEmgbRTKGhn1sQ87iASRbBAsmpRUGYQ/vI0VHBz4UNtLs32
	EWmV7BwD1+RgvMhzzDvICGZMmccm31sN3TtbZfuzAxB1cb3fcAyX+Ff0eyUGtOljEuBR
	rwEA==
X-Gm-Message-State: APf1xPAu0N96sem9RbSzNdoP749JkMydtK0f338t9gH1TgPPgqo9bU9I
	FNjn+UER4+uZnxpc6+FmkwuJYFaR
X-Google-Smtp-Source: AG47ELsNFRMtJy2t24b7a5mN+8ih6gJWVoQtNn36yHE/CTXEKYW9iSk9I5Se45olVHKSycS1oKjQWw==
X-Received: by 10.157.68.9 with SMTP id u9mr4790445ote.387.1519291154394;
	Thu, 22 Feb 2018 01:19:14 -0800 (PST)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41])
	by smtp.gmail.com with ESMTPSA id x4sm93150otx.13.2018.02.22.01.19.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 01:19:13 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id j79so3209334oib.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:19:13 -0800 (PST)
X-Received: by 10.202.179.214 with SMTP id c205mr4246261oif.315.1519291152740; 
	Thu, 22 Feb 2018 01:19:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Thu, 22 Feb 2018 01:19:11 -0800 (PST)
In-Reply-To: <1519288575-139362-1-git-send-email-hongzhi.song@windriver.com>
References: <1519288575-139362-1-git-send-email-hongzhi.song@windriver.com>
Date: Thu, 22 Feb 2018 06:19:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqj9wyUuYR5Rh+3DP=j40=P2fbgtLPvOwurfmtAKH9n1A@mail.gmail.com>
Message-ID: <CAP9ODKqj9wyUuYR5Rh+3DP=j40=P2fbgtLPvOwurfmtAKH9n1A@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Thu, 22 Feb 2018 09:19:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 22, 2018 at 5:36 AM, Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
> With MountFlags=slave, those mounts then become private to the systemd-udevd
> namespace and are no longer accessible from outside the namespace, which is
> not expected.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>

It is not clear /why/ this is need.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

