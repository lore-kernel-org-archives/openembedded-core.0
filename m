Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1100160290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 18:06:52 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id e131so9274940lfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=XeU+XCl6wu9q1Tbt83Z83bD8QEAdiwLE+UYFh5JMBNU=;
	b=faqZ05ujLLlaECE7SL63Iq/VYpwzLD798NMJt8yead9yGFIJCBp9UXOeTDGHTG5MRw
	Dy5ZIvVRSD2x9PQEsptq++3pbMcrULJXMjn3BikZvj81eGdnLSi01bakVjJgB82rD+pS
	Do61ZbnFdechF45vytvU3qzn4rUZR51gCjq41Q1p+e4tZ7S8OIQ43lkfCtgmohb/yF9+
	vDj734LY+z/mBcaxELuegB7n85nKiT+dQDzq6UKw17ZUSBNFliSy6iILZNcDXLgQlZIn
	OfpI/WJ5E6X+QkQwPNwwQI8nx6j+EaoMAYuu85tMrD6Qx7V+/KxiG+1F+qt6qwUu2iiz
	clKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=XeU+XCl6wu9q1Tbt83Z83bD8QEAdiwLE+UYFh5JMBNU=;
	b=MyEbFXa0CiQWVrDVURTGa4/LzMBlIUI4B+isVtmtF2msZ9YGWJmsQhrwUN6gnMUiX+
	+HwI5VBa4jEDRiDyD4yGUMHvZrwlRzyHZGhbufq2HaOx1ojXvny+66gzHpKW/jflzwUo
	WEvULdi4hF7xEQAOCJZ64nvpeD64uHPL/TiV40DDBK03JUn0p6ArLBQzdb/zJYokLpXk
	L0rWs71dQNghwXEAOl0ec63IQS/+IvbyCzrgaUUzE7wbHCzOVtwGutvktBEWywfjKkcF
	DLVVAUAOXeB4hLNiVsjlGNR1ZrOdsU51BdHcVDtmQJhpejK6W/UuvKPrl/8Ev5xsXcHC
	OF9Q==
X-Gm-Message-State: AOPr4FUWTu1IKnD7Oo9nwHjGWY6i9veDEbLgt98HSNj5DqJPAsDUadou6A5DcaHnAnGhmw==
X-Received: by 10.25.201.88 with SMTP id z85mr7124681lff.140.1464113212070;
	Tue, 24 May 2016 11:06:52 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130])
	by smtp.gmail.com with ESMTPSA id z68sm687931lfd.2.2016.05.24.11.06.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2016 11:06:50 -0700 (PDT)
Date: Tue, 24 May 2016 20:06:48 +0200
From: Anders Darander <anders@chargestorm.se>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160524180648.GA7403@ad.chargestorm.se>
Mail-Followup-To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1464060246.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1464060246.git.liezhi.yang@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] remove unneeded python2 recipes
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
X-List-Received-Date: Tue, 24 May 2016 18:06:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Robert Yang <liezhi.yang@windriver.com> [160524 05:25]:

> They were required by buildtools-tarball, now replaced by python3 ones.

Do you plan to add those recipes to meta-python?

I think quite a few of them are usefull for quite some situations.

Cheers,
Anders
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

