Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 894216018C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 21:54:01 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so35181360wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 13:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rFPghK21GS6hRlLcCiwLEb9DdWH1LJ9msB91YBg0QJ0=;
	b=rhCTZ8jMwKrEUToXHhd/1OI3fp1CkO50F8V2NObvTH3gnpZQYap0YxX+zKfky4gey3
	lplZCBOgRrb8Zjtet3Fcn0wjbZ5O3M+QHWRmOeK1bAEH4/utaugujsC7rLLrqx+q3LH5
	f7O/XNvUgBABgwobg9HRqqy3TomAJPCUceKQiSIL9+LOB+iWzrL1WGTsFKERIkSat0QI
	MC5nvobktOxWQDaaS5cUeGOby66kJdUg+csUoiEHsYMyvjTugd37UtkNznqj1XEcPbH2
	sEJzCR64xyuLfeZI4LkkDoygAuixO6S8vEXejbEXLofNNfbuCGA82/qQtCkF3bMmXk/f
	H+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rFPghK21GS6hRlLcCiwLEb9DdWH1LJ9msB91YBg0QJ0=;
	b=Iafjg1vMM7qT5p9A91xmxo/0aABK/HOOCMbuPh4SmEwIgDa0W4E5A2BGVcJ3U+UvRG
	Md5RYWUJzaLZDgU6jBETDaoW9FKNSU7odx3jkS89pxhJ8FnWBvv5Nn3Rvw6SHqx04FMV
	yiao1LXpqit6vDswwWQPHUmp9NwjP0fCEz2EMzRIsNaS9azCZbsW8u8FyF5M4C/cYyiZ
	ox5UgEnCqnU3GZ503SwHk7U3mHyF6AieqQj/L2T534iKHBZ6aXi1XESIlahTxoydlDTO
	wmBOaHw0igNQvAo8BeFzm2Hzh7vmN9J9grZIayv9vDejH0rOyg070VURQg8cCieQVKvR
	t2dA==
X-Gm-Message-State: ALoCoQmQJhPTnI4nO9grH1RulL+bo0MhdUsUw6WU5qggFsTonRkTaoVGdNAqWQu/+yXbx3R63FfF
X-Received: by 10.28.170.133 with SMTP id t127mr5738875wme.65.1448574841605;
	Thu, 26 Nov 2015 13:54:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.184.110 with HTTP; Thu, 26 Nov 2015 13:53:42 -0800 (PST)
In-Reply-To: <1447430355-17813-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1447430355-17813-1-git-send-email-alejandro.delcastillo@ni.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 26 Nov 2015 22:53:42 +0100
Message-ID: <CAP71WjwrFqt0OuN9omYdwiOtO10-ruxp0pbtAD8T7dK2KF4UgA@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>,
	Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: add cache filename length fixes
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
X-List-Received-Date: Thu, 26 Nov 2015 21:54:06 -0000
Content-Type: text/plain; charset=UTF-8

hi,

+Robert.

On Fri, Nov 13, 2015 at 4:59 PM, Alejandro del Castillo
<alejandro.delcastillo@ni.com> wrote:
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  ...ng_util-New-file-with-bin_to_hex-function.patch | 122 +++++++++++++++++++++
>  .../opkg/0002-md5-Add-md5_to_string-function.patch | 110 +++++++++++++++++++
>  ...0003-sha256-Add-sha256_to_string-function.patch | 110 +++++++++++++++++++
>  ...4-opkg_download-Use-short-cache-file-name.patch |  85 ++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.3.0.bb           |   4 +
>  5 files changed, 431 insertions(+)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch

Can this patch be backported to jethro? My jethro builds fail without
it.. I can carry in my layer, but I believe this would be better in OE
core.

If needed, I can prepare and test the patch.

thanks

