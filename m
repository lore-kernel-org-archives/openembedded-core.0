Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 459016AC3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 08:21:54 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id c15so57703571ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=HGMKjsbLWJymLjVa1yTa+Ah0rQqPCWFuyGBsCF7lhqc=;
	b=uI4jkocVm79I+v0joeeYhyxNednYkJrL3fONRYKz/pW0Sj8t+0/PvI4OvdbhyGZZWW
	OJsneTFTIgKvhzfbn/ITSiFCOObq8uWut1D81NaZLgOiSVwIA/su6iMa4FHGFPbKVKLA
	BZSpm9DyT7WsQ7rne4btPK/VoFtktrIA+hJU0l0PP8J64YZo3fjo4s2oGu+Z/Xf9JVdA
	Ox1OVpNvek4jkexLBX6K14DXhXP+XjJ9p2vLH/xteui3BkTA4QyRPkK6z91gUkXyNIvG
	Le8WU9Ah/UYPDHBmTAjOK+BTs7nNBjZ3gXr015+iM+yPUuMS05M6jCFvRajOdJai917R
	yM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=HGMKjsbLWJymLjVa1yTa+Ah0rQqPCWFuyGBsCF7lhqc=;
	b=jGCBQN3Ja2rUl1BPtHkDRAYJgHdr+BHID2lCLf7Ai8ECOW7YUX+kGCiebYnj+FSh5Y
	Lxgn102KvQW+BUFgAZj15CZMVolpDO3HrYjcPgs0IJmLZ9eBh6IbN+545ldBxPkpU34e
	qYmb40epz9Tvkl7U631moFmNxunWBu8aVyh4/mzAqkEuO7rkI272KMyBDw6U76httzA0
	MtotlXJlnKSTGO8QiK5dxzxYcwTbqjG+92oktUwL9n9LbAbne1pUabULZjaHjXW0mVgh
	B8aoMRibqmOzNUIwoMnLjRpSWV3SRiOSDBCRd9h8ni17BHD9Gaf5FXZLQ+T6Or02+X5i
	qBdw==
X-Gm-Message-State: AODbwcCkqAi0u1aXBalALlQy+ENvdgZph/1JviIimVibfrTb0+JkJp/G
	ktXugsXQcupbwsmKn0E=
X-Received: by 10.36.209.199 with SMTP id w190mr9766111itg.68.1494922916225;
	Tue, 16 May 2017 01:21:56 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EB79.dip0.t-ipconnect.de. [93.232.235.121])
	by smtp.gmail.com with ESMTPSA id
	p196sm5733522itb.22.2017.05.16.01.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 01:21:55 -0700 (PDT)
Message-ID: <1494922912.1179.306.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Tue, 16 May 2017 10:21:52 +0200
In-Reply-To: <79e18217-d4ed-8356-9532-7da63a420d6f@topic.nl>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<79e18217-d4ed-8356-9532-7da63a420d6f@topic.nl>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 08:21:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-05-16 at 09:35 +0200, Mike Looijmans wrote:
> ﻿This seems to assume that every project is similar and that develop vs 
> production is something well defined. Well, it's not.
> 
> I for one would welcome the demise of debug-tweaks. It's an option that 
> enforces one of two policies that may both be wrong.

If that's an option, then I'm also for it, and I don't mind dropping the
"debug-build" distro feature.

> While the "development/production" switch may be great for some projects, 
> it'll make things only more complicated for others while gaining nothing above 
> what we have now.

What about the approach I outlined in my reponse to Richard, where we
just introduce the IMAGE_MODE mechanism in OE-core without defining
specific modes? Would you find that useful?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




