Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUla8-0003f9-9N
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 23:16:28 +0200
Received: by wibhm14 with SMTP id hm14so1057805wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 14:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=CYWqFxRDeZ/dGPeK9yxcV27d3dw4tBICCLEactTQkW8=;
	b=aUGfjoRRUN4Iig/76tp4Ert4z7nZIp5wNmSz49FwAWCrbeyMV36phM5mB7C9WltPYT
	+cHas6JbYSjDRGh7WiQNEFslTo+VUNamZ/uE0lxj/b0Nok/4OhC2fM9owfQH6aMqdpy6
	vAhsV3GsTObViCmedxgt7SpzuoIY3cIiUR8TxhnMPvdsOlVLYpGnCgr9dJVhy2zPtBU+
	XPY8xP5jmsJjxJGgsvvccYPCv7XYzZem+Z7ZNgvAv2AeAdR3vn9xOaqipET6lL05W1t/
	oIDzErQkPMOCTAe+umSlElwzLr6U3dOcryyB7cZJamSCLFsgejAkXPAPXfywJqGkjt82
	9XLw==
Received: by 10.180.101.136 with SMTP id fg8mr44320452wib.4.1337202386661;
	Wed, 16 May 2012 14:06:26 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r2sm12945326wif.7.2012.05.16.14.06.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 14:06:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
Date: Wed, 16 May 2012 23:06:23 +0200
Message-Id: <E7972075-09C9-41B2-B353-A9D4B6AB4299@dominion.thruhere.net>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
	<CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmz2OLz1YjkW2V8xpPXJLaj64T+AuFjlV+BTTJIou1rnixEokkxeTtCdjzZ9NKnSgCRBZ1X
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Wed, 16 May 2012 21:16:28 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2012, om 22:59 heeft Otavio Salvador het volgende geschreven:

> On Wed, May 16, 2012 at 5:55 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Op 16 mei 2012 om 21:51 heeft Daiane Angolini =
<daiane.angolini@freescale.com> het volgende geschreven:
>>> Port recipe from Meta-OE at 4bf0e7e02544e9ffa54aa0ead966c411d7dbd0be
>>> and update to version 1.30 using FreeDesktop GIT as source.
>>=20
>> Why bloat oe-core? Nothing is using it oe-core
>=20
> Have it in oe-core allow for inclusion of it with other test utilities
> and easier to use for Yocto people. Why do you object in have it
> there?

OE-core is too big already, it needs to get *smaller*, not bigger.=


