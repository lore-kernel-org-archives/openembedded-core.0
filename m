Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SV0ht-00087X-TZ
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 15:25:29 +0200
Received: by wgbdr1 with SMTP id dr1so1580353wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 06:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=xgRfxUTAvi6LyT5zyVxUuhKIajkL7Mr14otvH2MVI/U=;
	b=UrtVHdPhMW+8HPvNaHrnZy84657Hm7cVbGHBG+m1sVGtOU+/wFyk35ZG9BuvhspHcO
	RLyzLPNydV/KvvA1VAstAeozPwcH9tKAp2hKznwFYOOgoAvRu2zZaerUm9n0dF1f4rBp
	7FtvR8kT1In+NFY/L7xhuBn67OcjANQ5xQq52AMabL+8M9LufcxUEkc+wOX+9sxd5koD
	6pT0Ag4WLFEmX5EGQA9pyBcSZdLSGnCaMh7GL7t0D/eovy7rTusqM1LlBZKnhvvesMz+
	cUgBHp2IMas8FC/lC/1raHkyXqVQ1OQmluApDEE3d8TOVzNexlB0K/a0RlhdMWd2m4l8
	/DOA==
Received: by 10.180.84.193 with SMTP id b1mr38239980wiz.11.1337260527410;
	Thu, 17 May 2012 06:15:27 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n11sm20911543wiv.9.2012.05.17.06.15.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 06:15:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+jg_OWX_ZF5UzzoWDauZquixUFL41KJP9umZMuoA-4C5T3mWg@mail.gmail.com>
Date: Thu, 17 May 2012 15:15:24 +0200
Message-Id: <6563917A-5FE2-4AF3-875A-6D0964C7FCD1@dominion.thruhere.net>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
	<CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
	<CAMKF1so4jRESbLbG867ehEBRgJjh=nJcoLPsFjNtvC+tnCg=Og@mail.gmail.com>
	<CAP9ODKq51+a9UbXP9wdgRnP4_LtX+wPt=ujCL7iZptBQNhq92A@mail.gmail.com>
	<CAMKF1sq+aa+kEJ62g2CE_FQKLd-8_wVTks4CB5tQn43-4y8ZZw@mail.gmail.com>
	<CC134498-24AC-40B5-BDF8-1097E74A7FE9@dominion.thruhere.net>
	<CA+jg_OWX_ZF5UzzoWDauZquixUFL41KJP9umZMuoA-4C5T3mWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkCnjmJNSXkkunthHZe47EW51wGCDhRgu38/ABmqLezyUcC1ceu87v3wCXdgas2AIasbho9
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
X-List-Received-Date: Thu, 17 May 2012 13:25:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 14:47 heeft Daiane Angolini het volgende geschreven:

> On Thu, May 17, 2012 at 4:44 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>=20
>> Let's make a deal: new recipes will only be accepted into oe-core =
after sato has been removed from the oe-core layer.
>=20
> Ok, I understand.
>=20
> Could you, please, point me the right place/layer it should be =
included?

meta-oe=


