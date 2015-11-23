Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id A0984601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 21:18:42 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so37993412igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 13:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mQHHvEwgVlh1SVF1el0Gx67KEJkoWjHIo69uZ4AU6JM=;
	b=WvD7QkH2yAIoZ8goEV4hQe/gxpfms/R6o+BTKth2PmFKpfgwRz91XNnP9QudCfFWuX
	EUFt6nfJDycqCHjhKHZwDQ2eylX5iANzQZls4CFT2JwX4wBXRqukQ/2/4qX0bf/qPMyt
	RsTyzy4XVpn/r6DR1O3jk09zDvQA8+MpdI9S0LP/tEmMse6YL2+Vy602D0+uNolSoG6m
	ENU7uUZOi2dXY5y29e3xBhQbqqL+4vsjvheV1Ju2YIzdn8h5/gXqN87g4y4xVBf163jQ
	0OpjL/fboldvdScX+WwujVF6gPaBJfY466x1hvFMNph1mWqCmikG+ycVU7i8Ii117zOC
	lQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mQHHvEwgVlh1SVF1el0Gx67KEJkoWjHIo69uZ4AU6JM=;
	b=Hac/MPWvwtvO2z115CdN0H5cwQVb02E83quY0FKj8GJqxFpVLFqMT4yDxcslDl2deh
	yxxNiJDMm+12mpQV63HYejGwONxKxNst3ctsdwP4K6ulCLKRAdmnUR1yo0R7pYYtJFID
	4ShXlimM4nZFckCJXSJqzLTke/Ab9Iu76D5car1MB/+LYiegzWFm7SE1nvsDYA+eP8I2
	GcqHGf0fdNoZpYda0aNv9H7l72v9m/l9UE/09aq+8TPKndL7GgRgZlexlc3aJAHtQlpo
	VS9Uj5il4xu352gijm1QoyN/40yj685J8R4hVhgmT0pOZaU8SgQfq47Pq515Z7VKRibL
	f5wA==
X-Gm-Message-State: ALoCoQnIVg+gDh/+8C5nZu2CyaNzBzmd2lHasoX7KXM4Ef/VmpIOUqIpYz4lEX79pJYdVE19nVDp
X-Received: by 10.50.2.99 with SMTP id 3mr6615378igt.78.1448313522880; Mon, 23
	Nov 2015 13:18:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 23 Nov 2015 13:18:23 -0800 (PST)
In-Reply-To: <1448271748-3210-1-git-send-email-liu.ming50@gmail.com>
References: <1448271748-3210-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Nov 2015 21:18:23 +0000
Message-ID: <CAJTo0LZOKv0S2-JAb_6goEt6OUetxyB3C24FZpVQyv+RKExTEQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] initscripts: do not save timestamp for readonly system
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Nov 2015 21:18:44 -0000
Content-Type: multipart/alternative; boundary=089e0122e6e80e52e605253bc5fd

--089e0122e6e80e52e605253bc5fd
Content-Type: text/plain; charset=UTF-8

On 23 November 2015 at 09:42, Ming Liu <liu.ming50@gmail.com> wrote:

> +[ -w /etc/timestamp ] && date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
>

This would fail if /etc/timestamp doesn't already exist.  I'm tempted to
say you should just 2>/dev/null so it tries and the error is hidden in case
/etc/timestamp is deleted on a writable file system.

Ross

--089e0122e6e80e52e605253bc5fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 November 2015 at 09:42, Ming Liu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2gp" class=3D"a3s=
" style=3D"overflow:hidden">+[ -w /etc/timestamp ] &amp;&amp; date -u +%4Y%=
2m%2d%2H%2M%2S &gt; /etc/timestamp</div></blockquote><div><br></div><div>Th=
is would fail if /etc/timestamp doesn&#39;t already exist.=C2=A0 I&#39;m te=
mpted to say you should just 2&gt;/dev/null so it tries and the error is hi=
dden in case /etc/timestamp is deleted on a writable file system.</div><div=
><br></div><div>Ross=C2=A0<br></div></div></div></div>

--089e0122e6e80e52e605253bc5fd--
