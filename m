Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id E30FB713A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:02:57 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so10934262wgh.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 01:02:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=iLmJ9etUT2dKwc8+SwLnuBcUOA/gOReLf3f9+aaO8QQ=;
	b=hbC+uCOsAHThV9+de2X5TTXvVyaDQtuyEVB7ng9JS0nvfq6O0v1BPXeUU+80wK31/s
	qnz+Mq/Pz6djXqOilQlNtzgee6YU1rFl2N9uJDuiabacnsUXoMdjH8OS1dEMxMOIHgFj
	wAW3Q60WduU8tduynJ9I2CEk20oAfQu63tiPtIIoNLSXAS+D8HwDgCl74RaJj3xZwT6J
	RwKuuc+ulJjwlMmUh1eU3CJM/UKzNvBmqoWBYWCgOt0ShntzHI4puRN+2EulNPvpS3OQ
	w5sZbrS0V8NwIbMnI6OVnnAyPqVs6xQmN/oxiuZ9kSmm5ew4sWM93SDx9vND3KSUfA9B
	wBNw==
X-Gm-Message-State: ALoCoQn9adHLCLvP/7vS/gboOPDYckKGhEmvkI3SIHFjpZfMPHJajDTj6O6+SH+T/VLQj1YYMHv8
X-Received: by 10.180.98.170 with SMTP id ej10mr38508554wib.74.1415696578022; 
	Tue, 11 Nov 2014 01:02:58 -0800 (PST)
Received: from ?IPv6:2001:610:612::c431:a480:a7cc:c1b3?
	([2001:610:612:0:c431:a480:a7cc:c1b3])
	by mx.google.com with ESMTPSA id t9sm26373858wjf.41.2014.11.11.01.02.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Nov 2014 01:02:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cb7ccb68e82c104d668177b180577673c86fc5df.1415516571.git.Qi.Chen@windriver.com>
Date: Tue, 11 Nov 2014 10:02:56 +0100
Message-Id: <62F02FCC-5D13-47E0-AB7C-9684E2B913F6@dominion.thruhere.net>
References: <cover.1415516571.git.Qi.Chen@windriver.com>
	<cb7ccb68e82c104d668177b180577673c86fc5df.1415516571.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] procps: install symlink under /etc/sysctl.d in case of systemd
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
X-List-Received-Date: Tue, 11 Nov 2014 09:03:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 9 nov. 2014, om 08:03 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:
>=20
> Install /etc/sysctl.d/99-sysctl.conf symlink in case of systemd so
> that /etc/sysctl.conf is taken into consideration by systemd-sysctl.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Look good to me.=

