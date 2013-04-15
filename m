Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URlgn-0001k5-V4
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:51:30 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so2342375ead.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Oj0qajba81CCRmDk13ej9d1lxZi/EkmIF8uzBHg5EVo=;
	b=L5pLlsKZZwyumYLgss0Dz/JbeJVxc0RAa+Ra9HL5zHV2JbN1P0OPnVi/pqfcKr3Oey
	DhEK7o+N0vqsAy2+mzBkEOaEx3/JvhDKxCB7Jcj4/tgEWPPDgy5W9+1iegjGVPiwG+l1
	ynGJ+aD9cLtlHuf+CLEQdvl4d+rgH10kcH5iHuDY2Z0GumzB1TZRhpVO2DqjAyv7/yqn
	5gF6IbIJsWH6jHlnZQjnvWuxMGnGGYCS3VBBaVwXhk1Mr7vOjb5PScfEaPPQ6e+4YTO3
	IPDtjzCpgLFwsPypD1KD8zZgt1viE5EGaHp1WVOifDAl3v0oIQk4jlYuAVzrY8FcXOsr
	GLuQ==
X-Received: by 10.15.22.76 with SMTP id e52mr63724024eeu.7.1366040041050;
	Mon, 15 Apr 2013 08:34:01 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id d47sm27429761eem.9.2013.04.15.08.33.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 08:34:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <341AED6F-8BBF-4203-B5D0-6F215C8E7F14@dominion.thruhere.net>
Date: Mon, 15 Apr 2013 17:34:00 +0200
Message-Id: <7733EEB6-0AEF-490A-8318-3EDDF091A184@dominion.thruhere.net>
References: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Lbcv-GkQs-PWoW3mtJWzfp_WuNbwU=A1NVd9R7-=uF0tQ@mail.gmail.com>
	<66033B10-A10A-4660-85F5-D06E1B9C21D7@dominion.thruhere.net>
	<CAJTo0LZWt2W2w5FvOcPsh5OnrGWcnFCR2mjzYDWCkq8K7etJ6g@mail.gmail.com>
	<341AED6F-8BBF-4203-B5D0-6F215C8E7F14@dominion.thruhere.net>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnJctL4iL4Kay/Lpp8ESqApoa8vUe414GbYmL+wDJAN3L1ttzJ+UqrQXR5fcnWkYi16zoqb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 15:51:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 17:31 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 15 apr. 2013, om 17:27 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:
>=20
>> On 15 April 2013 16:21, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> What udev updates are you referring to here?  The udev in oe-core =
has
>>>> RRECOMMENDED on udev-extraconf since 2008
>>>> (fc128ab1e4fec27d44cebfa690a9bc233eda0caf) and I don't see a udev
>>>> override in meta-systemd.
>>>=20
>>> The udev in meta-oe, I never used the udev in oe-core, it was very =
outdated and had all the weird dependencies like extraconf.
>>=20
>> Presumably that's been moved to Angstrom as I can't see a udev at all
>> in meta-oe now.
>=20
> It was deleted in favour of systemd.bb providing udev, angstrom hasn't =
udev the standalone udev since it was merged into the systemd repo.

=
https://github.com/openembedded/meta-oe/commit/f95109e3e04ee167fd0ceb80e62=
f7cfec81802de



