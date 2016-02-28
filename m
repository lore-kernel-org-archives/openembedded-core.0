Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8C379771D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 16:39:25 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id bj10so8361528pad.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 08:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=0NmLlWlHPrr6U1OYC2faFxHKS47rs8lr2JYbaL6LRck=;
	b=Q+1BORkdhVk5MZtXl9kYetQAqD2KojdZrpkqcq2oZPg/SVwKnYKuqLgBnwFmCpeXOV
	v5jh0H7SvyU5KuStdgxz8QsKdBkMXpD4TvYPKGcGI1bxO2D6CcDaQiMfQpxs+hqjJdGi
	eQwhCyStky6fKVmRnjOEAMcFmjaYKgXHwfGJGFU8aDhP1NoWT/CDoG0cDtczvXBIBZhZ
	zO/z+Vi8kgRvn+uQ8IDMZxBLNUvjvwYIm5urif6Ql2m1OXBAZRqHJ68aTAzwEtHO1q0z
	gUHGE6vRSwTLPtpKZ+yWUXu/5KkF27u+aDZyE1iG5tf9tELTiXcAYgufNR7lN/4w2Jld
	JRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0NmLlWlHPrr6U1OYC2faFxHKS47rs8lr2JYbaL6LRck=;
	b=g48cOB824rdTC0xyfBctiDtuXyMnvX6TxSNLSqapJs98pYV9u23WgalZo05gR0lDOp
	O42Wwl+iBwrC0ItaFSCXGIpVvqaEw7FRVR5ptvGr9ybZM1IjwhlgXjgQN21CUkJXhw2e
	vHav8zeHOxI6jpiedZQQHfi1MkdvUV/2zDj3WEgofpYsy9G6vAPQANQcrYE1hVTaBcsn
	jTB5/ZwQyQpbV/5E1IxbePo+dh/54SieMjGQDpl2O4A+ss1das25kFtuXOl7eQpy18zJ
	6S+JOBNidimgxVtHiePI46W0O8udInpqz6QPFccJFGzUiXK33Lo0M+4FJyY26ziF5YIU
	1xVA==
X-Gm-Message-State: AD7BkJJTlYPixoHVuTbBy4ytLIeE7PVdYWMEEE+Yfhcp0MJBS7JTPfbiDyRc5h6AYkyUhw==
X-Received: by 10.67.30.163 with SMTP id kf3mr16443493pad.45.1456677565944;
	Sun, 28 Feb 2016 08:39:25 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:8c42:cbe2:78b3:46d6?
	([2601:202:4000:1239:8c42:cbe2:78b3:46d6])
	by smtp.googlemail.com with ESMTPSA id
	b4sm24783414pas.19.2016.02.28.08.39.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 08:39:24 -0800 (PST)
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster@mvista.com
References: <cover.1456242658.git.akuster@mvista.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56D322B9.2010906@gmail.com>
Date: Sun, 28 Feb 2016 08:39:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1456242658.git.akuster@mvista.com>
Subject: Re: [fido][PATCH 0/7] fido Security fixes pull request
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
X-List-Received-Date: Sun, 28 Feb 2016 16:39:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping

On 02/23/2016 07:58 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> Please consider these for the next fido 
> 
> This is to meet our obligation for Yocto compatibility
> 
> The following changes since commit 06d9c894636352a6c93711c7284d02b0c794a527:
> 
>   libbsd: Security fix CVE-2016-2090 (2016-02-18 11:03:10 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/fido_cve_fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/fido_cve_fixes
> 
> Armin Kuster (7):
>   qemu: Security fix CVE-2016-2198
>   foomatic-filters: Security fix CVE-2015-8560
>   foomatic-filters: Security fixes CVE-2015-8327
>   tiff: Security fix CVE-2015-8781
>   tiff: Security fix CVE-2015-8784
>   librsvg: Security fix CVE-2015-7558
>   gdk-pixbuf: Security fix CVE-2015-7674
> 
>  .../recipes-devtools/qemu/qemu/CVE-2016-2198.patch |  45 ++++
>  meta/recipes-devtools/qemu/qemu_2.2.0.bb           |   1 +
>  .../foomatic-filters-4.0.17/CVE-2015-8327.patch    |  23 +++
>  .../foomatic-filters-4.0.17/CVE-2015-8560.patch    |  23 +++
>  .../foomatic/foomatic-filters_4.0.17.bb            |   4 +
>  .../gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch      |  39 ++++
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   1 +
>  .../librsvg/librsvg/CVE-2015-7558_1.patch          | 139 +++++++++++++
>  .../librsvg/librsvg/CVE-2015-7558_2.patch          | 230 +++++++++++++++++++++
>  .../librsvg/librsvg/CVE-2015-7558_3.patch          | 223 ++++++++++++++++++++
>  meta/recipes-gnome/librsvg/librsvg_2.40.6.bb       |   6 +-
>  .../libtiff/files/CVE-2015-8781.patch              | 196 ++++++++++++++++++
>  .../libtiff/files/CVE-2015-8784.patch              |  73 +++++++
>  meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   5 +-
>  14 files changed, 1006 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
>  create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
>  create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch
>  create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
>  create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
>  create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
> 

