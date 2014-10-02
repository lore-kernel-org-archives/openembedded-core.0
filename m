Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 309996FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 16:24:05 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id z107so2168443qgd.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 09:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HWqjoijhrJX3fUgFH93ZhTCuibbfJBCFJPUA/XawTkE=;
	b=Y8WakMsVkDz2TtorXeX1S/8YmnOTVEw4sbaD0v2qUE+z0F5zG0ESb54z0lCwuyL7ex
	HDn1EnMbiTyuwvphQYGjTEIAfqFDF17l4ltBuqpi6xf2aDeNtpNO6ikbxetXYGLfQgAG
	dcS6+teeRz+PnHbaeGrxh27ZZmaLnieqP61Imc2/4OfFuNgdn5+TLX1SZLuAgpzTaLqL
	kb4wiyqsnN1OUtW/Jbm49d+G8cVoZwC+q4ItY13e1TJ2r6fxLk5+7QOoAVK/Od/RhYIj
	IBZMHF5q0TLaJx1Kfex4ruQNesKS85ZVcxFNLjdbFy7TZIdWffCHFK2o35pMXOIHM7Nr
	Bi3Q==
X-Gm-Message-State: ALoCoQmxRyIiaCJfoCUKbn/Q/uVeoipUZD6rmq1wunwGTXR5nhdKDU0jnAzyK5lTzE60hf/7gGNs
X-Received: by 10.140.27.239 with SMTP id 102mr5564196qgx.59.1412267046202;
	Thu, 02 Oct 2014 09:24:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 2 Oct 2014 09:23:46 -0700 (PDT)
In-Reply-To: <542D6A0B.5020708@windriver.com>
References: <1412260145-15296-1-git-send-email-sona.sarmadi@enea.com>
	<CAJTo0LbnpxBF98ZPYa3jNHNVU0NE4nH6Ku+4JFRyuVOFxywi8w@mail.gmail.com>
	<542D6A0B.5020708@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Oct 2014 17:23:46 +0100
Message-ID: <CAJTo0LY6L=ZyZnGzjiujdUX=jocRRMPW3eKscKMrYoysr25w5g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix for CVE-2014-7186
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
X-List-Received-Date: Thu, 02 Oct 2014 16:24:13 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2014 16:06, Mark Hatle <mark.hatle@windriver.com> wrote:
> This is actually correct in this instance.
>
> The bash community patches the generated files for these types of patches.

Of course they do...

Ross

