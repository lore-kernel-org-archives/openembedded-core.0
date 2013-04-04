Received: from mail-ve0-f178.google.com ([209.85.128.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UNmBW-0008Gv-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 17:34:45 +0200
Received: by mail-ve0-f178.google.com with SMTP id db10so2747139veb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=CSh3xqiXzX9ePmShfwZSTzZshgarid5oVSc2BTrvUBQ=;
	b=fm2tzEQgwojGoQ79RBmByOJfnCPMoOtUcMemeK9TTt20foBPKs2OK8oqD3EkmBILsT
	eve1p77+asoBUhghKFiAOFvUdOsEG4E04bIhlC3ex8Dt0g9OfX75Kegb+30C0mFuvfiQ
	lcs3LUT/vXGWgxezKCueErwYVpTOSUuc9bDAf8fE7vr8PnPgfKmp4U16Z5N+5hX2ujBx
	isHrBoyidpyeJc/hsby3+OygxucnAwB5A+RKJdOVVr0XrPvjjHcm2qeJr+Btc46qWIGV
	PY7V/n8X2TUs3BTKQ0gD3aHx91JETh5PkCKLfow4A/ND34j3AuZCv5db9R8QfL81XM1I
	TiMg==
MIME-Version: 1.0
X-Received: by 10.52.109.5 with SMTP id ho5mr4301276vdb.75.1365088649747; Thu,
	04 Apr 2013 08:17:29 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Thu, 4 Apr 2013 08:17:29 -0700 (PDT)
In-Reply-To: <CAJTo0LbHwtHjnBhGOtEKFVs2n-1P8CjR9AUiO5HP7vTpnS-0oA@mail.gmail.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
	<AEA1C7AC-2089-4F6C-A23A-1D04827A55F3@dominion.thruhere.net>
	<CAJTo0LbHwtHjnBhGOtEKFVs2n-1P8CjR9AUiO5HP7vTpnS-0oA@mail.gmail.com>
Date: Thu, 4 Apr 2013 17:17:29 +0200
Message-ID: <CALbNGRRguSWz2J5BLu58YfSMKX+N+Biw2qR4t3+4pyxQ7k7GPg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 04 Apr 2013 15:34:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 4, 2013 at 4:30 PM, Burton, Ross <ross.burton@intel.com> wrote:
> In my world order, console-image uses the
> default.target->multi-user.target as defined by systemd.  The gdm
> package as it's a graphical session manager (like xserver-nodm-init)
> should switch the alternative graphical.target, with a higher
> priority.
and lightdm-kde / lxdm / opie-login...

Andreas


