Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBAE6E68C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 15:00:21 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id q107so52634610qgd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 07:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z5gGlvNBMfu9s0JtYyFcvzyrJEIVaqjNx9s6M2pneo8=;
	b=J/cn6LwFRONYvLdEd+tDJMhotoR9JLC3LW5RqfRvV306IQEEYhtMH/TtK+wW0dJddU
	6apbxC4DUdToyJRWavJh+lK2xGy8eXzDkUxhFtRlOhD5xxSRxkHBRQ6Etksh3v1BmW3m
	IuqRNOKMbnyBQgVzRde0pxFnTFkLF2cQ0ORbZC9XP2QB+hF8aqQ8vzdtPQDm8PKSQAki
	yTKSsTehMc09xAKDHR8TLUsLq4Mwnjo0K/eYyUlCDMj3/Opqu0FIRYlN4jqq49iwtB6n
	U8NIRX8p0PbSfuxB47OsEsD9554GoJzv0O6Dhf9Skmx8dJxBZcUKDYL4RJX3tjqWjahg
	iQdw==
X-Gm-Message-State: ALoCoQmblxVSiF4FK5F37iRBeqwDBMk2gcIEEaeaLwO6wyC7UK1Ey0am5fBDsXtMf1myoxIqff8D
X-Received: by 10.224.97.72 with SMTP id k8mr54077953qan.52.1422975617444;
	Tue, 03 Feb 2015 07:00:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 3 Feb 2015 06:59:57 -0800 (PST)
In-Reply-To: <18cd01e42aa7a74c010d6114b6625bdfe586103a.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
	<18cd01e42aa7a74c010d6114b6625bdfe586103a.1422925725.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Feb 2015 14:59:57 +0000
Message-ID: <CAJTo0LbQbF4poEUwpWYRrcVn-yTPT6LmJ9oKUh2dE4FR5D5tVQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/21] libidn 0.6.14: fixed installed-vs-shipped
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
X-List-Received-Date: Tue, 03 Feb 2015 15:00:33 -0000
Content-Type: multipart/alternative; boundary=001a11c2cb5a33c676050e30544f

--001a11c2cb5a33c676050e30544f
Content-Type: text/plain; charset=UTF-8

On 3 February 2015 at 01:12, Robert Yang <liezhi.yang@windriver.com> wrote:

>         rm -rf ${D}${datadir}/emacs
>  }
> +
> +FILES_${PN} += "${datadir}/emacs"
>

This was already fixed - see the rm a few lines above. :)

Ross

--001a11c2cb5a33c676050e30544f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2015 at 01:12, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3wc" =
class=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf =
${D}${datadir}/emacs<br>
=C2=A0}<br>
+<br>
+FILES_${PN} +=3D &quot;${datadir}/emacs&quot;</div></blockquote><div><br><=
/div><div>This was already fixed - see the rm a few lines above. :)</div><d=
iv><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c2cb5a33c676050e30544f--
