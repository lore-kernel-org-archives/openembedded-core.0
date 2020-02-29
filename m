Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE2760B52
	for <openembedded-core@openembedded.org>;
	Sat, 29 Feb 2020 13:13:02 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id z15so6688520wrl.1
	for <openembedded-core@openembedded.org>;
	Sat, 29 Feb 2020 05:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=dQ87B0w47ljQmwnp/l4dI2BjePmBRj+oEj7RPZkqZas=;
	b=WbgAkjKJtqK0k7OBBSyCrBo8+eYTbCJGppxjKO0RlBam2HIN8+2K9Ov7VdI+1KLoDH
	JbfYHRthLMvgbq9uiQb3aOljIvLfVCfFMJQM4Thm/nbq5+bUY7Uak+OLUO6oqjxjkVfW
	7+6IBJQeNA9tNbh6VWdQypyWZV6Sv2B2Gd84I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=dQ87B0w47ljQmwnp/l4dI2BjePmBRj+oEj7RPZkqZas=;
	b=hrcPjI9oi1KfQkWeUTqBXVNdulJ5uK/fpU/PDKIl6CQ2Th4xn80ecg5T2EMlnpS6qy
	5tVtuO8rVeyo3NY04RtJevKcll3rTiDoVRXswknF/oCEYFYfbLJ9qF22kuTg7W07MwKx
	q4CV5LdHWpWWkb68XqoeT6DEs4TcDIolkdSp6XJyiDOI2kADcnASHb3u8eozTppm/TVL
	rnsi6rgqIxJ+Ig3fyIKXHpwb5Q2WfHKfRQ8hk+DzppizNC56g/vPBQdCYrGUZZWSj0Lh
	lYRDV/wM/mazh1Dfdc0ZLzIXuiJElNF+nJQSocym3osGK9aQS2RBtKceg6LV2GZh2obg
	Cjjg==
X-Gm-Message-State: APjAAAUJ4rasj8Rt3+NKdYU5jJ5kkO3lmfT6btTg9sWZK/DSyqWHYR7E
	XPSVztuyb6gjURfh52lzIStTmmEevTQ=
X-Google-Smtp-Source: APXvYqyV/JWdlK4p1Eroi+gUSpzEOpn8zPJe0Jo1YrXI9fAWvcpkXeH1vvB/9dwMAM8GTNUbzotvfw==
X-Received: by 2002:adf:ffd0:: with SMTP id x16mr4676406wrs.346.1582981982605; 
	Sat, 29 Feb 2020 05:13:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s14sm4251047wrv.44.2020.02.29.05.13.01
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 05:13:02 -0800 (PST)
Message-ID: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@openembedded.org>
Date: Sat, 29 Feb 2020 13:13:01 +0000
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: M3 build status
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
X-List-Received-Date: Sat, 29 Feb 2020 13:13:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Just to quickly update everyone, a number of patches we probably wanted
in 3.1 have had issues but have had the issues resolved and the patches
have now merged. Thanks to all who dived in and helped with those!

The patches/issues I'm aware of that are left:

* ltp upgrade (musl issue)
* util-linux upgrade (breaks wic test, probably simple fix)
* coreutils ptest addition (blocked on libmodule-build-per 
  reproducibility issue)
* psplash systemd race (smurray may have a fix)
* autobuilder new branch handling for initial run test comparisons
  (open high bug with RP)
* tinfoil race (open high bug, struggling for owner)
* LockedSigs intermittent test failure (RP has open high bug, no clue 
  how to reproduce or why, total mystery)
* Intermittent selftest failure with SystemExit (High open bug, Kai 
  owns)

As ever, help with any of these welcome. We'll build M3 when a majority
of the above are ready.

Cheers,

Richard






