Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPo8U-0002tt-TI
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 08:04:00 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so35597eaj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 22:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=/bT4bU8h7IPPMopq6qP1l2NpTRlukPS7FIfMmOjUixU=;
	b=gi+inGPijGCPEvmuL+43kkCnqu2rbjKPZZ9LPyQzZiX9D3y3+XlsLrXnGk4fmBz9M2
	UlwCCnUjsp/85bJv6khhhlz33mq2KSG3ZjzMgl2XPm0I/m2TzhpYSAVsCJOLXicvmapK
	zF2Ibn0toliPreUB5rITO2gQApSW/KDzq1DcqElMxQUolayJ08o0xJ2T97f8FjVpuOqS
	g1/u4aesv1DVIHqcw4T1a/TLHrJep7mKK4qOlMG3OZW5cIDqgQ7HjY8yXIxM9OeouYTa
	d8XINbSuGbvWHCIxTdCi2Pn4FFT5Qjq6WsqWVKnbQYHtTXjzZ90x6qS89QJLi2YuFaFj
	a8GA==
X-Received: by 10.15.101.200 with SMTP id bp48mr1723139eeb.38.1365572797952;
	Tue, 09 Apr 2013 22:46:37 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id bc1sm41557282eeb.11.2013.04.09.22.46.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 22:46:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365522501-7439-1-git-send-email-ross.burton@intel.com>
Date: Wed, 10 Apr 2013 07:46:37 +0200
Message-Id: <B8613191-4B51-4494-8AF8-1ED589E1F54F@dominion.thruhere.net>
References: <1365522501-7439-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlF/zOrpCLTEDhIostLanMlSXqGyAWqAT3bKjWE8GOnnu/Dnpnf3CBu4T3XN0yANCPwVnaH
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: restart service in postinst, not start
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
X-List-Received-Date: Wed, 10 Apr 2013 06:04:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2013, om 17:48 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> When upgrading packages it's possible that the service is already =
running
> because opkg doesn't actually execute the prerm hooks on upgrades, =
which is
> where the service should be stopped.
>=20
> Handle this case by restarting in postinst instead of starting.  If =
the service
> isn't already running then this doesn't make a difference, but if it =
is running
> then the service will be restarted.

In the specific case of upgrades you'll need to add a

	systemctl --system daemon-reload

to catch changed unit files as well.

regards,

Koen=


