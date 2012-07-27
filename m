Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SuhZB-0000xx-2n
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 12:14:41 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 03:03:07 -0700
Received: by obbuo19 with SMTP id uo19so3534356obb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 03:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=1RSP+vcXbVJ09Q2OfAHh+qLncSuV68C44HVR+L6nYww=;
	b=AVy9YPJQITHCP0XdGjBB6Hqs1T05cy8NUtdnE+6IA08FN3RUxSdryhU8uGTYf570BW
	sCuzMTC3bNS+UH48jzjjY3D4ozhGzuR/s+4IsvthgJrr1FQrLHJh7PCtaOvEqUeaoEed
	3aqoW5lUC8lNux6zrG+up3RPLYO+qzteT1ncyFyykELvUJFTOo7ZgmQMhzaXPwUiok4+
	MUy1XD/7wlkZi+lf1E5p/1g+oRIu1L18c0d8BtLJp+WeRwlitNXGn02GFVT9H8CxM4te
	Ya5zn8VkjsTbegTVDzVAy2s1gb2h4sBiJuhoHCKVAXPDsKUzpsuVsOypJA2TupiicIIz
	S9/A==
Received: by 10.60.2.99 with SMTP id 3mr2789148oet.20.1343383386833; Fri, 27
	Jul 2012 03:03:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Fri, 27 Jul 2012 03:02:46 -0700 (PDT)
In-Reply-To: <501230CF.6090000@intel.com>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<lyipdavezy.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LZKHiL75khHuircKy7Xv0aVW29DJjGaCSxXh+K1p6F1oQ@mail.gmail.com>
	<501230CF.6090000@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jul 2012 11:02:46 +0100
Message-ID: <CAJTo0LaYBnXtHs7ST+HhzSNaTopyxBe3d05YSmwJ6L3e=Yj+aA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnb9Z6IyqzUWYacgh7iGJGuJ4HLtHHzJdQ0qKBkNu/449nONZLyWjzuqOFSkzJJum8OQKb7
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Fri, 27 Jul 2012 10:14:41 -0000
Content-Type: text/plain; charset=UTF-8

On 27 July 2012 07:10, Radu Moisan <radu.moisan@intel.com> wrote:
> I've looked into the configure script and found that autolaunch feature is
> depending on x11, in other words using --with-x/--without-x implies
> --enable-x11-autolaunch/--disable-x11-autolaunch, so I guess the initial
> EXTRA_OECONF_X line will do pretty much the same thing.

Using --enable-x11-autolaunch (and --disable) make it obvious what the
intention is, and is the option exposed by DBus.  --with-x is an
artifact of using AC_PATH_XTRA, so if dbus decided to use pkg-config
to find the X headers --with-x will disappear.

Ross


