Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPa05-0005ab-Tw
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:58:33 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so2964965eaf.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Zn0FCTCm5pDVbTEv2i3Iw2Gzg6icZPaKcpwYR9pie8U=;
	b=pJR+2Bv3bFqHDeaahNIxjZlNGWMjIsRZP3s1ZSr5OzXhxKAiIXsjnd1rNIu+v0J60/
	PwZszL1dKdWJCbonlhidW5PmbDTFjNcEaoQG05UI0KlxkEUpWG8X/GuK/7MJ8FGRjZTU
	mHFl5wjgBcQGnEQRKItr8AEtW6mv3Lsd+U8sJVEqdjFGT87cucrjd20z19GloxkRizPm
	wXd8BHmW90qM6xQJwy5oxt5DGq0fe4VyarPJYfxosHLszkD0oPXzGp6hb0eifBCw/5fm
	ZO87fLhd9lEtfplrRs84J0qKhxY+iFB1rCLOCrC+8M9ntVAFI6TzSDdpQiptSTbL/jRF
	Kcgg==
X-Received: by 10.15.48.4 with SMTP id g4mr30624645eew.28.1365518461712;
	Tue, 09 Apr 2013 07:41:01 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a41sm4164822eei.4.2013.04.09.07.41.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 07:41:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKqEJCS56UaKT3M1cPpA-escn5f7d_kEBL2kasnLYN2avQ@mail.gmail.com>
Date: Tue, 9 Apr 2013 16:41:02 +0200
Message-Id: <3528EE5E-C07B-4EBC-83E2-B425A1DD5F22@dominion.thruhere.net>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<1365510909.12407.79.camel@ted>
	<CAP9ODKqEJCS56UaKT3M1cPpA-escn5f7d_kEBL2kasnLYN2avQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnmI7J7ghRja1kRHdDiT96GveJt6wDqIyCAHwtuQ1U0ipx5tm3gOa2dTE0DLm7ExYfuHFP3
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
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
X-List-Received-Date: Tue, 09 Apr 2013 14:58:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2013, om 16:36 heeft Otavio Salvador <otavio@ossystems.com.br> =
het volgende geschreven:

> On Tue, Apr 9, 2013 at 9:35 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2013-04-08 at 19:29 +0300, Radu Moisan wrote:
>>> Along with v182 upgrade udevd was moved to ${base_libdir}
>>> making scripts like init-live.sh to fail in finding udevd
>>>=20
>>> Fixes [Yocto #4046]
>>>=20
>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>> ---
>>> meta/recipes-core/udev/udev.inc    |    3 ++-
>>> meta/recipes-core/udev/udev_182.bb |    2 +-
>>> 2 files changed, 3 insertions(+), 2 deletions(-)
>>=20
>> We needed a decision on this. I've rewritten the commit message and
>> merged it. Most of the feedback was about the commit message, not the
>> patch itself. There were also no better proposals for how we could
>> actually fix the bugs we were seeing.
>=20
> If I read the thread right, it had two NACK's. So it wasn't a cosmetic
> commit log issue.

4 replies to the patch:

1) me asking about the commit log
2) me NACK'ing the patch
3) Otavio NACK'ing the ptch
4) RP mentioning other discussions

So 25% of the replies are about cosmetics, how is that "most of the =
replies"?




