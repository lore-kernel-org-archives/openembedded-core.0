Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D2FA76FF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 13:31:10 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 5so9108191ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2016 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qc4AQE0j/NcsbqbZvKIB/7AMT/LpcBBajc6BO9+9QsI=;
	b=LRxS0FHf6fPX7jp2eQebsPebxoJMkJhcAWi1IPpiTJzD1tdvm0bKoAvNpYhyC3H85i
	xClmtbvyJRJpfx+moq26mItouqjxxjkQ8QRe1ON0caWloduu8XfU4G02bUaT0CM1UyjU
	JdWvba48ific2tLZ4cR/h5gDj4Tu1IxryG+JrD9fUOwHQAn+xalVBpjSayp1RITq1Fu1
	Ox5weRMA3cYrXtjnQ+cl4qats1nIuHbmLwBcuDCtH+c3gXoceAVKr4eQ1DGxKh/zCiAq
	KecmNRcV4njNBo82lniixbnn8co5RdCT5rd6zmYeEXwiEV8SNtOprGIY6mKp/FsbrKEA
	llVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qc4AQE0j/NcsbqbZvKIB/7AMT/LpcBBajc6BO9+9QsI=;
	b=ToelONmxkMNrE4SsYRIYy2bqIbBLepOvaC4729A5MRM4UDJTpte2GQc0SbJ3NWjBlt
	eZesGudXfrsrw/Ow8sgSNBaH5S5MelsCVWyf5FI+8bx+zgy+ngEJOfHIQHcOwDAQ7taC
	vyj5Cp3urF+gq6vjw1cPmBoDiWANeFL/bRH4wgz5lIkj/+igetoiJ07qaL5cIhF8ydh3
	KlWpiVF+xbyGF2KbbZyYcZY9UTGfdGDd6+RYsnJXNXJIp9a3jtigPJsLaA52hnHAYgFm
	0dZRsi0zOz8cZn9CBNmzPJINQ5DzP6OeB4bUlVQotPPQCL1fUzb6ff315xAsR5tk/GFx
	l6Mg==
X-Gm-Message-State: ALyK8tIi9o6IxnuBPgJ1Wayy238J6zVUI0IU8iixn8ifJhsYEalYxd+M0ehL2sWNbCbiCpxKwfaX4MERVl9TVGke
X-Received: by 10.107.135.137 with SMTP id r9mr8109735ioi.133.1465392670840;
	Wed, 08 Jun 2016 06:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 8 Jun 2016 06:30:51 -0700 (PDT)
In-Reply-To: <57574166.2050203@linux.intel.com>
References: <1464380961-10423-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
	<574C5E1E.3020800@linux.intel.com> <57574166.2050203@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jun 2016 14:30:51 +0100
Message-ID: <CAJTo0LbsY6sZLmssC3LjFrPcrW0UZNEJu+hL9hXPOMEVxZJNNw@mail.gmail.com>
To: Plauchu Edwin <edwin.plauchu.camacho@linux.intel.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] unzip: fix security issues
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
X-List-Received-Date: Wed, 08 Jun 2016 13:31:11 -0000
Content-Type: multipart/alternative; boundary=001a113ec8429a2fa70534c451e9

--001a113ec8429a2fa70534c451e9
Content-Type: text/plain; charset=UTF-8

On 7 June 2016 at 22:49, Plauchu Edwin <
edwin.plauchu.camacho@linux.intel.com> wrote:

> Ping!
>

This is merged already:

Author:     Edwin Plauchu <edwin.plauchu.camacho@intel.com>
AuthorDate: Fri May 27 15:29:21 2016 -0500
Commit:     Richard Purdie <richard.purdie@linuxfoundation.org>
CommitDate: Wed Jun 1 12:38:43 2016 +0100

    unzip: fix security issues

Ross

--001a113ec8429a2fa70534c451e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 June 2016 at 22:49, Plauchu Edwin <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.plauchu.=
camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":27c" class=3D"">Ping!<div class=3D""><div id=3D":26j" class=3D"" tabin=
dex=3D"0"></div></div></div></blockquote></div><br><div class=3D"gmail_extr=
a">This is merged already:</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Author: =C2=A0 =C2=A0 Edwin Plauchu &lt;<a href=3D"mai=
lto:edwin.plauchu.camacho@intel.com">edwin.plauchu.camacho@intel.com</a>&gt=
;</div><div class=3D"gmail_extra">AuthorDate: Fri May 27 15:29:21 2016 -050=
0</div><div class=3D"gmail_extra">Commit: =C2=A0 =C2=A0 Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt;</div><div class=3D"gmail_extra">CommitDate: Wed Jun 1=
 12:38:43 2016 +0100</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 unzip: fix security issues</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div=
>

--001a113ec8429a2fa70534c451e9--
