Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T8yyP-000166-8D
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 21:39:45 +0200
Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 04 Sep 2012 12:27:21 -0700
Received: by ggmq1 with SMTP id q1so1549627ggm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 12:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=cTrjY7cKOIphcnHVvX6uNG7ftS1GIpCOg6t5AKdNxcY=;
	b=MYIpzaz1k1ifHP2xxoolqaoVSvW49DLnq5NwBfhBBg5hkf/gRknabkmDtjsPoRNAh+
	bSDCtqWYXwUkNClaVcOHbjS1oTTm+6/kQGgbKZVa4A9z7FhyPnGKEdWcSuJ2o9l9WcoE
	aRm7cWYKXAwqQQLar6H/M/TcfA2rn0dKZRBQDYqg1Z7PwfCFBmaJKzL66Emf/d9W3a+v
	kwYcAv9bf62RbzwY0CQa7/ArFiMnV5T+z5M690xjoo2CfL8vK4tLqU0URjGkZw0bwd2D
	xtIoPsrHpdN3oGFkRGm3whloUBOvtzVN9RdE/BF7oHGEm7DxhrYPPb+oER8zwfTD8ZK+
	oUcg==
Received: by 10.60.19.195 with SMTP id h3mr16149524oee.102.1346786840333; Tue,
	04 Sep 2012 12:27:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 4 Sep 2012 12:26:58 -0700 (PDT)
In-Reply-To: <50462C35.6000400@windriver.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
	<1346428885.16485.29.camel@ted>
	<CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
	<CAMKF1sqqWJEwsvng_BHbqACJWhUBDRfW4Nixd2t2O1eADmCE5w@mail.gmail.com>
	<43FF08E0-8A1F-4B64-9552-D5C68A207D0C@gmail.com>
	<50462C35.6000400@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Sep 2012 20:26:58 +0100
Message-ID: <CAJTo0LY5-Zuw=O_gPaHy326v4VCa704rruHZiefuxBQDbBKwLQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQmRMooyLLA9GsQ45OwD849Oj1funvJYlv7HR0lDCz21jVQh3MCw/36L8tWIedd+PFS1wz/C
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Tue, 04 Sep 2012 19:39:45 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2012 17:28, Mark Hatle <mark.hatle@windriver.com> wrote:
> I'm sorry, not all devices being generated have initramfs configuration (nor
> do people want that behavior.)   Also we've shown you can build a system w/
> a split filesystem and it works properly.  The systemd/udev developers seem
> 'lazy' to me... they were unwilling to work through early and late boot so
> they just gave up.

With oe-core master, I get:

NOTE: Executing RunQueue Tasks
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the
base_prefix, requires a shared library under exec_prefix (/usr):
libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xdead2000)

So that's a false positive, and libgudev can be moved back into /usr
where it belongs?

Ross


