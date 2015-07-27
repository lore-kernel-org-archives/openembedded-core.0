Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id F0B6560125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:46:33 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so54800606pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=6YUl1foW9RoywTOU9pbgWTtC81oQ0n1JQVdshY66RVY=;
	b=gcL5fTmVemuGFIoQvaif+vgvCRqyVPraveKJmwDhdzYcVneadH1xOwFgKUV5kyBpop
	1qmo3K0ZByZFDt6GY5yp2IY7AYmRg/MGgwuV8LHKwzWkQag2Nt8WHfRMCV4ekXL05Yyq
	HmY8MvPtpK+JlWOUKr4J8efTjMJm8gl8uOXo9o2Qp58goxPj16EQLERP3l2QBchr+5QJ
	j4/QPB0Pu5NjIlaUGvKoOxtIkb+KBwWe74rtKA0gqrBespwKU5mMkcgWGDKPI1V4i3g/
	MwCDreRpEcrw3jvCWE++mHS21hWOH3cdzo4nQ229rlOAg9/CtgeZLVvoDyxIZ5HI/qiK
	cgBg==
X-Gm-Message-State: ALoCoQnihyYyzdMNqK1gY+XBbg6DuRjEwhjfxUySnGZQIdV/Qn+dn6KtelRjGUN2K81X2FcG1rQ/
X-Received: by 10.70.118.163 with SMTP id kn3mr52202190pdb.115.1438015593780; 
	Mon, 27 Jul 2015 09:46:33 -0700 (PDT)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	bx7sm30382543pdb.82.2015.07.27.09.46.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:46:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabkd10 with SMTP id kd10so54270038pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:46:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.116.81 with SMTP id ju17mr70453797pab.35.1438015591473;
	Mon, 27 Jul 2015 09:46:31 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 09:46:31 -0700 (PDT)
In-Reply-To: <1437996407-29463-4-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-4-git-send-email-b54851@freescale.com>
Date: Mon, 27 Jul 2015 13:46:31 -0300
Message-ID: <CAP9ODKoYa5z=_OBUUs-88hn-fx0__Bx7z-Q-f7TzsuqKr=QxWQ@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 3/6] gstreamer1.0-plugins-base: update video alignment after video alignment
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
X-List-Received-Date: Mon, 27 Jul 2015 16:46:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 27, 2015 at 8:26 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> Video buffer pool will update video alignment to respect stride alignment
> requirement. But haven't update it to video alignment in configure.
> Which will cause user get wrong video alignment.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>  .../videobuffer_updata_alignment_update.patch      | 53 ++++++++++++++++++++++
>  .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
> new file mode 100755
> index 0000000..57edd8b
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
> @@ -0,0 +1,53 @@
> +commit 88d253ea23b06289df40401160b606323f16c910
> +Author: Song Bing <b06498@freescale.com>
> +Date:   Mon Dec 15 09:34:35 2014 +0800
> +
> +videopool: update video alignment after video alignment
> +
> +Video buffer pool will update video alignment to respect stride alignment
> +requirement. But haven't update it to video alignment in configure.
> +Which will cause user get wrong video alignment.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=741501
> +
> +Upstream Status: Backport

Upstream-Status: Backport [WHERE?]


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

