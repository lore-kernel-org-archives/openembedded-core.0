Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id A9E5A6DA74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 07:14:53 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wp4so2390139obc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 23:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KMrBBVyKEouU04oEvDUJjfzUG7RNuadnxnUPOM27PTA=;
	b=NoknGClIVa6gewrCkX4YV3hbxzfLCzMw2W4kGSqtQyH05/TfT3Cc+Tw9JZhmRBpcw8
	/ecXDz/fw1hNBaco7FlxSE6xpeXg5HW1xru9KXr4zFgeGGu5d7ubVXXuhXFxWT+iQOrZ
	C/HOWaARdRUzJxIiV4c+2Wy3beQn0hUm96sZCQTFOz/j2HDf+mwTEo45O8jj8uJOf+Zt
	xPZu+abvZ8btb+NUe6M/okoZLkNYNIg+V1u6wMhc7mnAe8wuSR79qssGqtKcsuW2zxuT
	9BJim2UA+yN+yU8Dgf3rTVIUYTzSkh6x7K3y/sHCR36pzPmsDVy0K3Kbd82xm0RU+u/9
	Rd9w==
X-Gm-Message-State: ALoCoQkEXQe1nHYz8bNV3DHF2FFt9qLihfZrKPmRsWqP19p1n6CFthVjWOBU38BZAjhcG4jNXQFz
X-Received: by 10.60.124.69 with SMTP id mg5mr5812009oeb.73.1417677293870;
	Wed, 03 Dec 2014 23:14:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.159.138 with HTTP; Wed, 3 Dec 2014 23:14:33 -0800 (PST)
In-Reply-To: <CAJTo0LZ6b0SYW7GY5KZ+zC-UGx8+afDif9y5iGTumj7Yycjr_A@mail.gmail.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<fef682ae2a0028af5d14a4cc82e83208c6a440aa.1417466734.git.anibal.limon@linux.intel.com>
	<CAJTo0LZ6b0SYW7GY5KZ+zC-UGx8+afDif9y5iGTumj7Yycjr_A@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 4 Dec 2014 08:14:33 +0100
Message-ID: <CAP71WjzrWaBs-q8i=4UwbMpzsMzOxePXOFAyCCxa0xckwX2pbw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libdrm: Upgrade to 2.4.58.
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
X-List-Received-Date: Thu, 04 Dec 2014 07:14:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 4, 2014 at 12:30 AM, Burton, Ross <ross.burton@intel.com> wrote:
>  | I/O error : Attempt to load network entity
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> | warning: failed to load external entity
> "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
> | cannot parse
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> | Makefile:612: recipe for target 'drmAvailable.3' failed
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/114/steps/BuildImages_1/logs/stdio
>
> I guess it found some documentation tools at configure time and is
> attempting to build the docs, but not enough was present.  An easy solution
> for now would be to disable the documentation with either a configure option
> or patch.

hmm. it worked for me, libdrm-doc was generated fine, and nothing
really has changed upstream in this area. my buildhistory shows that
libdrm-doc has:

==
PV = 2.4.58
PR = r0
RPROVIDES =
RDEPENDS =
RRECOMMENDS =
PKGSIZE = 40390
FILES = /usr/share/doc /usr/share/man /usr/share/info
/usr/share/gtk-doc /usr/share/gnome/help
FILELIST = /usr/share/man/man3/drmAvailable.3
/usr/share/man/man3/drmHandleEvent.3 /usr/share/man/man3/drmModeG\
etResources.3 /usr/share/man/man7/drm-gem.7
/usr/share/man/man7/drm-kms.7 /usr/share/man/man7/drm-memory.7 /usr\
/share/man/man7/drm-mm.7 /usr/share/man/man7/drm-ttm.7 /usr/share/man/man7/drm.7
==

could it be a temporary network issue that prevented access to
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
when the package was built?

nico

