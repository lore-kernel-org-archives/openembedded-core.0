Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URhlH-00011A-CC
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:39:51 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so2111969eaj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=f+u4loavOdq0cbor37LWR9ZryDvDV1D/0j++A9MSnZ8=;
	b=VdFeJQgjl521+RsTlLnpcSdxuwrxpPNz2gFwlrknae0/LIs/ehUbbn3ZY0fMbPDa9k
	ACtuyh0mdIkBwsg8dmv2qpflgfDILpjQbmPioqWTlLiDZcwKy9tLfCrnTiDWG5SelbWI
	7gqg5w6hwQnz0/mm7zRY12leS1sKvfH8n6zMJwOZx8vMAxZ6icjue9nErXohXmw8g8IF
	DzCasggl7LmZwE2ldAwD5XrrGUx5nmWdUSk4LQzNdq9uo0xBn3lALom8XWaR6snyHhaO
	0uG8VkLZdLKxTbp1iFAM/X+uL8TmB+YCiSFJUVsY93pTC46bEkwRoMWHX7Z1FQW1cnzw
	WfDA==
X-Received: by 10.15.36.135 with SMTP id i7mr61374551eev.34.1366024942792;
	Mon, 15 Apr 2013 04:22:22 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cd3sm26350637eeb.6.2013.04.15.04.22.21
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 04:22:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LakpuA=dRgETNpqMh59AXmc+-2uEbfo2q-spfzqaB5z9w@mail.gmail.com>
Date: Mon, 15 Apr 2013 13:22:22 +0200
Message-Id: <B557195F-91BB-4812-8D80-ECBD8BADB753@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
	<CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
	<CAJTo0LbfDu6bOAPYjd3ohzZJcvPDmYiT4RcUhZC9JXkQB6dmOw@mail.gmail.com>
	<053E167B-AF9D-4E0B-B8D8-D518096D2C49@dominion.thruhere.net>
	<CAJTo0LakpuA=dRgETNpqMh59AXmc+-2uEbfo2q-spfzqaB5z9w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQn2eO3KUEOIr7Y00Y2RzLqE4ycZYK1UbBO45pdp/+4fUIiBw7IaLb8wli+35a7YcIjF8l+i
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 11:39:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 13:05 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 15 April 2013 12:00, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/mo=
unt&id=3D1fc11cc25938b6a0c1e9b69a30326de8608cb98f
>>=20
>> Do you have an oe-core patch?
>=20
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/patch/?id=3D1fc11cc=
25938b6a0c1e9b69a30326de8608cb98f
> will apply to oe-core just as well as it applies to poky.

'git merge' was very unhappy with it.=


