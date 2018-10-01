Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 88CA87A3AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 11:17:35 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id q4-v6so12582877otf.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2018 04:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j5QcWIUwINxpnTFL9ll93D88eKbQrVT4j5/7PlK1ojA=;
	b=UES/k0iFxdtUDp2bir1sm6WmViWUFcZK21J6BhUtMJe8IxITjPp1Htn8rJd1ly2dZ/
	i95E9QCBRbrBJNE/Csm0fIWexXkwpJL9kcOl6g4/pgN98et+BnMfUXKGdMYFUGD1wIn9
	HuOY5rtTXOj2I840mUqfFAEgpVX3C6L5vEgBDrQ67mzmw9vED/2XjQPYFbMfqlp2pu3I
	rPJjhTyra42rPvNs1F/bYrD/eFFXpPG2jOtkq+cFFGUBYqwklfc7jKrSXXysDpNue9+o
	1KT++u/0SRIroj5XISeYQcVHw5xE+Ea89I1enve8IfEDg+JlLxqmno3QTSPH0kEVl2G4
	GnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j5QcWIUwINxpnTFL9ll93D88eKbQrVT4j5/7PlK1ojA=;
	b=eecArWnAO0lnr1Eiz6nBrUAcmWv2k6lhnVVohyjy/C8X+Wc0H01+FwyvshqzzkRCUM
	IyDSYwG+fT2UvKExC6Kg8hXctr7GnP7rQIi8Qx1qaDpNHKAT1AhpQJrCvauAh1k0TjAP
	K8j9THuKEc0zOh5lKy69btyFyuLumX877GO+QjIqnPcQXe7zQP1rXuEnBc1XfBKsWuiO
	ZMdrC1LSjswsGkc7y3jFdQyUAV08VPG5m+nHVJbCnJUHbtgwlLFmGFNjWieZMPJ85Rfv
	OTR4vJGZla7lgz0LZFsy459KWrdeccQKJUSFKaxsbe3E7JJJiZATrcJAEjFOhI16oDig
	BRbQ==
X-Gm-Message-State: ABuFfoivpwiBZMU9J5OQ1NeQ/3uSKV5fWiarvkd3Lu79dQQamqtJfVbS
	kMwJjQ7fCqw08UKUjFUW/T6gP7JsDGv8F0Rbz0b0XU9w
X-Google-Smtp-Source: ACcGV620TN/H1aqTNaAVOSOS0rFDyOkLF/uVs1eOz0S128PbnBGlbyG8CIuy5PFSEFKkBQ22kyy+gtyDg406WWcI6fc=
X-Received: by 2002:a9d:44ca:: with SMTP id p10mr3626016otg.291.1538392656483; 
	Mon, 01 Oct 2018 04:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1538212391.git.Qi.Chen@windriver.com>
	<16e11291dea2788cfd669a94e5342e308cfd8b66.1538212391.git.Qi.Chen@windriver.com>
In-Reply-To: <16e11291dea2788cfd669a94e5342e308cfd8b66.1538212391.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Oct 2018 12:17:25 +0100
Message-ID: <CAJTo0LYowZUvOvHrzcdRrRniG5YUjLRzr1zcasXwz3dSmVj-Kg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libepoxy: fix PACKAGECONFIG to get rid of required opengl distro feature
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
X-List-Received-Date: Mon, 01 Oct 2018 11:17:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Sep 2018 at 10:35, Chen Qi <Qi.Chen@windriver.com> wrote:
> -REQUIRED_DISTRO_FEATURES = "opengl"

But libepoxy is a GL wrapper, so what is this *actually* achieving?
The opengl DISTRO_FEATURE is deliberately vague and just means that
some form of OpenGL is available.

Ross

