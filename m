Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 04AAE60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:04:30 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id im17so384838vcb.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z7Zu07VnhokPePNjpINEoDfqSMP7XoMYPx0iKqYRqjY=;
	b=EMQHg7CVGjc+fDPXeuSKP7a2x660zUQKBNSAcWsKZ617KJ7Eh1wvedbyT4jpFyeTxM
	XrtDoheAdt6Rl5iBpk3gSozBSy4eAUST9Y4zAVLfK0ZgIoZS0yRYmq86hhMp8yGK/9z+
	ptYtsMCXO0c47xnpOfpRl9qLvYCD8KBocrS/RFZe/x1NLv77qmkJqU7cr29wqECQDxXt
	L/8Fzp/i2wN3RQuu59e5bVvqhDjMA/EaLUU20GO2uhsqFy0uS5daHUFEZTN8KV22pxBz
	t1lgE31WRCIVvWUd4FD7vlF72vwOt+8VnHhDlnwgwgoUCd3xKI0bO1zFVeGXrCN26Kjt
	LS9w==
X-Gm-Message-State: ALoCoQnRncGzxXAXiCemtsPZMt1QH+HYgT3/4+8/LwzDcmy0Ng6HHV3aNgTpDlpuunBD7jt/6HKn
X-Received: by 10.220.99.7 with SMTP id s7mr1559219vcn.19.1390410271441; Wed,
	22 Jan 2014 09:04:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Wed, 22 Jan 2014 09:04:11 -0800 (PST)
In-Reply-To: <CAP71WjwVdruoAvkjtO7mPTVE0bNQfCWYUrEC2TZdjagXCBRkrQ@mail.gmail.com>
References: <CAP71WjwVdruoAvkjtO7mPTVE0bNQfCWYUrEC2TZdjagXCBRkrQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jan 2014 17:04:11 +0000
Message-ID: <CAJTo0LZ_dNVaBQpA2J2GPEZ4VHLM=dDpp1HcvRDPoa0Yz=7ALw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libsdl and opengl DISTRO_FEATURE
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
X-List-Received-Date: Wed, 22 Jan 2014 17:04:32 -0000
Content-Type: text/plain; charset=UTF-8

On 13 January 2014 09:58, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> if we make it a PACKAGECONFIG instead, would that be considered the right
> fix for this bug?

Yeah, until we have a replacement for the "opengl" DISTRO_FEATURE then
you'll want to use explicit PACKAGECONFIG options for GL and GLES.

Ross

