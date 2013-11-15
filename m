Return-Path: <hans.beckerus@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 450A76D75C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 09:08:39 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id i7so3599902oag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 01:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8xI3v2Y+CL2fDz8W/GqjwNFGAJCeGzWjw8bW70BibhE=;
	b=mSHBmsTODtPOfYIS3Qby2njPycXzL2M/u15xTN9NqBa8Xcuhjq+6PkGrWhH8V98xb8
	ESnchgCtILPIPfcb0oJV4xx4ZG15h6SWc8O3qsiUo1mJRkcjQqW2ylAY/NMFWD64kSS2
	dmIzerJ/XdTcEMELatloHubFivHFVWVuJxdh33cQwABaeHm6V7Zyo0KNdenMwkRtrS0K
	oMGIpaGLwj3WJ+rnULogFrREXsVMCv8TxrFqRp8T6akFpoie45GjXRVYQepPOeEoFYua
	ziGD0dk1vDXBYQ7hlrh0SBo+bZnxO64Q0eIHJcJ1+eJ7EAxmAVkkSMFHY5HbrZBbdnFb
	vhDA==
MIME-Version: 1.0
X-Received: by 10.60.59.5 with SMTP id v5mr5910920oeq.30.1384506520667; Fri,
	15 Nov 2013 01:08:40 -0800 (PST)
Received: by 10.182.228.81 with HTTP; Fri, 15 Nov 2013 01:08:40 -0800 (PST)
In-Reply-To: <1384497286-19011-2-git-send-email-Yue.Tao@windriver.com>
References: <1384497286-19011-1-git-send-email-Yue.Tao@windriver.com>
	<1384497286-19011-2-git-send-email-Yue.Tao@windriver.com>
Date: Fri, 15 Nov 2013 10:08:40 +0100
Message-ID: <CAFyqS9o64=J_rOUT0aQf1LHXCSF+hw=1zLpg3R+y3t6MXLA6mQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Yue Tao <Yue.Tao@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Add e2fsprogs-mke2fs and e2fsprogs-e2fsck as recommend packages
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
X-List-Received-Date: Fri, 15 Nov 2013 09:08:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 15, 2013 at 7:34 AM, Yue Tao <Yue.Tao@windriver.com> wrote:
> The mke2fs and e2fsck commands are regular tools of e2fsprogs, so they
> should be installed.
>

Could the enforcement of mke2fs conflict with the busybox default install?

Thanks.
Hans

> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
> index 63c0057..5c78c82 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
> @@ -59,6 +59,7 @@ do_install_append () {
>  }
>
>  RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
> +RRECOMMENDS_e2fsprogs = "e2fsprogs-mke2fs e2fsprogs-e2fsck"
>
>  PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks"
>  PACKAGES =+ "libcomerr libss libe2p libext2fs"
> --
> 1.7.5.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

