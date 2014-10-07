Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1D98F71186
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 14:44:50 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id i50so5442292qgf.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 07:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=hV15mRtM/nJaYW1HWsh/i0Sot6wRYFc37QynLk1wLI8=;
	b=OIZzV5dCtzapFB7+fgVF1sWZF/plvMGqYkqgbv2bedaBw7VcqIEd5WK/vgww82VU8n
	k9ZleD9z14RfqF9ht5nPBeC38Fp1AsB9/1kVKfRX3VvrwFjvbwfrg3jeyEKX1Nbb2Xl4
	ABj2X8V3SUSDmAlmA+HaiqN5cZ5OYqWjcn6Ie8qZMyAvkB0DuejaghI6jKiaxYLqIkS/
	mL+MMETLscHvApc2tme8kQPupakSZrk4CNhHFJZviLB1/IQ65hgOAUvhGYgkB9Xo4j0P
	eOlImzLqZ7rMKxHZSd48q1EszxlarzE/ttQuoswlCt/frUwGEANJNAVdqaiFvpmwYt+k
	QZUw==
X-Gm-Message-State: ALoCoQnm8UaQoNWGsMVJ3RdyObVTlKJ+AqWotfyVj5VatyxPJiA15BsJiANInF6rwSrqHsqg3TwV
X-Received: by 10.140.23.50 with SMTP id 47mr36683088qgo.77.1412693091702;
	Tue, 07 Oct 2014 07:44:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Tue, 7 Oct 2014 07:44:31 -0700 (PDT)
In-Reply-To: <CALbNGRRiHL6P_2PuHPz=6evNKrbYdku71o0z0y=KjHsrzh_a8w@mail.gmail.com>
References: <1412633433-23255-1-git-send-email-ross.burton@intel.com>
	<CA+AhUGw=iumQ49Y-kshAM5R8zqww+vL7ADErTN-Ywtq+PYq9ug@mail.gmail.com>
	<CALbNGRRiHL6P_2PuHPz=6evNKrbYdku71o0z0y=KjHsrzh_a8w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Oct 2014 15:44:31 +0100
Message-ID: <CAJTo0La1fFkhdLhpmP79V2E-LxQOv+aQj9hsccD5_B7Ho_TznA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: don't add files and dependencies from units Conflicts
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
X-List-Received-Date: Tue, 07 Oct 2014 14:44:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 October 2014 11:40, Andreas M=C3=BCller <schnitzeltony@googlemail.com>=
 wrote:
> What other packages are missing after this change? Any buildhistory on th=
is?

$ git checkout master
$ bitbake core-image-sato
$ git checkout systemd
$ bitbake core-image-sato
$ buildhistory-diff | grep -v PKGR
Changes to images/nuc/glibc/core-image-sato (files-in-image.txt):
  /etc/systemd/system/sysinit.target.wants/systemd-binfmt.service was remov=
ed
  /var/lib/opkg/info/systemd-binfmt.list was removed
  /etc/binfmt.d was removed
  /var/lib/opkg/info/systemd-binfmt.control was removed
  /lib/systemd/systemd-binfmt was removed
  /usr/lib/binfmt.d was removed
  /lib/systemd/system/systemd-binfmt.service was removed
  /lib/systemd/system/proc-sys-fs-binfmt_misc.automount was removed
  /var/lib/opkg/info/systemd-binfmt.prerm was removed
  /var/lib/opkg/info/systemd-binfmt.postinst was removed
  /lib/systemd/system/proc-sys-fs-binfmt_misc.mount was removed
  * (installed-package-names.txt):
  *   systemd-binfmt was removed
Changes to images/nuc/glibc/core-image-sato (installed-package-names.txt):
  systemd-binfmt was removed
packages/corei7-64-poky-linux/systemd/systemd-binfmt: FILELIST:
removed "/lib/systemd/system/shutdown.target"
  * FILES: removed "/lib/systemd/system/shutdown.target"
packages/corei7-64-poky-linux/systemd/systemd-dev: RRECOMMENDS:
removed "systemd-binfmt-dev"
packages/corei7-64-poky-linux/systemd/systemd: FILELIST: added
"/lib/systemd/system/shutdown.target"
packages/corei7-64-poky-linux/systemd/systemd: RDEPENDS: removed
"systemd-binfmt"

That's not a world build but it does include many packages with systemd uni=
ts.

Ross

