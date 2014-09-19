Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5B12671497
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 15:08:27 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id r5so3278171qcx.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 08:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Htw4iSkfm2Bs7tv2WK2QXGlcH4Ds6KjGSVDBcE5CnHw=;
	b=NUB+6MqRqIH2MKkhrZz6dh1zaIDPOQRYCyZm4HAsOZpRK1YLj96g+RtLdEM+GL8672
	bAVnZ2HfPEK6vmlCpnsPbwQgCT6Ei/uHLQJXI+wXv3w2Y8/bBYjaw+Rofk74Q6sTIie3
	+tBfmvwcxIYJl0ixLEels31rhsAH/V5z5drZ8QwOlc6Y7/F2FPDbISGqwhJ+QZa2fvwB
	YTCbziebiLFNqVK2sKTpStAen2X8i4A1hi/10Ps34JVsFkomByDpoO98uwad0P16OMMa
	c69QlIVJzilK5meis/5kh9BCU93bNZlR841Q0630wxWd6aMp8EuAYmddFHMB9z1szYOS
	Ajxg==
X-Gm-Message-State: ALoCoQkkiOXPf1n/z+7r61UVrlpLfZvIYriIupex1bgETbtC+5Fy6qvNmSLpxfIZED9FxevMD0hf
X-Received: by 10.140.40.84 with SMTP id w78mr1813125qgw.87.1411139308004;
	Fri, 19 Sep 2014 08:08:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 08:08:07 -0700 (PDT)
In-Reply-To: <1411109378-27850-1-git-send-email-rongqing.li@windriver.com>
References: <1411109378-27850-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Sep 2014 16:08:07 +0100
Message-ID: <CAJTo0LYdghqD+V_0QDCV-dgsEtrU4vSPZjG60Da+BCogkwZ+gQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gnupg: add pinentry RDEPENDS
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
X-List-Received-Date: Fri, 19 Sep 2014 15:08:31 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2014 07:49,  <rongqing.li@windriver.com> wrote:
> gnupg needs pinentry to run

Isn't this only needed if the agent is enabled?

Ross

