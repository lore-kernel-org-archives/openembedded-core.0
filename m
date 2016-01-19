Return-Path: <paul.barker.commagility@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 91B066E687
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:51:17 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n5so115985411wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 06:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:organization
	:mime-version:content-type:content-transfer-encoding;
	bh=O3TrmUcY0uq95Zwr0U8OV6p8HZrnvZSuS4r7BdUj3Bw=;
	b=DjzobVxUE+uZ9279zAxx4P0TMA3QGUUiuPj/hVDjKvvSISH2CuhV/nqfODGBlwhm7o
	wrxTaO6/1R9au62QgCrG155OGQ21IK1PiTr7hkqK/hAU3uiV84gq0i4cUeN/IuBYVjkT
	LSMG4sbzdIi/jeuUOIJfgU4Nr5e0g56kFLxot9YnA29kj5ou3WCqVbx9ZL0ST3aKk66p
	2gx7ctJGilU/TB8XDDWI/eDG7/V3bnS+puPyE3Tl/NmOwKuWrx5LrlG2nxBxEtW9owjs
	IfJkUWeBnXQJHZlhblzxZch3+oe4UY5W1WkGQKC1jwS3UrzU/5AZ672Xr9Ih3GoQdrhw
	NZsw==
X-Gm-Message-State: ALoCoQmn7rnieheHwEi7kGuS8oOUqxld1ayqT35cBvutzz1uexMyIr8b3HiUrPXmdlfPwObr9vjVXdGFu7+Rfkwz814CWet6eg==
X-Received: by 10.194.104.5 with SMTP id ga5mr30902895wjb.155.1453215077819;
	Tue, 19 Jan 2016 06:51:17 -0800 (PST)
Received: from ku1404 (inno-commagility-ownrouter.lut.ac.uk. [131.231.60.35])
	by smtp.gmail.com with ESMTPSA id
	u69sm20748062wmu.20.2016.01.19.06.51.16
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 06:51:17 -0800 (PST)
Date: Tue, 19 Jan 2016 14:51:13 +0000
From: Paul Barker <paul.barker@commagility.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160119145113.61a5af48@ku1404>
Organization: CommAgility Ltd
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Daisy backport request
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
X-List-Received-Date: Tue, 19 Jan 2016 14:51:17 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Is the daisy branch still accepting backport requests? I'd like to
avoid carrying out-of-tree patches myself if possible.

The daisy branch of meta-mcsdk uses BAD_RECOMMENDATIONS, for this to
work with opkg we need commit 3fa24eee41c26fecd5e4f680082288ec772d2de9
in oe-core. This applies cleanly with a cherry-pick. It was added in
dizzy so should be very safe to backport.

Many thanks,

-- 
Paul Barker
CommAgility Ltd

