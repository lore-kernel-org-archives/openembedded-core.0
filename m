Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3116FF76
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 06:53:15 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id z134so3458098lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 22:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=j1pX1OctLdeW0iTV3LlJA94WxAk8aeVGxtZe7C7iy/o=;
	b=dla7xuARxWQxona0gYeXymT8DcM7KfUJUXhRRSlR3XORpJ1aVN1OVJKESmnx23V5cd
	HfhIpx7vqha3vnaEp00ddwdeq6zYVRR86iTS2oPHG+/+KwrVA6ukvJiZLWHTDvhAAVvK
	gzxPscg+cT/6U2mz1uFbCWQkn7D8i9I6AkZ0IUJtRDdceqUYuHBRXKcClGILMtTIZYYN
	YxBvneCr68hbld7MaJwbGM5CwB1BdYp7Bd+gOFhNwZzX1ZH2nKfTrhku/giAh2Gadv5p
	P4LEN34LzaaECsajvBjXdP5/7G521LtAEK9E026Gbnx0ndUP+KSc6EfNGXGVS2Ft4q2K
	6Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=j1pX1OctLdeW0iTV3LlJA94WxAk8aeVGxtZe7C7iy/o=;
	b=R9Ycd2uLM/goiDmFpLgkFCko51V3wQObS5oTQMA70kwbc53i0VWLydmKL/e4tFh5uq
	/cIzuw4uwedkPlXH8gs7fq9ilDoxHpCLGyWv0oRjdfvk+h30qHKETxzK0N/bmKt9/yGx
	6tbUUYU+cTfClU3j+aOtvfAA1WVqip6QDOlJR5Fkz3wnuOgMBwyETg2uGfmYWsFpQX/0
	4z5cfFGX9Ax6K4iV06r12DmK4z0Cx9w33yQaaWMbTzMQirB3V6qKBRo59v6+W/8zRmBb
	AhGQF7mUaZT3d0OGVQBNcKzgJMx4vbTA8rt7Kpcvts9i4MIAXa2TGygZjDsnAKZwj52J
	ry8g==
X-Gm-Message-State: AIkVDXI1v7avdHLofcOWohTZ+UA6KZ7cXFtXkDBh2e16U6eQOvN4GTQjjjELRpvfBsVEpw==
X-Received: by 10.46.21.66 with SMTP id 2mr2632597ljv.19.1486018395701;
	Wed, 01 Feb 2017 22:53:15 -0800 (PST)
Received: from ad.chargestorm.se ([194.237.220.218])
	by smtp.gmail.com with ESMTPSA id h13sm6431974ljh.5.2017.02.01.22.53.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Feb 2017 22:53:14 -0800 (PST)
Date: Thu, 2 Feb 2017 07:53:13 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170202065313.5nrljla74ihgd3ij@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1485846907.git.anders@chargestorm.se>
	<20170131072324.4466.26983@do.openembedded.org>
	<20170131074629.qmofdkc6ktxtsc2a@ad.chargestorm.se>
	<d8de15e5-f412-29f0-b9bc-ad69f2bd42e5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d8de15e5-f412-29f0-b9bc-ad69f2bd42e5@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFB5dGhvbjMgcGFja2FnaW5nIGZpeGVzIChyZXYyKQ==?=
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
X-List-Received-Date: Thu, 02 Feb 2017 06:53:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Khem Raj <raj.khem@gmail.com> [170201 17:53]:

> On 1/30/17 11:46 PM, Anders Darander wrote:

> > Again, the patch series was just rebased on master; but as there are a
> > single (non-modified) line in that >998 characters long, one pacht won't
> > apply from the e-mail. Please pull directly from my github repo.

> I wonder if we should consider finer packaging and move stuff out of
> misc, since its a junk bin for all unaccounted files

Yes, that's something we really should do. Though, unless someone has
some spare time, I guess we'll continue to do that on a case by case
basis...

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

