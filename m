Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id DA3F7761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 11:26:06 +0000 (UTC)
Received: by qges31 with SMTP id s31so25206701qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 04:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MjkjsNacXznV+tjqd3ZhpZ8+SoH/HH0/9aoBp9cIrlg=;
	b=Rzb5XuR51fJGsgK/iRPGOSIQzQ4VLvbuTSh8swnzkWdW69YVo7WygaUKzOkIzenf2O
	opvL0/NOuL+fmtDEpMbveLIJZQZ81JVNDk+JWvLF0s3tsv6XOnMjf6v2enOdj/hgRqmZ
	GDb7gEFTsQ4uPkNz0PP/7uJkRi4L4cdIOyDmVBaeQElOP0F77GAr2YaUCnYLDkNaCwT2
	f+EVJP3r7kLBwFyX077UxHXj0Kxj5AWPxCnGqnPd7KvOmu9ylYSwaThHGBI0jP65hqGm
	ZVjQGMDxWaNYSvUC8RIVE9CsETQxydZ5iyJho5i3SadPak6sPDD26vL6HrohRynE9BQq
	zEbg==
X-Gm-Message-State: ALoCoQmdBfdD/mK/Ap2J7yovt6zSbwx64wvo9kIcQM+0LkWdjIWea5ZIik0qu87h6FJEn5B8eg3i
X-Received: by 10.140.235.19 with SMTP id g19mr50731372qhc.52.1438082767002;
	Tue, 28 Jul 2015 04:26:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 04:25:47 -0700 (PDT)
In-Reply-To: <f629d3d6e47782347bea424511ef6bedeb64f9a8.1438074266.git.liezhi.yang@windriver.com>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
	<f629d3d6e47782347bea424511ef6bedeb64f9a8.1438074266.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 12:25:47 +0100
Message-ID: <CAJTo0LaXppcw31FEs_CwS0n+XTF7ScrmVgRVqvEd0nQcFokpOw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] mc: add PACKAGECONFIG for util-linux
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
X-List-Received-Date: Tue, 28 Jul 2015 11:26:08 -0000
Content-Type: multipart/alternative; boundary=001a11376dac7c341e051bedbc3b

--001a11376dac7c341e051bedbc3b
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 10:05, Robert Yang <liezhi.yang@windriver.com> wrote:

> +PACKAGECONFIG[util-linux] =
> "ac_cv_lib_mount_mnt_new_table_from_file=yes,ac_cv_lib_mount_mnt_new_table_from_file=no,util-linux,"
>

For mc this might be something we want to enable by default.

Ross

--001a11376dac7c341e051bedbc3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2015 at 10:05, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ic" cla=
ss=3D"a3s" style=3D"overflow:hidden">+PACKAGECONFIG[util-linux] =3D &quot;a=
c_cv_lib_mount_mnt_new_table_from_file=3Dyes,ac_cv_lib_mount_mnt_new_table_=
from_file=3Dno,util-linux,&quot;</div></blockquote></div><br>For mc this mi=
ght be something we want to enable by default.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11376dac7c341e051bedbc3b--
