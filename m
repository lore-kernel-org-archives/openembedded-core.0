Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6o0r-0006dr-BS
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 21:33:17 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 12:21:01 -0700
Received: by obblz20 with SMTP id lz20so1813678obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 12:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TDr6W2EZaVvgTiILnkwRXdh1od7LTl9wZ/FBjWlQJzY=;
	b=TiORPpZv4ziSUy7CYHrApMC2v3ATEtNyAsnEt071wy1NXhbIaDgGYA6B+vJRUVLY4h
	vN9HL4AQAVnzyR18+2pXavIis+F6qUY2p7xZCt3/bUo9EnBn666OfpdWjTGCIG0P8Vdg
	W9N6rB0869rHuO64+eo8dcysHTL4Oo7h7fI2Xgnr0PP87vFQNvXfbXQXNajurJdKSuJ0
	QNL/oKxHLcoxBG8Pho//r+R/RYU0AkIgrYkr2gn8/kmHti4ssXdXvoixZO4oXLIvPj/W
	308h86NMUn9ZIXXY1RsUXIQx1qp/yXxSiR5YwQUaAxKlf3Rz85UBcUWMzityBdtwQeTZ
	5IPQ==
Received: by 10.60.19.132 with SMTP id f4mr2349827oee.17.1346268060883; Wed,
	29 Aug 2012 12:21:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 29 Aug 2012 12:20:39 -0700 (PDT)
In-Reply-To: <1346267538.4396.38.camel@x121e.pbcl.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 20:20:39 +0100
Message-ID: <CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQleKM6gWebaFAZ3hAV5SiuPSBcAjD+0WR9MIhZNCdMA4FH6aJIw9QtTzR2sAQgfKjFjbhfB
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 19:33:17 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 20:12, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-08-29 at 18:31 +0100, Burton, Ross wrote:
>> Sounds like a lot of extra work when the choice is fairly clear.
>> Either we don't support split file systems and mandate initramfs for
>> network boots, or we do our best to support it.  With a decision on
>> that the choice of cp vs ln is obvious.
>
> Even if the TSC decides that OE-core ought still to offer the option of
> split /usr, that doesn't necessarily mean that all distros will want to
> take the option up.  Ideally folks who don't want/need a separate /usr
> would be able to get a symlink rather than a copy.

Sounds like they'll need to write a tool to run after every package
operation and hunt out symlinks in /etc (and other top-levels) to
files in /usr and turn those into copies.  Anything attempted on a
per-package level will fail.

Ross


