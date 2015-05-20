Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 791C5601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:27:32 +0000 (UTC)
Received: by qgfa63 with SMTP id a63so5666374qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=58KZiMOAV46KnsiVpwpYrfSXhyXJCMLRm830EPeaw04=;
	b=RY3gKEDZvsfS2+4xhTWncvZfHtG6NMAktPIZkZIlkajl/wrefW56WJDOZWucuNlAZ+
	lcrDr3mzF/XQ1km9Y9TaRw0zsAxGpCrYSNMkqzMAQYJUGJSF2YU2yS3yT11s63HmRjx4
	XWojgg57Pu8hlVBFn34M+bCtIwwFlJPhy+Q8aWlQS9qmGzTO0GfjZ7qfHNzAZUaNgDJe
	vF0pknBoKoYVGz51BUzR+UA7O+If7Dq9so7DveUIm4PS5Yvvw5p5RO8YAuOR8WJjQ7D5
	4nC9KQv4Wylf27hecLd82onSPA4PGrSS0loDZ3yLwKl/EYarF3LDn8hiGoQBFngyGj2v
	0vJw==
X-Gm-Message-State: ALoCoQlhPQXvwSs/phnC6wW/xQeNop6HA0GSg47qOd6EiyHDDh8VoZLff3G+sszsw7Jo8NuCO4bc
X-Received: by 10.140.235.77 with SMTP id g74mr46750005qhc.64.1432135653847;
	Wed, 20 May 2015 08:27:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 08:27:13 -0700 (PDT)
In-Reply-To: <555CA719.5080508@linux.intel.com>
References: <1432064457-15895-1-git-send-email-ross.burton@intel.com>
	<555CA719.5080508@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 16:27:13 +0100
Message-ID: <CAJTo0LZPQT4VxQ79UVaKvpT0motZ_2+kOr7KtD15ez=kaHh_Og@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] midori: fix build with GLib 2.44
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
X-List-Received-Date: Wed, 20 May 2015 15:27:37 -0000
Content-Type: multipart/alternative; boundary=001a11354a00eb0dd80516851080

--001a11354a00eb0dd80516851080
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 16:24, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Midori is already at 0.5.10 upstream; if it's compatible with the webkit
> currently in oe-core, maybe it's better to update to the latest version?
>
> When the new webkit patches are ready, I'll definitely pull in the latest
> midori as well.
>

The precise cause of the problem was a bit of a mystery to me, as the
autobuilder was failing in ways that I couldn't replicate or understand.
Because of this and the failure being one blocking master-next from being
merged I opted to fix the immediate problem instead of doing an upgrade.

An upgrade is certainly due though.

Ross

--001a11354a00eb0dd80516851080
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 16:24, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":nq" class=3D"a3s" style=3D"overflow:hidden">Midori is already =
at 0.5.10 upstream; if it&#39;s compatible with the webkit currently in oe-=
core, maybe it&#39;s better to update to the latest version?<br>
<br>
When the new webkit patches are ready, I&#39;ll definitely pull in the late=
st midori as well.<br></div></blockquote><div><br></div><div>The precise ca=
use of the problem was a bit of a mystery to me, as the autobuilder was fai=
ling in ways that I couldn&#39;t replicate or understand.=C2=A0 Because of =
this and the failure being one blocking master-next from being merged I opt=
ed to fix the immediate problem instead of doing an upgrade.</div><div><br>=
</div><div>An upgrade is certainly due though.</div><div><br></div><div>Ros=
s</div></div></div></div>

--001a11354a00eb0dd80516851080--
