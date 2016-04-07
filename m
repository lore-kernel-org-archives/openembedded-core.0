Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id BC95B75A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 16:42:41 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id c20so58922131pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=YTrySnXbcon/4XLOtkjuDsY0lQxL29/b5WP62D5MJ8w=;
	b=W5FjYt4eCIMUJrhl9JBdwITQMVLJCV56L2qa/sE7Nh19EmlTeyOdGkBjXuZcEq/YGl
	LzBaA2vylyJJBVkjRDbeKNRPYRNNCpZ8e6/WT+5Ss6WA5bx8PiGaHxyIowSm8eosB5Bi
	EYvv/FxaIDen4aX8uGdC02EF4NEwHKfDZTLr46pBW2qtcM43mO9sJrmxc7jDe3nfd6k+
	UARfgjpDebK6RfhM1gaFw6cmBwS5WKysoD0kbmv1W5FQxpPsN6JXSsImQiZbpdwoaE45
	iiWR4YgDzxbciLHwfZPDXWXwZ5ooP8iBNYCb0Dd7G/eqzSjC5rNckaP3mpliQ5Har7yR
	YdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=YTrySnXbcon/4XLOtkjuDsY0lQxL29/b5WP62D5MJ8w=;
	b=SxEcRV1xus77RPk5QnrtYVmrb3qwu+V1bHBjdWTNVm93naMsDU/4XCsVBhk8/vjeXF
	03eUjED1QNvDWA0PJV5ZvlRDZmmiVnCzA000gQdYnQ0X3SdPUmtdnrs8OfIzsrn69p8/
	hnqNaHXwWn5XopBMcZHVcURM8CIWf10+1oqODhpq/8e+EM5Zs1BIGzCX8ixRJqBBMh4j
	0EBgKuE68Idwppptt9iGIIGEo8UE0wY4yEaFeIgRQ8giLZvVtTiNzmyW2DbtL36yiGWa
	0uT7l+yz4X+kfPLmUzrAg38frNTciiFCvBU8hWJGoGda5ZU/c8/AC3I1PAucEFxX7HDr
	0dSQ==
X-Gm-Message-State: AD7BkJJmggUuagZi1vkicbMjxWSn87Mfaxhm4kCyVBVYsyrp46vrruHSWlBAg76Iqa0Nag==
X-Received: by 10.98.67.67 with SMTP id q64mr6042464pfa.44.1460047361671;
	Thu, 07 Apr 2016 09:42:41 -0700 (PDT)
Received: from [172.20.124.128] (ip67-91-94-2.z94-91-67.customer.algx.net.
	[67.91.94.2]) by smtp.gmail.com with ESMTPSA id
	g74sm13367531pfj.1.2016.04.07.09.42.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2016 09:42:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1445729978-29103-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 7 Apr 2016 09:42:38 -0700
Message-Id: <C45DACC4-0F2A-450B-B17F-4A7A362876FB@dominion.thruhere.net>
References: <1445729978-29103-1-git-send-email-raj.khem@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH] toasterconf.json: Set default distro to nodistro
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
X-List-Received-Date: Thu, 07 Apr 2016 16:42:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 24 okt. 2015, om 16:39 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:
>=20
> This makes it self-sufficient with OE-Core
> Generate ext4 instead of ext3, most of Qemu
> targets in oe-core now use ext4

Any reason this still hasn=E2=80=99t been applied yet?


>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/conf/toasterconf.json | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
> index c8e42ef..1ee6d29 100644
> --- a/meta/conf/toasterconf.json
> +++ b/meta/conf/toasterconf.json
> @@ -1,8 +1,8 @@
> {
>     "config": {
>         "MACHINE"      : "qemux86",
> -        "DISTRO"       : "poky",
> -        "IMAGE_FSTYPES": "ext3 jffs2 tar.bz2",
> +        "DISTRO"       : "nodistro",
> +        "IMAGE_FSTYPES": "ext4 jffs2 tar.bz2",
>         "IMAGE_INSTALL_append": "",
>         "PACKAGE_CLASSES": "package_rpm",
>         "SDKMACHINE"   : "x86_64"
> --=20
> 2.6.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


