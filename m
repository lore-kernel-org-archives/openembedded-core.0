Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UX6vQ-00066o-FW
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:32:42 +0200
Received: by mail-wi0-f182.google.com with SMTP id m6so285822wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=bbY3UmghbdbgJX3zt+lI1WqpgxtaL473CkAJCDZOZF4=;
	b=Gir+F4NW3OR1Ep72uDENFkV+qNdwm/BGrRY7XtNRIXwtFHjJL6CXrGEn8PVSG0YsmO
	/+xQiPrDRf4187wWXxVd1yefVU1+jdfdtR/cEWAqo7iBG6Nj2Pm+G/NWv4TadJms0Ho2
	LMWtFe1jO4kkrMuexUXxnbytRHEcMb3ZAmvJ+zQ892q69dwNxDC9P1lqMkAPOFQIh8f2
	n19APkexwSr0FYeYOAn9CyFvUutdf1k+PqoIyqInD6IrGtaRDj/6ewpHBldo3MvVXjAa
	h6LMyzTAyBPMz/gg3bBNR8VrORk4lu+dMTyKkzmw9M3Lhd+5+TmQXKy2dtvY5eARMjG+
	l72Q==
X-Received: by 10.180.77.12 with SMTP id o12mr8434030wiw.0.1367313290313;
	Tue, 30 Apr 2013 02:14:50 -0700 (PDT)
Received: from [172.20.0.3] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id fz3sm27625292wib.0.2013.04.30.02.14.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 02:14:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0Lb-RNvd85JO6O0iTZSiuJ3HMe6=rpGdgqa4QF4Xv0SE_g@mail.gmail.com>
Date: Tue, 30 Apr 2013 11:14:48 +0200
Message-Id: <F1511140-B61E-4A53-83DB-8B4E494CEA75@dominion.thruhere.net>
References: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb-RNvd85JO6O0iTZSiuJ3HMe6=rpGdgqa4QF4Xv0SE_g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnIULZkUVG099IemUXJXEnuBq9Yj+W377QvE3SWIC6HsYG99cbdKgAqHH2GLsZlmvAN8Mia
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: do not recommend udev-extraconf for udev
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
X-List-Received-Date: Tue, 30 Apr 2013 09:33:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 apr. 2013, om 11:09 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 30 April 2013 08:31, Andreas M=FCller =
<schnitzeltony@googlemail.com> wrote:
>> * adding this extra functionality is an image- or distro-decision
>> * at least automount-rule/script breaks other automount solutions =
causing
>>  misleading kernel messages as 'VFS: could not find a valid V7 on =
sda'
>>=20
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>=20
> If you're going to do this, please also do udev at the same time.

http://patches.openembedded.org/patch/48183/=


