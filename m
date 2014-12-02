Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id D5A7F60144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:30:48 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id x69so9331067oia.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=VgWEX56JDXR6omNlATPIOw71YGHTt91J6DMFdtLnUBU=;
	b=BHXMj260xIq7mUZk19nnEEOzr4YzIL5wmcIvSlYIjllrIvgTw5LtFX23zeN9L32+fT
	sQZiafS6PM3dBA6i5NqCJgfTsXFEz/AiYVXn1wMsv9C47aDBMKsurh9dsuYepKsnYWOs
	nbz+XXrfEb1cUF434Z4UMxeHbYP+W+Q+nA/ZOoRtPzsNnfKqDOqZPbX6OjsctPZKxXLv
	KRw1qF5B2fOZyu8PjnLrWFXSqllPa9+C34iL6ojWcw5d495iRB6S5oeszlAUmPIpEmc/
	Nw8hNVKQA+SWlJeSdoGb65eElgdKzTB2VU5E911A39vQ6yAD/QjZ89BLJwEPuc4XIOq5
	krDA==
X-Gm-Message-State: ALoCoQn5ePb9jJRA/z+zcXVLK4wbWdMcLgxqOLb0ZI4YS4Gk81kztu5AzZhJieCt28IPg61g9OPt
X-Received: by 10.60.145.167 with SMTP id sv7mr39766102oeb.38.1417534248923;
	Tue, 02 Dec 2014 07:30:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.159.138 with HTTP; Tue, 2 Dec 2014 07:30:28 -0800 (PST)
In-Reply-To: <cover.1417466732.git.anibal.limon@linux.intel.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 2 Dec 2014 16:30:28 +0100
Message-ID: <CAP71WjzP8mBdp3TC=+CTw2Sv_iNB2MudqV=SpuAjuvSZ8mSv2A@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Tue, 02 Dec 2014 15:30:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi,

On Mon, Dec 1, 2014 at 11:36 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Testing was made building and running core-image-sato in qemux86, qemumip=
s,
> and qemuarm also core-image-sato/core-image-weston in Intel NUC.
>
> Tests freedesktop piglit was run in Intel NUC with 95% of tests passes
> (9251/9694), you can found full results at [1].
>
> [YOCTO #6805]
>
> [1] https://bugzilla.yoctoproject.org/attachment.cgi?id=3D2267
>
> The following changes since commit b8631416f12b8a904ce3deb036f9d5ce632937=
b0:
>
>   package_regex.inc: Update REGEX'es in order to find upstream versions c=
orrectly (2014-11-28 14:03:02 +0000)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib alimon/linux_intel_graphics_201=
4q3
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dalimon/linux=
_intel_graphics_2014q3
>
> An=C3=ADbal Lim=C3=B3n (3):
>   libdrm: Upgrade to 2.4.58.
>   mesa: Upgrade to 10.3.3
>   xorg-xserver: Upgrade to 1.16.2

I have tested this series on IFC6410 board (Snapdragon 600, with
Adreno 320 GPU) using freedreno Mesa/Gallium driver, using [1].

tested GLX and EGL with Xorg 1.16. Also tested the OutputClass feature
available in 1.16.

it all looks good to me, so fwiw, all patches can have:

Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

cheers.

[1] https://git.linaro.org/people/nicolas.dechesne/meta-qualcomm.git/shortl=
og/refs/heads/xorg-1.16

