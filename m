Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm143-0007JZ-Iy
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 12:46:56 +0100
Received: from mail-vb0-f70.google.com ([209.85.212.70])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 03:32:08 -0800
Received: by mail-vb0-f70.google.com with SMTP id r6so6348579vbi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 03:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=bDXfzOP1XeJm6cUbfyMFb2ogRypgta3tJTiatH5a8ms=;
	b=GxS0Nd+1gSc4yEXQkFt5Ow2FOvCoIr3u0dH2AkZ710MD4J1jXyn+A4GnniDmQIEQfU
	OeO0V/hHj2/3MY0GiCQv7XMH6OcDZn/YWj3Q+qYs97gROWXcy7uSKuS6YVVpID7L3fRr
	UcpcDHYVa8w/+DF9P1zowQuTFFi8fHFaTe4bpj/ZjIO2i08h1INYlVono/Px8iJdXWge
	syA+sVYhNyGUo2hmZJ5ylz8OIj6KuITMcoJ2caTnMuO3cd7iIdflhZ3J3j66Kixoopsg
	76gDJ02wFPprCVLLqDuF+VgoIC7wHgFJX2F7/vT6unJEUgyfDNzsMI7fOq7EJk6wRcdh
	lTfQ==
X-Received: by 10.58.155.99 with SMTP id vv3mr19635839veb.50.1356089527255;
	Fri, 21 Dec 2012 03:32:07 -0800 (PST)
Received: by 10.58.155.99 with SMTP id vv3mr19635820veb.50.1356089527079; Fri,
	21 Dec 2012 03:32:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 03:31:46 -0800 (PST)
In-Reply-To: <cover.1356022882.git.radu.moisan@intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 11:31:46 +0000
Message-ID: <CAJTo0LaRLqYM8DC185riHPo_hTy+-GCn_-xntvCeX_JnCcjbXQ@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQkolQIGjeVp+mtxGGSPzgkhWeSKF/sA9gx21ErB+Aev3nvHxaaSnsbmyMj0qdsBEkLY7HtUCq6opWvNC8Hn62TybZQUyp8kZeccckR3K/2XDCuArtJ3CyzEuru8iawHlQ8vaiJG0iwm9PBcqdg9VfQwWuM67Ajj7HAO4kqRg9UzeoboinJj5Zt6xSj6jn3EpgjXvx54
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28][RFC] systemd Integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 11:46:56 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 17:11, Radu Moisan <radu.moisan@intel.com> wrote:
> I've rebased my branch, again :), with some cleanups here and there
> I also pushed a few patches suggested by Martin.
> Feel free to comment on everything.
>
> The following changes since commit 958162e96b4a4f23bca94500b5f20975633dd5c6:
>
>   bitbake: hob: use base image only if it was set (2012-12-14 17:31:31 +0000)

That's 95 patches away from poky master, please fetch origin and rebase.

> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd

The short log looks like this:

86470e3 Systemd initial integration
d1fa1fa Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
d7f6847 Automatically set PREFERRED_PROVIDER_udev
a2edc09 Add systemd_base.bbclass
ccc83ce Include systemd-compat-units and avahi-systemd
addb2bc Inherit the systemd_base class
2426a47 set default.target to multi-user.target
42cbe6f wpa-supplicant: Fix indentation
e715fa0 dropbear: Fix indentation and cleanup
83311c9 systemd: Some more cleanup
f091e53 systemd: disable  source rcS-default
a7dc429 polkit: merge together the two instances of PACKAGECONFIG
14165c9 systemd-native: update FILESPATH with *-native directory
eaa960c systemd: Remove gitpkgv.bbclass
6220483 systemd: (temporary) remove dependency on cairo
1527d71 cgroups: Add INSANE_SKIP to avoid warning about .so file
0bd67a2 initscripts: Cleanup recipe
4aeecde systemd: disable sysfs.service
9869ffd Remove sysvinit mount related services if systemd is enabled
3b0884e systemd: Make the main systemd files proper CONFFILES
43609a3 systemd-systemctl-native: fix FILESPATH to find systemctl
901deef xserver-nodm-init: add systemd support
9427b9f systemd: add PACKAGES_DYNAMIC
02cde59 util-linux: Enable systemd support
3f07f4c lighttpd: Remove automake patch
7428e54 systemd: Introduce a create-volatile to create tmp directories
1b0886e systemd: Fix build when base_libdir is not /lib
60da63d systemd: move disable operation into prerm() script

First, in a branch for review you don't want to have "fix this",
"delete that", and so on.  If a file was added in one commit and
removed later, squash them together so the file doesn't exist.  If you
fix whitespace, squash them together so it was always fixed.

Next the mantra is single, obvious changes.  The first change should
be to introduce the systemd packages, then the integration into the
build, then the fixes to individual packages.

Any patches that are not related to systemd (eg lighttpd: Remove
automake patch) should be submitted separately.

Ross


