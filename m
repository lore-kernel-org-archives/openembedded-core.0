Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StdG8-0003vw-4y
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 13:26:42 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Jul 2012 04:15:06 -0700
Received: by yhpp61 with SMTP id p61so5902255yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 04:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=jeXCi8QQ5X0xVbGXu15wkZF/tNHdhnOgvWqZKGnRG08=;
	b=AoJ32tY9SMVsJi/xgW0xRKouXzYA3ha7XvU2GN0/ltd8qOZ3EadyG94U3Kg8OD3qZ9
	xPYIShkdVqWfJCz0mp0tN9B8XT+/8NzhwXvzEoVqgyytvqCs2dAvjvdUgIzfwysMrpE4
	Qze70hA8hgjs9lBw7g4NEnqPzAvRtYMQ/rYO3xQuXO5+4QJ468Q8oulk9dqW2vpjc49J
	ixWD/UaUPccDyr2ErZPVvhw6rBOLfiUA+kP8OgBgugH71jGKznF0MnfQGO/2gnjwgTVy
	LENhVtOK/YTtRnjeyXA3TXS/qQrHWWwpGs4WRBZS72fWWqOLTcyCTJuUBHAIq4OurGVI
	/8pw==
Received: by 10.42.38.83 with SMTP id b19mr14398952ice.10.1343128505588; Tue,
	24 Jul 2012 04:15:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Tue, 24 Jul 2012 04:14:45 -0700 (PDT)
In-Reply-To: <1343108218-7108-2-git-send-email-cristian.iorga@intel.com>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
	<1343108218-7108-2-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jul 2012 12:14:45 +0100
Message-ID: <CAJTo0LbP6AhnPAUjxQ7i8Gjgxjvz-wA2Yv6cFdMb6481xd_wJg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmR8zVR/Klp4Hl/KW66oKip9kq3nZw2NteFMg3RpBbA16KyxnY/QY+VHxViowovb6pVwmbM
Subject: Re: [PATCH 1/5] telepathy-glib: upgrade to ver. 0.19.4
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
X-List-Received-Date: Tue, 24 Jul 2012 11:26:43 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2012 06:36, Cristian Iorga <cristian.iorga@intel.com> wrote:
>  rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.2.bb => telepathy-glib_0.19.4.bb} (80%)

I only just noticed that we're shipping the development series of
telepathy-glib, which is a bold statement.  Telepathy follows the
GNOME versioning, so even=release, odd=development.  For telepathy,
development really can mean it -- new interfaces and aggressively
increased dependencies are quite likely.  Once 0.20 is released it's
probably best to stick with stable releases.

Ross


