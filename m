Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 11434719E2
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:05:57 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id r185so54484477ita.0
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 04:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gqIEblhowONYIo+W9UQ6iRqh2mc4Ydvs8HJWtJUW928=;
	b=GrfnsAmA+GPhdLpgrwcf2q8Nrkj2i/EXCTsdZ0HkpRICEOnqaRJkl+mjYFuQuuYLwf
	HkwsjL2JldaOcr+b+X0sISj7sGNnPfJ5nJvOp++XFi2SKQ3d5fQMg8rCbUkVkOlhBDwH
	8jZRBfg+Cwa5URcwovuQbsBDz4N9H8XvMRV3GscZUECp3flNwgJ2XuwgptfT1WDyMGTQ
	EBYZ1m76VDUJ5Gj/S3SoUVUCaLnZ++I8gPjf7US9tnnk2CvC+bBgBIYHqrN5R9CyNEpm
	4cjV1Qrgn72cxbkyECQZEybdIS40Dt9SFNDvmIe8pzg3cpydzeZVrBltNVYO991pddJc
	G0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gqIEblhowONYIo+W9UQ6iRqh2mc4Ydvs8HJWtJUW928=;
	b=gzcCFESpKHMRZOO5znmWfSLaN7dvrCjHdQmyKlZLZuMTo8Zvk1VBrhtsKiWYvI+664
	PEiIMygoSG0HeT/ukJrqEMBZXhdzTk9R7kzQCsI8xgiyAZR4YZirAzSgKtZYU32VKNSS
	tI1a1hfddX/o/u6LyQhMZh9vbyV801z2XjKHHFOh6r+enAknHvKgD7f1Icmv2CpnvCnd
	eV6tOfrvov7Tt6vgLaRpqpd4PYZlvZ1EiggBcVorp6DjPY7RUmCqDM77sh0z1h8iFW16
	E1uWAJKJamEQ2XRtwjnCIasEbcdXunuuAPYtHPLlB6i1PVz5y3HZxTq+++FWalwNCKNN
	wqgg==
X-Gm-Message-State: AIkVDXJGwxiKXvpDRSlYvt9CKOxzAp6AHD2l99/Xn6C7RaimP9/EygBvFiEHM7u/seZLwIMz
X-Received: by 10.36.64.198 with SMTP id n189mr2790259ita.6.1485518757662;
	Fri, 27 Jan 2017 04:05:57 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB2E.dip0.t-ipconnect.de. [93.232.219.46])
	by smtp.gmail.com with ESMTPSA id
	d143sm3161256iod.18.2017.01.27.04.05.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 04:05:56 -0800 (PST)
Message-ID: <1485518753.20333.105.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Date: Fri, 27 Jan 2017 13:05:53 +0100
In-Reply-To: <4f3ba191-aa55-8cb6-6d4c-fbfd0c451ecf@mender.io>
References: <4f3ba191-aa55-8cb6-6d4c-fbfd0c451ecf@mender.io>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: sysroots, wic-tools and rm_work
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
X-List-Received-Date: Fri, 27 Jan 2017 12:05:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-01-26 at 16:39 +0100, Kristian Amlie wrote:
> It seems like wic doesn't work together with rm_work, because of its
> dependency on wic-tools. The reason is that building wic-tools will
> result in rm_work removing the very sysroot that wic needs.
> 
> It's easy to fix locally by adding
> 
>   RM_WORK_EXCLUDE = "wic-tools"
> 
> however, I think this deserves a more permanent fix, and I'm not sure
> which approach is best.

wic-tools.bb can have:
RM_WORK_EXCLUDE += "${PN}"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




