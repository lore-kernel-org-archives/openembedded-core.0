Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 819666AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 23:42:13 +0000 (UTC)
Received: by igui7 with SMTP id i7so68046132igu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 16:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KJycX+hhv+ApFGluyP7m57JWqW+EnfAjv9XJ4K2CkTg=;
	b=jomlcO1rFaanY1dzuAzV1gbqSyiEvnkUI9Ch+a7IYF9KNRlT3QDkDKLLEZwNFc3aVg
	d9MV/qdHq07Sn/rzvCwRnC6xHOfEMcAHdGon8g3b5W1ZXM+Ll8nVZOtKCV63VNvGSQBN
	s0p9MR79rVI7HQfcCAAAHLqfltq+/rLTKBESxB1o1lgYzse4rHRDKzgVslMGgFc2yYpj
	l6xd/hfFWVeCuYecPJOeIesnp/xy7LQfbx++HigKDrFof4tZ9XdMZipfBiuJH+CzUwRf
	zjQ05F1hslaY9YtXLyki7BgZ5tqyQyW4qwNmeR3vcO/VgMTtvfyWc2OTe2BnE/6sZoO1
	RE4A==
X-Received: by 10.50.59.148 with SMTP id z20mr18243371igq.77.1440459733580;
	Mon, 24 Aug 2015 16:42:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Mon, 24 Aug 2015 16:41:44 -0700 (PDT)
In-Reply-To: <55DB9A37.8080600@windriver.com>
References: <cover.1440126018.git.wenzong.fan@windriver.com>
	<c22d818de805fde488bce9e0263d573c51cee5c9.1440126018.git.wenzong.fan@windriver.com>
	<CAMKF1srnPDL=yzcu7_niSfwuxa8a-93bBQLN0ba-Roru4DRHhw@mail.gmail.com>
	<55DB9A37.8080600@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Aug 2015 16:41:44 -0700
Message-ID: <CAMKF1srfmPb6MAwTuV-jCKi3Z-fbWRv069fJi+uTLu2DCKtwZg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] libcap-ng: add package 0.7.7
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
X-List-Received-Date: Mon, 24 Aug 2015 23:42:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 24, 2015 at 3:27 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> I agree BTW that it's the wrong answer to say since it's used in multiple places
> that it belongs in oe-core.
>
> HOWEVER, in this case, I think the use in multiple places is a reasonable
> justification that it's a commonly used, and potentially core component.
>
> Add that that it's implementing posix capabilities.. and I do think it's
> reasonable to put this -one- in oe-core.  (The key to this, as always, is that
> these things need to be looked at individually to see if it's reasonable.)
>
> Anyway, this ONE has my vote to go into oe-core, based on the usage patterns I
> routinely see.. and that fact that I believe we have people willing to step in
> and upgrade/maintain it moving forward.

you have it your way, the patch has been pushed into OE-Core so
further discussions is moot from here on, I wish we wait for
discussions to finish for little we discuss on patches now a days.
anyway for this
but on debian I see there aren't many reverse deps given thousands of
debian packages its only needed by handful

libcap-ng0

Reverse Depends:
 qemu-system-common
 libvirt0
 libvirt-bin
 suricata
 libcap-ng-utils
 ladvd
 heimdal-kdc
 audispd-plugins
 smartmontools
 qemu-system-common
 libvirt0
 libvirt-bin
 libcap-ng-dev
 irqbalance
 gnome-keyring
 dbus-1-dbg
 dbus

That doesn't look much core component to me to be frank, But yes when
one needs it in his own setup then it becomes pretty core. I can site
you an example of many,  RDK depend on yajl its found in multiple
layers too but we happily take it from meta-oe because we want to
respect the layer boundaries.

