Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 23A0C768AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 16:22:55 +0000 (UTC)
Received: by qged69 with SMTP id d69so120772443qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 09:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mNte5fnqwFhFH5ZlxGv1RQkqaeKqwJ21Dqc9MF74bD0=;
	b=BzYkvEYCggJUYZgJJnIgu9TQBhC91YaHZ9T6bXKzmWclIXK9I+gUtjwhBOrbhj6Bl4
	/mSJSq+Xc6ekF0ls3J4sKj3VqCeFhCoPLlzLYXb6zzM5AfbGjuJ+1bGZkix1VXTB1xU9
	WMrcgBqH47akcj3ihwoYwrGan8i8bu2oMsUrQRYk37nGzRkvsnHfEi9LCn4xYBNyM8Mw
	S78YaKe8Olli4Vg9pxAZNb5RXYiLq5Vg7IS4aptv4fgEy372uMNgHM9p544Q/s5avJks
	qtp72pAWnqnV/qDSRQd9FrxhYDgiimDmWevUoUiddKCD1nw4WjFbXifZg0cC/P9do3t9
	n2HQ==
X-Gm-Message-State: ALoCoQmnbfhXLUCi2tGDwV2HRitGngCJbMqaJg/up3640W7PIvX+Gr9pwOGGJHg1CIw5rPxozyu5
X-Received: by 10.140.18.227 with SMTP id 90mr1621680qgf.59.1439223775377;
	Mon, 10 Aug 2015 09:22:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 10 Aug 2015 09:22:36 -0700 (PDT)
In-Reply-To: <1438978727-2172-2-git-send-email-raj.khem@gmail.com>
References: <1438978727-2172-1-git-send-email-raj.khem@gmail.com>
	<1438978727-2172-2-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Aug 2015 17:22:36 +0100
Message-ID: <CAJTo0Lb=YHJ5LQs0LbUWkWom5Trey9T-yXazDy-meUQX2Jn7YA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gnu-config: Update git version to latest and use it
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
X-List-Received-Date: Mon, 10 Aug 2015 16:22:59 -0000
Content-Type: multipart/alternative; boundary=001a1135535ae25279051cf76534

--001a1135535ae25279051cf76534
Content-Type: text/plain; charset=UTF-8

On 7 August 2015 at 21:18, Khem Raj <raj.khem@gmail.com> wrote:

> its GPLv3 with autoconf exception but the GPLv2 copy of recipe
> is left in as well to not break non-GPLv3 builds
>

As the files in this are only used to configure the build, could it be
whitelisted to allow it to be used in a no-GPLv3 build?

Ross

--001a1135535ae25279051cf76534
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 August 2015 at 21:18, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1zz" class=3D"a3s" style=
=3D"overflow:hidden">its GPLv3 with autoconf exception but the GPLv2 copy o=
f recipe<br>
is left in as well to not break non-GPLv3 builds</div></blockquote></div><b=
r>As the files in this are only used to configure the build, could it be wh=
itelisted to allow it to be used in a no-GPLv3 build?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135535ae25279051cf76534--
