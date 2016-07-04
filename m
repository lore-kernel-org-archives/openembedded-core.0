Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E41256011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 15:00:32 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f126so106868648wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2016 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=kyU1s0ADTIDcrK09XaPJZatz7yHHvVyrTeCE8ny8hx4=;
	b=pWISNhwbegKbQKBZolRQJ+wSKLSsz9nXMAwSPXYVDsrUbyEt/648HgV5lb13jjGv9k
	0YpKYg3pt+tEawTLlZ09hWRSy0xBFRy93hJEoiPPYmf5DSsxNm9Xs8vTFj8Fnto6jRKI
	koG9Ob6ys/U05F1xEKi4C3dk7XuivIz77FwGsF+vMllY6oxYttmHfnNcqr1BOxpydEjw
	dqQVPe4rdyi7iPEDrLvDebo1x9jsU3LskfZ4lU9bUgC2tkv/GpfkbjCU3SgReboLrONz
	NnhcWutZ+IBiou2i+evG5wunXw5L5CymuNOCJ/++tUZyrQUwXG+8uiNvc3eMlZq2kjtb
	MhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kyU1s0ADTIDcrK09XaPJZatz7yHHvVyrTeCE8ny8hx4=;
	b=cik/FEJ0YXcYFUQ8mXj2WHUtyRzi7SpnUILBf+iePuUBld4yGGuN47Un5GeERPW5ib
	r/zm9ofDqM/EFH3FzsK03NNIcfacWqFqj7Va0qzD1IfzTirgk37odJzXo2zhQgMbVhyl
	P4hCl0Sbz4735HTXO9nbizjZJ4iRJWy5MYbbN4HJuBaljbEmvs/w4YhrBY/4ybWOFwCv
	8Jj59J0HfCQFSCJF68/vPqZzgtlLyKBjoDEy8sBCjdZTCDPY02c4kZs2CKng1RtlUGXy
	n/VFuWZ5wcP3PM+fiB9k4Ew2xYeFE3ygkfizJdWb8tn7c6mMm1XxmgzcMolq7LtyLQSD
	P90g==
X-Gm-Message-State: ALyK8tIlaq9M20E/E7SsgymbQmfDYFgRstcSNEXnD5yoSuNtrweqdFV8PpdAZVqKvCLnlT7Mc6hS08Wjto5LPA==
X-Received: by 10.28.36.136 with SMTP id k130mr10805894wmk.4.1467644433250;
	Mon, 04 Jul 2016 08:00:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.39.134 with HTTP; Mon, 4 Jul 2016 08:00:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 4 Jul 2016 08:00:32 -0700
Message-ID: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Automatically creating tar files for bin_package.bbclass
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
X-List-Received-Date: Mon, 04 Jul 2016 15:00:35 -0000
Content-Type: text/plain; charset=UTF-8

Say I have a proprietary library which only I can build from source
and I have a conventional recipe which builds it within OE. I would
now like to create a tar file of the library and headers etc, plus a
companion recipe based on bin_package.bbclass to allow others to make
use of the library in their OE builds. ie the situation described
here:

  http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#packaging-externally-produced-binaries

Is there a recommended way to create the tar file to support that?
e.g. a class which automatically creates a deployable tar file of a
recipe's ${D} directory?

