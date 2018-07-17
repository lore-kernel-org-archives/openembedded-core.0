Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3C9789A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:57:45 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id j11-v6so957810vke.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=kMHfAXclwR97P4WWBP4c/7mvsCmQo6AlbisYcOh9Iuc=;
	b=OKDmhgzE3x+rMdn/tXgDvY01HzpbPYBp8KJV5MYfWKGfQI6kBDngSfYyPJO2fi0qj6
	74dehHLytyhvEck1pjT28jJFkt7wWIrZRsWwFJ91FwYDrIAcBP9R+GCvKkkTdURqsgxm
	KvC1QuK9HROvu5W4srA3gRpNb/ZpVfBtCy+3wVgL82W0CBXYr9i6lNbijDOWCglY7R9e
	M1BnQQeNAbN3r2L0ihPUiX+YuRGccgYUC6r38lO5dyd9lbXPFeWTvrPd0eLlHN8q83Tu
	9yroau1dQf50siv9iPuYHyvtvux1xKkOcr2S7ZRBQjzW3Ev5vyeN7MFhbjqER+1YkoFZ
	dHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=kMHfAXclwR97P4WWBP4c/7mvsCmQo6AlbisYcOh9Iuc=;
	b=YCf7CYwebFF94xJXquUINAvuvUuLmwxDPz6gnS/CUAmvgs82Bsta39/O6swYIU9Yk/
	xcJpfnpyvPdwGnaz740KWofnY1kDFV6AiQjPs0g/4Q7HNuUjYwKWM1zlxzxEnJb9XPny
	4hj84c+npkthjo/cOgFlCSJaJUt4498qgK8LY7K/OsR3rWRaVapk2C+H8tAZvnEEMC9b
	yXiNhHSacaxKLwzxujL4BGQF4/qwV42t4uniSZ3FgQYnLpPTd5dFo7on2hgq2OQ9MjXP
	3m2UjqgG4HaQgTXuzD03Dk5G7X9tyOS5VJh5//rFZWqykJo4rRPJkfYHXyNuDcxMx4lZ
	bMNw==
X-Gm-Message-State: AOUpUlHdcEBVe9dIRCp+rqyynbp3SAwD6Zh1nrgJ5XIZK3d3vKD/Z3tV
	WIJh9ERSrUNtvVNJPv9VEkl6dYohFSiAmm1vlVw=
X-Google-Smtp-Source: AAOMgpf/dfBJnjJ671uSJDXb2ieS3QQsdsnv1bsi2ILYfyrMmel3rBuvP+n4dfBA51QQRZ5zgW3MCyhWFFhZLEQSsps=
X-Received: by 2002:a1f:9d16:: with SMTP id g22-v6mr1355607vke.5.1531846665847;
	Tue, 17 Jul 2018 09:57:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 17 Jul 2018 09:57:45 -0700 (PDT)
In-Reply-To: <DB6PR0601MB21336F7A8CB14036C06506FCC34A0@DB6PR0601MB2133.eurprd06.prod.outlook.com>
References: <DB6PR0601MB2133CEC1B8D8FAB2DFC46118C3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>
	<CAJ86T=UUz7_m+P1cWAk8tNT6Y=Cmme-2Jy3b4q8ZUkHzJwi1Gg@mail.gmail.com>
	<DB6PR0601MB2133389C83155E102AA5E6C1C3770@DB6PR0601MB2133.eurprd06.prod.outlook.com>
	<CAJ86T=VVumy=u-OT9voyVJ-SBcO+tW=Pf-M8S5FXxHXzgVycsg@mail.gmail.com>
	<DB6PR0601MB21336F7A8CB14036C06506FCC34A0@DB6PR0601MB2133.eurprd06.prod.outlook.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 17 Jul 2018 09:57:45 -0700
Message-ID: <CAJ86T=UkYDfv0_oag61tGn9VHfxA-waTBzJ2ZPcieu8tEPztPg@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCHv4] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Tue, 17 Jul 2018 16:57:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 25, 2018 at 1:51 AM, Tobias Olausson <TOl@hms.se> wrote:
> Just wanted to bump this, since I still see that v3 of this patch and not v4 (this one) is in master-next.

The buggy version of this patch just got merged to master-next, via mut.

It's missing Ross's signed-off-by so it looks like the change was
originally merged directly to master-next, then mut was rebased to
master-next, then the change stuck around in mut after being dropped
from master-next...

