Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 638947701C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:32:28 +0000 (UTC)
Received: by iodv82 with SMTP id v82so36013474iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 14:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to
	:content-type;
	bh=MTqMOcatRgtJCg3afJ9jeV0/v1NqFVxA8ZGex+PIToQ=;
	b=PU/Lk+lzSr21a6MnbIuf3GWH+HnUbCxTC5u3CPBcHAM+55aQJ1mXjkETFl/hBddRyq
	zCflJfPyatfXNo9KtBEulABI3nVXjRTfCQW/RqIHCM+iOR643UFUgb45hOkZ/spqzIx+
	mB8tx2zXABfmN2m5BQhSwJnjIaLyB3QmA3EzcXZoTTTZ04TWTHEF9i4y9QOE+y8hd8qn
	AkAnjn40Hx2i1S15NX7Zl1s3Ce4T45DFolHW/kEFmHovyYgTYcJ/i+2kQM6G9S+S/hwv
	2Mrr7MOJhNabYIIn9J4i1NfBB+iMHRsqYe0xWvqqEKkE6GW6cZ2Ox1kyCerRxVuqjdVd
	t9YQ==
X-Gm-Message-State: ALoCoQlWMuI1QM4OKhAXBtPTMgG4Xzt8TbRlot3YQBHRhLHxHVq55WF3KTtqmMosqy+LH7AsS/q4
X-Received: by 10.107.28.140 with SMTP id c134mr201293ioc.93.1444771948532;
	Tue, 13 Oct 2015 14:32:28 -0700 (PDT)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169])
	by smtp.gmail.com with ESMTPSA id j9sm7830171igx.3.2015.10.13.14.32.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 14:32:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iow1 with SMTP id 1so36154404iow.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 14:32:26 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr202346ioe.37.1444771946627;
	Tue, 13 Oct 2015 14:32:26 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 13 Oct 2015 14:32:26 -0700 (PDT)
Date: Tue, 13 Oct 2015 18:32:26 -0300
Message-ID: <CAP9ODKpN0kbRtm7pvrky5pwFZ_1YPoZ-fy=kt+4CPB+NUoyBKA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Error due GTK+3 new rdepends on libgl
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
X-List-Received-Date: Tue, 13 Oct 2015 21:32:32 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

commit 3d95440b77bfe90d20c8b7a96e611b6cf2ffcb70
Author: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date:   Fri Oct 9 15:20:55 2015 +0300

    gtk+3: gtk3-demo needs libgl

    The demo app uses OpenGL (within a GtkGLArea): it needs a runtime
    dependency on a GL library. Current GTK+ can only handle
    full GL (libGL.so.1) so RDEPEND on libgl.

    Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>


This includes a forced rdepends on libgl and I see no reason for this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

