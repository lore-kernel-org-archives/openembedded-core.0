Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6BD60017
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 17:05:38 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id l19-v6so4237069ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yfjxcRYlDlF2ihI5Pap1IfsoqCUHZIE+l2+FiJPUwVI=;
	b=SbeGTri5m+TzZ1Q9YfZlc0i7E22C8sKITchaOTdQm3WbRuNoiqkcrDetkNQam2WVJH
	8lSIIuOBfyjYaOVnsnUo3AJcIJKm+SpWh0V5cDPWlyOK1mroVOl9+c2ZVyb0i3sBMfD4
	ukKUTrIBr1GZV+lOYyBSipScqHwsrhSkjiHgIIHgdfJG+JqfaGtzckReVibQC52DHtUw
	vgibM6R3knhi0xL/R2Nuf+tr4euQCZqKaz0TsMtFAFGHVx2w4LeMtfkKHP+0QlYE8oM8
	aOxrhpyE3CDjtOPeM01/lnwAIwZv0dUtz9N7mIdCKPc9vMq7r8ryfoe0tkiDwCXrg2GV
	jnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yfjxcRYlDlF2ihI5Pap1IfsoqCUHZIE+l2+FiJPUwVI=;
	b=snkOipV8Q8kIFs/CtYBbjtCzmsZhHxYkDGyqxuV1hpm+3MMx+6HuTdW7eO5M/v+XBx
	BIJIXZU4c83hYOaV2rMdunG9S+55B7mB+WzvHWutKWH+FSqDMQaLq1+Mv9WWmgJuVttJ
	Mxsp2Qz8uNxZmrdHSjE9mZ2Ept0YIyc4LQiLzyFfmOm538b3n7JXobjb+TyR2wraBCRi
	jtj+GaLcxRwzjNrqnD4UE8A30XFygK90iDIsXo3ZIXPJeePwdfycobuKS/5QDKHhP7ZU
	U0pT7tYA33nFZtUYasjjhhaYf6TlpuTcO5uJQ6DwsFEhRq10CWtSn8g53ulSVmhh+OB7
	hiVg==
X-Gm-Message-State: APt69E3u+VGeDVY1j9aj/hzU47n0Z62jG9ET5WKi0/3OJl3KORmwse72
	5JhwlHy/8P5ssk91/kzV/vjdZRv5FUrwL7s496Un7w==
X-Google-Smtp-Source: ADUXVKKQLGlmAuK3kShMKYNxBPdu1O7QAh1f9yG25J88D8RIkTpsroggWyK1BS7iIMNJZfYU7i51NiEakvFARTlvdO0=
X-Received: by 2002:a6b:6b19:: with SMTP id
	g25-v6mr1738499ioc.20.1528218339770; 
	Tue, 05 Jun 2018 10:05:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 10:05:19 -0700 (PDT)
In-Reply-To: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
References: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jun 2018 18:05:19 +0100
Message-ID: <CAJTo0LaWr78D1yrZ2V_kocAyoJRbHUB0Qqb6n4M=Ow6s_6Ho6A@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] bc:1.06 -> 1.07.1
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
X-List-Received-Date: Tue, 05 Jun 2018 17:05:38 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 June 2018 at 09:10, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> +PR = "r3"

As this was an upgrade you can remove PR.

> +SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \

Whilst you're here, ${BP} is BPN-PV so this can be
${GNU_MIRROR}/${BPN}/${BP}.tar.gz

Ross

