Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id E7EF7710B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 15:36:51 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q108so6628648qgd.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 08:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EwA5mEOfkj6LIwd2Y1swsJNj+y+PNsBFMzRj3sQ6Yyc=;
	b=e5ziuRnJvh9JjABcRJ8ZnK3YSrENBPWZBRMSfuLzWNfWWEneA+7clxU9lcaRa9/04q
	GfIXgG/xhZWh/xm0P8Ddd4IEYxlZ396X/By9+M2iZQlAWhwAJ9qOb3ppHU8On/E3wtUV
	hJwlKglcCsZ7pc7xFpOcUqHp1D5hIMqVFAMZF4RhgO3LPU+NQffbnsdTbuiWk6pAiFgW
	Q8Lv7kclgMXhDlzX3ylUtDXOnRWCglHrWWe/0KsOxABjHeq46mVQpm0S7OIkuWq6Btbk
	p/WIxbq9H1PYCEreJfO5sIiGo+8c51U6bmGH+WZ5RT/BQ0IDlTgV4JJjnGNfhurvRbKE
	qrCQ==
X-Gm-Message-State: ALoCoQkmo1KbKrdzigIs8SDLrpigM6hQEpt4DOlk1uYAbOaExlGRwlG0mF1sChZyUDifwwC0J8ca
X-Received: by 10.224.103.65 with SMTP id j1mr57607832qao.17.1409672212023;
	Tue, 02 Sep 2014 08:36:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 08:36:31 -0700 (PDT)
In-Reply-To: <010279d1b3a4c009f7231f646d2d34fbce904656.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<010279d1b3a4c009f7231f646d2d34fbce904656.1409655125.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 16:36:31 +0100
Message-ID: <CAJTo0LZ1GjmstpEiFdbWd5h_MR65_jvZ2E+Re-wwbcHYssAF2g@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/26] cups: make cups daemon start correctly
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
X-List-Received-Date: Tue, 02 Sep 2014 15:36:59 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 11:53, Chen Qi <Qi.Chen@windriver.com> wrote:
> +RDEPENDS_${PN} += "procps"

Presumably the init script needs procps for some reason?  Is this a
sysvinit-specific dependency, or something the daemon does itself?

Ross

