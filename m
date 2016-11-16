Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC5A719F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 15:37:04 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id o1so58339309ito.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=mEGOFXhliLZJKACODgrYZz5iptaefi2pvFFHee4ZxQs=;
	b=ImmpcHvtnPEI9vL3NmF9uAylPhugE2X301SKOZ7r0oB1LiilDf4yPsrTSr1bfNgC7k
	F980E2R1yJhXggGdCqNH/Dh1KlCdBmoFseMwHPPGilBuUjlK9QQSpEcKUAMn7s6F4gc+
	wRo1bNuQ5I5cvDd77XhBX3OUC5gvF34iIL06PiEh1FKhOmmXmzZGCWc41AQMKFoZxEBv
	+HxdY07S3h7OK87w3NyK0DDULgqYzf27gj1804S5zfGXmLAjg/c7abcmJO2gJeSRuM5j
	CE0/hUxz6jlHBuaznffH2oRlc0dSYik4g+/+iqTNUqTxqCJByM+CzWW/A5m1cr24+9L4
	z9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=mEGOFXhliLZJKACODgrYZz5iptaefi2pvFFHee4ZxQs=;
	b=lbts5rIqyZrJ9nyXuqXrO1GVC1aE+FxZ6/wpL2mxdZkGfGQq6DHXoX3c8wn77HDMSI
	mvcyMIeuBQIaQJEcSS8+ZKb8300dRm+nu0WfwyHlxvsYgHf5ZsOhNqpw5R9HHe3wFbC0
	2bdnaEInmNquLNNMu8VWCVXJTxSM4lSCrxNSw0MlwJHu3VJ7JyT9CHOmjv4lmkZFjjyL
	VV2aY22czSghWhBXLIzGkl3XQs0fazN1LAPX1WRl7bO7oMBwlmiDj5X+GVF2Id20mBgK
	w5GxNrOSGiIPFVC7T8O6R9QvHwQMFHojMstur0yEHuDL2m8sqqATVM6cUNYv4C/Gtm10
	iomg==
X-Gm-Message-State: ABUngvdaCqpenuOxdfrcraM+ZRMInBkCnZB6j+BBig/KmxY0J2q2B6Chgqn79gwXa4Dde4nF
X-Received: by 10.36.88.65 with SMTP id f62mr8766835itb.89.1479310592339;
	Wed, 16 Nov 2016 07:36:32 -0800 (PST)
Received: from pohly-mobl1 (p5DE8EAC8.dip0.t-ipconnect.de. [93.232.234.200])
	by smtp.gmail.com with ESMTPSA id
	g126sm2748035ioa.13.2016.11.16.07.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 07:36:31 -0800 (PST)
Message-ID: <1479310588.18151.22.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 16:36:28 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: truncating quoted text in emails
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
X-List-Received-Date: Wed, 16 Nov 2016 15:37:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

While trying to follow patch reviews on this list I noticed that
(subjectively?) quite a few replies completely quote the original email
and then just add a few lines. That looks fine in GMail where the quoted
text is folded, but not so much in mail readers where quoted text is
unfolded (Evolution).

A random example:
http://lists.openembedded.org/pipermail/openembedded-core/2016-November/128861.html

Not sure what the netiquette is for this list, but at least I would
appreciate a bit more aggressive trimming in replies - thanks! ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




