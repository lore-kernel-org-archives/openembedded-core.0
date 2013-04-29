Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UWpgr-0007Jb-01
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 17:08:29 +0200
Received: by mail-ea0-f174.google.com with SMTP id g14so1230504eak.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 07:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=dQirtcxs2yIXmVmlRwqabeji5/12tic/EhcSym5RvVw=;
	b=dza9W6ExTO3AGW9qc+5mxQQd/PVsjrcVDWLZyZ0qVGBjy4TLT/o3AZmnJrQ4BdNPn8
	qImUEdkno5WEBzXwtZin0CAQgIqCoMvcTe5hzjDAIH3YQ0JAE3O2/lDEULUpKTf8MGMT
	00mFpNuKi4qB1qolRqL3sxj8FUIXS4MhXOhxwlMX7p0YuVxeGelebb4XT+QKWCeyXyzT
	TEfYfot/JZzoUoaz3oxKHoNPNIRqKIxhgroJH3aKH/HWC3UTjtDrrN+57zdHKjM7ejEE
	Bv4wWn1p76fTY2g0LIKXTNIVVBn4Ch2HUEXe1HOOcyKa8FOtbi0b0gBk8dZMVCpZtEbw
	u9Gg==
X-Received: by 10.15.22.76 with SMTP id e52mr124620226eeu.7.1367247039787;
	Mon, 29 Apr 2013 07:50:39 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id f9sm33221420eeu.11.2013.04.29.07.50.38
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 07:50:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1367243669.5379.21.camel@ted>
Date: Mon, 29 Apr 2013 16:50:38 +0200
Message-Id: <BD5CFD85-9073-4C09-ABAE-C7E79E8E0886@dominion.thruhere.net>
References: <1366894048.14512.87.camel@phil-desktop.brightsign>
	<1367243669.5379.21.camel@ted>
To: Richard Purdie <rpurdie@rpsys.net>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQl7CE1s9wo+CtHiXKC21uUe6nXllwppWIjlO6Th4uz5CLlMZlwzHXQOTh1jA5BMumyMVqtl
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: Move alsaconf to its own recipe
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
X-List-Received-Date: Mon, 29 Apr 2013 15:08:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 apr. 2013, om 15:54 heeft Richard Purdie <rpurdie@rpsys.net> het =
volgende geschreven:

> On Thu, 2013-04-25 at 13:47 +0100, Phil Blundell wrote:
>> 18575b082a4042376fd1575465e69562dea04ddc added bash as a dependency =
of
>> alsa-utils-alsaconf so that the script interpreter will be available =
at
>> run time.  However, this has the undesirable side effect of making =
bash
>> be a build dependency for alsa-utils and, for those folks who don't =
need
>> alsaconf but do want some other part of alsa-utils, this cure is =
worse
>> than the original disease.
>>=20
>> Fix this by moving alsaconf to a separate recipe so that the bash
>> dependency only applies when alsaconf is specifically requested.
>>=20
>> Signed-off-by: Phil Blundell <philb@gnu.org>
>> ---
>> .../alsa/alsa-utils-alsaconf_1.0.26.bb             |   22 =
++++++++++++++++++++
>> meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb  |   12 +++++++----
>> 2 files changed, 30 insertions(+), 4 deletions(-)
>> create mode 100644 =
meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb
>=20
> I merged this however I'm not convinced its the right way to handle
> this. I'm wondering about a PACKAGECONFIG which when turned off, =
deletes
> alsaconf. I suspect that might be a nicer way to handle this kind of
> issue going forward...

Or remove the bashisms from the script, can't be that many, if any.=


