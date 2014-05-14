Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (unknown [209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id BE47E660E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 22:05:17 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id r10so7720055igi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 15:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mV1vP07DD3zRFsRRFAprixoO2+/fzkrn/NlNJHc5thM=;
	b=cL9WQJqdBKLBcof7MmK0cJ2fdIUVyCqVHZzF/oL9+LACd6JOgKupDB9zS0E6cuL0DG
	tw8Zwf6AmAfK5EuTws4Mtre/e2TlXAcYDt4snf7ragYolHHzXNVIJ0B6rw81Z4iRW/l8
	/1d8QGmPxYcxyxt9lx4/K39JLZjDY+1rziFT818UR5ZHI2KfSVRwcWuRlqJmutbrH5xS
	lUPHCn6vjYTvQUXC3pw1WObC6m+wOnn0qncsfFs9HvRdgZEsRQrF+uvizGSbF7mj/4BK
	v3N1mqIu5eDVLeXuRTfPRB/iloQjdf/Cd2DxAQlxrMzevoU3zk8W46hhDalAJl+1A6C1
	Ri4A==
X-Received: by 10.42.52.199 with SMTP id k7mr6151728icg.4.1400105118277; Wed,
	14 May 2014 15:05:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Wed, 14 May 2014 15:04:48 -0700 (PDT)
In-Reply-To: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
References: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 May 2014 15:04:48 -0700
Message-ID: <CAMKF1srwzW+pU4K2wgSG6GPmRGmGdGqCbaJi34ZjF0Npi4TOcQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/4] tcf-agent: add systemd support
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
X-List-Received-Date: Wed, 14 May 2014 22:05:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 14, 2014 at 1:30 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_unitdir}/system
> +       sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tcf-agent.service

shouldn't this happened if systemd is enabled in distro

