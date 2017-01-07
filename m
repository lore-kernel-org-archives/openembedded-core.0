Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id C1093719C8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jan 2017 08:10:02 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id j18so2217294ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jan 2017 00:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=/bV/OX0jCxJ738cxq3ZE+gbel/r/q/LBLtTtYVhxoyM=;
	b=Ovzbz2iPPzHLGe2+QZ9oCVXNHYifx6p3MXRCvRJIUeQtfx12v1/AlBWhas9Ngk9IyL
	SJleyiyRJzRWTzC+zjzhkp7Tuq01lzGEP6iRkMMEDrsLG2HD4tVLhL6JenKDCbGDKS4y
	LAOFzJmQETzRL1J2ucYzXHOIXWVUqvkbbUO1CRYj3UeApdEOpv++AY9ONPBSBF0lSRx5
	agR0ybsB9aOSGmbBWaAGMZbv3s8NHmS/snJD3BK5La/8d0CZ6EHyM+yNjE/4OSr4pdU6
	LnZDCrOeuu6QYyBoOHRQVBKHHcK16z4RwU6Z9puzuho+v/ZeFLFoDkqP3amNvDVXfbTf
	l8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=/bV/OX0jCxJ738cxq3ZE+gbel/r/q/LBLtTtYVhxoyM=;
	b=P43EJj6icGhPXAT6JC99AHgsvcOCG98nIVozXYlZqyx4k2w5Y2I1H2dcNx0n3/tVYg
	wvWlOTE9oopVYP8ysWCnA3vIcfPi521zrA9YCdWQZH46p4FLAOWIIKAC3E4NSdfH2Lwd
	ACL1PHg3/T2OZIWQEFJcGjYNlM4dWxBcC1EpVTKh1uWiYQweG4vG6G5ADveaSl7ODQLG
	nGPGMpv5AE6SlHZpDsgjUkpBzT9Y4zdg+nNNADQ3JpeA9+MMvNc6o41fwMgden7Y+rNc
	K/7a9smSt97B+4wMZDYwmZBbtOETqm6CfIduE7zfTUYBV2HouOhXng+Ya/Wjkj+fIaF9
	g9gA==
X-Gm-Message-State: AIkVDXLQVSbnWGnvHIwaroBcPvtTp47AIt1qAnmlhLUX/TRN9naiD+LTqEH7NcMeZEA7Zeaf
X-Received: by 10.107.170.133 with SMTP id g5mr36952395ioj.148.1483776603030; 
	Sat, 07 Jan 2017 00:10:03 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F82B.dip0.t-ipconnect.de. [93.232.248.43])
	by smtp.gmail.com with ESMTPSA id
	j201sm2848587ita.20.2017.01.07.00.10.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jan 2017 00:10:01 -0800 (PST)
Message-ID: <1483776598.4383.24.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Randy Witt <rewitt@declaratino.com>
Date: Sat, 07 Jan 2017 09:09:58 +0100
In-Reply-To: <CAP5N7XH56aXsVvqVns=Pa4mbmHOZvGecD638nApM94LHibpDqQ@mail.gmail.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<8002ec38c29d685bd369fd1d2382298ca33f7b68.1483696378.git.patrick.ohly@intel.com>
	<CAP5N7XEQs7acZPGpbY+fHbU5ehCoG6sAE+rwgL5GzSRsMk0nNA@mail.gmail.com>
	<1483730551.4383.19.camel@intel.com>
	<CAP5N7XH56aXsVvqVns=Pa4mbmHOZvGecD638nApM94LHibpDqQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rm_work_and_downloads.bbclass: more aggressively minimize disk usage
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
X-List-Received-Date: Sat, 07 Jan 2017 08:10:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-06 at 13:29 -0800, Randy Witt wrote:


> There are times that the work directories help with the debugging of
> build failures. The logs aren't always enough. So a person might want
> to do something like remove the downloads, but preserve the actual
> work, especially in the case of failures.
> 
> 
> I'll admit it is a fabricated scenario, but in general I'm against one
> knob requiring the turning of another knob.

In principle I agree. Okay, let's separate the two.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




