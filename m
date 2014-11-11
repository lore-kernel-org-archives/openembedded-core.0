Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0B70865CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:02:22 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so11223312wgg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 01:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ICS3gAu5Ao+749KkDmjBY6UQInctf6H020Y8VtsDLg4=;
	b=Xm1XfwIw10WhMhbS3Di7Ju1yk9L46PHUk9mvNaphzNUu/JYKd+RqObOThoJo21rHON
	PXzHFO/rdtPqnAXnbjEHMJJmr6MkFkVf1g26SqPvcdEnt37anFmyH+fijgDcUFslxRSW
	mcSMzZ9xzhVslwN0Db4liUa4YHdl7yxjc9rd1P2hNTOVwtAkD7ppFAahzsEcZ4mVWYmG
	Gf3FQACSjtvlOgu7g9bab/ESXu0YdZPOpHtgrMLrl9Ppr/x5XrNzqNDjVsm35E+eLfp6
	W4T8y1uFGykeHf/2uTY7QKv3LQdScX1f2VFnZpsX6ozYf2ZOEYVpZPCuwLaBan6N4z8Y
	9tsA==
X-Gm-Message-State: ALoCoQlUPoL9bBbDW9L4FGLqhCsjV3meEjK3pfOf109LI2aUJoVuRbeX9E6f08DYIeOvltdSMTEj
X-Received: by 10.180.20.173 with SMTP id o13mr11913155wie.70.1415696542600;
	Tue, 11 Nov 2014 01:02:22 -0800 (PST)
Received: from ?IPv6:2001:610:612::c431:a480:a7cc:c1b3?
	([2001:610:612:0:c431:a480:a7cc:c1b3])
	by mx.google.com with ESMTPSA id t9sm26373858wjf.41.2014.11.11.01.02.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Nov 2014 01:02:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <54606AD5.1050905@windriver.com>
Date: Tue, 11 Nov 2014 10:02:20 +0100
Message-Id: <3313D76B-7622-4F78-B550-E3BAD5910B4A@dominion.thruhere.net>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
	<20141107143813.GF2444@jama>
	<01AE3AA2-1B18-4047-A760-E137E0A245D3@dominion.thruhere.net>
	<54601CC7.1060000@windriver.com> <20141110064247.GB2440@jama>
	<54606AD5.1050905@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Tue, 11 Nov 2014 09:02:32 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


> Op 10 nov. 2014, om 08:35 heeft Hongxu Jia <hongxu.jia@windriver.com> =
het volgende geschreven:
>=20
> On 11/10/2014 02:42 PM, Martin Jansa wrote:
>> The docs say that IMAGE_INSTALL is for "package_name". So I think =
it's
>> correct that it fails when you put "recipe_name" in it and sometimes
>> there isn't any package with the same name. It's the same as trying =
to
>> make RDEPENDS/DEPENDS entries to be interchangeable (putting
>> recipe_names to RDEPENDS and package_names to DEPENDS)."
>>=20
>> Especially with that patch for xinput-pointercal, if user explicitly
>> asks for installing xinput-pointercal, what's the reason to create =
him
>> completely empty package? IMHO it's only hiding that issue from him =
and
>> instead of discovering the issue in do_rootfs task, he has to check
>> generated rootfs or even boot the device.
>=20
> For most recipes, they generate packages with recipe name, it is not
> convenience to figure out the different between package_name and
> recipe_name, especially for newbies, which I means we should reduce
> that convenience, build relationship between recipe and package,
> especially when the recipe doesn't generate the same name package.

It is not a bug when recipe foo.bb doesn't generate foo.ipk. Your =
changes introduce needless churn and break upgrade paths only to cater =
to people making wrong assumptions.=

