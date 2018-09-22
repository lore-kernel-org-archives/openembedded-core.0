Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id BAEA760722
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 19:03:19 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id y12-v6so14841425ioj.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 12:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4lUF9dwyDAitBulP6S5Ngpsw360185aHuhJFLuRQgKA=;
	b=Oe3XjRMJXEH+Ez5j4xSHEpBCEqj2TP/A93y343q5ecQRkWMzjcU6UDaKLy3Z6urps0
	3wRR61PGYUlwagz9dG06M9kloDbCryzjxhhCHSTwpU0SFqDPX++hCdNqe6Vp58HvbGOi
	3ExXMp1V16IGZ5GAZMmTf7BYQLKPcMPiA9Guk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4lUF9dwyDAitBulP6S5Ngpsw360185aHuhJFLuRQgKA=;
	b=MQdNPtL0hvyG/SbvyLuSKD7ViAmZnM2cRfe7WqcpCWOCj2ffS130cEftz+zIz/Tm29
	yRg2szmBpliYohb0283fSVGpzO2qoEjpE7AbOXaxFzZS0KXR0F7b4mQn1gZkNCUyDDn5
	9+4/7GMN6WpjGP21tyRnUsVKaxDqwwJnPb9oV/Z19A9GiyS/GMh10iA/t35epxTvW0zI
	76iFQUWzbyw9camL1LOJUWzv7kwisvcobJ1KDw785r1oDVuOYDawGUX+7hLjhTfSWYi+
	1Ktb9PiUWdbSUvdkApAiBmKgvFMKmtywYK6+CjypNP56Xc4ACtWssbQTNQjEuXafAZLA
	A61w==
X-Gm-Message-State: ABuFfojr7ArUbQWMLAxKdl8gwZ909EzBrSxfpK7Bt+I5sFPIBF8bXASZ
	RrPj54sSdIXyeM+c6bzvrZ3dLg==
X-Google-Smtp-Source: ACcGV61DSfhW0lXlMEOuui4MUuOwLHww9oGoKAAbRtEMsOk5nHBD51LaCu32FHZe/FjRbAm+76L92A==
X-Received: by 2002:a6b:4006:: with SMTP id
	k6-v6mr2504144ioa.277.1537643000498; 
	Sat, 22 Sep 2018 12:03:20 -0700 (PDT)
Received: from hex ([209.82.80.116]) by smtp.gmail.com with ESMTPSA id
	k190-v6sm1536809ith.4.2018.09.22.12.03.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 22 Sep 2018 12:03:19 -0700 (PDT)
Message-ID: <8cdd39798d234df59b511f643fdad2e1e20d978c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sat, 22 Sep 2018 12:03:17 -0700
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 22 Sep 2018 19:03:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-22 at 13:18 -0400, Bruce Ashfield wrote:
> Hi all,
> 
> Here is the consolidated pull request for the active linux-yocto
> kernels.
> 
> It is -stable updates, configuration audit warning fixes as well
> as a fix for the qemuarm64 boot hang with the ssl update.
> 
> Nothing to major here, and I've boot tested on all architectures,
> but you never know what the autobuilder may dig out.

Thanks Bruce, hoping this is the last missing piece of 2.6 M3. Its
queued for testing on the autobuilder so we'll see what happens.

Cheers,

Richard

