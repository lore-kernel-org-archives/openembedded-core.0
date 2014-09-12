Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 45CAD65DAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 10:22:54 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id r5so447083qcx.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 03:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SDrhEUZZH2cTqiZhY5apgsrDIm5o+qmlhVBiOIB3ZKQ=;
	b=Aidrao39qqmujcIklgawLyoKcwlCwwxp1xFZuNXsdTXuj0RcGAhUU69rbYwvrO+b3U
	X57CQEhxQx3eT+yhhM8YGX99EIt9tRRfTYcyPM1D8Zv5afIgrMtXDGSLwnXYzTv+2M8K
	WtGifNa5Lk3eLHt4oIwcTSj30qt1cDJnghviHQr7684hJrlD9UTTLqSjlHYSS7vZnY17
	5BCnHE/0Y4rzvcAgas4XkZFl9zd9/gHer6OVvuqG9IU0FowJFA0oJdYX2+im+JsVfYoO
	q4yyeUSMNoGTSSn4TXrtGWrY3aVjn9USZPF1wvkYzGq9P7HZ0EU+4dji1mtPU/95gvWy
	7ang==
X-Gm-Message-State: ALoCoQm18y3ck9+A8e5iVesFnJBYqD79HtfKTakhp2cRqf08YaLWe9Q9OFnJg1wfAQ/AryYZUnj0
X-Received: by 10.224.64.201 with SMTP id f9mr10758993qai.64.1410517375969;
	Fri, 12 Sep 2014 03:22:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 12 Sep 2014 03:22:35 -0700 (PDT)
In-Reply-To: <1410507789-9307-1-git-send-email-kai.kang@windriver.com>
References: <1410507789-9307-1-git-send-email-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Sep 2014 11:22:35 +0100
Message-ID: <CAJTo0La9+9YnJPPaCNXp_7H+_ejYVuOgKb8QRNkV0q3hdZRnAw@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add machine qemuarm64
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
X-List-Received-Date: Fri, 12 Sep 2014 10:22:55 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2014 08:43, Kai Kang <kai.kang@windriver.com> wrote:
> There are some packages fail to build with qemuarm64, I will send pathches
> for them in another series.

I can't build a kernel with MACHINE=qemuarm64:

|   LINK    vmlinux
|   LD      vmlinux.o
| aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
| aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
| make[2]: *** [vmlinux] Error 1
| make[1]: *** [sub-make] Error 2
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/data/poky-master/tmp/work/qemuarm64-poky-linux/linux-yocto/3.14.17+gitAUTOINC+a94680bfeb_b85edae6fd-r0/temp/log.do_compile.24366)
ERROR: Task 81 (/home/ross/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.14.bb,
do_compile) failed with exit code '1'

I can email build logs if you'd wish.

Ross

