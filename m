Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id D28046FC57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 09:46:56 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id e89so5312318qgf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 02:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=V5wPUpi1a0W6oXzuJHrdxOZgE7PzVRX1Fh7xJv5pY+8=;
	b=KbayJdqVkEhO18IoWWv/iNQd1dwy0CceOpPUc3Lu85K/D60rsoAg6i7t0o85BeW57M
	fcIgRZY2EaGZ6/iPbsFZRLjdglqfeQN2wf+CpeKo7gr+D93AwNN33iFYrMthJCjTKtW+
	inGkdmvXyg6rv0zNINFU4CMlwyg4hMQZyAkczZBUjclCuSGFsWKZN+9sLMKDrFp0l2VW
	xULjepbZTfudCU8eR8G8uJ6vP/+akjELm4OweoZ/EzqzUG9wrVaalVkajASk4yDR4v+g
	a1UQSwQi9uy5RCSvOCC51pWxsoTUp+rJ4cvpgsT8DmZosWxVPkS6QHiAFCXPZhN+5J02
	4ALw==
X-Gm-Message-State: ALoCoQmdeMG00bbqBIq1cOEi/2/W4Y9ip0a46pjeqXN1ykqEWybrZeaNLObQ9R4HuMbI0zirw05R
X-Received: by 10.140.94.144 with SMTP id g16mr21795280qge.77.1410860817953;
	Tue, 16 Sep 2014 02:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 16 Sep 2014 02:46:37 -0700 (PDT)
In-Reply-To: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
References: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Sep 2014 10:46:37 +0100
Message-ID: <CAJTo0LYYSxR7VDtZ8JyCg+MtgJQpnXgno6P9xs744Pzx=FRXJw@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmod: remove the setting of INHIBIT_PACKAGE_STRIP
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
X-List-Received-Date: Tue, 16 Sep 2014 09:46:58 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 09:27,  <rongqing.li@windriver.com> wrote:
> Setting INHIBIT_PACKAGE_STRIP is added by 61cb45869c[kmod: ptest fixes], but I
> can not reproduce the described issue, and seems it make wrong logical [
> when enable ptest, INHIBIT_PACKAGE_STRIP is always 1; and when disable ptest,
> INHIBIT_PACKAGE_STRIP is always 0]

I take my comment back:

ERROR: runstrip: ''arm-poky-linux-gnueabi-strip' --strip-debug
--remove-section=.comment --remove-section=.note --preserve-dates
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/armv5te-poky-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/package/usr/lib/kmod/ptest/testsuite/rootfs/test-dependencies/lib/modules/4.0.20-kmod/kernel/fs/mbcache.ko''
strip command failed

The autobuilder failed dramatically on this.

Instead of inhibiting the strip globally, I wonder if there's a way to
avoid stripping the test suite.

Ross

