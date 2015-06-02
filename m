Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3744C7570D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 10:19:34 +0000 (UTC)
Received: by qkx62 with SMTP id 62so97950693qkx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 03:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6o+6piLmzpx+f6SzNPQhDqbEcra2pj8urdYiVnR3LrI=;
	b=HBmx+rzHH7DgqxaTtLM+2NDgql9jUs0eseFF4EyacIYCUes1bhV00EH34NqjKeXcyE
	EF6q1PlT59aYozbcbsYDFuZf1UE84F2w9PRmlKq3sevIjQco7xwxxhocGKYpS+GEZFin
	F3X9hB7NtxPGyQqFJfI+1wvh5wnZRAQogUzks+DKjh7hO357GvXL1/291HjXb9vt1wVW
	yqFMhP2m7vChinwpTYXbQLQtMOFez4MQiJDnCs7KSOi2yAEi7KGEGrtAththwtKGZ7rb
	Xwa379MZ4RmSot0CPjgW/ZEiGluLK/HCxm1rnnGjJc5zCzLJjSjMCGB6hlK43dj0Qq/X
	cJuQ==
X-Gm-Message-State: ALoCoQk4BgQDu24CA6ov8NYdO8e8k7AIGdBHziPO6yKCHXb4eklQxduqQCbwkIJ+W68jG55vp3A5
X-Received: by 10.55.40.18 with SMTP id o18mr46197421qkh.58.1433240375975;
	Tue, 02 Jun 2015 03:19:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 03:19:15 -0700 (PDT)
In-Reply-To: <CAJTo0LaAwbP0MafJ9kzUQeUiF_Jh8zh506ZxGjqC9dK2xsTv9Q@mail.gmail.com>
References: <cover.1433231155.git.kai.kang@windriver.com>
	<6b3f1d643cd1ae133c15b5c27b675983cf32f4a4.1433231155.git.kai.kang@windriver.com>
	<CAJTo0LaAwbP0MafJ9kzUQeUiF_Jh8zh506ZxGjqC9dK2xsTv9Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 11:19:15 +0100
Message-ID: <CAJTo0LZv=2_ikEGWKcGLBiGkhgU86cEwzD_RcqfoGH+rxLa_Yg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4: upgrade to 4.8.7
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
X-List-Received-Date: Tue, 02 Jun 2015 10:19:36 -0000
Content-Type: multipart/alternative; boundary=001a11440fb87cf71c0517864740

--001a11440fb87cf71c0517864740
Content-Type: text/plain; charset=UTF-8

On 2 June 2015 at 11:18, Burton, Ross <ross.burton@intel.com> wrote:

> This doesn't apply against master since the GStreamer 0.10 removal patches
> landed, can you rebase?
>

My mistake - didn't read the output properly and it was git aborting on a
corrupted patch.  Cherry-picked from the branch instead, thanks!

Ross

--001a11440fb87cf71c0517864740
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 June 2015 at 11:18, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div>This doesn&#39;t apply =
against master since the GStreamer 0.10 removal patches landed, can you reb=
ase?</div></blockquote></div><br>My mistake - didn&#39;t read the output pr=
operly and it was git aborting on a corrupted patch.=C2=A0 Cherry-picked fr=
om the branch instead, thanks!</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a11440fb87cf71c0517864740--
