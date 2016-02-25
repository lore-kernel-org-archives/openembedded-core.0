Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id A697F7719C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 17:06:21 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id g203so94852449iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 09:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=PmDI6IxojLz7MpB5Wbq+KdeDP1GGudQ9SkvPxcwvDKE=;
	b=zc6HHTpuxTKu/s2RaRy1FjAo1rQ53KUTT8XTNQ8smADuimT3QDp8ZHgCNjIbycJqJ4
	4AerPXMEUgqqIvlwoLMzs+woL1DDvDmWJs4MB6DtMVRdI6TXrW6XpFzEZFyy3b/SCE8Q
	V4p+NsO4mx3F+b52MSwV9JSA082V7UG9L5TVB+dbmR/+8hItkIu6Qf112ZiYGCB2NKZi
	TME+WWn8+CoV8zhwMfCNAW5oevCik1lSZNKnkSjn8kT5lItBHUEk0RXMdo/GaZrHJQmq
	pW+N4CibQ5ueOFJ5S+1o5FDu4uCv5Yz6sL/m5XLC3Z4HxtCFxvBauun77HCL/owdDKdD
	rwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=PmDI6IxojLz7MpB5Wbq+KdeDP1GGudQ9SkvPxcwvDKE=;
	b=QPKMjjph4GNKno1sOzN3DlTTpm7bs3RN7A9qDMMaHluK27tSbaH6AOXu0zhzVnyFB3
	uostxW9OsPyLpoLGaZdmqtyu5pnRL59uUiT5cjVJ+oJvlrtccmc07YTQliBTw1Gj+vYZ
	kwm6r1ysdVel+3Ykm17Ou6MAWIXSZX4isPvria5oVUTRsMqx8PJ/PNTy7W/L/yqiAoP3
	16ODrcCxFs2fUnHjfEYN3D+dSqn9yiVEsS5udA1mvF9fid5/VPdBf2oZuyuB4oY/hBJH
	D562oRVHwmD2YnC9MH3z+SLzhVnRva+Ij3/fju4g3M4tQxWa7vDIuyZtlixo5xofgWvx
	2gLg==
X-Gm-Message-State: AG10YOSXDXGq/Rhu9+Y4Yq5YIC5D5oDgE9QbtrSxCTOcMH+w9GXxKwJuh0ZrsAFy2WQ5W6gV
X-Received: by 10.107.135.150 with SMTP id r22mr3805016ioi.92.1456419982376;
	Thu, 25 Feb 2016 09:06:22 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F03B.dip0.t-ipconnect.de. [93.232.240.59])
	by smtp.gmail.com with ESMTPSA id
	f70sm3565433ioj.37.2016.02.25.09.06.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 09:06:21 -0800 (PST)
Message-ID: <1456419979.30039.67.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Date: Thu, 25 Feb 2016 18:06:19 +0100
In-Reply-To: <6372957b8304964030e874ad8e5b05b1727d7be8.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<6372957b8304964030e874ad8e5b05b1727d7be8.1456325292.git.joshua.g.lock@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/10] swupdbundle: new class to generate virtual images for swupd-image
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
X-List-Received-Date: Thu, 25 Feb 2016 17:06:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-24 at 14:52 +0000, Joshua Lock wrote:
> Our initial strategy to generate bundles for consumption by swupd
> is to generate images which contain the base image (os-core) plus
> the additional contents of the bundle, then prune out the core
> contents. By generating images in this manner we hope to accomodate
> packages which modify the rootfs outside of installing files, i.e.
> with postinsts.
> 
> To that end this class, to be used via BBCLASSEXTEND, will generate
> virtual image recipes that add extra packages to the extended
> image.

Can this be combined with an image recipe which itself uses
BBCLASSEXTEND to generate virtual image recipes, i.e. create a virtual
recipes based on a virtual recipe?

I don't remember whether I ever posted the class here; what it does is
add or remove image features in the virtual image variants based on
BBCLASSEXTEND parameters.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




