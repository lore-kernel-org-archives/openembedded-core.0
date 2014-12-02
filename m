Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 132A7601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 14:28:55 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id x69so9152987oia.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 06:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=14GKOZDsFCmWIiE1U5k6L/Hi9lLOVuWx756gp8F+glw=;
	b=P4MhjEh8hNpMkLQ+9HTomEeYx7AmEhGUIi6zn1uuTcX6KVrjTowsPpG9W0GAfMivs4
	Y4Lh8O4yjD2Qjt69oiSSMNJPYA/XEKgdcEtxMg5WgKRLo32WVSpus7dT8SYm5XYjTDuj
	QgoraujjjE8TpGsPI73BuTrlNyuDoO7vOBhEBEZvHyRUTxyQzsRV+hLXZRJ8bh6cnrIJ
	StNCZ8yuIvAT+DVOUN1EGnVWhiWgt++00W2s6DEtNFfRZWvDDv3ujfKts/BUB+VtXrvj
	SZrblPo6XeoQoKM3Ja/QG4LTkag6IZCleJjLtrcAotHHDrfEAvfwzQqCjGuEuejQY3XF
	rjdQ==
X-Gm-Message-State: ALoCoQmdMeFFI1cEhzMO9NzUv/sz0NKN+LhjEuIvnffjwJHqzUzMAWMfDavTvBS+8y2uPNY08bgO
X-Received: by 10.202.182.138 with SMTP id g132mr5435651oif.119.1417530536193; 
	Tue, 02 Dec 2014 06:28:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.159.138 with HTTP; Tue, 2 Dec 2014 06:28:35 -0800 (PST)
In-Reply-To: <434556f7b955c934a5eabbd8125d46aab0ffbde2.1417466738.git.anibal.limon@linux.intel.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<434556f7b955c934a5eabbd8125d46aab0ffbde2.1417466738.git.anibal.limon@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 2 Dec 2014 15:28:35 +0100
Message-ID: <CAP71WjzO2sg-RbY=51Nu89=hcahNqP0NhVYUCCJX3=eTYz87Hg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] xorg-xserver: Upgrade to 1.16.2
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
X-List-Received-Date: Tue, 02 Dec 2014 14:28:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2014 at 11:36 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Remove crosscompile, mips64-compile and present-module because are alread=
y in
> upstream.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  .../xorg-xserver/xserver-xorg/crosscompile.patch   | 22 --------
>  .../xserver-xorg/mips64-compiler.patch             | 29 ----------
>  .../xorg-xserver/xserver-xorg/present-module.patch | 66 ----------------=
------
>  ...erver-xorg_1.15.1.bb =3D> xserver-xorg_1.16.2.bb} |  9 +--
>  4 files changed, 3 insertions(+), 123 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/cross=
compile.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mips6=
4-compiler.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/prese=
nt-module.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb =3D> x=
server-xorg_1.16.2.bb} (75%)


I am seeing the following warning when building this patch:

WARNING: QA Issue: xserver-xorg rdepends on dbus-lib, but it isn't a
build dependency? [build-deps]

