Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id DB49D73E11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:47:49 +0000 (UTC)
Received: by obkg7 with SMTP id g7so55421765obk.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=acq74cR0j7Ak8d1QaaNgCwtfM6mGsrWeBvdFGScrypo=;
	b=Y5vVs1nAxCdE9TK+vg7l8FH6udP0QA85DjzNMXAhkCL0EV2oNggSWo2PtWLrOfYEhl
	6ssBiqM7uM7ZlxirS+9JaFGKiZwU2JTNwlM/XFNCktsDK95KVu9JPZpB8y3G9a4olbCC
	0hTCd1AyLzlktxfZn1qIMMS6/Wz9eQ1o4+WokYUd86bGhVVqjEw3960t79wdWWmc1C1o
	egVjR2FVVvvGI/hzcr3cB+Trfff/76XrON3nkuGIvagU4vTxFMQXwQXB+t5D5cAmwQ8M
	rvBJm23mVXBeFrE5gpJoDy/hHgkvbVuHA6H7Ns0MU1jggMIMR1U8kQUxerZyv6k51VwK
	+LDg==
X-Gm-Message-State: ALoCoQneLYX60GM4A2zVitsmsRvsk7OZQUcg+gqtFVd8fCY2MpY/Dxd43hdULefvXt6Q+cyYKyLN
X-Received: by 10.182.148.65 with SMTP id tq1mr7506046obb.12.1440154069677;
	Fri, 21 Aug 2015 03:47:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 21 Aug 2015 03:47:20 -0700 (PDT)
In-Reply-To: <74b4262e5df004800e56b273e7d7a3d64d7af9b3.1440145857.git.liezhi.yang@windriver.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
	<74b4262e5df004800e56b273e7d7a3d64d7af9b3.1440145857.git.liezhi.yang@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 21 Aug 2015 13:47:20 +0300
Message-ID: <CAHiDW_HqD908Y_F7i6kFNrLhD4UohnUp1FSMtF-aVnCoW=A7TQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] btrfs-tools: 4.1.1 -> 4.1.2
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
X-List-Received-Date: Fri, 21 Aug 2015 10:47:50 -0000
Content-Type: text/plain; charset=UTF-8

On 21 August 2015 at 13:15, Robert Yang <liezhi.yang@windriver.com> wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../btrfs-tools/btrfs-tools_git.bb                 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> index 4ad4b81..15cc3f2 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>  SECTION = "base"
>  DEPENDS = "util-linux attr e2fsprogs lzo acl"
>
> -SRCREV = "20be329fdb569fefdf88ba0e4ca1a41488fcbc19"
> +SRCREV = "7f1328ccb5d159efe850d4eaea9b49bbe8c4181e"
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
>             file://fix-parallel.patch \
>  "
> --

Is there no PV change here?

> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

