Return-Path: <ross.burton@intel.com>
Received: from mail-vn0-f51.google.com (mail-vn0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB416E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 13:52:46 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so3791357vnb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 06:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=59pntdio2qPq5VzX/TFRiXMrsf0UQaZLSN5QFK6+D4A=;
	b=GeClRhctN0CkrNMVLxy2hQkF5RpjIfJOL6Msn4YNx8zz/Od1nY5oYtK9SpbfrDWE/p
	xYWha50ZyAWwgDkwEs1g5ckJ1vHLTt+rchV15ZMyqJT7US3GLKds0fvtI6UejCmTEK8k
	pIr5QAOuEeVi1a8+KGMRDtiCSePNEguHLxfbghf5bWVo3hSKVJe124Z2L4Jv5V7WWfYt
	IlyC6b0Sb813vtv3QaEJDfp/qONAXfXlsIfDHsDyHxK5sVZOJuDtOi7XFXBRCH+3oqXF
	zjmERrsFMZUxut9dhofa0H7ofe5MWN9ZRk8ux6zIvp4WaRDLqAW0IadE3XfdE7Ru3T5j
	q1MQ==
X-Gm-Message-State: ALoCoQkYzzeKOgpw61XIJrY6uAUzSoEsEZvBTmMjlbTEwto9ZQflCJVUxoXm+1eXQxw6hW5fNkZx
X-Received: by 10.140.88.80 with SMTP id s74mr24195877qgd.59.1429019567870;
	Tue, 14 Apr 2015 06:52:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 14 Apr 2015 06:52:27 -0700 (PDT)
In-Reply-To: <CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Apr 2015 14:52:27 +0100
Message-ID: <CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Tue, 14 Apr 2015 13:52:49 -0000
Content-Type: multipart/alternative; boundary=001a11c114c4b85e7e0513af8b9d

--001a11c114c4b85e7e0513af8b9d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 April 2015 at 14:50, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> from the error I would DEPEND on virtual/egl
>

Agreed.  And there's no dependency on virtual/libx11 which the readme you
quote suggests there should be.  Presumably that dependency - if it's
actually required - can be made conditional on the x11 DISTRO_FEATURE?

Ross

--001a11c114c4b85e7e0513af8b9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 April 2015 at 14:50, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":445" class=3D"a3s" style=3D"overflow:hidden">from the error I would =
DEPEND on virtual/egl</div></blockquote><div><br></div><div>Agreed.=C2=A0 A=
nd there&#39;s no dependency on virtual/libx11 which the readme you quote s=
uggests there should be.=C2=A0 Presumably that dependency - if it&#39;s act=
ually required - can be made conditional on the x11 DISTRO_FEATURE?</div><d=
iv><br></div><div>Ross</div></div></div></div>

--001a11c114c4b85e7e0513af8b9d--
