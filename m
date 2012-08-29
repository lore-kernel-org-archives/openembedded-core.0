Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6huL-0001PI-Vr
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 15:02:10 +0200
Received: by weyr6 with SMTP id r6so291367wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 05:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=KD1HN+XvCiuXMSpM/3ojmSjY9CTHswTpLEgNf7yX3F8=;
	b=BZ06afnR5A6TlMWlcmQ1h60LBefG2mf1++uCHmNv2mGQX/zw96qeGD7TRCFeP3Vwtm
	ZneM7gkntp8I2byTvsYUTHOoEWLVt+z+6HkeRPf/2PlYSqlg9iJAAyGOwmdxMjqFdyuo
	j54bjK/MeKJtjxCsGKubAV9lkx5VG58BZT7Jx8tIe5ntOGExiocHE2/YQJKCCzqPvm0O
	kX4DPWLFnPR4kS5QcKRTn8XDWf49LpYiFkE5CFwB3mVPkWSzOBzSCUNLJ4/wKeuDt+Xs
	Yo6y7tZS8N94vtVwu8ZPFjyFq1YTpDyUaioJSJ+Gc5cvjkx+IpwOeJb5KhUd/x4MUx+V
	jWxg==
Received: by 10.216.197.11 with SMTP id s11mr866851wen.55.1346244596120;
	Wed, 29 Aug 2012 05:49:56 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k20sm10123050wiv.11.2012.08.29.05.49.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 05:49:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <897CCE6A-604A-484A-8ACD-452701801FAA@dominion.thruhere.net>
Date: Wed, 29 Aug 2012 14:49:53 +0200
To: "<openembedded-core@lists.openembedded.org> oe-core layer"
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQks88w/RSCWVGkjoQPdrlX7MtpzWhpErpPeEiQtDwKOn5vUJx7PlDhlnm+OYNihrveo/Pwx
Subject: Bitbake distro packages: kill them with fire
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 13:02:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

These might not be the appropiate lists, but I might reach a few of the =
culprits. Over the years people have been doing 'apt get install =
bitbake' or 'make install' to put bitbake into /usr/bin and after a few =
minutes to get on irc/email/etc to complain that everything is suddenly =
broken. There are checks for bitbake versions in the metadata, but it =
can (and will!) still break with due to python path nastiness.

So to every person packaging bitbake for their distro: stop doing that!

If someone has a better suggestion to avoid this problem (more =
documentation doesn't work), please speak up.

Thanks,

Koen=


