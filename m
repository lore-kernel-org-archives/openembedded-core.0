Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 58ABE6E668
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 20:35:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m124so5737111wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2016 13:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mbwkWW+Zcf/WFgk/0bGPy95gL/AFPUeByyd0fO98OQA=;
	b=zMBxSlpHmKY6xeZbDIe+icJiz9O0CBVy6AoAFM1MueLXI1U/PdnspyUp6Nvy/avify
	ZUB/I4Zu4K6/xM0dYn+k8DjAeYYQDPt/H8bCu4Qr2nCqR3om2XwlpiH7vNtT9WA30cfj
	OkAPvhrBJEG6Cp+UHr56mL52FD5xOEV94IcorURXcJu+bR6/cu6cHs5P/Y2YaXTrz5Oi
	3W6/TmaTsKHW1zSb32lBNjVQOrWrO1vYtmI52CwLq3piB0qL85+Y3ZUCVcE/zCq+hFy5
	OOy6b1NJVrBab1HWlnxvDs2mtiQhbyZPtPO3u24ia2GFhFsZET7xXlPHSaH11orARiCA
	anzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mbwkWW+Zcf/WFgk/0bGPy95gL/AFPUeByyd0fO98OQA=;
	b=Zx4z6wRvxBDsL3NHL/cr4EblKZBrwVU0VV8p0XAMyzTpLY4GGgmrMg4Dtm69PwVdXa
	YcJ2mc+OZgFNzkppby7+yJrwS4tEeVQ+7X7G+RzznWNLF6TH16Mst9EAsN1VfcZrtl+y
	/dJPfiGp0yOe+Na3z8fbwZvLfcDcO6rrHw00niuQk+4CbFzxjasYP+kngyj7Up9005s6
	h/4uSfQpwxjKhgEI+RQRsCmL5lhhd+ZPBS7zwxZ/DzStNQG4j2amGSM0mddRkLld7zfv
	5FJt+EN3cvyGMqrmD6C3HIRqwuqgZ6TnXwBmZgz7bObcVdP1JsGpUtsNBKS+ZZxWf7Oz
	RaDg==
X-Gm-Message-State: ALyK8tKz2M3wg7GeVpN5trTBbrsXwuUFJGU3cmzq+IoqZd32rOdtwtCeupUwrMqr/Cqli+TEcZA4/I2F3WkVpQ==
X-Received: by 10.28.215.148 with SMTP id o142mr9334659wmg.72.1465418130307;
	Wed, 08 Jun 2016 13:35:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.150.13 with HTTP; Wed, 8 Jun 2016 13:35:29 -0700 (PDT)
In-Reply-To: <1445376809-25202-5-git-send-email-ross.burton@intel.com>
References: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
	<1445376809-25202-5-git-send-email-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 8 Jun 2016 13:35:29 -0700
Message-ID: <CAJ86T=U4JCAcbAN4rwvhNT-KO8jHK2OncF=6zQo093g-BmARSg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V3 5/5] subversion: add explicit dependency on file-replacement-native for native builds
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
X-List-Received-Date: Wed, 08 Jun 2016 20:35:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 20, 2015 at 2:33 PM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/subversion/subversion_1.8.13.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
> index f843b95..9c9bdb1 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
> @@ -1,6 +1,7 @@
>  SUMMARY = "Subversion (svn) version control system client"
>  SECTION = "console/network"
>  DEPENDS = "apr-util serf sqlite3 file"
> +DEPENDS_append_class-native = " file-replacement-native"

To make this work, isn't something like:

  EXTRANATIVEPATH_append_class-native = " file-native"

needed too?

Same comment for rpm-native.

>  RDEPENDS_${PN} = "serf"
>  LICENSE = "Apache-2"
>  HOMEPAGE = "http://subversion.tigris.org"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

