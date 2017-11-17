Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id C94747864E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:56:40 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id r128so1460953oig.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 03:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ekswkn9uPWftOmfsloPm3mAz5164wZ7BdaslfyTj/7Q=;
	b=rqHsI/FQTEx5AzuvMw9j9YnhY/BiXO55e9sIudOE0XrAE3fU4Wo+seHx+ujuzMzzNw
	M/UqDCcyIsZJDoyFY7nGPp0qL15jA9ahL7SmBUFXWqahJbH46kqTXrPKlvNoXpf3m95/
	AnluYq9aJL5KkoPdLNTXY3ZRoWPKhd16aoqEmXMGfdNTBIhjqZ6jOpIUrezAZm4K08HU
	aaAkCkA93xF1KvFIF2I4p0M+VOk2q4KQzUpuNEFQjvFDJBuhIOvowO1WFxhOtwpH8AOl
	kT+iEkn/leJMbpUsTGClrpkHthmHJOieDkvXXIB+ExNn+HmyN8rDxzXWNsvFomPsE1Ln
	PYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ekswkn9uPWftOmfsloPm3mAz5164wZ7BdaslfyTj/7Q=;
	b=oesaQR5CP9cbyzAN8ddv/koXwHYWmP/LrVFmGcPBbXhs/kklc2osXd5zVQ/a5PUDV4
	vBInRZTW+g5hjIV9phlpAigoEBXj3zVI4LAk8NE1JWwrb5rT4Yq+CWopKTZ1+DJuV7Ye
	pYzFMFTD+eXoIRQvRzkjgoFuPqt1IjEu6yx0fLP/z1FK4S8EDHi14RHm03qdW2bnmy2f
	I/Gy4rKZZ802nHvbpi+ia2cFJlfE4gmoI7gmZRRMrv5+OTS1dzS/QK5LRZ1iRj/wQXCx
	GArJqrh0bbvuAemKYf0CrmGJhULCeRGMSZSYgwuChc7H7kGb9JYe5b0i6vKWaIdOqZVb
	McpA==
X-Gm-Message-State: AJaThX5PIYML5TME19+/upPnv4MciP09aoqMkrqzJXQcvFfrR1zhi3H6
	9BFwL1LkYJM2zmVQNcYI2/E7S323
X-Google-Smtp-Source: AGs4zMaf1QJeQ+FEoMqYrSnHrbBczUKSMqsyTee8+CabIvQgmkYiAd/KVhuwlz4X+9HRUL3oNOEizQ==
X-Received: by 10.202.74.205 with SMTP id x196mr1011127oia.260.1510919801533; 
	Fri, 17 Nov 2017 03:56:41 -0800 (PST)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com.
	[209.85.218.42]) by smtp.gmail.com with ESMTPSA id
	j40sm1523799otj.57.2017.11.17.03.56.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 03:56:40 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f42.google.com with SMTP id r190so1458941oie.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 03:56:40 -0800 (PST)
X-Received: by 10.202.59.7 with SMTP id i7mr926529oia.166.1510919800064; Fri,
	17 Nov 2017 03:56:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Fri, 17 Nov 2017 03:56:39 -0800 (PST)
In-Reply-To: <1510913165.4514.3.camel@collabora.co.uk>
References: <1510844758-20290-1-git-send-email-martyn.welch@collabora.co.uk>
	<20171116172129.11b89562@lsandov1-mobl2.zpn.intel.com>
	<1510913165.4514.3.camel@collabora.co.uk>
Date: Fri, 17 Nov 2017 09:56:39 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrh6YxyYk9V6yKg1kC13LA5-CYTftc6ws=Rpx4QBUoRUQ@mail.gmail.com>
Message-ID: <CAP9ODKrh6YxyYk9V6yKg1kC13LA5-CYTftc6ws=Rpx4QBUoRUQ@mail.gmail.com>
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: yocto <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH v4 1/3] image.bbclass: add prohibited-paths QA test
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
X-List-Received-Date: Fri, 17 Nov 2017 11:56:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 8:06 AM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:
> On Thu, 2017-11-16 at 17:21 -0600, Leonardo Sandoval wrote:
>> isn't it this class meta/classes/insane.bbclass for this type of checks?
>>
>
> I don't know. The logic for IMAGE_QA_COMMAND is in image.bbclass, as far
> as I can see the package QA tests are in package.bbclass, so
> image.bbclass seemed like a reasonable place to put the image QA test.
>
> If the consensus is that it should be in insane.bbclass, I'm more than
> happy to move it though.

If not in insane.bbclass, a new image-insane.bbclass. I dislike it
being defined in multiple places.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

