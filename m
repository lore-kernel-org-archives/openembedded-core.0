Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TE06B-0002F1-Sh
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 17:52:32 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 18 Sep 2012 08:39:50 -0700
Received: by oagn9 with SMTP id n9so6314627oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=wcJJMdJZxR3PF5z00OUSvzdQ+zH0VdAe3KrKKk7gQ8o=;
	b=h14zrMwBQtHPfkTNQyASR4hdlhsKRxEJ2OFkAn65maaQhp7ZYDLMCNahRMbzNafvSM
	JXk58hBoigGv3Ggp04MZltFm0hp+XVWoRGlwERdqCGIf8hdUtMuhM499enn5sLCMO6Ua
	EgRTAfyhAj/FPfDQYGKJ+rycNrpHQwbYwoibKC3VFRQUci/8dlnf1GJTebSPW80K5ljx
	9oWY1Gm/ciBBXAlpMDobaJkQHgaYtyHQdDtJ26ijstgWEEZJwASaTMjCA6omb2zVWIRA
	csRsd1lz7dcq8OOz0sj25hdPugZlFS5tcP2rU+EaHjpoj2c3mHcMT2BjZTMsr6/YpYCA
	50og==
Received: by 10.60.28.162 with SMTP id c2mr463497oeh.3.1347982789840; Tue, 18
	Sep 2012 08:39:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 18 Sep 2012 08:39:29 -0700 (PDT)
In-Reply-To: <CAP9ODKoDtFJF+m9h2YGEvgjCYGTir4xHgP==NZAB+sPgEiCJkg@mail.gmail.com>
References: <1347962498-756-1-git-send-email-constantinx.musca@intel.com>
	<4D914278-5082-4B59-9162-CE561159AAF7@dominion.thruhere.net>
	<20120918152216.GD3498@jama.jama.net>
	<CAP9ODKoDtFJF+m9h2YGEvgjCYGTir4xHgP==NZAB+sPgEiCJkg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Sep 2012 16:39:29 +0100
Message-ID: <CAJTo0LYkBhODB+C-0p1O=ZCK2QjusORkr1MmGMVsZoaTxCwjHQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQkoJMzT/gn6EA086W7UlE3n0pOHrxehhXqplhc0A/big4L/4pC+53YMBPY85t/v5Xb86QeY
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
	Constantin Musca <constantinx.musca@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Tue, 18 Sep 2012 15:52:32 -0000
Content-Type: text/plain; charset=UTF-8

On 18 September 2012 16:31, Otavio Salvador <otavio@ossystems.com.br> wrote:
> It seems netbase needs to bump it's version so the RCONFLICTS can be like:
>
> RCONFLICTS_${PN} = "netbase (< 5.0.1)

But we're not upstream for netbase -- it's downloaded from Debian.

Of course it's so simple that forking it is an option.

Ross


