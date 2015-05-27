Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 89BCB608B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 12:06:39 +0000 (UTC)
Received: by pdea3 with SMTP id a3so12107902pde.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sbIkmx9gliNjv4T3y+sEGsjebZgFq9FFV42aYMxBqSk=;
	b=ofI7mV6rrgyYWY8kofrJtgl7CIjrKzAwJ280LmLscIu9q0vnf6389kxzReFOuelSn0
	DkA9AOfmtUhNysIw0H5VtbxMelZZgnSGO4HzAw29FjWm2wPmWpjzxAK7CoSnKoPBLzD2
	WveAvMH5Z1gxdCTxxqA/b06o1bTOTFhqwH7P2whkU0MQom1ZfTGtOItItRaNxkv97imz
	a6yTdIPkXA0DGiOglrIAqpjSnHB9QCDvOJska7g2/70Dmzo+1Id+w7pvUlWghZpYX+Jb
	DDvsHQU4qYW9Uh38L1cs92idxZH7zO+3EG6+hUvX5lC8AoFPPDgS2RIer4NoBNgjTIIq
	iylA==
MIME-Version: 1.0
X-Received: by 10.67.4.161 with SMTP id cf1mr58102715pad.35.1432728399936;
	Wed, 27 May 2015 05:06:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Wed, 27 May 2015 05:06:39 -0700 (PDT)
In-Reply-To: <e2402c26a050c4bb6387b3ee235aad25572124e3.1431997609.git.kai.kang@windriver.com>
References: <cover.1431997609.git.kai.kang@windriver.com>
	<e2402c26a050c4bb6387b3ee235aad25572124e3.1431997609.git.kai.kang@windriver.com>
Date: Wed, 27 May 2015 09:06:39 -0300
X-Google-Sender-Auth: INIhzsbfH_qgTK5j0VCOr6BkD3M
Message-ID: <CAP9ODKqJnHrxU=jagLe8SKH_X0YX__7Pd-iZ9EesUY8GRGjeYA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Kai Kang <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] alsa-tools: upgrade to version 1.0.29
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
X-List-Received-Date: Wed, 27 May 2015 12:06:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 18, 2015 at 10:08 PM, Kai Kang <kai.kang@windriver.com> wrote:
> Upgrade alsa-tools from verion 1.0.28 to 1.0.29.
>
> * update autotools.patch
> * add file gitcompile which exists in git repo but missing in release
>   tar ball for sub-directory hdajacksensetest
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

Seems this broke framebuffer build:

framebuffer fsl-image-machine-test@ls1021aqds (1/7) patching file Makefile
framebuffer fsl-image-machine-test@ls1021aqds (1/7) Hunk #1 FAILED at 1.
framebuffer fsl-image-machine-test@ls1021aqds (1/7) 1 out of 1 hunk
FAILED -- rejects in file Makefile
framebuffer fsl-image-machine-test@ls1021aqds (1/7) Patch
makefile_no_gtk.patch does not apply (enforce with -f)
framebuffer fsl-image-machine-test@ls1021aqds (1/7) ERROR: Function
failed: patch_do_patch
framebuffer fsl-image-machine-test@ls1021aqds (1/7) ERROR: Logfile of
failure stored in:
.../build-framebuffer/tmp/work/cortexa7hf-vfp-neon-poky-linux-gnueabi/alsa-tools/1.0.29-r0/temp/log.do_patch.26177
framebuffer fsl-image-machine-test@ls1021aqds (1/7) recipe
alsa-tools-1.0.29-r0: task do_patch: Failed

Is it possible to take a look?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

