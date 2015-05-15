Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4108C73FC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 10:21:22 +0000 (UTC)
Received: by qkgw4 with SMTP id w4so26722566qkg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 03:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=75zn012UKhASIlJL/yR3UyUniA9v0imsBHmnxfbbGcs=;
	b=cYC9b+R0GLmQuf832O1RIW1oDpXTHWsPULjZxEcjiuPWwP5YJL7wlKhf79ZuXS0a7F
	7R+oy07Zdbu06mwlZDqsP9lWIo4M55se/miproWuK6prjY4X3iKPMGJ6ed8nrCddiCUU
	r+V52pM2qMx/tvOpTPRJcSwBXnKGvT/hEvW281C+rgcIwM11eSIEF623DCbJFl2iSu4t
	BzGaitVWkzpvVhRE80lB9AWa9eavK3AZB5RHOjRRXE1LtSEuOPSOvcGvYQgBpaZJv4th
	iwAAPO4z4LdEPwwRuM8LuwH09R3QzWXuitKeGJZ9X4XwHeJPjSp3EJ6ZNCo5jDrw/6g3
	H9Iw==
X-Gm-Message-State: ALoCoQmDw9Vo6Z1zawGcwm71wx/Ho2s2x0LsJcvbtEm92kS+/FviLseVluZR+Du5fHYjPQLnHbLh
X-Received: by 10.140.88.35 with SMTP id s32mr11140552qgd.59.1431685283583;
	Fri, 15 May 2015 03:21:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 15 May 2015 03:21:03 -0700 (PDT)
In-Reply-To: <5555C780.5090905@opendreambox.org>
References: <cover.1431333085.git.liezhi.yang@windriver.com>
	<d81cfb100f102438213c54a72c1f412323a80dd2.1431333085.git.liezhi.yang@windriver.com>
	<CAJTo0LZ40TNQ4NiFKChiYikMsyKN3hUyZ9GjhezVeEtSQqSeVQ@mail.gmail.com>
	<55516887.5080908@windriver.com>
	<CAJTo0LYsOyP27CHxMvy87fgU=+YhMREtfbodMSv4o+C4jgh1_g@mail.gmail.com>
	<5552A982.3090100@windriver.com>
	<CAJTo0LZTnpZ6jkWO1aQFSVK54g=0wOaSLUFUVkwcu2iqbjXTFw@mail.gmail.com>
	<55544886.4040206@windriver.com> <5555C780.5090905@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 May 2015 11:21:03 +0100
Message-ID: <CAJTo0LZy5xkAk_Yrtm4KFc90EJ+uZpassNj-QrPVpban9bj=aA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] xserver-xorg: disable xwayland
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
X-List-Received-Date: Fri, 15 May 2015 10:21:26 -0000
Content-Type: multipart/alternative; boundary=001a11c11d02c22db105161c3445

--001a11c11d02c22db105161c3445
Content-Type: text/plain; charset=UTF-8

On 15 May 2015 at 11:16, Andreas Oberritter <obi@opendreambox.org> wrote:

> You don't need a conditional here, because empty packages get ignored.
>

I should have said that I fixed that when merging it into MUT, so there's
no need to re-send Robert.

Ross

--001a11c11d02c22db105161c3445
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 May 2015 at 11:16, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=
=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":tk" class=
=3D"a3s" style=3D"overflow:hidden">You don&#39;t need a conditional here, b=
ecause empty packages get ignored.<br></div></blockquote></div><br>I should=
 have said that I fixed that when merging it into MUT, so there&#39;s no ne=
ed to re-send Robert.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11c11d02c22db105161c3445--
