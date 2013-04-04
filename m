Received: from mail-bk0-f46.google.com ([209.85.214.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UNmpA-0003T4-Gu
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:15:41 +0200
Received: by mail-bk0-f46.google.com with SMTP id je9so1602861bkc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 08:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=2/OAbhOi2eEg8grbTqUU3Rjhz5tQuJWcdLxyaTsHmAw=;
	b=jFXHCC4etz5WVQk07LzK4xwdJ8cnZHbbp1+lmjVBE5gi4AhJE0TBvtdFYrHOqhcTny
	x5PEn5WTcI+i7s4DGsKRyNjaWWRDFFKHMs9B3VYE+wWU0FQNmSViknsYMRPY1Jd0jB7l
	wp5LDxxYk+Jpvfcq0ZgLU+wdJwypgBwqWdYSpNJYfnS5T0M8lChXhR3fxAWs/QC6WOMh
	21gQqW5sCiBCqlzOj3WAZgV2MTFPhr/f2pqi6BANkACoSoKZ2ElWNKfj/9JeXY6iPG+B
	HvZsTOuZh9AoMMja+hReZQZdU7j59NgYIKgeWAL+a1gKLaBrZG3Tf5wUpnRcoVIeOTch
	m2DQ==
X-Received: by 10.204.109.14 with SMTP id h14mr4919978bkp.39.1365091107500;
	Thu, 04 Apr 2013 08:58:27 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id b21sm6449065bkw.12.2013.04.04.08.58.25
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 08:58:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbHwtHjnBhGOtEKFVs2n-1P8CjR9AUiO5HP7vTpnS-0oA@mail.gmail.com>
Date: Thu, 4 Apr 2013 17:58:25 +0200
Message-Id: <CD002F6E-9167-458F-9D14-34914161D745@dominion.thruhere.net>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
	<AEA1C7AC-2089-4F6C-A23A-1D04827A55F3@dominion.thruhere.net>
	<CAJTo0LbHwtHjnBhGOtEKFVs2n-1P8CjR9AUiO5HP7vTpnS-0oA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnfnbVult6jdaOfcIRnLJbRSWBA14ceOSEB369rpX4JQKQCXEaalG4Xsk4/xV+KGQFAOYP0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 04 Apr 2013 16:15:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 apr. 2013, om 16:30 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 4 April 2013 08:37, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> 1) console-image already using systemd, used as-is
>> 2) gdm-image already using systemd, used as-is
>> 3) console-image already using systemd, gdm will be opkg-installed at =
some point.
>>=20
>> What will be different between 2 clean builds before and after these =
changes and what will
>> happen when I 'opkg update ; opkg upgrade' those image built before =
the change with ipks
>> built after the change?
>=20
> In my world order, console-image uses the
> default.target->multi-user.target as defined by systemd.  The gdm
> package as it's a graphical session manager (like xserver-nodm-init)
> should switch the alternative graphical.target, with a higher
> priority.  This will mean that both (2) and (3) will both boot to gdm.

That sounds good to me.=


