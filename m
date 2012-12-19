Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlNn8-0005eM-FN
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 18:51:12 +0100
Received: from mail-qc0-f199.google.com ([209.85.216.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 19 Dec 2012 09:36:05 -0800
Received: by mail-qc0-f199.google.com with SMTP id b40so3315705qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 09:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=WqRkSFwFiOulU1ToHWqvQV13VtVZ+/czr3+dB/2/Mss=;
	b=alfWrxW4cjZUok6ZueV2yJs2r37z5+VKahoYtGbfF3iwpHT8GCho6ksu+rX8e9DawV
	VIuqb1a8ArP+1DvnuiAqd7jDl+VBrNDMbsh2UOxdtSLSkR0LmVoYrvmHK2GJPshf+8BI
	IxS+HIe0afFmFNx2MJoyafcCZCxCxOclZqjyAAYoIsjVjOLFHN9mWhOoAlJUHbi5uF3O
	4uuJw/Z9FlaI+lTosmMvawvq/87COg0jzc+mjlNHh8pkqB5zuxaMTqEv9ZJiHGggpUVC
	BzPcz5J3TfDseCz1O/HT1/e9ANzT/xE9Eq6HHABuRX3SCeNpaAx4JTG3OssY8b35Jr3G
	FC2Q==
X-Received: by 10.221.10.6 with SMTP id oy6mr8168700vcb.65.1355938564209;
	Wed, 19 Dec 2012 09:36:04 -0800 (PST)
Received: by 10.221.10.6 with SMTP id oy6mr8168691vcb.65.1355938564084; Wed,
	19 Dec 2012 09:36:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Wed, 19 Dec 2012 09:35:43 -0800 (PST)
In-Reply-To: <1355932969-25071-3-git-send-email-laurentiu.palcu@intel.com>
References: <1355932969-25071-1-git-send-email-laurentiu.palcu@intel.com>
	<1355932969-25071-3-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2012 17:35:43 +0000
Message-ID: <CAJTo0LZhssWLSM=jzX4QBCoGbrMcESgR9fNJ4hCJNqg-AuWTdg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQkGGQAOp+iiShiLNDbDcgc8bST6eIgHsdEKSuG8hC7CJTFCBaJSk+fB8HzTu52T9avlfnAkw+z1Ihz7bqnlw/554Fr1ut3NWkJEWuBvg1Ngs946jwRqeEfWqkghSKPvWWmnLOU/nR526w72xoOxU/lgoYt2FQxeuAw8Uk9KYDCUrqCFhfXbbIb5SCIH7FYZkhLO6hR+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] matchbox-keyboard: use the gtk-immodules-cache.bbclass
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
X-List-Received-Date: Wed, 19 Dec 2012 17:51:18 -0000
Content-Type: text/plain; charset=UTF-8

On 19 December 2012 16:02, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Since the class was already present, use it. Also, this will have the
> postinstalls run on host, at do_rootfs time.
>
> [YOCTO #3602]
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


