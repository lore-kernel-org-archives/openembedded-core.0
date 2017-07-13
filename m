Return-Path: <kergoth@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id BA2FD6093A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 15:21:09 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id r30so40677533qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fe7OZTGGgEmkEplbQPaMtdepnGalm+ekHXUDC9O8igg=;
	b=nzV/eI0EsHiwqquZRFjo8TXgnaNUtAjm7rGcjvaH085OscvYnbKLhEz0B5rJJ0AiTy
	6mjsIpYtqqUFNmlSxSrgLoxY6BK7jbDiNPBGr7YhgpBvGGP0tBD11f71HZs9IKJ5p/Td
	mBRS5ZSqnyIK/SGbWnMsDni2Kk7if9ToA6oZvTGuu+yXu/oaoqGsb9zm1F5URYHcW+a3
	86wxyX5ECY98XTaSs1IXAzb3vxPLanYngS4azy/BUiSd1UhHqixHVjX9Ev8Yk9ZUazy0
	NCKVDgHfY14Nl9Vf02DE1pYXiZpq6cj+CDFoEPvhzPK0WtcdqgucxlKGo52gRBucLBTV
	lFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fe7OZTGGgEmkEplbQPaMtdepnGalm+ekHXUDC9O8igg=;
	b=t7Aatm0nnXt2mERO+NQF4bpJogUKvDVSDl/6t8GCYGTp1VQTjCUZIVZj79sZhRfhxG
	2bHqVKO6xnW9sd3uknwgQ4FoP0kf75Tz+e79Vdxc6T0RAmggBbGYUB6OQ8yo71VkCWR3
	WJq9aNqb6xSONS9CZ5hgePNpVaJNnyoW0urxf9CfztvyzRg/0iukW2ajnQXiASoXhRSK
	zq42HHWmajYEXdk940x6pn59CYz0Pl90VswjgZQIvpEeBo0MlME5mokGDp7sKIY96Nxg
	FS2ECE7wFK3Vm6HK5j33ZZf64mt8Sav96TZoAXAPBUiRI1HyJ+HIdAyjkQOrQ4wIcJc4
	ZX3g==
X-Gm-Message-State: AIVw111mUTen8e2yWZEFBuFhB3fislo71V6Gzfaux9nH2Uay9RtR6G2L
	Q1ccvERZiAagWPRQP9CiviKrapBxIw==
X-Received: by 10.200.2.75 with SMTP id o11mr5484655qtg.26.1499959270194; Thu,
	13 Jul 2017 08:21:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.6 with HTTP; Thu, 13 Jul 2017 08:20:49 -0700 (PDT)
In-Reply-To: <3c793129b4cc43b00dcd1028ab04abb8ca72a9a9.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
	<3c793129b4cc43b00dcd1028ab04abb8ca72a9a9.1499887935.git.anibal.limon@linux.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 13 Jul 2017 08:20:49 -0700
Message-ID: <CABcZAN=o5vUm-O=6BOZCxVNaSaOzg5JOLrtxmJZD1UV+7t=x_w@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 04/29] bb/tinfoil: run_command handle busy status in bitbake server
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
X-List-Received-Date: Thu, 13 Jul 2017 15:21:11 -0000
Content-Type: multipart/alternative; boundary="f403045e6cd67a44260554347b6f"

--f403045e6cd67a44260554347b6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2017 at 12:36 PM, An=C3=ADbal Lim=C3=B3n <anibal.limon@linu=
x.intel.com
> wrote:

> When tinfoil request a command to bitbake is handled in async
> manner [1], sometimes is this ends on return a Busy status.
>
> This is a workaround a needs to be fixed in proper manner
> inside bitbake code.
>

I=E2=80=99m assuming you verified this doesn=E2=80=99t cause issues with sy=
nchronous
commands? Not all commands are async, after all, but the comment in your
retry logic acts like they are.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--f403045e6cd67a44260554347b6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jul 12, 2017 at 12:36 PM, An=C3=ADbal Lim=C3=B3n <span dir=3D"l=
tr">&lt;<a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">a=
nibal.limon@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">When tinfoil request a command to bitbake is handled in async<br>
manner [1], sometimes is this ends on return a Busy status.<br>
<br>
This is a workaround a needs to be fixed in proper manner<br>
inside bitbake code.<br></blockquote><div><br></div><div>I=E2=80=99m assumi=
ng you verified this doesn=E2=80=99t cause issues with synchronous commands=
? Not all commands are async, after all, but the comment in your retry logi=
c acts like they are.</div></div>-- <br><div class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Chris=
topher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedde=
d, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div=
></div>
</div></div>

--f403045e6cd67a44260554347b6f--
