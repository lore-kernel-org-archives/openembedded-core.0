Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 171E860C22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 22:55:21 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id hk11so34158329igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 14:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Go1gibGX5Jqmifd40/oLHqGqP6v011kqSg58aZOZUuc=;
	b=ZuGR8o5HYmTtntxkAAYt3Deiu7JrW6RHIecI34bZqcwaRgnOZj0Lix7AD4TkPaWvGh
	wkGO3fzB5GtRomkY7pUHzQtEDU8AOKkYv1FIn4MIkRsYE/1+c6Hb9jyfuQIlHqrxh2WQ
	aNU1Czs3t+K9Tvrq5AqRkMgDHZZIVRkCBHhLp0tLuWecnJ7g3lB2c29k0C+I9ZqflcWl
	oTwycPXOI9BVcYhN0hCniPBoPIbJNmeTCPQGTNvK/TnvtZrRr6WxsRgKCgonzOQnanoa
	3OdzhCkyczblkQf+/IRmvxwP6ZxNAl4JEtOg2d7j3WTNNeoPh4bm3k1WRzRS/iHi3v9c
	WTpg==
X-Gm-Message-State: ALoCoQlmHnBdLOGu7RndIsDtNxMUtnHA1FEljERAOHaEa0Ilej+AC1rxdldlAg3kuQYDwmxPtuTd
X-Received: by 10.50.102.99 with SMTP id fn3mr52373484igb.5.1388357721888;
	Sun, 29 Dec 2013 14:55:21 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id o1sm56526967igh.9.2013.12.29.14.55.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 29 Dec 2013 14:55:20 -0800 (PST)
Message-ID: <52C0A856.7050603@linaro.org>
Date: Sun, 29 Dec 2013 17:55:18 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 00/38] Cleanup series
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
X-List-Received-Date: Sun, 29 Dec 2013 22:55:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 12/28/13 17:28, Paul Eggleton wrote:
> I got a bit tired of seeing poor SUMMARY and DESCRIPTION values in our
> recipes, so I went on a bit of a quest to clean them up, and ended up
> tidying up a few other things in the process.

This might be a good time to remind people of the

    meta-openembedded/contrib/oe-stylize.py

script (which was recently pointed out to me). Unfortunately the style
guide to which it points

    http://openembedded.org/wiki/StyleGuide

doesn't appear to exist anymore.

