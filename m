Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNlSk-0002LF-QY
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 16:48:36 +0200
Received: by mail-vc0-f174.google.com with SMTP id kw10so145494vcb.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 07:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=dFnnFtHG1OEIxsAUzYryhz/o0uWIvTUPs6qFovDFkiw=;
	b=ApbM2yhl6U/uC2YpPh37ASEHbh8Nt/W3uM7F+Vxu8YNXqf9XAJ7Tc8IRqhwhYBQGVH
	HRY9YEhbOeotZL+aglagwwuJIXwnmv6xZ9SqCMfZC9CuP6ZjsgXuIwJut4+wdVbu35gR
	hLjXccWKe6LqA94VNCVTtkVHb5ahHRhKnjX+j8waj7hMmEhSPBiSa5uQrtbC98phKbHp
	mCk49UblWJTFsqZ0QqtpsmQLTTmVTUWk4loGvlcMZT3hkcFpm6sm/qqh1oWNe7qbbg1c
	gpJxIJ1dJQYpdPgZC/92fVqFh+0DZ6tpu9aDfGpoiAdT3FWUE2TK6iG6IAt855Iag5U8
	8QGQ==
X-Received: by 10.52.74.102 with SMTP id s6mr4176859vdv.28.1365085873572; Thu,
	04 Apr 2013 07:31:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Thu, 4 Apr 2013 07:30:53 -0700 (PDT)
In-Reply-To: <AEA1C7AC-2089-4F6C-A23A-1D04827A55F3@dominion.thruhere.net>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
	<AEA1C7AC-2089-4F6C-A23A-1D04827A55F3@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Apr 2013 15:30:53 +0100
Message-ID: <CAJTo0LbHwtHjnBhGOtEKFVs2n-1P8CjR9AUiO5HP7vTpnS-0oA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl7E2RTVky8Z6nXo4EzVeoBwZG+b4NvhvsLj6a0NI+Y9S2uMzp7J0HlYr3zyUl8Ge53AKoU
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
X-List-Received-Date: Thu, 04 Apr 2013 14:48:45 -0000
Content-Type: text/plain; charset=UTF-8

On 4 April 2013 08:37, Koen Kooi <koen@dominion.thruhere.net> wrote:
> 1) console-image already using systemd, used as-is
> 2) gdm-image already using systemd, used as-is
> 3) console-image already using systemd, gdm will be opkg-installed at some point.
>
> What will be different between 2 clean builds before and after these changes and what will
> happen when I 'opkg update ; opkg upgrade' those image built before the change with ipks
> built after the change?

In my world order, console-image uses the
default.target->multi-user.target as defined by systemd.  The gdm
package as it's a graphical session manager (like xserver-nodm-init)
should switch the alternative graphical.target, with a higher
priority.  This will mean that both (2) and (3) will both boot to gdm.

Ross


