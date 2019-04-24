Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC916BE39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:07:43 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id q14so5867109itk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FRyEfe+q6cM8oEip6A1XxM4jw88xlVmAZTAObM1PCuY=;
	b=OtY9sRhCvO8pI9TVIEQU+YvXG05bklCzSkVsR9urgWBqwnK9tZm6KgwXBNCSfQbYsr
	9Rbc8P6Sf3KDwTchsOb/p4BJS17/wtkzTkitpAH6W+saU+9D/cCbDtACMg2/GlS8lP8P
	iYw5yqRIeKHrpVwOM5RFb7CDT6LX0vQ+T/zVadOiikylPzgcFxHv7kRN71nwj1PkAx/k
	FWhsePzOQemIMgHuJYIXAlVHlILGzzM3xHAutHHzQgxzcOBcoN1xF1UZkJm1Ji9iETCR
	gzisvciqnmA/vIQx32cCXZHAtPUxy43jonlUNr82cdEVPMQfropbVxZ+CL0Nxmji8YP8
	rMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FRyEfe+q6cM8oEip6A1XxM4jw88xlVmAZTAObM1PCuY=;
	b=uFOUFxRL9NOshElTeP10wjlMgX54M4xDGgqOCB6t/nI2+fuJa1bU4O8VRcVJ0ttyer
	BwHzs10KAQmuoMjYUsqhkvpKwtQ0mAljSmxareel7Narqs8NlqOF5ibqDbSCdcdQxOaq
	Lkgz+flEjGAlRW4YzS3xh5cSxB04dmw8pgTJZ0jipE/RZr0WFYl1VdzsIkk7o56tjjrv
	R93KeNrMTdKjWhst3Mau/Y/EzO91Nq/+CDID0diaq5zd/lrQjeEOxInf8TarhkuhPbvk
	d4WVNtw8oOXoWXRu0vjfQpwjEsZoj70A+IEP7d1bGOKDcMLez1Uc1bdkLuiI9vLxZdMM
	UF/g==
X-Gm-Message-State: APjAAAUorN92h5UOT33W+m2Op0ZBk2uLWCaLmGqJGC90C0t0xy7mZuPf
	JgzSr3RjGAiki6HFUyTIOdpV0LxaqWmN6xOE138GfNEVpig=
X-Google-Smtp-Source: APXvYqzCgFC5OvNp2+bavrdhavb1waMIeAcCtujFncXdc9efYdTCkyfsrDVKQWCadMtE6ArcGl5Z5o7MIXLbPn+IgN4=
X-Received: by 2002:a24:5ccf:: with SMTP id q198mr771661itb.130.1556107664259; 
	Wed, 24 Apr 2019 05:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <1555664043-329543-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYQeSCoShBRc5SJ9C1+qyFAgxYn7uVYAshFrFGGQAos=Q@mail.gmail.com>
	<5CBFC2C8.2000301@windriver.com>
In-Reply-To: <5CBFC2C8.2000301@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2019 13:07:32 +0100
Message-ID: <CAJTo0LYTNWiahedBPtGujq9JT53vtWrHw9spOTwgPCmpqkr8tg@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: fix ptest failures
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
X-List-Received-Date: Wed, 24 Apr 2019 12:07:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2019 at 02:51, Yu, Mingli <mingli.yu@windriver.com> wrote:
> Per the comments at https://gitlab.gnome.org/GNOME/glib/issues/1357, we
> need to run test_non_utf8_printf under builddir to guarantee the test
> passed.

Re-read the comments.  Setting that variable skips the test, as it
isn't useful without the translations being installed. So, we need to
install the translations:

root@bob:~# /usr/libexec/installed-tests/glib/gdatetime -p
/GDateTime/non_utf8_printf
/GDateTime/non_utf8_printf: **
GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf:
assertion failed (__p == ("10\346\234\210")): ("Oct" ==
"10\346\234\210")
Aborted (core dumped)

root@bob:~# dnf install glib-2.0-locale-ja
[ ... ]
Installed:
  libglib-2.0-locale-ja-1:2.58.3-r0.corei7_64

root@bob:~# /usr/libexec/installed-tests/glib/gdatetime -p
/GDateTime/non_utf8_printf
/GDateTime/non_utf8_printf: OK

Ross

