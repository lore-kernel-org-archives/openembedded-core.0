Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tszuv-0000Nu-Hs
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:58:22 +0100
Received: from mail-gg0-f198.google.com ([209.85.161.198])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 09:42:05 -0800
Received: by mail-gg0-f198.google.com with SMTP id f4so3367738ggn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 09:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ICcReMgOJtsfNbjLvjr1E4rWNMyfx1w0IbhIvriXxPA=;
	b=F43zXrv3ABVYsPnSRVQRl/lLD055K9zw7boXuOyprzX2e/HKKFOUHcpaWHFdpVMuK9
	dMkwJ1ICu0ung9h0pgs4uv1mB1Ab7XLZa3OKAN3fJ3ibdl2rnma8MICwuFWHT48d9er+
	1FXbtkTDtcHIQm401ji39VnRsz/5rDFLW8rGm0WsS6SrgnOBfjecazL3IbBgd+MFb9ql
	1UhxX9j3gokJuwFt8qj5G8XNZYNxfaxu2Y8pZdq/S0U32k8tB4ZB/FwEPVV1RqSGMPci
	OJAYUasIrzJjQIgTMS86kCNsymdWXH2FfUoITfGF2oVlT0IfuxPFqQ7e+aApveadFfzL
	fc3A==
X-Received: by 10.52.72.232 with SMTP id g8mr77924662vdv.69.1357753386851;
	Wed, 09 Jan 2013 09:43:06 -0800 (PST)
Received: by 10.52.72.232 with SMTP id g8mr77924660vdv.69.1357753386764; Wed,
	09 Jan 2013 09:43:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Wed, 9 Jan 2013 09:42:46 -0800 (PST)
In-Reply-To: <1357751495-28236-1-git-send-email-cristian.iorga@intel.com>
References: <1357751495-28236-1-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2013 17:42:46 +0000
Message-ID: <CAJTo0LZwxy0E-ODr61YK4T9Qn+jkqqsPeW06vm8O7pmE-cMAfg@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQkrN83JsGu2ui4y6JWk8D+5sfnnqh2jmrwyvq9zzInlLepjEZ+N5wGwRldKNYipmXVAw/+qK3uzFeTRPYJVu1dRI/9sVgmurnb5WgYvX+Kidf4vXvvJVktvzBpS96MpOY2xkAKI8YpHrzYwabvQahh6afEldof2GpBkJzl6ZOVh91qS7zTwfFa0F6inTQsNG6Kz8PKW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: upgrade to 1.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 17:58:23 -0000
Content-Type: text/plain; charset=UTF-8

On 9 January 2013 17:11, Cristian Iorga <cristian.iorga@intel.com> wrote:
> +do_install_append() {
> +    #Blacklist ethn network interface in case of qemu* machines
> +    case "${MACHINE}" in

This makes connman machine-specific, which isn't a good thing.  This
configuration file should be split out into a separate package.

Ross


