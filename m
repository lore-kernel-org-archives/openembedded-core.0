Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 70B9E6BC09
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 10:27:16 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cy12so3754792veb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 03:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=X6usSqCj8hfpGdW9hVetzLfw1kYvuKeyLgvhiuFF2zk=;
	b=P4vrJ+NHwus65alUCOR3MwbBbtSwpWdyCQDWukS1EOgg2kr21w12L3I4qYGgAhjPQh
	if1Y/S3wyUEdZWApk+I9ACyEZP5SlN0MHKMPcU60DySORsya/8FHjMyj1wUO4a4P6s3i
	nHq/2jtCQIYqKdoyDN3n7iHkQWqTv16aJir4QIVVY0FrxlZ25+8wT/C81sXSHkr9+aYu
	U2dooKcOabQ5SkCT5LKgzjsIMPDc7poERDfr/W4glfLW4sp5dclt/hnDZMrpKv7Ube21
	vq7yOKGVfxvsSf0y6JANfi6m5HrnBywM4WLITh+TeSsRZLwV8u5NKQ2XnboP2PL6FBKM
	gdEw==
X-Gm-Message-State: ALoCoQnlSV9zn3Z2MKrMYKl9hPdrsqdRcEFdmLUBYfJXPOb8SOBQsi5gj3cYToSihCtDhjbJ/n9y
X-Received: by 10.52.178.198 with SMTP id da6mr6318111vdc.26.1378204036917;
	Tue, 03 Sep 2013 03:27:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 03:26:56 -0700 (PDT)
In-Reply-To: <20130823215953.GF3544@jama>
References: <20130820142105.423E0503D1@opal> <20130823215953.GF3544@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 11:26:56 +0100
Message-ID: <CAJTo0LaTDeTnifQXoSq63tUxruJ1XvAgwvnGT-xOh8_YcPh4Gg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Marko Lindqvist : gtk+: update to upstream version 2.24.20
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
X-List-Received-Date: Tue, 03 Sep 2013 10:27:16 -0000
Content-Type: text/plain; charset=UTF-8

On 23 August 2013 22:59, Martin Jansa <martin.jansa@gmail.com> wrote:
> | failed to load "./apple-red.png": Couldn't recognize the image file format for file './apple-red.png'

That's odd.  Can you replicate this on demand or was it a transient failure?

Ross

