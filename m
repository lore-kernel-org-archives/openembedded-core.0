Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id A1CE160132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 14:14:43 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id va2so23960822obc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 06:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hFAAbglWvKjhXvP78wJZ5TvB8eL/hDoalGSotI+J9uU=;
	b=MALoZ0Xx7gX4V3cJ2ksyyMGZomDyDEi1R8bURAdlvFCmQwt+VypY+Kv37SZHoUNU16
	TGAWxHrqnViIGz1pFAY7G5wF09+xTSTl5kLak/h07VkKVzGT43E+sJqmlwa8rF1ylPwi
	W92c9AJqoulB9q3Sy5I1Lr6zeh/Vh9sfvXwe1/xUS52PAs9BgTl2Avp08VGUrHKiwsx2
	S/HFPNEZ8tMRYyo+UEsvvRjycTbLaU7tVCogkwElPZuqs2u9gXAtfl2n/MMMTDgGG17O
	lbthx8k8wfElWD8xaSxD8jCS7ny8LQkh4CO+X7oMFFFRn98a6S2dIPK5VVnhQGGW+g+O
	UAqw==
X-Gm-Message-State: ALoCoQnsty8HlpAPlXYiQ7hzfh7WZd0fbYGtlLjpO8Tzt8JIVJeenuBSIT/XWBtVdUcDi2kusfhG
X-Received: by 10.60.178.105 with SMTP id cx9mr3898701oec.16.1422627284660;
	Fri, 30 Jan 2015 06:14:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.167 with HTTP; Fri, 30 Jan 2015 06:14:24 -0800 (PST)
In-Reply-To: <CAJTo0Lbf8OJ5R_JSymiYY8=q+xyM-+5fEzmCfwVoPoh7+=cyPQ@mail.gmail.com>
References: <1422610395-2581-1-git-send-email-pengyu.ma@windriver.com>
	<CAJTo0Lbf8OJ5R_JSymiYY8=q+xyM-+5fEzmCfwVoPoh7+=cyPQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 30 Jan 2015 15:14:24 +0100
Message-ID: <CAP71WjwKsR4=qZYH+EmOk6qZifLHwt2dxzpHiQ6hrAJcAu4gQA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 10.4.3
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
X-List-Received-Date: Fri, 30 Jan 2015 14:14:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 30, 2015 at 11:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> WARNING: QA Issue: mesa: configure was passed unrecognised options:
> --disable-gallium-egl --disable-gallium-gbm [unknown-configure-option]
>
> Presumably they changed the configure options, so can you verify all of
> these please.

yes, they did:
http://cgit.freedesktop.org/mesa/mesa/commit/?h=10.4&id=c46c551c56f78c6bf9e63524c89478695fc4f525

