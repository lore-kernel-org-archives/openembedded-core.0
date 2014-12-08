Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id B642A72482
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 09:29:30 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id a141so3103741oig.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 01:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=M8K7T8wZiK3fT36v4fXsM/fn3PrDwcl2I/NPvDrEae4=;
	b=cYJDGfqFVE709S0il5QFGs69e60FtUmOwKL7hZCi6iMUX+BKFiimIZu7G6C4o67CRJ
	mR53Uzcm4oAkWvVUYXgK0qvm3d/xHzVzLSRFLW4W2q6uQ6FRtykmic2Mo5V1NTcN+xn4
	DTmJeEee9hcVANzlcCrf3VRT44lCFQDfivn3bhKLSDP20VyE+YSTltQWNI8kIvAyygK0
	mQNP6uKdAX4zbj04jaDK27FfrV8z1GaXNfWLuOnCl37Fbm3UYxV3ILBd6wBNsinvT8Y6
	x3fJP9Ie/dQrAfppcqK4bKXxyRtepDTZDqWZ/pt1k91zjCvsGEjbk4d0autqp3xY7025
	QiaQ==
X-Gm-Message-State: ALoCoQkteSm0CWVw5XBQvclYT9vHPT2uN29USLBqWhX2y5t0tEqURhoaKR8xIjtkVHyPRiel+QYu
X-Received: by 10.182.108.229 with SMTP id hn5mr18017750obb.51.1418030970609; 
	Mon, 08 Dec 2014 01:29:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.159.138 with HTTP; Mon, 8 Dec 2014 01:29:10 -0800 (PST)
In-Reply-To: <cover.1417734782.git.anibal.limon@linux.intel.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 8 Dec 2014 10:29:10 +0100
Message-ID: <CAP71WjxBoeiGQUcefjm3AWf7wcXmbeMKj1q_mdUMas6dEnbfZg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Mon, 08 Dec 2014 09:29:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2014 at 12:18 AM, An=C3=ADbal Lim=C3=B3n
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
> The following changes since commit a862bf045109d213c301121961bd8d389e48b1=
3d:
>
>   upstream_tracking.inc: update entries for dbus (2014-12-03 12:24:01 +00=
00)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib alimon/linux_intel_graphics_201=
4q3_v2
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dalimon/linux=
_intel_graphics_2014q3_v2
>
> An=C3=ADbal Lim=C3=B3n (3):
>   libdrm: Upgrade to 2.4.58.
>   mesa: Upgrade to 10.3.4.
>   xorg-xserver: Upgrade to 1.16.2.


I have tested the last 2 patches on top of this morning master-tip
which already included the libdrm upgrade. mesa 10.3.4 and Xorg 1.16.2
worked fine for me on Snapdragon 600, using mesa/gallium freedreno.

thanks for making the update!

nico

