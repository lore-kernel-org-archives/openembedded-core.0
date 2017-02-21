Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id B2ABC72F14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:32:00 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id x35so38655959qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 06:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R0RJy+WlAeKUGh32V4UFaPfUAZymutV6RTsk1O59Djk=;
	b=l8/Rx7Hcjuzk172eo4xFCj3td6ozhVHQscQWjdSOQaDw7nNE7b03BZ0l/AV4KYjluu
	ErCg6og4IxFLN1f4xCQgQrbNe/KI8udzxAfk00ng79ziGjYZJqSpvFrUt7KGGR+rL6JY
	0QOwh+JaXe51Bwt1HDcrQMAmrDDAeoTLz7xDDUEeqrXtmYRMepaVNzF/99YuTlMENlFE
	pfeK26SV0LhWET2S0riv+O6fCgxLgH4nkXMRXLcswGBhV/pA3LmpGBxWYfBLI3zCVmgh
	ZFVAoCL6YqR9AaEVFHyrkFIm7FGLRdc7v+kEbH64JdQHpKAcjbBlJNvvgxrPsrwFWQqz
	Lo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R0RJy+WlAeKUGh32V4UFaPfUAZymutV6RTsk1O59Djk=;
	b=tCGDjR38gcYgwEYAT3VSv88PLGTcRrrFrrDQLDejrqLcV+SQOH5bt+XLv12K2kHOED
	bV1SLqZXKTKenbfebwp0SRuXBCy9ry+Dr/JmOw2agqie2QDtic0GZryeJuJFRkxQhLl0
	sy4DolymAEVXhJpFQa03omRQFmD3RER1fCc0NLnXER+PQU+OxKlDQSm/1bF1gxprnVsh
	CFu17we6+g611uFLK7u/wEVHrU4YbbpNZYo5iYtI9QsW2qVPLMl9CKwJN4oXx1jp9hty
	5/Zx8VhY6Nk0H4ea9K4uLGc7S1Wq63lhaDy2bEWlA+lC4STx7jL1H0dYUbW8ER15CcV4
	hgwA==
X-Gm-Message-State: AMke39k2i49sq4y/3Sxd1e4vJw0c/7bRg18dfspoNuBjiCTvC4FN7iAQ8CaO/mmVua8ThU4/9YYetCgBOlHXZ450
X-Received: by 10.237.54.1 with SMTP id e1mr23641698qtb.68.1487687521688; Tue,
	21 Feb 2017 06:32:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 21 Feb 2017 06:31:41 -0800 (PST)
In-Reply-To: <1487687297-15455-1-git-send-email-alexandru.moise@windriver.com>
References: <1487687297-15455-1-git-send-email-alexandru.moise@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 14:31:41 +0000
Message-ID: <CAJTo0Lasd8e=RnXmiazEtR7aXBM-R3N45gAG-0XY_4VAA5VEVQ@mail.gmail.com>
To: Alexandru Moise <alexandru.moise@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-selinux] [PATCH v2] refpolicy-mls: user native bzip2 instead of host
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
X-List-Received-Date: Tue, 21 Feb 2017 14:32:01 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf0447cce05490b3e3b

--001a1142dcf0447cce05490b3e3b
Content-Type: text/plain; charset=UTF-8

On 21 February 2017 at 14:28, Alexandru Moise <alexandru.moise@windriver.com
> wrote:

> +EXTRANATIVEPATH += "bzip2-native"
>

You'll need to depend on bzip2-replacement-native for those binaries to
exist.

Ross

--001a1142dcf0447cce05490b3e3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 February 2017 at 14:28, Alexandru Moise <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexandru.moise@windriver.com" target=3D"_blank">alexandru.moise=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":48x" class=3D"a3s aXjCH m15a61134c4db1989">+EXTRANATIVEPATH +=3D &q=
uot;bzip2-native&quot;<br></div></blockquote></div><br>You&#39;ll need to d=
epend on bzip2-replacement-native for those binaries to exist.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142dcf0447cce05490b3e3b--
