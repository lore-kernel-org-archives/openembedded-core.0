Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SZTcn-0004JF-EF
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 23:06:41 +0200
Received: by eekd49 with SMTP id d49so1519070eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Wh/XnbAyR8BLgCYrXZPfyyn7tGZQmaz3xTJ5d38jzSU=;
	b=oOMfnYj9krykAgLan3HkY1MqpXV6gLbmHjouXouPrMhlS0F4FVLLk75AH6CD3Z4MeU
	9sKxn9+l2H9m3+W5yM4PIUEuQZ9Zo3mr6fYJSuX6pbGb7IARssD+NgdiCyBKpB+P8XBI
	1jyyxK6QnZw3nrT1rLI+Mzk1M5C9Uzt5goFxqRt/3dGIk+vvqe4Eb7oESLCl6nxQLDoJ
	s6d9XKNotajnX6q73NynfVuIZLfvfGxswhaoGSGnQUqGtp0n7txCqxQr3QxWn4nPqiFr
	h/9PbUGqfMqj1Noi5eYwLbR2iDm0vdEbMiHeYRhfY7aTJuz5bRBozgv5UrzlZTYV63aw
	qdZA==
Received: by 10.14.53.80 with SMTP id f56mr4826659eec.167.1338324983590;
	Tue, 29 May 2012 13:56:23 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z5sm52996471eem.3.2012.05.29.13.56.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:56:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1338323483.git.ross.burton@intel.com>
Date: Tue, 29 May 2012 22:56:18 +0200
Message-Id: <41C46607-08A4-46F1-8572-3320B7FD2615@dominion.thruhere.net>
References: <cover.1338323483.git.ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl02zWZ8aJMdrfnXMSd25xv4Y/FeqV66ZS8tnvU2fylgx7K9EaTNeAIx3EYKB7UyiJYqfvM
Subject: Re: [PATCH 0/4] Upgrade connman to 1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 21:06:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 mei 2012, om 22:43 heeft Ross Burton het volgende geschreven:

> Below is a patch set upgrading connman to 1.0, and cleaning up the =
packaging somewhat.
>=20
> It Works For Me, but my current available hardware is limited to =
qemux86 and
> a headless Atom machine.  In particular the non-root-X permission =
changes
> look to be correct (where they were previously obviously wrong) but I
> haven't verified that they work.=20

IIRC the sed was done to get around the 'atconsole' restriction, is that =
not needed anymore? E.g. can I ssh in as root and run the connman tests =
and when I log in to gdm as a simple user will connman-gnome work?

regards,

Koen=


