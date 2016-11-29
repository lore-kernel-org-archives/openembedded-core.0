Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f174.google.com (mail-wj0-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id E500C71A15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:49:21 +0000 (UTC)
Received: by mail-wj0-f174.google.com with SMTP id mp19so152468003wjc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9bS+uhqOHIen8S+WOJndJyGDRRA4jGMT3yBOR4XwtNE=;
	b=EistNCvjaYFMo4lFskDxX8+cWVAt+b4lSUi113XlCKh9NClxaQpb5HYkJ2RNqGCDcX
	NDF7uWCvhwt+Dbbtltq07OKdCbSorMLH71RCpxjWtr8f4QVE3N8j4a7looTJPE1/TG98
	g4waMrn/S1ha+D7P+flvAREGl2iRQpjLAK3HOG9cgGSCtLk018yp5heBd1KzWE1IVJv9
	rEgXhsECK/nol71zBbsmceN1HfpEeBKoxHeNXiEUpGCwn2zlXtlke/KVLt2DZvbyKHhe
	/FM8W4VVRPmUe61Umx8xbMuZKyURqCM+BXuEOL9rSWe4KbNx4V668Znfaf4U7zpCvXFd
	yQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9bS+uhqOHIen8S+WOJndJyGDRRA4jGMT3yBOR4XwtNE=;
	b=LSS/jKGEgopoaxIBdO3hAKzpM+g6i0+6EycWtK4oCnTZnyFNLmKJ45/4vTi63SXuvD
	S/1NeLQo19yXD/o8Pa1iSI5yJBq4HdKBzgy5zuvJSOI5LSZacXo7Q3luIJKS7UucAR6s
	q/uLRXlswpGee5hjnwYmHUuxpJX7cS7LHGBLzLRTFctc7cM2+nlA25HRhcVAtdBFsPXe
	0FJ4tp4LFoT+oRrV21k3ZKXgDT+c/z2wQgXijf7bv358YqiXNN3kFgLTn9qF9AZWMy5x
	Ae0G9qOy8YfKkSpvYnSufZrWufEgoYW8Ok+9pGA/6VXRoE7jbFEdG50HwAbIgmQBrKYS
	NucQ==
X-Gm-Message-State: AKaTC013WGR0rvMJrzgptyzcwwLNsFxDsKgwAn7qIn4eBE+x8Ohe+GSDqpyhVnfSPVd1HBAdPUn/IJT5+fYkxw==
X-Received: by 10.195.30.165 with SMTP id kf5mr24251451wjd.41.1480441762129;
	Tue, 29 Nov 2016 09:49:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Tue, 29 Nov 2016 09:49:21 -0800 (PST)
In-Reply-To: <de64dc20-cff3-5f25-7e66-55887e641e3e@topic.nl>
References: <6df42b3b-66b7-25dc-faac-e26e19fefbfd@topic.nl>
	<9147101c-f99a-92fc-d45c-0b67f477a57e@topic.nl>
	<CADkTA4N-PEZZdDh7nrzaXBQb7jm0-SUkGbpcShXcQAJKe5bfEg@mail.gmail.com>
	<B3A9B210-3501-47BB-8B16-CC31C7A4BCC5@gmail.com>
	<de64dc20-cff3-5f25-7e66-55887e641e3e@topic.nl>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 Nov 2016 09:49:21 -0800
Message-ID: <CAJ86T=UWX04LH5aOTAd3yq-JB5EV-3R_5=psdD2=to0und7fTw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Kernel: Builds use old version of defconfig
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
X-List-Received-Date: Tue, 29 Nov 2016 17:49:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 28, 2016 at 11:58 PM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
>
> The current system assumes that the kernel recipe creates a
> do_configure_prepend to do the mangling, which is rather counterintuitive,
> one would expect to "append" extra actions.

For reference, I've implemented support for merging of config
fragments in kernel.bbclass based kernel recipes just by over-riding
KERNEL_CONFIG_COMMAND. No do_configure_prepend required.

The basic version is:

KERNEL_CONFIG_COMMAND = " \
    cd ${S} ; \
    ${WORKDIR}/merge_config.sh -r -O ${B} ${B}/.config `ls
${WORKDIR}/*.cfg 2>/dev/null` ; \
    cd ${B} \
"

The debug version, with lots of error checking etc to verify that
calling merge_config.sh with no config fragments is equivalent to the
default KERNEL_CONFIG_COMMAND (which calls "make oldnoconfig" with a
fallback to "yes '' | make oldconfig" for _very_ old kernels) is:

KERNEL_CONFIG_COMMAND = " \
    set -x ; \
    cp .config .config_original ; \
    cd ${S} ; \
    oe_runmake_call O=${B} oldnoconfig ; \
    mv ${B}/.config ${B}/.config_oldnoconfig ; \
    cp ${B}/.config_original ${B}/.config ; \
    ${WORKDIR}/merge_config.sh -r -O ${B} ${B}/.config ; \
    mv ${B}/.config ${B}/.config_merged_no_fragments ; \
    cp ${B}/.config_original ${B}/.config ; \
    ${WORKDIR}/merge_config.sh -r -O ${B} ${B}/.config `ls
${WORKDIR}/*.cfg 2>/dev/null` ; \
    cp ${B}/.config ${B}/.config_merged_with_fragments ; \
    cd ${B} ; \
    diff -u .config_oldnoconfig .config_merged_no_fragments ; \
    diff -u .config_oldnoconfig .config_merged_with_fragments || true \
"


> A structured approach would be to split the do_configure into two parts that
> should run in sequence, and then kernel recipes can inject their actions by
> appending to them as they see fit. The first task would create the .config
> file by (forcibly) copying any defconfig or starting point. The second task
> would call the kernel's make script to futher process it.
>
> But this too would break existing recipes.
>

