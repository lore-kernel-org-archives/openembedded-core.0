Return-Path: <jun.nie@linaro.org>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 528777DDA5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 08:56:42 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id m187so2338868ite.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 01:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=MwvMNZGX3hr/YM+8198RoHfgCGsfMQLEx8PZvrDsJCI=;
	b=ocnLU6NRoLYWPf8OXhx/iGYsCBHa57xqvtVqze9JhlgdCvfQSAWyM7z16qFlmordwU
	WyzXLVwbQ48PyPdP8EK6vCKMT9BMyesOUOig5JG179CCbqB1xbB0y4kXH1rFBeYpLPGY
	0hLoORkkDrdHUMYIf9NsNQEmV4Lv7TYUfq0iFhUtc2O+OEc0M/MuYn0Kq6KRag4ucmK1
	nHUg7XXfY7lCyScYpFQSHd1olm+UwhL8J30mpkgSn/cBMr5eqDyLvoKxT79q7ShAk3EZ
	ncOUxn3lOELwaHjluYTwTvR2QUwAt2Ne0VyBPXy/NFustJSb92OMe6R8RsMcGsBuEgFR
	x7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MwvMNZGX3hr/YM+8198RoHfgCGsfMQLEx8PZvrDsJCI=;
	b=mG+AYo+Sbb0NdypPlI7meB4xvT4YVm89FOsvSNUPHbEJljn5wRyg3MyUdvi4vSCvJ1
	5wbHFW2mNkq8LcqezwRNU0Liu9m13QTRvINf4Cc9yKY4+bbBu/d3ZNp3A3V1xoB5OyAe
	StfBOouXHqjLjCP+wmR3MXvgRhrJYEh1j59HOkvsRqy8C2sdYI4s/bf4EF0WvpTWySPs
	gJZf/cD2efN31/R3P03Y6+xcCWDG1PyX/nyFwuT/w/hbjLiqCtvRHexJXhAF4IxSByE1
	pJ9KWEXRmXk7vG/H631cs6Qf1q7vAMs1vnBj2Sk+qUyDCDveNjovPWQspjDmvtmcPOf2
	FjHA==
X-Gm-Message-State: APjAAAUjr+XSOPJgyhEpPIeDAebJnzjw1LIMfTFRKBAFNNVgHHj5VFF+
	c2YyS0QcwQQ5QK5nITtdo0VnIkK7hsnxilNfhqLVNQ==
X-Google-Smtp-Source: APXvYqw5I+AOmJgGBb2Htknbve3gH0dj0/rKlT0m7JuFukHaWuY+jdS2olk7Wnphn2KZm4ID5JmZSDNV/ZnyBB4HqxI=
X-Received: by 2002:a02:298b:: with SMTP id p133mr26906898jap.37.1559725003270;
	Wed, 05 Jun 2019 01:56:43 -0700 (PDT)
MIME-Version: 1.0
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 5 Jun 2019 16:56:32 +0800
Message-ID: <CABymUCMUGWxQ-CXJmjrjHMBzuOHgSHFw7Mz0QMxKVJibjTSqxw@mail.gmail.com>
To: Haiqing.Bai@windriver.com, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Subject: make-mod-scripts: Add nostamp flag on configure task
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
X-List-Received-Date: Wed, 05 Jun 2019 08:56:42 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry for start a new mail for I just register to mail list and cannot
reply original mail.

Maybe below change to meta/classes/kernel.bbclass is acceptable
because rebuild of make-mod-scripts is triggered only when kernel is
already cleaned for this case.

do_clean[depends] += "make-mod-scripts:do_clean"

