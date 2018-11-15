Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id B93526B12B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 12:37:53 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id p11-v6so18847677itf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 04:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dj1VXZDhRLS+pQtgsR8Mq7tCqjI+sSIAneT9i3ZAar4=;
	b=ugmjzwXrkGy70tSsx/tVH+klcRPYO3HdBsk/prEPBgZlBxo6TpFIlo8Lf5KCQuCob/
	JSVyvIlLeqWwSTcF1J3XCXEPyQz6u2WTD8jU2SwLwamrklEV8np36ls3hiUb1iVBCgI+
	OMnlPns/c3HvVWNNrEUAJnDNqvkElzo7W/jTwU99iJC/H1gN+hXE6+3rs+TzuK5HdmGv
	j6jXTRO0+77S4UrqIjN8n3svQ8QyCWbuMribEVRsFAOmTzfaWCXbib7zerakZm0pN64W
	JIKWrQyoiCNBG1IP0lz7K+/0LiGnA3PYGvA3qXzNz9YL7cuDzblP4Ro34MzF4X8en8Bl
	itVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dj1VXZDhRLS+pQtgsR8Mq7tCqjI+sSIAneT9i3ZAar4=;
	b=Pcwn0M0IyZNMO6os46hNLwh8RasXpLdRV4p5psywBirO3LNLm9rsWqxESVLzIV+IXA
	A8hLEYBWyx2JO1NMqic3hLgDQw54/sNTFcSnATRG3OYxBvi8eOIKCINA7nOIn1YhvPng
	SvLwmD1I/xDx9/lIU3W/tmmfgIfz2G27LRjXykmdSpruxakDzAcjsW29bAoV9jcWitpo
	CObiG0qT+5HX3ZUttj3nvccpQ+ijuKBdXts1pRFUeaRLRWJdbRSrNE+W7ZoSeiOrK0vi
	NJ4Bw2zgq5zyrWKs86E35DQ+30yJMHPpohAZ8L6RXc2pyEsdSCyV+79WT5kR70gXiZck
	GjHQ==
X-Gm-Message-State: AGRZ1gI+I3+fhB1mXJA9bx69HWVvXlUuh/GyRMs7ocLjgdlLu42N83lF
	qLK1VkF0rPs7bt3ZVvmrsPX0SJXY/NUgC9pFqcka5w==
X-Google-Smtp-Source: AFSGD/W2+NPlXoR5fZ46mOZJ8/oCk1UOoYl7TrhhvBRuFLIKP/AsvcAvJNceGjjmF/yFXMMP0LRblJ+L2knhfSTVR/w=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr6092013ite.130.1542285474871; 
	Thu, 15 Nov 2018 04:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20181102172812.12120-1-sno@netbsd.org>
	<CAJTo0LbRiDVcGxuihyGkhDk3ATKb18r7Z5_pfSd3=C=0SHbaWQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbRiDVcGxuihyGkhDk3ATKb18r7Z5_pfSd3=C=0SHbaWQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2018 12:37:44 +0000
Message-ID: <CAJTo0LYX6v7zusWiOtmkNfR+pcS_EUPq9E4krZkn1wvgBjoJKQ@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3{,-native}: update to 3.7.1
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
X-List-Received-Date: Thu, 15 Nov 2018 12:37:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Nov 2018 at 10:47, Burton, Ross <ross.burton@intel.com> wrote:
> Getting reports that this breaks cross builds, for example python3-dbus.
>
> tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot-native/usr/lib/libpython3.7m.so: file not recognized: File format not recognized
> With 3.5.6 the python3-dbus do_configure lokks like "-L/home/dev/medusa/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot/usr/lib -lpython3.5m"
> With the patch 3.7.1 from the ml, it looks like "L/home/dev/medusa-test/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot-native/usr/lib -lpython3.7m"
>
>
> Looks like the cross/sysconfig/etc code regressed and it's picking up the native sysroot libraries for a cross build.

Yep, all over the autobuilder too:

python3-dbus: http://errors.yoctoproject.org/Errors/Details/200715/
gpgme: http://errors.yoctoproject.org/Errors/Details/200716/

Ross

