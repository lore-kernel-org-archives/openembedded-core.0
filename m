Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URlUN-0000dI-Po
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:38:42 +0200
Received: by mail-ee0-f43.google.com with SMTP id e50so2269569eek.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=wc5XW3Ujg8QGuWjZKA9F6oaBf4hloBa3XdC1n+ODNYM=;
	b=EkfNtk+d0kLFiPuxjzg4W56ZpnRqEz7MRFongbHxG322zta8huNOSfAt2hhnkrewKD
	GAcEf9BzEN6PZXM5E+OA3bHq2orXtqArxFeiMu4IsGoGMhRzcLzKI7cqGDq3bfwqHjMG
	UPxOoAEVfIp902+T9klK4ZwCZNlAoHddL0/Mos+H9tivx5BjpVK95Vrhdg4mGlOFqti1
	zPt9olhoqKqVBh7TqnzqkICjTO9jmnbNMMfxF8MJtZOwGxiSWD/ZhsgGLkH3VbeqEP3N
	AMZMFR3P8DLmp2X7Tdd1fczuDPxKi9U1wJnKw6DdiqGuAgWReLmzxzaSE14hLcMl1q2l
	CHKA==
X-Received: by 10.15.31.197 with SMTP id y45mr62935942eeu.18.1366039271068;
	Mon, 15 Apr 2013 08:21:11 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id u44sm27390942eel.7.2013.04.15.08.21.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 08:21:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0Lbcv-GkQs-PWoW3mtJWzfp_WuNbwU=A1NVd9R7-=uF0tQ@mail.gmail.com>
Date: Mon, 15 Apr 2013 17:21:09 +0200
Message-Id: <66033B10-A10A-4660-85F5-D06E1B9C21D7@dominion.thruhere.net>
References: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Lbcv-GkQs-PWoW3mtJWzfp_WuNbwU=A1NVd9R7-=uF0tQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnGtkt56nKCsZE+M/rv+F9Tth+CcmS2VUE07DDV9k5xzjAb0j5kDmLyBv+ccRJzdR3mP8Pw
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
X-List-Received-Date: Mon, 15 Apr 2013 15:38:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 17:16 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> Hi Koen,
>=20
> On 15 April 2013 11:12, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> In the original udev and systemd updates these extra conf rules and =
scripts where removed and moved to a different recipe to avoid pulling =
them in by default, making them opt-in. The systemd merge into oe-core =
regressed this into making it impossible to opt out of it when using =
package feeds for upgrades.
>=20
> What udev updates are you referring to here?  The udev in oe-core has
> RRECOMMENDED on udev-extraconf since 2008
> (fc128ab1e4fec27d44cebfa690a9bc233eda0caf) and I don't see a udev
> override in meta-systemd.

The udev in meta-oe, I never used the udev in oe-core, it was very =
outdated and had all the weird dependencies like extraconf.

> Dropping udev-extraconf from udev is rather invasive for a post-freeze
> change considering how much it will effect.

I don't really care when it gets applied, I can always carry the patch =
in the angstrom 1.4 tree.=


