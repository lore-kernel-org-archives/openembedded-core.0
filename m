Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TznRU-0002Fy-4k
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 13:04:04 +0100
Received: by mail-vb0-f49.google.com with SMTP id s24so1758321vbi.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 03:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Y02nftSsbzEOggUQTOfwTAc4KQ4fx6zaBOE7hKkPm/U=;
	b=qk3G+gqlzh7VpCcl6wlZ+AOXyd8oODwNJMb5IBXDyr3QMqebEXor+gEvGB6oNB4Ioj
	BB9ghsOxXsFVOPjGw0jYhPYroE8OGbSCZGLYWqlwrUQQBmeQCVbJkbFVAqFvhG2v6hVf
	tuKVXJuVo/yabHXtEGYpN3HT9AQAeaF5oiZIehHcIPlqNvNheGHBtIMh8mUeHaMKe+jd
	xTGK2fDAgnOw2spxz8aEbboOMVo22VKQm/BSiJanU97CkvfRAu37dpCNp3XwXaax8Lfq
	fcWrdmYZI1PPn/wplJMGFYTXfm3XiwxwxDyxTOLwWTMcjbXEdUNW1V2txy/ZYWNLHrZA
	DoJQ==
MIME-Version: 1.0
X-Received: by 10.52.76.170 with SMTP id l10mr12696882vdw.83.1359373705572;
	Mon, 28 Jan 2013 03:48:25 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 28 Jan 2013 03:48:25 -0800 (PST)
In-Reply-To: <CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
	<CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
Date: Mon, 28 Jan 2013 12:48:25 +0100
Message-ID: <CALbNGRSbLSf6oysR-EkR9ojsUNwhZLGfGg6P5Y1s2XKbFf5gYA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Mon, 28 Jan 2013 12:04:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 28, 2013 at 11:44 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 25 January 2013 20:26, Martin Jansa <martin.jansa@gmail.com> wrote:
>> ALTERNATIVE_${PN}-systemd = "systemd-def-target"
>
> Let's not introduce packages controlled on distro features whose sole
> purpose is to contain a single file.  systemd enabled -> units go into
> $PN.
It's more than that: postinst and companions to auto enable/disable services.

Andreas


