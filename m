Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B2EEA65CB6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 09:10:21 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id i204so23156172wma.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/DIbRrOvmP2kb14XJZOOLf3Kk2/HASI8YtpIkLXH4eA=;
	b=Y6Sxac86OZzIhnhYaBg8nZGc3/NEkrtmODfQ8A7Qyu8t8a1sjYikkTXTjY4k69OYLC
	CuW6iM7sAmcvVz+MBZLtiTujVaB0NxecnQ5mBJEcStMS5OeEmBLOBjiYlLtyL9JTlPWg
	aJ8Cg9RyhTpN+FxSgpQC1VVgVeMlU/napsPrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/DIbRrOvmP2kb14XJZOOLf3Kk2/HASI8YtpIkLXH4eA=;
	b=JIEqJUxWPWvhFeAq6o2CK6nnUbq+lTes5xzb8DW/MJvRoPXeq8UH8oFaOR8/XaXKjV
	uDbJiKziR53oSMgjyNSHSK2AVM+MLot+13385e5DWaAepuedJI7Y1kOVvCeX0Ld6X7LR
	pAJpvk9CBiYrtgafMk2m47JNxQjdhF7VQmOHJs1+CjfNFF3Etw5dXQzysP1lOeN/Z88c
	oT6qQeOihIT5+7qX7ykG3tvQuzCJKLum33u9pd4ii3P5v3EUaArK8XrCTqgC2vzFsWU8
	TUI8e3e0JdKt/Mrxpme6OW2uW259sVdaijAp6IRnibp+dMB8U6clTUDEPrg9QZb/OwM5
	oCmA==
X-Gm-Message-State: AE9vXwPk82QiZFCIfGLcIt3vdnBXWG7m24fqWLifroHdpL0cwk9c1kEbP+eMescXA2b8IJMmXB6JAknDuKjliTgQ
X-Received: by 10.194.143.104 with SMTP id sd8mr33779395wjb.161.1473153021747; 
	Tue, 06 Sep 2016 02:10:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.120.162 with HTTP; Tue, 6 Sep 2016 02:10:01 -0700 (PDT)
In-Reply-To: <1472213100-11245-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1472213100-11245-1-git-send-email-nicolas.dechesne@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 6 Sep 2016 11:10:01 +0200
Message-ID: <CAP71Wjwa-r8ronfbxrO+r7cA_jMDyh5MJ2h4-mC3vBJqtPUQ3w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-good: enable v4l2-probe
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
X-List-Received-Date: Tue, 06 Sep 2016 09:10:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 26, 2016 at 2:05 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> A new mechanism to probe v4l2 M2M devices was implemented in gst 1.8 series, in
> order to get such devices probed we now need to enable v4l2-probe compile option
> which upstream decided to keep disabled by default (unfortunately), see [1].
>
> With this feature disabled, it is not possible to get v4l2 M2M device to work in
> Gstreamer which is a common use case on many embedded platforms. This patch
> enables this new option as soon as v4l2 support is enabled in gstreamer -good.
>
> [1] https://bugzilla.gnome.org/show_bug.cgi?id=758085
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>


any feedback on this change? Any additional info needed?
cheers
nico

