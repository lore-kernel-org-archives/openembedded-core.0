Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id B36E560043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:22:59 +0000 (UTC)
Received: by obbhe7 with SMTP id he7so17583921obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 04:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SDLP1XazoBJp9jWR4ZjU7JObP61xHAy4tWHB9kLq6SU=;
	b=EJyVUQTBLSDRxF83kjNrfzO6TvWhMszFhTilymZ/IDIIuMnmBH6JI3rDUbrbKAiMfJ
	fg/stlCyNSQovztZA/Lfn7LXOWghaEl1OZlzjX69fH7Bjt9WGclRoVLjTwLWAbVfVbse
	EqAziHrjui/cCUgAJL7z3VvnRVrQm0oFdzI/J2SuoUHgzMJ8rxS5BqaSHNIR9l4Ge+zq
	iDGu6UEJTRWRPZTaNxQ9OgrKdiLpAI9rX1pKnEmTkypkhj1Nyi/SCYRSP440YzeI+kWs
	U771Gkt7RA+Bnya5ReHbWHTKaOynJ58IlLx+buXrbeJanMNj7MtkPaY5eOvDX2C3yS0d
	I2jw==
X-Gm-Message-State: ALoCoQn2JSUb1cwQ5/KI5G9K52BwuP7WpmgkV4V+jNfzZOrtJ8ZZFfzPcrafe89/jI+8CMDJAe9j
X-Received: by 10.182.112.163 with SMTP id ir3mr2155583obb.44.1440674579556;
	Thu, 27 Aug 2015 04:22:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Thu, 27 Aug 2015 04:22:30 -0700 (PDT)
In-Reply-To: <1440666743-12035-2-git-send-email-andrew.shadura@collabora.co.uk>
References: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1440666743-12035-2-git-send-email-andrew.shadura@collabora.co.uk>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 27 Aug 2015 14:22:30 +0300
Message-ID: <CAHiDW_E+9HLPzehoxvm2S6RUuRfy5mcgYqXEL69rrr-d2=U+mQ@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dbus: update the recipes to 1.10.0
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
X-List-Received-Date: Thu, 27 Aug 2015 11:23:01 -0000
Content-Type: multipart/alternative; boundary=089e012955768d46c7051e4930b8

--089e012955768d46c7051e4930b8
Content-Type: text/plain; charset=UTF-8

On 27 August 2015 at 12:12, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:
>
> Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
> ---
>  meta/recipes-core/dbus/dbus-test_1.10.0.bb      |  61 ++++++++
>  meta/recipes-core/dbus/dbus-test_1.8.20.bb      |  61 --------
>  meta/recipes-core/dbus/dbus/python-config.patch |  13 +-
>  meta/recipes-core/dbus/dbus_1.10.0.bb           | 177
++++++++++++++++++++++++
>  meta/recipes-core/dbus/dbus_1.8.20.bb           | 173
-----------------------
>  5 files changed, 245 insertions(+), 240 deletions(-)


Could you please configure your git so that it tries harder to find
renames: it's hard to see the changes otherwise. Something like this would
work in git config (the other option is renames=copies):


    [diff]
        renames = true


Thanks,
  Jussi

--089e012955768d46c7051e4930b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 August 2015 at 12:12, Andrew Shadura &lt;<a href=3D"=
mailto:andrew.shadura@collabora.co.uk">andrew.shadura@collabora.co.uk</a>&g=
t; wrote:<br>&gt;<br>&gt; Signed-off-by: Andrew Shadura &lt;<a href=3D"mail=
to:andrew.shadura@collabora.co.uk">andrew.shadura@collabora.co.uk</a>&gt;<b=
r>&gt; ---<br>&gt; =C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus-test=
_1.10.0.bb">dbus-test_1.10.0.bb</a> =C2=A0 =C2=A0 =C2=A0| =C2=A061 ++++++++=
<br>&gt; =C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.8.20.bb=
">dbus-test_1.8.20.bb</a> =C2=A0 =C2=A0 =C2=A0| =C2=A061 --------<br>&gt; =
=C2=A0meta/recipes-core/dbus/dbus/python-config.patch | =C2=A013 +-<br>&gt;=
 =C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.0.bb">dbus_1.10.0=
.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 177 ++++++++++++++++++++++++<b=
r>&gt; =C2=A0meta/recipes-core/dbus/<a href=3D"http://dbus_1.8.20.bb">dbus_=
1.8.20.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 173 --------------------=
---<br>&gt; =C2=A05 files changed, 245 insertions(+), 240 deletions(-)<br><=
br><br>Could you please configure your git so that it tries harder to find =
renames: it&#39;s hard to see the changes otherwise. Something like this wo=
uld work in git config (the other option is renames=3Dcopies):<br><br>=C2=
=A0<br>=C2=A0 =C2=A0 [diff]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 renames =3D true=
<br><br><br>Thanks,<br>=C2=A0 Jussi</div>

--089e012955768d46c7051e4930b8--
