Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id C25B371547
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:27:38 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id r5so249604qcx.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 13:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qRa7y3h3z0px5rcZ1mD7/olD8D8TerL3UzgXQQtJ9rQ=;
	b=RdxWlw4myBDiuuoeAMer/FQTbMaYhmEkfTg2QUi7jyKoXpSa/wQ6fBvrVQq5oj9MkV
	K4XiVtrfUd4LlMJPlzCZqAvitvn55qxX4OnEmc8E0nqn1JgVkGXuT/VhQppF+x6HhgCG
	I9ifviKUCAofiLcJIH+7vXBYhz1dvi/6UdXWNwYhw5/h7v6LVDmXPuEeCkqjLe6ymDks
	BcTtKwScz/rn4b0xZksRAJ7+RTrVYq1Xp2wtrb1QubKhduUUH4JuQMmZCFAr6vTRT9N/
	0BXfdp5RO8Dxpd5WQ4Nig+gavVTaWTnSprHR4NmDOrSZxHsTKX5TIOy09UfC6eEnTKUt
	Q9Gw==
X-Gm-Message-State: ALoCoQkVgQ4jRrPfZvV3MlGOYM+I9enz7k1wzO3zqKbK1OQEttxQ/jjRFi6HxLAYEvG9Diz519rT
X-Received: by 10.140.97.247 with SMTP id m110mr3196749qge.80.1411504059572;
	Tue, 23 Sep 2014 13:27:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 13:27:19 -0700 (PDT)
In-Reply-To: <1411500714-17508-1-git-send-email-denis@denix.org>
References: <1411500714-17508-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 21:27:19 +0100
Message-ID: <CAJTo0LZLxJtaimXR4rU85=5VOxQVk7+59+2Le4-r6bvZekgdpQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libinput: add 0.6.0 version
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
X-List-Received-Date: Tue, 23 Sep 2014 20:27:40 -0000
Content-Type: text/plain; charset=UTF-8

I didn't see a 3/3 for this series on the list.  It's also too late
for 1.7, so I'll queue this in my staging branch for 1.8.

Ross

On 23 September 2014 20:31, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> libinput is an optional dependency for Weston to handle input devices
> externally, which provides better support especially for touch devices.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-graphics/wayland/libinput_0.6.0.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-graphics/wayland/libinput_0.6.0.bb
>
> diff --git a/meta/recipes-graphics/wayland/libinput_0.6.0.bb b/meta/recipes-graphics/wayland/libinput_0.6.0.bb
> new file mode 100644
> index 0000000..c3bbb7b
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/libinput_0.6.0.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Library to handle input devices in Wayland compositors"
> +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
> +
> +DEPENDS = "libevdev udev mtdev"
> +
> +SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
> +SRC_URI[md5sum] = "3afaf9f66d8796323a79edb879c10ba3"
> +SRC_URI[sha256sum] = "30b555771e7cb921ccb9430c4a86940aa3938d05506e81d2417c03e30451bfbc"
> +
> +inherit autotools pkgconfig
> --
> 2.0.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

