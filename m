Return-Path: <raltherr@google.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 735A871A82
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 15:33:24 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id w43so20424007wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bkF3imYgGvnXe2E+sRiBaYTYNyPVbx54kITtqvHOyps=;
	b=QP3Sy4gjUlGtcLd/0Z3BZ7qlmKQAFg/qy4XVMWPUUu3WHgqhcjkCC010IkwU1vLpxM
	s8WWxpt0YOlp0++fscYelLQFuj39VLsZ2t8Dd1Fu6mPQqf8auZUOcq0PpoMUxMUluFrv
	4RFRTIH7k4d7Z257j1DlNDzdteYXD3tjBSA1uY10FUxRjwuZ2MkBGonU/Fj7etucpwgG
	gLnodInSwxTo/zcJ3Wtr8J4SNmbVjGK9ACTh+vdeajbphvnB07m822HXzRmRF4efJ6iP
	xDLHijm0iILmWeAHc435Y1kuw89AS5TdCWpfXAQixYfOIBDtVhFe1IlnpK7Lm9aftnJu
	CzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bkF3imYgGvnXe2E+sRiBaYTYNyPVbx54kITtqvHOyps=;
	b=s0ES6RUSJEM/9/DZbmtGi71SX0DjVMP6kaqqN8WpNDPahLmd3z6e5kVUL/nVzJtSaD
	XGwrk+LRBgFmbe0ov6jjsseYSb70hbUD/4LUVYU3kZfJnZucowk1QDo97X3AHIRi8Dkj
	olTYtXseNRyf9jKpe+2z8mW3fH3GzlZWvRDJc+tESnPfVHVDpEsi4iTS1dL+zl6KhsMR
	xXQV8yp8uohGSEyMlfeQY/OWeFPEJ3McvZurfOtYNtD/bt8QfviI9iSbs1PWpZzTGDvs
	FDBVvjnMTnmIyd0/jp64HFSdco/peZ/odjIUbPlqFjw2V6C5D7Ekey/yLvSmG/5MxMF7
	iLeA==
X-Gm-Message-State: AFeK/H1k/RcJN51oWXvu/Jht/fs62Afmba6rESbttg66wqt9wo4C+2zfGTt5C1MTKW0aiviWShtAYnw1LjKakLlG
X-Received: by 10.28.199.132 with SMTP id x126mr1261090wmf.37.1490801604943;
	Wed, 29 Mar 2017 08:33:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Wed, 29 Mar 2017 08:33:24 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703290647590.19269@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703281817440.27955@localhost.localdomain>
	<CAPLgG==F8OV8U6CVZ2yEyErUhCJw+UwHmbEaCmaXpJBaBeLHaA@mail.gmail.com>
	<alpine.LFD.2.20.1703290647590.19269@uk63952.mitel.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 29 Mar 2017 08:33:24 -0700
Message-ID: <CAPLgG=mrr9bigbBUB5r=FgrwMLtGzhMZK8vyALgQ7D9MFkmbuw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there OE support for building multi-image/component FIT image files?
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
X-List-Received-Date: Wed, 29 Mar 2017 15:33:27 -0000
Content-Type: text/plain; charset=UTF-8

Looks like this was changed 8 days ago:
http://git.openembedded.org/openembedded-core/commit/meta/classes/kernel-fitimage.bbclass?id=cd2ed7f80b555add07795cc0cbaee866e6c193a3.
I was looking at an old local repo.

On Wed, Mar 29, 2017 at 3:52 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Tue, 28 Mar 2017, Rick Altherr wrote:
>
>> kernel-fitimage.bbclass loops through all the DTBs listed in
>> KERNEL_DEVICETREE and adds a FIT section for each one.  It looks
>> like only the first one is put into a config section though.
>
>   that's not what i'm seeing based on a test with YP-provided
> beaglebone reference board. that machine config file includes the
> line for two dtb files:
>
>   KERNEL_DEVICETREE="am335x-bone.dtb am335x-boneblack.dtb"
>
> and the resulting .its file generated contains two configurations --
> using the same kernel, and for each dtb file. i just need to read the
> code more carefully to verify that it appears to loop through all the
> dtb files.
>
>
> images {
>         kernel@1 {
>                 description = "Linux kernel";
>                 data = /incbin/("linux.bin");
>                 type = "kernel";
>                 arch = "arm";
>                 os = "linux";
>                 compression = "none";
>                 load = <0x80008000>;
>                 entry = <0x80008000>;
>                 hash@1 {
>                         algo = "sha1";
>                 };
>         };
>         fdt@am335x-bone.dtb {
>                 description = "Flattened Device Tree blob";
>                 data = /incbin/("arch/arm/boot/dts/am335x-bone.dtb");
>                 type = "flat_dt";
>                 arch = "arm";
>                 compression = "none";
>                 hash@1 {
>                         algo = "sha1";
>                 };
>         };
>         fdt@am335x-boneblack.dtb {
>                 description = "Flattened Device Tree blob";
>                 data = /incbin/("arch/arm/boot/dts/am335x-boneblack.dtb");
>                 type = "flat_dt";
>                 arch = "arm";
>                 compression = "none";
>                 hash@1 {
>                         algo = "sha1";
>                 };
>         };
>         };
>
> configurations {
>         default = "conf@am335x-bone.dtb";
>         conf@am335x-bone.dtb {
>                         description = "1 Linux kernel, FDT blob";
>                         kernel = "kernel@1";
>                         fdt = "fdt@am335x-bone.dtb";
>
>
>                 hash@1 {
>                         algo = "sha1";
>                 };
>         };
>
>         conf@am335x-boneblack.dtb {
>                         description = "0 Linux kernel, FDT blob";
>                         kernel = "kernel@1";
>                         fdt = "fdt@am335x-boneblack.dtb";
>
>
>                 hash@1 {
>                         algo = "sha1";
>                 };
>         };
> };
>
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>

