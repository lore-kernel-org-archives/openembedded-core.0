Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id AE9756B43E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:57:11 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c13so540918vea.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=yKyRnutT2dQCLV05Tr7ZSSYYftBfT9A2+81ILS8RvU8=;
	b=PrRR2OpxHvi5jcyZa6Nci1d8ZiqeHPASM7FCMN4DmAYgzV1Btd2ovn4/4PgStZ7awq
	tYdJbkDpR1quIsAmUhIj+PnF4MrbhC/kDY00BvGf7pEZyDHtYSP0i2fe6VjH5ZYEmkGd
	mqAO0Ii3J6w4KEJMhqtngNgMMiey2H/Ni/AOk4WX6NjuOitGITntLaLGM8WnmwgBodjz
	lLw34xk7jP6tJhjLzpoRCr+mFFZJy/9a7G2yGap6cNZQfYTOWaG8t61AF8646POKDeuG
	QCzRuIc56A0Xp2VluGlma4bA/N/cyO0jljkkGIp6cBROh8MS1oJuYLfyStjbPF7XaVhy
	KbiQ==
X-Received: by 10.58.171.4 with SMTP id aq4mr25556957vec.26.1375113432240;
	Mon, 29 Jul 2013 08:57:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 08:56:52 -0700 (PDT)
In-Reply-To: <9e31ede9ba9cb827f0b5e510d4aab17260aa5eab.1375065009.git.Qi.Chen@windriver.com>
References: <cover.1375065009.git.Qi.Chen@windriver.com>
	<9e31ede9ba9cb827f0b5e510d4aab17260aa5eab.1375065009.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 16:56:52 +0100
Message-ID: <CAJTo0LYSeFR29EAWWqaVVGw_YO1_u=J-UquRhaMdyNq7s6gUpQ@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQktznk4VMKDOHI1Ms3Q9x46+QROChp+5hC+yXjSkqzu+Ffy/2pqh+pB39vBYnRcIaupBK4e
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 09/10] lighttpd: make /www diretory writable in read-only rootfs
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
X-List-Received-Date: Mon, 29 Jul 2013 15:57:11 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2013 03:33,  <Qi.Chen@windriver.com> wrote:
> +    echo "/www /var/volatile/www" > ${D}${sysconfdir}/default/readonly/lighttpd

/www is the default lighttpd document root, where the web sites are
stored, so putting them in a tmpfs would be very wrong indeed.

Why does lightttp need write access?  If it's putting logs in there
then they should be in /var/log, PIDs in /run and so on.

Ross

