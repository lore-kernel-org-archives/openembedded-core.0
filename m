Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6856017E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:07:29 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ex7so5957612wid.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 02:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=MluWSZhc0DgZ1VX3OX2ttxnFlggl85eka4paclJu0k8=;
	b=nK3E1vRHZIeiTlmofaMxcSUCzTl6yWeLbpKS+8fw3QjC9Q1AtRaZUmDCiy+PXnyBmw
	B/LaP5KRecfsn/jK5TOlDePnPQsVSJhMe087gK8MYdKnNsdqpbSvflND/PCSFvcWxyAE
	vXuj98M9GIoZyGfYPQCu5Knd+Ia5SNSqd8llNeu9KwLur53M/w9jOB7UlCrCLOx5daeq
	i9Og94QoOHxxgMuz7n54odNMvXSVdUsfF68u/x1DSG7wMBzeua6qdlpWdkfZ3x7h5KKb
	kXtHMypi21mKzrUSYvsC/HqvFddWOSIwFvNXzv74iB1o3qOOc7+q578O0YVuER5DkRtV
	FRmQ==
X-Gm-Message-State: ALoCoQnGMvXZb2qg6cku9JzQtuSiwWu8qMf9Hmv3xSi/jiVEEg5D1BL+66lbTg+sginv6AEF+Amu
X-Received: by 10.195.11.6 with SMTP id ee6mr9077029wjd.95.1415009249788;
	Mon, 03 Nov 2014 02:07:29 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id fr6sm8186484wic.1.2014.11.03.02.07.28
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Nov 2014 02:07:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <afef7088ee50cfc2be2d08f16ddd8fe087a1c490.1415000039.git.hongxu.jia@windriver.com>
Date: Mon, 3 Nov 2014 11:07:27 +0100
Message-Id: <B1172F6D-7C60-4AA2-BB10-98B3D283E503@dominion.thruhere.net>
References: <cover.1415000039.git.hongxu.jia@windriver.com>
	<afef7088ee50cfc2be2d08f16ddd8fe087a1c490.1415000039.git.hongxu.jia@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: add network config while networkd supported
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
X-List-Received-Date: Mon, 03 Nov 2014 10:07:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 3 nov. 2014, om 08:37 heeft Hongxu Jia <hongxu.jia@windriver.com> =
het volgende geschreven:
>=20
> While networkd supported, we add network config which starts
> dhcp by default.
>=20
> And the customers could edit it according their own requirements.
> (dhcp or static ip...)

Another thing: don't put this in the main systemd recipe, forcing layers =
to bbappend systemd_git.bb for only a networking config file is =
hazardous and too invasive due to sstate invalidation. I don't want to =
be forced to rebuild Xorg and flood people with updated packages in the =
feeds because I, or worse, some random layer wants to change the default =
network settings.=

