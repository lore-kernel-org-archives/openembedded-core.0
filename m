Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7F54460290
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 15:36:05 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id vs11so7847674igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CCgSgAKwttEZDo8kr+LxBlvTdrZHdLizzlpRIr/tk3A=;
	b=zg+akC8v2wPnB8spaMG4AjavDq/9pYbbGPrRtOEj1uHK78Lsyr8TvqP+JvVYa/6QTU
	KMBqHPChnS+iLHAhNth9Ygfow+uqOmGpVY0gSl30TvoPYUuDwKuxQVBm6Xx5I0uXEj3Z
	FAOi19sOlOfTKzfprywNPWnf8Bbo0XmIzB/ngx7PvAwd8U74jGiXbgEZbrHrCrmwyYT9
	UOJNfhXNQwbSLUHlAQK48bjyfdpHZrp6RrD3N/0q91h+ZiA3oALJ6fr9/72RKC8dbAb2
	KHccFR12cHGHWoVh0NqBS8H825uI5usOIUAgT8aRSdlgNMbyTePfgkFlbZZxS2/23rlE
	7z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CCgSgAKwttEZDo8kr+LxBlvTdrZHdLizzlpRIr/tk3A=;
	b=K8nPQeaKl90OblupyG5qAopqOAJP7jApn3IrgDSWVw3KdY2Fe06YqYIUORA9nLafdo
	s2qZAo10mkKBhsbYICgBe2sBVTmyZ6464KTVfNYQ54o4gasNgg9rkhYMOGPDmEn9dWL3
	GZrhSTb/AjIi1jw8G7gtAao6anAPFTVZw8ueZyTPCPWV0WHCB4o60/K3gpmoFXKTOXCA
	wEpDI2yxmj6gcCtGWeEUcrdLAcFYT84gBTagAMP/yJ4+H27dpKpWx91NvLKCvmPHIcJt
	0h1P+FQButmLCmOe1PyoajnHwcfsX0nS5CpNgK+h+pUuul6Rvz5CPu/q5sZQggbZOaKC
	wacA==
X-Gm-Message-State: AOPr4FUjoWrD2KsCgIDWkPSatfq1dkYsSP+qgs3DI2MrUU8FHfICaQE3MY8LXKcN6p45Ip+zMawTeyM1l+lnCFld
X-Received: by 10.50.60.132 with SMTP id h4mr3635854igr.78.1463672165660; Thu,
	19 May 2016 08:36:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 19 May 2016 08:35:46 -0700 (PDT)
In-Reply-To: <CAP71WjzOUk7fOVkBf2MCZizSW3mSYivYrNsa3XBkqhBCGX4ZWg@mail.gmail.com>
References: <1462204592-22025-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAP71WjzOUk7fOVkBf2MCZizSW3mSYivYrNsa3XBkqhBCGX4ZWg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 May 2016 16:35:46 +0100
Message-ID: <CAJTo0Laf6FBjdTYL1sMBsOqO4vjT4G26eY-VWaP-7ACadLFCFw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez5: move btmgmt to common READLINE section
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
X-List-Received-Date: Thu, 19 May 2016 15:36:07 -0000
Content-Type: multipart/alternative; boundary=bcaec5015c9b80a748053333bb4f

--bcaec5015c9b80a748053333bb4f
Content-Type: text/plain; charset=UTF-8

On 19 May 2016 at 16:32, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> i haven't seen any feedback on this one, and I don't see it in -next..
>

It's in mut and I should be sending a consolidated pull soon.

Ross

--bcaec5015c9b80a748053333bb4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2016 at 16:32, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D"=
mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@lina=
ro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
b3d" class=3D"a3s aXjCH">i haven&#39;t seen any feedback on this one, and I=
 don&#39;t see it in -next..<br></div></blockquote></div><br>It&#39;s in mu=
t and I should be sending a consolidated pull soon.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--bcaec5015c9b80a748053333bb4f--
