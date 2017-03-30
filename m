Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0BE77CE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:46:51 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id b140so17113486iof.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 04:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=aHWsasytbpVKPRCBzu4uZOo2e7T6HRavEAjWT6jGMJ8=;
	b=Ue6fCWP/g1y5ZLKY1zGE7txQAGOHx52hkU7BLPBk1EyBcwxG+ld2wG77MsBY3d0Yxw
	Aqqm4GCJdbJcsBGjbqchxPWrzotpB3y0cbdBFfhOXevvd5/ItZYOqxnKMBaEChilWaZ1
	wNjm3J06AsEfDB2abSfFNApAk0eZddsjFf2TJWi/gvteC7ReTvievniKO92fgwg7t+ix
	zGZqUze+5SsDSbK0RnhZG2tAAuIvcvugVwzgvMpl6NyG4MErVDiXdPilvC2Ehzku4GWb
	iBXwiNzaRFVtEDm6MQn+IVKRiwCAu889BnX+Y44866YaAbB3i1HS9IxOyGYFFDiFTXID
	kWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=aHWsasytbpVKPRCBzu4uZOo2e7T6HRavEAjWT6jGMJ8=;
	b=GAeQ17W/C5h5opbSWy0Def0nHk1lryhf3tjP/gA0Vw/i/QrNrGff7bcJAJgV0sBUVD
	wSh3EuvLOSQg4qWp3z5pN42ZbO4UG8YrClFTJAlDGBLgS5fFvDbM0kIGxTeT5Jm4nLkv
	NULCck6/k2DMBQKCAdT1o9r3Cexg/3SzQGTeZzNVxO7PdppFXBP9Xmrv6xibLQKIyEyh
	HvoC6WM98ABzibgmkR82VwRFLhVqWdYXDK3AhIBLqwn+WIWi82kxEKGlUVUnlAkus85k
	qLPg4xhyR+ENCgYmq2yq4wmH9r+Am04Sqs3/Q3TaE4N+rICgaGfR+JD9zkNVt75tyLzb
	agSA==
X-Gm-Message-State: AFeK/H1p8pWXZcJFwmSZICIUM37OehHYOgVvwtHulnAI1RU21Cb5rLfOHYnKx3rVeYkrgG8z
X-Received: by 10.107.53.170 with SMTP id k42mr6937931ioo.176.1490874413255;
	Thu, 30 Mar 2017 04:46:53 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE63.dip0.t-ipconnect.de. [93.232.206.99])
	by smtp.gmail.com with ESMTPSA id
	b25sm1216218iod.32.2017.03.30.04.46.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 04:46:51 -0700 (PDT)
Message-ID: <1490874408.6396.448.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Thu, 30 Mar 2017 13:46:48 +0200
In-Reply-To: <9d94d2771cd34d5fa5f1f3df1ee52ffa@XBOX02.axis.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
	<f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
	<CAAQYJAvnEY2=jHs6dkjk0aSR74s6+4xYLEQMsp4yVXjngsWQ4g@mail.gmail.com>
	<CABcZAN=vQzdwxd6F=nGBq0TWhOjx8kw0_MZfPpN82V=pbntF5g@mail.gmail.com>
	<9d94d2771cd34d5fa5f1f3df1ee52ffa@XBOX02.axis.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] update_gio_module_cache: fix host user	contamination
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
X-List-Received-Date: Thu, 30 Mar 2017 11:46:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 23:54 +0000, Peter Kjellerstedt wrote:
> One thing that confuses me though is the “(Output: b'')” part in the
> warning below:
> 
>  
> 
> WARNING: core-image-base-1.0-r0 do_rootfs: The postinstall intercept
> hook 'update_gio_module_cache' failed (exit code: 1)! See log for
> details! (Output: b'')
> 
>  
> 
> What does that b'' mean?

A empty binary string - that's what Python 3 uses when it deals with raw
bytes instead of text with a known encoding.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




