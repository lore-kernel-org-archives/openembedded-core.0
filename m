Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id D984C7827B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 21:15:58 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id o143so4959576ywd.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=EdjRGqn1qoJUcEOk+mnJYHayFAepbr/zHKC1KaLJgjs=;
	b=vka42Ve2VPeST7Fv7Zentj7dGV5nc0xNSE2RdlJ/25U9KbVohyunzxNbLt67aALxSg
	cTNI4ce8kR+w0cJw+8uBUcwUax2EyJMBfhyurshzL+JZNnpU8kJFlpcRB8G62jA8uERK
	gUf9HfDPiR0aV/Ke3gd99nBup7+wM0FUNNFdvU4yrnvKusTAS2slHqAdXH4mfz+7EnDX
	LFEPq/f3JA4/O9adh4NmL0a9p29ZigGKndxdFSjsq3xqYpkG7DFUO67xuvIOCbhQzH9B
	Ecw3bezWcoQwXyRV6I8qSnafFzww8G4lKSTRW1iAPp9d/Mt6L9FyOLsXZU28UbHWwTRa
	+S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=EdjRGqn1qoJUcEOk+mnJYHayFAepbr/zHKC1KaLJgjs=;
	b=kkeGGiqZycb7XA/abQYrYBZQvj57xPZvj6POnn9nnPOXn3Bb0MgT+sj7Ijo8K3+LHQ
	EhtiIEH4S2ytn6z9RybUxe2JRk4jl3NRQfkNlv9H2W7ZDbOLqoVT+RCBdqAYEQkvztnT
	8uwLhCPRpqx2c2FnsROjFP/jQL2g1NwBFBVVdJ4tGalgOyIq7UvDJJnn7MjSJmXXF8TO
	MAxs+uykcIOJJzlv+TW/SeqVjJuNvB1sCte8YxuLWMN7R+dTeUkVVn8ODq3VO+KkqrLH
	z7UeiVUAu99SRlc/4DI/eyMrX0YnVAl5sLUttMKsxM4xBxQV6ANhLzce4Sk/nLVXjHU6
	GLVw==
X-Gm-Message-State: AHPjjUhLdGbq5nT1uwrR3pFCDY4Kd3NaiBxpYsDUcaMABy1asePYOrno
	jetIf9YwsZTHvk3WkWHCNfVnL4jA
X-Received: by 10.37.234.75 with SMTP id o11mr2408381ybe.187.1506028559346;
	Thu, 21 Sep 2017 14:15:59 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41])
	by smtp.gmail.com with ESMTPSA id g72sm908967ywe.26.2017.09.21.14.15.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 14:15:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id p126so3233620oih.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:15:58 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QARzCoUDM2IGcw+iMHRKKyQ9VdunOOVUiF8BP7NDwRYyShVzqyvtKVlufvLRrScqV+sDUfgijt0W2IMr6FNqEI=
X-Received: by 10.202.83.10 with SMTP id h10mr3713512oib.56.1506028557525;
	Thu, 21 Sep 2017 14:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Thu, 21 Sep 2017 14:15:56 -0700 (PDT)
In-Reply-To: <1506015977-16858-1-git-send-email-trini@konsulko.com>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
Date: Thu, 21 Sep 2017 18:15:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKquj79BCNcRg66C+GSbDeoAeO6nb61Nk2FQG75w_CCTjg@mail.gmail.com>
Message-ID: <CAP9ODKquj79BCNcRg66C+GSbDeoAeO6nb61Nk2FQG75w_CCTjg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Thu, 21 Sep 2017 21:15:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 2:46 PM, Tom Rini <trini@konsulko.com> wrote:
> When we have been told to use the UUID we should also update the fstab
> to make use of PARTUUID instead of hard-coding the device in question.
> This will make the resulting image much more portable.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>

Adding more features which changes the fstab goes to the opposite
direction of reproducible builds; is it desirable?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

