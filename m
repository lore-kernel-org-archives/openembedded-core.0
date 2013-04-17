Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1USZCd-0007W9-CW
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 22:44:02 +0200
Received: by mail-ee0-f44.google.com with SMTP id c41so972319eek.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 13:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=98hm6jwZ6UMh6roGHNOQ6SA9Df/aKFOOV05/8mM2y0U=;
	b=GoIpmv6yxWtlTH0oyQzh07yFkXs7gtsmWB2zYj64CBeI91oYg5f7U1HZlgsiRTO4pH
	N2I6k41eQFLgA+BLGh7FB+hZLMKUqL89GCgJ8gHd107zNdOd8TknMXcJFaj3QqGvmFnX
	IeSzqFQQKBHzyVridCaHkZLA/s7x03ydxCEqnH3jVKEZDxQt1hnf8h/dnxudBw5C4ZRU
	zJ6upr8scoBkiW+Kuib0bPzZreb8Vjr86twgVGdfOsVfyls+kbuw0Q48vu8ZHvcqDwlD
	1VONUE4k5CBdFWH7mpFNU3kw3Bpt6Q6LTHDIHLH12niBU+5d7K5Lyrdr0/COSMVPYSca
	O/lw==
X-Received: by 10.15.36.2 with SMTP id h2mr22192724eev.2.1366230367192;
	Wed, 17 Apr 2013 13:26:07 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id bk42sm11312588eeb.3.2013.04.17.13.26.05
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 13:26:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
Date: Wed, 17 Apr 2013 22:26:05 +0200
Message-Id: <98902250-F158-4566-962F-17153E77E39A@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlnX8FKH5+F8mq93a+dvka3EP2Va66VS/oqzl4rnIr8yh3MGZiOfqIfo/wKEeNV3NOgoAY8
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Wed, 17 Apr 2013 20:44:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2013, om 20:55 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 17 April 2013 19:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> I get a similar result here, but I have to rerun all postinsts with =
gconftool to make the packages actually work. I'll update OE-core =
tomorrow and try to get some more debug info. Systemctl says postinsts =
ran for 3 and a half minutes, a big improvement over the 60+ minutes for =
the same image built against 1.3.
>=20
> 3.5 minutes is still a long time, what packages does it run on the =
target?

According to the do_rootfs logs, the gconftool-2 ones. This is a full =
gnome image with a complete desktop and gconftool is *very* slow.=


