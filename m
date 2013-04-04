Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNmEw-0000DY-Qv
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 17:38:15 +0200
Received: by mail-ve0-f170.google.com with SMTP id 15so2760925vea.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 08:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=yQgivLlqCfOKrnkpVCckfp0BY9Bk0heut6O/CpEjBNg=;
	b=anYR02nKXea7Eh6gvEWN9jH0dr25QdsL4FUsJfpgCjTfxR/5AlCcxEquQH1oyNqaV0
	w5kZaEoO3wFRKTBmyre4/LS9PuYJ7GrUUjLqUEDGj4URewOX835LDOdnvw38/8fAqs7+
	s/OV6FJJefGqGKm6pAL/zo967mIm9IN1xIvNoQUf0SfiMqXxTZTy01+AEvUiFg4vhXYq
	uBQtxIdemqPH7LpDquPTYIQHZfkXEoT5zN0jjGcE4c9hSDEXGKhHr+TAQAT3KrdYUX3F
	RpNHLVWhwr9TeMu6N4q/kvryBO6PrqabDjPEnOxrgle0uxeHrAJ3NQkLSbAcZZY4EVyL
	Sr3A==
X-Received: by 10.52.97.131 with SMTP id ea3mr558833vdb.71.1365088861713; Thu,
	04 Apr 2013 08:21:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Thu, 4 Apr 2013 08:20:40 -0700 (PDT)
In-Reply-To: <CALbNGRRguSWz2J5BLu58YfSMKX+N+Biw2qR4t3+4pyxQ7k7GPg@mail.gmail.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
	<AEA1C7AC-2089-4F6C-A23A-1D04827A55F3@dominion.thruhere.net>
	<CAJTo0LbHwtHjnBhGOtEKFVs2n-1P8CjR9AUiO5HP7vTpnS-0oA@mail.gmail.com>
	<CALbNGRRguSWz2J5BLu58YfSMKX+N+Biw2qR4t3+4pyxQ7k7GPg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Apr 2013 16:20:40 +0100
Message-ID: <CAJTo0LZ7-Hh+qAra=_sfsEyRfOHiog3TXnigirYgc0ryg5PVvA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQl7W+58smr2FFFy+llLsGpwBwqfa5ujmxR0UGbxfmrScEUwjBZU76jowXxGsBdAvk8F3GcX
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 04 Apr 2013 15:38:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 April 2013 16:17, Andreas M=C3=BCller <schnitzeltony@googlemail.com> w=
rote:
> On Thu, Apr 4, 2013 at 4:30 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>> In my world order, console-image uses the
>> default.target->multi-user.target as defined by systemd.  The gdm
>> package as it's a graphical session manager (like xserver-nodm-init)
>> should switch the alternative graphical.target, with a higher
>> priority.
> and lightdm-kde / lxdm / opie-login...

Sure.  So do we want warnings in the log for non-graphical targets, or
have to change the session manager recipes for graphical targets?
This entire discussion was started because there were complaints that
minimal images were producing warnings.

Ross


