Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 71D64606CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 13:58:34 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id m85so15653945wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q89xZC1ZCA/gbXxqzaLhYQJocMvu2Bi6yB578QK9RnM=;
	b=Iqapky8s4XuB5zg3Crqfhmu2zdpkPSHl8j85gW3YVQvEDPMO0Qo8S258BjBQ85VNG+
	DfvkSNkZtVF7VeV3bZLfNNilTGcPYk8y/EQIsQf6mQDUIpvHGfuff4KVBIyjsNzOjc/E
	mCU++3IKkyjHOHkv8AnuYGgC4pq6b3IsqK7oQTQpNRYDxBBsKh2sOMMbb5d3D5pDfLtB
	poNNxmdDQjl8A3+mnU/MvAkuYe5sQfWLpmf9QJIZ143K8MYtZmqcuuTr7zd3t50KM91j
	H4407GZsrYATH2i0U6XETp2yBb9KbzeWvdSRyXgPQ/7+dst32imGXmANUe1SuF8yWK6I
	WhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q89xZC1ZCA/gbXxqzaLhYQJocMvu2Bi6yB578QK9RnM=;
	b=N1Segx+VnX5KSk6hvu8HK0waKcrd+yjdicvO1dMkbB2DeVR91hFURDwyyyuq5Tyex8
	A1Gs03O9ySDHsiM0/unt4Z6P8LuAc/DxsXctKxBOD+94xbEM7xzJIJHCAtG0rhKP3h5C
	yLQe8fFft09ukLTKV0tfQWFNZkZ22GCRzQQkk16W9G7hsBV6nvVEio7W+T3953Co27nO
	ih42Mz6mY6J+auY+48GpHhmNNRldcInxl/0UkJlrGAfBgb3s5wAXjWWvKN/glV9FS5LU
	PeD2WNEW+l/CbDhLD2SridKyw1F1qgj8oJudIjKi1n6OpcLOHF5FKmEXwEXaZrclKWEd
	nibA==
X-Gm-Message-State: AIVw112F2hg8brYfsbbD51rwau97c1gC2e5JnoT6snR3N8ESD7qv/x3I
	mb0IacOHRmu3TYy+mNP2pldwJw08oQ==
X-Received: by 10.80.145.38 with SMTP id e35mr18343709eda.8.1501595915354;
	Tue, 01 Aug 2017 06:58:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 1 Aug 2017 06:58:04 -0700 (PDT)
In-Reply-To: <CAJTo0LbrPuF8c+BnhCjaVU=uyyjqZnPp7o48dgUx1B+rWR8TCA@mail.gmail.com>
References: <20170801002347.23800-1-raj.khem@gmail.com>
	<CAJTo0LbrPuF8c+BnhCjaVU=uyyjqZnPp7o48dgUx1B+rWR8TCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2017 06:58:04 -0700
Message-ID: <CAMKF1sq6p3rLaNyYqAVpFhjXmVRkEKwz01aJS3w39HNf3hZ1+g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa, llvm: Use native version of llvm-config
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
X-List-Received-Date: Tue, 01 Aug 2017 13:58:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 1, 2017 at 3:44 AM, Burton, Ross <ross.burton@intel.com> wrote:
> ERROR: llvm-5.0-r0 do_compile: Function failed: do_compile (log file is
> located at
> /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/temp/log.do_compile.4542)
> ERROR: Logfile of failure stored in:
> /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/temp/log.do_compile.4542
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | ninja: error:
> '/data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/recipe-sysroot-native/usr/bin/llvm-tblgen',
> needed by 'include/llvm/IR/Attributes.gen.tmp', missing and no known rule to
> make it
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/temp/log.do_compile.4542)
> ERROR: Task
> (/home/ross/Yocto/poky/meta/recipes-devtools/llvm/llvm_git.bb:do_compile)
> failed with exit code '1'

yes, just realized that I was building it with a build where
meta-clang is included and TOOLCHAIN = "clang"
so it was getting llvm-tblgen from clang when llvm-native version got
renamed so it kept on building for me.
I have sent a next rev of the patches which addresses this issue as
well as your comment.

