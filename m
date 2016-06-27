Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id E8D6D6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 10:12:42 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g13so141003450ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gTtfmBLsR7nlLpU9GkbYaEsdtXsvbqndtX4//suSOEk=;
	b=eM1HTCHMyncH6NAkgsMsQXVkAOK4CHN7sxkMuUcIyiBGsoI7LF5S5lahBGOA9txbTy
	Sxl1CdWH76SYif40HZFTetwcTX8SLsbZp0hAXheztRHt158wBiIUMDlatsPC0hhoCyer
	JQtdmpuVGe01CExZPTqiVqL6nrYmrKrgzBVgdUY8FonYTJV4gZpWSWXCbRNYk6m4BSum
	Ie39Kb/k32JHgqYKbA0Z7nFE42grV27AVdP3/Yvho6tBCHmEVu/RenRbkjS/hRI07EKa
	7d5wCewU4EBzqZcqVXN6LWpsc4ijvVZWMiS2DXJy8ObsmdyN+6V1JCsqK9hgi9+bpYwU
	xFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gTtfmBLsR7nlLpU9GkbYaEsdtXsvbqndtX4//suSOEk=;
	b=DHEJnddhFChqtTjbuRTXKnvY1eC+9oEzgGPvLzIFgd3POXOB2eA2YhFCEX3KwqKT5m
	FxhtLmD7f+mGAPQ3Osqw6TwBFh72bHRqL/oV5RLET24JFz7qtidEe56ZzOegXKfbT+r6
	gH3PmWeEO4PyLJ5HC0//FIovOtWu7LhPMF3Qfrzp+7tQtODZrcGexlfE9wTlEvK5VTzB
	U3O1ET2yofVxUpGo24fBH4eL8b/036kgJbxEi5dnufpsgwel30VA3ges8yBlAACczvhb
	JwDLlZzPBJA5VPftX14fUpht3ntvTLrKh4WJZ0BCG03WZrm0ftr9c3stmgwIYJu1zJGE
	IWsA==
X-Gm-Message-State: ALyK8tJMiQQScUy8puAQPmtlouxtC+PT77TC87Qt9BLqIO3UiSid4/uv3yFd84VbP2KIGYd2
X-Received: by 10.107.10.35 with SMTP id u35mr12410ioi.92.1467022363118;
	Mon, 27 Jun 2016 03:12:43 -0700 (PDT)
Received: from pohly-mobl1 (p57A5698B.dip0.t-ipconnect.de. [87.165.105.139])
	by smtp.gmail.com with ESMTPSA id
	e41sm9104726iod.17.2016.06.27.03.12.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jun 2016 03:12:42 -0700 (PDT)
Message-ID: <1467022360.25432.22.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua G Lock <joshua.g.lock@linux.intel.com>
Date: Mon, 27 Jun 2016 12:12:40 +0200
In-Reply-To: <1467013411.2892.2.camel@linux.intel.com>
References: <1466590945-10412-1-git-send-email-joshua.g.lock@intel.com>
	<1467013411.2892.2.camel@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] rootfs-postcommands: don't hard-code .rootfs in manifest filename
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
X-List-Received-Date: Mon, 27 Jun 2016 10:12:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-06-27 at 08:43 +0100, Joshua G Lock wrote:
> On Wed, 2016-06-22 at 11:22 +0100, Joshua Lock wrote:
> > The .rootfs suffix of a generated image can be overridden by setting
> > IMAGE_NAME_SUFFIX, to ensure manifest filenames match the associated
> > image make use of this variable in the manifest filename.
> 
> This change will break a few external layers so probably isn't worth it
> for a minor cosmetic change?

Agreed, please don't merge yet.

The problem is a bit more complicated: is IMAGE_MANIFEST the manifest
file for the entire image (as the name implies), or just of the main
partition? The two are not necessarily the same, because some image
types combine the main partition with additional content (like a boot
loader and the kernel).

This conceptual issue needs further work.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




