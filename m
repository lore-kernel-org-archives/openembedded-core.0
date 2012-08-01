Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SwaoC-0001BJ-M5
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:26:00 +0200
Received: by eaad12 with SMTP id d12so668666eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rlwE+ad9wRDihwEF53X+OAvq3Iq6d/hWm5gigOKmLc4=;
	b=b487VifO7rLHRU0e+KJehuBO6f4R5PZJFwpxryI3MX513A6DMhBofnchMA9um+8+TP
	4s3Hv6Faac+q0k1ASjDnU3Wt+dUrdkwrTuBM8zh86kfv4OfFhgRWHAYAutkL+0hu9DcB
	yDkaYI6rezP+gfrA4g8elVrvXwPMQY3Ink0FiAld8RGtfMYeQEakMIWCC9cw5qpk0mC0
	l5OHgPjUfJMlAxoJTHP6m+W1J7Gh4WNq+4rNQn0inVqXaztpJqnGVxoXIhgfJHbF+90R
	HBCx++nGXNNM4hPIGC12dUUwNmW1uuberldz+K3sLGYESsN0T1KoDLL6ao8MPha2jGV9
	tFpA==
Received: by 10.14.175.5 with SMTP id y5mr22514177eel.40.1343834062350;
	Wed, 01 Aug 2012 08:14:22 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a1b9:594:e8d9:e8db?
	([2001:610:612:0:a1b9:594:e8d9:e8db])
	by mx.google.com with ESMTPS id s8sm9702801eeo.8.2012.08.01.08.14.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:14:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LaTWibL0ep=H0UsLXrL9mrFroX6vVcQGW-1vySoDAX_sA@mail.gmail.com>
Date: Wed, 1 Aug 2012 17:14:42 +0200
Message-Id: <607356EE-A40D-42AA-9D2E-AF7991F8F013@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<6d27974b9045ca97ce135095a9d48715ac5bdc6c.1343823907.git.ross.burton@intel.com>
	<20120801124455.GE16306@jama.jama.net>
	<CAJTo0LaTWibL0ep=H0UsLXrL9mrFroX6vVcQGW-1vySoDAX_sA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmdkCAZ+CwKSn2ZuiIHi6memjs2S7NF6L2/GPHxTfvAek2NQut1Ces6JwSvtFEjjjsgdBFQ
Subject: Re: [PATCH 07/12] mesa: enable GLESv2
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
X-List-Received-Date: Wed, 01 Aug 2012 15:26:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2012, om 16:53 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 1 August 2012 13:44, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> +PROVIDES =3D "virtual/libgl virtual/libgles2"
>>=20
>> Shouldn't be this provided only for opengles2 in DISTRO_FEATURES?
>=20
> I've changed my mind on this -- gles2 is just another library so if it
> isn't used on the distro it won't be installed.

And shouldn't all this be a machine feature? Making it a distro feature =
is a bit draconian, no?=


