Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC046EF8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:22:06 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so527679eek.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 04:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=oZMAbP3grPj+ngzDsWAgSq53NXzGnO6bNRvt+2Q3LPc=;
	b=VGeLVJOij7U/1vwn+rv0zguj4mkc/YTKfP63dnTVF7Q5QqO+r3S+Xzhd9xejS1TqJd
	z6noR8HAbdgx/mXbnMDn8FjImwZhO7ZgMBYgH81ppeb52FuCDQX/RJ+6oXpaDv/JV7xw
	t2Sq6e7afNd1FJnLayicB3gx2XhUIqfKm+CbbVGmzVn3dZCv44zYMt+K2nM3OavLqC3m
	9xeltHuAEzulIBX7Sg8gtC8USaYyTB0WE61ed6EJDYUnHfp/9MUbgRfGHx9j8OCfGxTC
	bYzl8AiE/xi/+QFbj2guc5D1QwO43huLyw1QE5vNfeA/JKOBwNLAFKYplt+CH+V6NbbM
	mEvw==
X-Gm-Message-State: ALoCoQnXAOhVFTA6e+fqh42vWJTeGsu6YTPliF9q9vl/LVdSRrYMqtVEOBk+syACpWR0PabK8z/8
X-Received: by 10.14.209.193 with SMTP id s41mr896381eeo.108.1395314527731;
	Thu, 20 Mar 2014 04:22:07 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id o7sm3540247eew.25.2014.03.20.04.22.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Mar 2014 04:22:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
Date: Thu, 20 Mar 2014 12:22:49 +0100
Message-Id: <0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 11:22:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2014, om 11:45 heeft Burton, Ross <ross.burton@intel.com> het =
volgende geschreven:

> On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
>> +PEER=3D127.0.0.1
>=20
> That doesn't seem like a very useful default.  We also can't use the
> NTP pool by default, so this should copy the behaviour of the ntpd
> package in meta-networking and default to no peers, and not start if
> none are specified.

And the initscript is missing LSB headers.=

