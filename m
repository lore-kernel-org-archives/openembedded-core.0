Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7A24A6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 17:45:03 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so1754029wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=oeZUM3ZtRMKC/GXLUIJhTaRrSIlzruvSmYWHB/DMVgs=;
	b=YIC7alIyWdnlIrC6wo04SbHKxAIgIhxKkhZoSzV06fKQH2hrvqfEP4fWmNsQ14RG2L
	K44FyBK75hesBAn2vzR1GkCYz4HgSa0ZDs3JRHL1aqRuoVVuz+B8l5UEihvHAK9PaXVG
	1NBHgA7tRTrkSgsRoKfv4+trJQlGyviWOMqQrBA1JiVptlbG7aun5TGTvLAZBdEIhkVJ
	6C8kvJBL+mIBOIvipl/x379QKvSpAPxqocgDLZZbZAnDKRYnOCTeYJnnORdGG3KY6ttO
	ydsmLQZ/aIqGagnQnPDWOW1IX5RxtEjkS4VudQcOE0QEZptZq2ePQf7r/qtO4pDpzApq
	evTA==
X-Received: by 10.180.100.2 with SMTP id eu2mr8197794wib.90.1438278303459;
	Thu, 30 Jul 2015 10:45:03 -0700 (PDT)
Received: from [192.168.0.7] (212-41-99-31.adsl.solnet.ch. [212.41.99.31])
	by smtp.gmail.com with ESMTPSA id
	be9sm2939708wjb.26.2015.07.30.10.45.01
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 10:45:02 -0700 (PDT)
Message-ID: <1438278300.2650.6.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 30 Jul 2015 19:45:00 +0200
In-Reply-To: <316d1fc15fc3ef12d5164dbc974c1ba15f4a3564.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<316d1fc15fc3ef12d5164dbc974c1ba15f4a3564.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/26] stress: use developer's website for SRC_URI
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
X-List-Received-Date: Thu, 30 Jul 2015 17:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Alexander


Please note that the package has now a changed file COPYING for GPLv3
(but the sources still reference GPLv2)

So unless you still have stress-1.0.4.tar.gz in your download folder
the package checksums and LIC_FILES_CHKSUM will throw an error/warning
and then fallback successfully to the OE mirror.


Regards
Max
Am Donnerstag, den 30.07.2015, 16:31 +0300 schrieb Alexander Kanavin:
> So that upstream version check happens at the upstream, not
> at Fedora's build servers.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-extended/stress/stress_1.0.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
> index 44f2fc6..df96fc0 100644
> --- a/meta/recipes-extended/stress/stress_1.0.4.bb
> +++ b/meta/recipes-extended/stress/stress_1.0.4.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
> -SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/stress/stress-${PV}.tar.gz/a607afa695a511765b40993a64c6e2f4/stress-${PV}.tar.gz \
> +SRC_URI = "http://people.seas.harvard.edu/~apw/stress/stress-${PV}.tar.gz \
>             file://texinfo.patch \
>             "
>  
> -- 
> 2.1.4
> 



