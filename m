Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UFK7Y-0007xl-Q7
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 08:59:45 +0100
Received: by mail-ee0-f50.google.com with SMTP id e51so2624101eek.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 00:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=SndtpDxOlqQw/qSUaEpS1vcglGzwB25I4iKcvvME/7M=;
	b=ljlGs/bKBqv1i3PBItqzW8gJLaX/U08VSgZNSko6cPaBF+1m5SM8H/o0hyAXHPCscH
	OSzd38O2Eu52ICXs6lxKNe/ZzrVM9U1TLGZtc713gmoEuUNKb5aPUtwQJ53gwv3jEwYy
	J1BwxnbFxpxsZwdMxz7hd6GM84ifkz/5GHVGALgxo72cBuJCdZDPHj4Syd3WXqdY0Wt8
	Ap66sLF4BrtXvVyLntT7jodcQrQpvQMpmSDQGgsQjyoOSEa53PADK9cd7p6oBgvUe/0n
	/12T6D6Ia3wih9e2cNFAp0HomKWlKUIyhBjlIUZWUGBHIDk8QhTMGBEVdbJh7IRBcUGi
	xBUA==
X-Received: by 10.15.101.204 with SMTP id bp52mr45337397eeb.31.1363074180822; 
	Tue, 12 Mar 2013 00:43:00 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4504:873f:60a5:8047?
	([2001:610:612:0:4504:873f:60a5:8047])
	by mx.google.com with ESMTPS id q5sm27957764eep.11.2013.03.12.00.42.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 00:42:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZiS3Sx8fKZFyiDWJ21csLiKhOvuJi4=qs16CQ+u1Doxg@mail.gmail.com>
Date: Tue, 12 Mar 2013 08:42:59 +0100
Message-Id: <170DF684-F55C-4065-8D24-0295044CB17C@dominion.thruhere.net>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
	<ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
	<CAJTo0LZiS3Sx8fKZFyiDWJ21csLiKhOvuJi4=qs16CQ+u1Doxg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnwYacjnKWe2rbfshJ/1E/VhCFAtjN9M4Y4+iQk4kuVmv6JxP8lIsbRM7jLskTTgNI3uCjF
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Tue, 12 Mar 2013 07:59:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 mrt. 2013, om 00:21 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 11 March 2013 15:49, Khem Raj <raj.khem@gmail.com> wrote:
>> using different init manager is a separate problem than what Ross =
tried to address here isn't it ?
>=20
> This series lets you do DISTRO_FEATURES=3D"systemd sysvinit" and it =
will
> build support for both in the packages, and then based on
> DISTRO_FEATURES_INITMAN it will build different images.

Isn't DISTRO_FEATURES_INITMAN more like an IMAGE_FEATURE now?=


