Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id A460465D0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 02:31:11 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id hl10so363383igb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 19:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LbUW1cw4qVSuRsm/tPGtpWWh3Sj7k6TI+8a1xMTSRV0=;
	b=Xo12ISFztGcQ/W58tEyPcD2C5JGKypDmraxnRw7arTpuK59eVZdyFCKNObPLWkUd2c
	MejxEwksxCmlAu6U1ukOwPTsiJIKCYxx6IbVQuRi8M2lwbpKlkSaB0VNb+GQJxo2yDHI
	RtfVvmnx7FaWsAe1BTzX9wz5cfLH0JhLmYsq3/JbykylFRITjtPl6HVfKJjoyrjm7Mnk
	mED0Pwdm8On8hInrDa5yUD8vWAxKt7KtitHJ4Iahla+fmD0KiwLukAJ/Cy2TxkM1oeZS
	+On0UufypE5dqoprCz9ElYikYSWazQKarR4fgZfGnTlbAhsvowKrcyxrrZ1zQ2lhVqDb
	+WpQ==
X-Received: by 10.43.140.144 with SMTP id ja16mr47778188icc.46.1398306672037; 
	Wed, 23 Apr 2014 19:31:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Wed, 23 Apr 2014 19:30:40 -0700 (PDT)
In-Reply-To: <806504230ea599d6dda0a77743b080b8ed8eb915.1398245851.git.Qi.Chen@windriver.com>
References: <cover.1398245851.git.Qi.Chen@windriver.com>
	<806504230ea599d6dda0a77743b080b8ed8eb915.1398245851.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Apr 2014 19:30:40 -0700
Message-ID: <CAMKF1so1aB8sZm3mnAyQk23yfK1_eUVgZazRxiA7GZrz2b2OdQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cronie: add systemd support
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
X-List-Received-Date: Thu, 24 Apr 2014 02:31:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 23, 2014 at 2:40 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> +EnvironmentFile=/etc/sysconfig/crond

should this be represented as ${sysconfdir}/sysconfig/crond somehow instead

