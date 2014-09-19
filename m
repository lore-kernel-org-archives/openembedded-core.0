Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC89605BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 23:04:02 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id i50so633575qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 16:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=84yLfx4s2F2TBoKN6VX35qBLBkC7A7pdRN9BZjl/ioY=;
	b=dDLAvv2LIXdU3ZrB2OLiKRCchauotnUE/mLYrAryqxwhagzulUGuDxJ3CKCNs66Erc
	Qm9xPzMEJlLzYHzzToYIIUrGH9Rt4IqWKbQPak3ZTFMNYbCWAfQtoa/XCQyzopDOQc91
	pNTC2Bg2tO9T14Rv7HxTDfEIcbLpJX3hoKzaVNqa6CWewohbY7hJKW0cVHKCu6n5Jsj5
	BPMgB3PxfxkNSAFadHbAIs+BBCIAjVCI62aSbqOfhdLpBMvK+o7erbtEEGmMXirY/84k
	BddHybnH6aXHupVoT0Fh39cIrlOXp/EdTpGBSEYHCss8zuo8dYyN3PaxFzJMN+ksuqq7
	kF3w==
X-Gm-Message-State: ALoCoQkTWYr1e0aSqVJIP5tgL7snvZ6hyoIHLyOc9wqlgdfOsClLTMD1Zwx2EmzhIyZmU8INqWR4
X-Received: by 10.224.63.140 with SMTP id b12mr3750967qai.22.1411167843274;
	Fri, 19 Sep 2014 16:04:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 16:03:43 -0700 (PDT)
In-Reply-To: <20140919224401.GA24684@linux.intel.com>
References: <20140919224401.GA24684@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 20 Sep 2014 00:03:43 +0100
Message-ID: <CAJTo0La4Etb61dwdMdikLJpByAhFE6OM1-bAHAZPyk12Nok9uw@mail.gmail.com>
To: todd.e.brandt@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Phoronix Test Suite package
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
X-List-Received-Date: Fri, 19 Sep 2014 23:04:09 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2014 23:44, Todd E Brandt <todd.e.brandt@linux.intel.com> wrote:
> This is the package recipe for the phoronix test suite v5.2.1. The
> tool is for benchmarking and testing of the system.

+RDEPENDS_${PN} = "php-cli"

Surely phoronix has more dependencies than just php...  Or is this
just the runner and it talks to slave?  Honestly have no idea how the
phoronix test suite is structured.

+SRC_URI = "http://www.phoronix-test-suite.com/releases/phoronix-test-suite-5.2.1.tar.gz"

${BP} expands to PN-PV, so you can replace that with .../releases/${BP}.tar.gz.

+S = "${WORKDIR}/phoronix-test-suite"

That's the default value, so you can delete this line.

+do_install() {
+       DESTDIR=${D} ./install-sh /usr
+}

Use ${exec_prefix} instead of /usr.

Finally, this is a patch to meta-oe, so it should go to
openembedded-devel@, not openembedded-core@.

Ross

