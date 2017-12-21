Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id BA2B478745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 09:09:08 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id d137so10047213itc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 01:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hzH5ADMRKI228EL2oQeNyucqnDoq+hlDm83yy39tyA4=;
	b=ahx1BnVFrlBLZsy6m6+ddb8BtRLzw4Oo5Qov1ChmNdh+MtyxWOaiYc7pgIdAZUGPVY
	eEAoAmAvo5d3bgMt8nHcaDp7S+wyguJ0tQT8daEfTMGXJTiOtMyCFCqikhE5x80cEKi8
	TmHOLQfUhGF+l25kxSLrI8uFdYUvesg3s9IzqAQGT1+JhlobVr3i+zJw1qgixhony9Lc
	XO1Xt/K945jisr372jAkzkJYq5q61Sj6QApMP53iip9uVc7GoijWtWvicxGBT8jHM1V/
	AvNlZ/ysfGgDvX9X9cwvlsDsPTL2nGN+uuNA3VHltOGlxWyJwNR3rLfMDKqcGaJsvgpu
	cSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hzH5ADMRKI228EL2oQeNyucqnDoq+hlDm83yy39tyA4=;
	b=Z33pA5BgVJM2GmSnq46YnwZ+friNK8KXy6Kpldis+XyCdMzhOztqI9QpVoiSYE/3s+
	0Gq8iSWE+aG9fiuR3dOw1ZsetvyndRt9LNRaBms7uD6VW1fVFAjC07EFYpu9z7UYJgZH
	SS2IagsJX0xmWGW4fdaLNC+cD+zTG7X4UAlJV2SkC97QDSEXxXJkTlLIsohn64GbnP2J
	OU1Ti4u3imxw6l/AxFWYhH3oQqJxA7t7PSLaGYqFEyaxUsCLXOP0VEkSsJCD8uRPiN/V
	IKscK3MY7C/BdhB9d8xaGC0szw3LotHoUshKGUIJKl9SFvAeC3V67YDjxJ3aOqsJC5hg
	sHDw==
X-Gm-Message-State: AKGB3mLwCGaH/qXkATKtiQhHNuhOLox8Z+5WD1vIaLgJloSAEY0Rgu0P
	OWzn/gRI1uSFEXg/30PCojtOCYT430KKjczVKAZrEw==
X-Google-Smtp-Source: ACJfBosKIA4VeyJnYoVulpcOaOi4DOUtkk7G3JMd7Ox0CSZgdj3riF6NVl0hTurkeu9rz/e3tC5WPWAAfQjO647ObAI=
X-Received: by 10.36.80.148 with SMTP id m142mr12139126itb.6.1513847349761;
	Thu, 21 Dec 2017 01:09:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Thu, 21 Dec 2017 01:08:49 -0800 (PST)
In-Reply-To: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Dec 2017 09:08:49 +0000
Message-ID: <CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: MS Windows machine?
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
X-List-Received-Date: Thu, 21 Dec 2017 09:09:09 -0000
Content-Type: multipart/alternative; boundary="001a114387b886ef100560d60d7f"

--001a114387b886ef100560d60d7f
Content-Type: text/plain; charset="UTF-8"

On 21 December 2017 at 06:40, Steffen Sledz <sledz@dresearch-fe.de> wrote:

> Anyone tried to cross-compile for MS Windows target with Yocto/OE?
>

Yes, see meta-mingw.

Ross

--001a114387b886ef100560d60d7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 December 2017 at 06:40, Steffen Sledz <span dir=3D"l=
tr">&lt;<a href=3D"mailto:sledz@dresearch-fe.de" target=3D"_blank">sledz@dr=
esearch-fe.de</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Anyone tried to cross-comp=
ile for MS Windows target with Yocto/OE?<br></blockquote><div><br></div><di=
v>Yes, see meta-mingw.</div><div><br></div><div>Ross=C2=A0</div></div></div=
></div>

--001a114387b886ef100560d60d7f--
