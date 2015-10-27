Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFF375CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 18:45:46 +0000 (UTC)
Received: by qgem9 with SMTP id m9so152682857qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0npanUC2H7JWfXF1eicotJtLFmhDtqOhk5IrYjQgrB4=;
	b=WNxDCzForfEsrJ5HYzAvX0HfSxP34enWuAlHVKg3jmj0ptrWFGJJqpQigL6gwybheh
	WUnXXYx5yipn+0D/s9QLu9j6bfQlIx3xodYP7o3+/a11I3eKrsGYJZgaCN/TtFuhH07n
	e4O75xKNfEa6lvGhT/1ysJyvWKU4d76x9yurV5RgaCeIS+px8V1hiEddK1NNKCsnwfbp
	2Nlz4uMurcQNEDao3ONqbnVWZZ1DZ19FSFbByQS82eMu9CG06V0N6X1WyEDeKsgLLQG5
	nCm6NcVE/BTv1Jnwcd+M/waY63QeTkGnYdjrJeEmRd7Wbe3xHwVamjgKZ229W8eBZjlh
	uUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0npanUC2H7JWfXF1eicotJtLFmhDtqOhk5IrYjQgrB4=;
	b=W+v8t5tfOZ10gShOpO7fS4nUxOdiYEhVXaXaHsBYQensYTVNPQF8y9ScHnFlU6egwd
	98bkGbJ2RHz3SMB924mdbN4U5KpQaZl9GxkXkCgxalCX2tgnKJOB5bLyOwRVS3AEKVIR
	INqdt/XWbpPzfSft15Y2p1m6aBioCAMnuGBUUKpPQ8KCkhxLflvZedNXENzaMl2OeVfa
	hrgnf3yO3XkyEQKHQn9csOQUFrdaGSM8lJBJnjNaQO3kq22NL38fTkp89nxnWtdsNC/b
	FUrWkUwA+vBr0FTIy3dJAuaNKVVOTd3JaOI6i5N565VhLFO05ykIZ4IQ/fEpe5JgThkr
	3sDA==
X-Gm-Message-State: ALoCoQm/T1g1siZnGxDqDI6MQ1ui5BvW2jOB91le5RplJJAwUYUEdIFa1qM3B+gqpOIcCCSm62ID
X-Received: by 10.140.16.21 with SMTP id 21mr38209265qga.87.1445971546966;
	Tue, 27 Oct 2015 11:45:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Tue, 27 Oct 2015 11:45:27 -0700 (PDT)
In-Reply-To: <6aacdcc20175b509fa9adca8a7bfa861e443ee09.1445954460.git.liezhi.yang@windriver.com>
References: <cover.1445954460.git.liezhi.yang@windriver.com>
	<6aacdcc20175b509fa9adca8a7bfa861e443ee09.1445954460.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Oct 2015 18:45:27 +0000
Message-ID: <CAJTo0La8YZQafC-8SKdBt_4K5N8TsHU6bq3oeykJ6-j6pc6isw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-smartpm-native: prefer same arch when install
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
X-List-Received-Date: Tue, 27 Oct 2015 18:45:48 -0000
Content-Type: multipart/alternative; boundary=001a11c051d469a4e905231a7c10

--001a11c051d469a4e905231a7c10
Content-Type: text/plain; charset=UTF-8

On 27 October 2015 at 14:05, Robert Yang <liezhi.yang@windriver.com> wrote:

> We had made smart install multilib RDEPENDS correctly from
> package_manager.py, but it couldn't handle RRECOMMANDS, this patch fix
> the issue from python-smartpm-native, and make it work well.
>
> The logic is: when pkg_A rdepends/rrecommands pkg_B, then let pkg_B use
> pkg_A's arch when possible.
>

I added this patch and rebuilt core-image-sato, then ran buildhistory-diff:

Changes to images/intel_corei7_64/glibc/core-image-sato
(installed-package-names.txt):
  lib32-ncurses-terminfo-base was added
  lib32-libjpeg9 was added
  lib32-glibc-gconv-iso8859-1 was added
  lib32-shared-mime-info was added
  lib32-libxml2 was added
  lib32-wpa-supplicant-cli was added
  lib32-libgdk-pixbuf-2.0-loader-png was added
  lib32-wpa-supplicant-passphrase was added
  lib32-pango-module-basic-fc was added
  lib32-bash was added
  lib32-libgdk-pixbuf-2.0-loader-jpeg was added
  lib32-libgdk-pixbuf-2.0-loader-gif was added
  lib32-libgdk-pixbuf-2.0-loader-xpm was added
  lib32-glibc-gconv was added

Some of those are good (gdk-pixbuf and pango), some bad (bash,
wpa-supplicant-cli), some probably bugs in packages that should be allarch
(termino, shared-mime-info).

I'm undecided what we do about this.  Fixing the dependency chains is good,
but we're definitely pulling in more than expected.

Ross

--001a11c051d469a4e905231a7c10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 October 2015 at 14:05, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D":28a" class=3D"" sty=
le=3D"overflow:hidden">We had made <span class=3D"">smart</span> install mu=
ltilib RDEPENDS correctly from<br>
package_manager.py, but it couldn&#39;t handle RRECOMMANDS, this patch fix<=
br>
the issue from python-smartpm-native, and make it work well.<br>
<br>
The logic is: when pkg_A rdepends/rrecommands pkg_B, then let pkg_B use<br>
pkg_A&#39;s arch when possible.</div></blockquote></div><br>I added this pa=
tch and rebuilt core-image-sato, then ran buildhistory-diff:</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_=
extra">Changes to images/intel_corei7_64/glibc/core-image-sato (installed-p=
ackage-names.txt):</div><div class=3D"gmail_extra">=C2=A0 lib32-ncurses-ter=
minfo-base was added</div><div class=3D"gmail_extra">=C2=A0 lib32-libjpeg9 =
was added</div><div class=3D"gmail_extra">=C2=A0 lib32-glibc-gconv-iso8859-=
1 was added</div><div class=3D"gmail_extra">=C2=A0 lib32-shared-mime-info w=
as added</div><div class=3D"gmail_extra">=C2=A0 lib32-libxml2 was added</di=
v><div class=3D"gmail_extra">=C2=A0 lib32-wpa-supplicant-cli was added</div=
><div class=3D"gmail_extra">=C2=A0 lib32-libgdk-pixbuf-2.0-loader-png was a=
dded</div><div class=3D"gmail_extra">=C2=A0 lib32-wpa-supplicant-passphrase=
 was added</div><div class=3D"gmail_extra">=C2=A0 lib32-pango-module-basic-=
fc was added</div><div class=3D"gmail_extra">=C2=A0 lib32-bash was added</d=
iv><div class=3D"gmail_extra">=C2=A0 lib32-libgdk-pixbuf-2.0-loader-jpeg wa=
s added</div><div class=3D"gmail_extra">=C2=A0 lib32-libgdk-pixbuf-2.0-load=
er-gif was added</div><div class=3D"gmail_extra">=C2=A0 lib32-libgdk-pixbuf=
-2.0-loader-xpm was added</div><div class=3D"gmail_extra">=C2=A0 lib32-glib=
c-gconv was added</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Some of those are good (gdk-pixbuf and pango), some bad (bash, =
wpa-supplicant-cli), some probably bugs in packages that should be allarch =
(termino, shared-mime-info).</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">I&#39;m undecided what we do about this.=C2=A0 Fixin=
g the dependency chains is good, but we&#39;re definitely pulling in more t=
han expected.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div></div>

--001a11c051d469a4e905231a7c10--
