Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id D66FD60CB0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 14:27:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g1so2691844wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=q+ocs81xPcPMsC/cpXtNMAjbtDErmx1MBwG39e6wOfA=;
	b=IFjKcI+akeUevRdIee3/pgH2+rrjeRDMoeHGx7PhO0cEVBxEKfdlpIj+Ds8GS6WUHv
	A5lXUfVFXjXPKMma0tlBIwLOI7SMmYmpGMndM2Y4Qen7ugnaKHY/5YuT4mLjA6ObxBYm
	oyyLieRaGGdz/oREIDqIeb0OwI6G82CNvny84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=q+ocs81xPcPMsC/cpXtNMAjbtDErmx1MBwG39e6wOfA=;
	b=EAVlJKfex93pGbljHnWlH8FfOkjKYt05Lpc7u9jwCSYX8ISP2tTb4Kq7o9NUXGcXje
	+u3mDJWid2VDOvZCTqNpMTboQX2w/vKAtIBL+wDaYH8GP2sAgDZzSWn9DRf1l7MmXHTP
	3EWJk2QpFGEZNhf1Sv7EOIhMM+s5ZPdDE7d32O38qnB0aHmw2ikZiPBZMCksMH2XoPTx
	6Yb9P4ff6Oc8dpqSpfOCiiHpMv79c19Umg+81qatWHMwUXW+PxTZAhmF+ZlmHbXoe7aI
	fPEkKDSkBpcDUSaALqXL+mIhMLldlOW6kAjNc53j95aF8TbaIxQA8by7zF6A82MVa8QP
	8W4A==
X-Gm-Message-State: APjAAAVU4FkZwkHJEzrG2kGw+kBFXfOQjWIqawFV6vOS1l12rnOsEcr1
	cbomRO+6NZs/CyoGbOWGBbUXG5cC7Iw=
X-Google-Smtp-Source: APXvYqzweEHrBV644YwMqLFey5CPFL9EkqOksImy2NUvXa3w8hYmpAgNht0qXtC+WlPB0ylCGff6bw==
X-Received: by 2002:a1c:a381:: with SMTP id m123mr5959335wme.158.1580912837094;
	Wed, 05 Feb 2020 06:27:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y131sm8809801wmc.13.2020.02.05.06.27.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 06:27:16 -0800 (PST)
Message-ID: <b678f3b8b7dc947dec08b47886eb49e5bd61f097.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Feb 2020 14:27:15 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Reproducible Builds Issue Status
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
X-List-Received-Date: Wed, 05 Feb 2020 14:27:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Good news is we're down to a set of specific issues and those issues
seem "stable". The ones we haven't fixed yet with master-next are:

/srv/autobuilder/autobuilder.yoctoproject.org/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl:
(https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl/)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb
(needs a bug)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=13771)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20191019-r0_amd64.deb
(needs a bug)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=13770)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=13773)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=13772)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.deb
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=13774)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.deb
(unfiled, may be related to above 13772)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb
(unfiled, may be related to above 13772)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb
(unfiled, may be related to above 13772)
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb
(needs a bug)

Also:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13776
(didn't show on this set of builds)

Cheers,

Richard


