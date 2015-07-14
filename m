Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id BDF5B65C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 11:03:25 +0000 (UTC)
Received: by qgep37 with SMTP id p37so2311949qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 04:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=oX+ShOljncYO97Pe9BhLQVnS5jBG+XWNjGYyewpPiyo=;
	b=G1ArXfmwhXBtq582L4Iz8bcP9w4A4FsyHrg/foKrDoLDj27Ps1g8MrDjXYXXqngVTQ
	VwJ2MQ3V6uhhVHnmBZ+FKdqE+x+cnAgDGzmIOwaG06FwlsaQ/iVeg43/GGb+OJ4yWEMb
	LFW37dSkrYVjsnW+15JK56NLjnVNP/GYaXlOuLB28O4tXRxOFaBOBlXcUM7oThPsY9kW
	l7nEUlAgx1g371gGQol1Wog/aTNFJqnaKohjlG/mBKa5pgKLdveUgroxr+9ZVx1NSOfy
	0UfDLlZ558r9A4RioGfMclx7n2rEPzYAGsiwqNg7dONuek6baSjyBb4MzOKNhsc8SZyf
	sYew==
X-Gm-Message-State: ALoCoQm6e5u0MuX9yUkjVeUIz0YNvkFl1iVxNLnzZDm7l5dsqHiPEhfXrf7r/u0v88ENaNp717l1
X-Received: by 10.55.15.129 with SMTP id 1mr60231979qkp.29.1436871805329; Tue,
	14 Jul 2015 04:03:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 14 Jul 2015 04:03:05 -0700 (PDT)
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Jul 2015 12:03:05 +0100
Message-ID: <CAJTo0LYnL4ighqwVs8oBvYXYrbv-W4r-y54pOGMwuVzZTq7xCQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7][RFC][HEREBEDRAGONS] Remove bitbake's knowledge of ${B}
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
X-List-Received-Date: Tue, 14 Jul 2015 11:03:25 -0000
Content-Type: multipart/alternative; boundary=001a1146f1008b77ba051ad3c956

--001a1146f1008b77ba051ad3c956
Content-Type: text/plain; charset=UTF-8

On 13 July 2015 at 15:02, Ross Burton <ross.burton@intel.com> wrote:

> Ross Burton (7):
>       build: don't automatically mkdir/chdir B
>       build: add remove/mkdir/chdir debugging
>       ptest: add dirs
>       boost: add dirs
>       python: add explicit directory when copying
>       libc-package: fix path assumption
>       kernel: fix path assumptions
>

FYI, I've fixed the libc-package fix (to pass -C to EXTRA_OEMAKE),
elaborated on the commit messages, and merged the oe-core parts into my
master-under-test branch.  The actual change to bitbake is still not merged
and open for comments.

Ross

--001a1146f1008b77ba051ad3c956
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2015 at 15:02, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1kr" class=3D"a3=
s" style=3D"overflow:hidden">Ross Burton (7):<br>
=C2=A0 =C2=A0 =C2=A0 build: don&#39;t automatically mkdir/chdir B<br>
=C2=A0 =C2=A0 =C2=A0 build: add remove/mkdir/chdir debugging<br>
=C2=A0 =C2=A0 =C2=A0 ptest: add dirs<br>
=C2=A0 =C2=A0 =C2=A0 boost: add dirs<br>
=C2=A0 =C2=A0 =C2=A0 python: add explicit directory when copying<br>
=C2=A0 =C2=A0 =C2=A0 libc-package: fix path assumption<br>
=C2=A0 =C2=A0 =C2=A0 kernel: fix path assumptions</div></blockquote></div><=
br>FYI, I&#39;ve fixed the libc-package fix (to pass -C to EXTRA_OEMAKE), e=
laborated on the commit messages, and merged the oe-core parts into my mast=
er-under-test branch.=C2=A0 The actual change to bitbake is still not merge=
d and open for comments.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a1146f1008b77ba051ad3c956--
