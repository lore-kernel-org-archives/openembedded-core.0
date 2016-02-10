Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A6CC165CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:32:06 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p63so28982030wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 06:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pk2bSIoMbDDMgrHqtSRyp1qV0j+KjCK/C8g+BiGoauA=;
	b=dLUEpZEbGTwOhQWXvN/OtGbdPf6fWy2xeiop6HZU7a6W0Cntgt/OGHYgRvTPRI3m1v
	rbBAiASYXYCCaO7bB5xUt/ahf2VAGulu83qiOq6w2/V6s+mKyamLembxxXGfuYzCVuQn
	2G3V75qJAbn44BxdsNbUy84HPsCWl1lvT6eDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pk2bSIoMbDDMgrHqtSRyp1qV0j+KjCK/C8g+BiGoauA=;
	b=OG8Q7CHuOP6S3f7PaZ5gw/sosUoc3ho8yxNmZIAOYq7NCMu/LRhmIhOoBPKpo0MYBx
	87Yi+Xp/JKsiYa2c6ST6Uwu8Ff4CK0gHRsrfm5MoOn6PKiBDoeEpR1o+Eh/qZljbJbWJ
	4gKT3uSyKueFzta8aHqmqeqgLt2LMw29+tf+pmzRX248SWhyeb7/tV231ou2lYSsPOaS
	U79gJTxrqP8UJ9PIXM/xA0eMDMxPxXD1jVdsRnbPF6EkpyhRpRMugWnDT20tyXUrNrXZ
	3ovHSia6eu9+unTrGKRVifKZuORVLwbgfhQmQiOoC6zEw0jqAH0cEmAfX2hSF2rCDMlZ
	svHg==
X-Gm-Message-State: AG10YORGdqFP4RgNG2ji2X2CQdojtInFz1G7v3XW57wIIWFhQMOlIHla5w7MbD284wrtes4IeQZbJoIu1FwspTd0
X-Received: by 10.194.91.233 with SMTP id ch9mr25511364wjb.121.1455114726679; 
	Wed, 10 Feb 2016 06:32:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Wed, 10 Feb 2016 06:31:47 -0800 (PST)
In-Reply-To: <1455112614-7112-1-git-send-email-ross.burton@intel.com>
References: <1455112614-7112-1-git-send-email-ross.burton@intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 10 Feb 2016 15:31:47 +0100
Message-ID: <CAP71WjwOB_tLaHAPFwaYP1wFxTQw=CgrXC2vXfzG_owApcEaXg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] piglit: add missing dependency on python-xml
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
X-List-Received-Date: Wed, 10 Feb 2016 14:32:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 10, 2016 at 2:56 PM, Ross Burton <ross.burton@intel.com> wrote:
> Piglit uses ElementTree so ensure that python-xml is a dependency.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>


Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
without too many surprises.. it fixed the issue I reported to Ross on
IRC, about piglit..
thanks

