Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B79C6B6F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 15:06:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z5so2090650wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=wMgkgPPVTeIBcI0sn0QqEPk9ZVRMcQYrG+gJjko3yVs=;
	b=TqXj7JzyBmX0U7B4MVpOQED61e3zUOoNyE4q+YRu/oCyONTLdM0XL3RcI8TzC+4iey
	USyhlv38N4vq5N4qIylzYs/iIttUVaYsWhqzuGcD/iWQtjPjo+iDZpjg8AZ5czJeJnTr
	BOBOhYaSHRwta+vcaASiz0006kg5YHJWxkNrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wMgkgPPVTeIBcI0sn0QqEPk9ZVRMcQYrG+gJjko3yVs=;
	b=G+Ndzo1rdPWA8Jss5Geny2mJFnnSEg3wisA+3wXJ3HfsLH+IrqH3CHkoToB+pvuUPY
	0OIpI89xNkgUGisphc021+qnvuVXDkCpHOJuqNGCGFEs8CEJi9E6tkk3UABiDjOzEcqd
	+q/8RzN4VeLDV5FFek06jDIobDQ70o6fxb33ieJzyNhOE80Fk1off5hXFj+mUTM5HsNG
	ATPUCPl2s4Wnb8VzoRpsn8aCWIrqnblmXgdkpaGeowdDRyryJ7kpRDY2uAhvgXUDLEee
	E1ZRhQuVS/ghmUg0lqO25GBev/NLzSHUbbzn84ydxsW+EuLVjSqybtvfLL4zDUIIl85L
	AvmA==
X-Gm-Message-State: AA+aEWYe+gVuNaBkN5fgdF9S9JTSp68qA94z+J+ihv9bf5baHoqJJunN
	1MTKUPTkcgI0HZbzZ5X4P3OCRQ==
X-Google-Smtp-Source: AFSGD/X89p/JJ7x4t+wGiAsfwMq5l6Fa2eMunpV3K+pdJO5zy1OJGCyvRZpI3ndALnMrXsY/rTVn7g==
X-Received: by 2002:adf:a50c:: with SMTP id i12mr21889499wrb.220.1545318381785;
	Thu, 20 Dec 2018 07:06:21 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d4sm11153934wrp.89.2018.12.20.07.06.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Dec 2018 07:06:20 -0800 (PST)
Message-ID: <7f4d5364472280b622057a82fbf9dcfd11dfc17b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 15:06:19 +0000
In-Reply-To: <75d63f87f2ea25effa7707b735b2123ed2156ea4.camel@linuxfoundation.org>
References: <cover.1545291716.git.liezhi.yang@windriver.com>
	<29e6785a8b38d49961aa7f1138d664336052dca8.1545291716.git.liezhi.yang@windriver.com>
	<53c222052c0da6a7db056bfa1318371c8b7db2dc.camel@linuxfoundation.org>
	<50ccbdb3-12b8-e381-5931-b52b5b5efdf5@windriver.com>
	<75d63f87f2ea25effa7707b735b2123ed2156ea4.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] oeqa/concurrencytest: fix for locating meta-selftest
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
X-List-Received-Date: Thu, 20 Dec 2018 15:06:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-20 at 12:19 +0000, richard.purdie@linuxfoundation.org
wrote:
> On Thu, 2018-12-20 at 18:43 +0800, Robert Yang
> wrote:                    bb.utils.mkdirhier(newbuilddir)
> 
> This broke on our autobuilder:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/61
> 
> It basically creates a "stampeding herd" of bitbake startups as if
> you
> specify -j 40, it would do this 40 times nearly all at once and that
> causes retry problems.
> 
> We need to move the call outside the for loop as the value doesn't
> change.

I fixed the patch but it raises some questions about the way bitbake is
behaving. I wrote a test script:

#!/usr/bin/env python3

import os
import sys
import subprocess

for i in range(50):
    sys.stdout.flush()
    sys.stderr.flush()
    pid = os.fork()
    if pid == 0:
        ourpid = os.getpid()
        print("Starting %s" % ourpid)
        sys.stdout.flush()
        newsi = os.open(os.devnull, os.O_RDWR)
        os.dup2(newsi, sys.stdin.fileno())
        try:
            output = subprocess.check_output("bitbake -e bash | grep PN=", shell=True, stderr=subprocess.STDOUT).decode("utf-8")
        except subprocess.CalledProcessError as e:
            print("output: %s" % e.output.decode("utf-8"))
            os._exit(e.returncode)
        print("output: %s" % output)
        os._exit(0)

which is a bit crazy shows some errors both on the console and in the
bitbake-cookerdaemon log and shows that closing the UI connections when
we have a client is not the right thing to be doing.

This may give some insight into some of the oe-selftest failures and
I'm looking at how to improve this behaviour...

(added Chen Qi+Randy to cc as well)

Cheers,

Richard





