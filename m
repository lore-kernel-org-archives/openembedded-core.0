Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id BAAA0619DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 16:13:18 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pa12so1124274veb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 09:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=NmDS8t080TEvKJm/mYRa40+ao89OwTHVtx6HovSXSf4=;
	b=MjuYIpmwzbeE9Vipk25XkDv1+q87HC6H5LJQ3r+4ljJj3AgGcJ4l2hiSHk38oravwd
	XSMsqinlj3UxqOnNlJh3dOwRXylO6Uegwy25P0XdIC1KEKqfL3/XHJEMNRgbGdgYIy+b
	N4N/w+PjFYno8uk2czZW/g5fJ4HjVZLUmZL9tKXmpFH6iCDP2YT4ag91pYGsKuOi7DNw
	qYFQq3mkuwqRsQDbBVNAYt3Ci60trsFQrfceM2sivX+3WgmfD2C0Nk1GQ7J7oMDgekSn
	/AH0ZR3RDCm3OpoM/hcRH/DskYYHAlLkmaJQHzxoTCLrQI5/ALQAeF5dQ6OJrfbCcSfk
	zMxw==
X-Received: by 10.52.163.46 with SMTP id yf14mr2964510vdb.58.1372954399739;
	Thu, 04 Jul 2013 09:13:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 4 Jul 2013 09:12:59 -0700 (PDT)
In-Reply-To: <84abd44bc70ed4b13ca44a8ad32a8a91d708163b.1372950678.git.radu.moisan@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
	<84abd44bc70ed4b13ca44a8ad32a8a91d708163b.1372950678.git.radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 17:12:59 +0100
Message-ID: <CAJTo0LYK3=YTgHq39=g-m+CYLGx=+52xA=uvrzF=Ch_36VfSow@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQn0pQURz4165O817RXaqDnyV84E9UXVsK2AN9/IGc2rspH8fAo7Obnd+ora0ltQrMH24kZr
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/10] iputils: Upgrade to v20121221
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
X-List-Received-Date: Thu, 04 Jul 2013 16:13:19 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2013 16:13, Radu Moisan <radu.moisan@intel.com> wrote:
> -DEPENDS = "openssl docbook-utils-native sgmlspl-native"
> +DEPENDS = "gnutls docbook-utils-native sgmlspl-native"

Please say why this change is happening.  Also is there a configure
option to force the use of gnutls over openssl, or what happens if
openssl was already installed when iptuils builds?  Vague dependencies
cause sstate problems.

Ross

