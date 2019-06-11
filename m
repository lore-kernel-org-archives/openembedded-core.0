Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 16EA17E4F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:59:09 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id i21so5412649ita.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GpkvarFao9xnhdPrUrIjsc4E7XD7HEXml2UoyzHvXEM=;
	b=pkF5uLJVinNH0GZ7kbO05vHdgRq/zilxsF+BzY7WY2er2JzwxmFuVO72PsQp7x99dR
	+E5o8pDYxxOBQ58hkyqEY5iMLt97Gvfc2ovV8AItl4JsRA7KxLST00EKxz4xlR+4/Ab9
	0zsPusqn6Yqy1S2SlEr+EOicrIu7j27Q5dP7kemH338s1RNEIMwXRCAgCdAeKHNQpko3
	VENNYnUk6S9CCSrVIXGPbvZlEAABUxV/F9T4WdcxPwUvCxjH5jTgqEFxGkydEoQ7bpcZ
	u/+Pg4UVrDqON8vML5kgV3KGThmikPMbglOQhD/JOCsMTWzMSBa5LRwLgm0MhFN2e0OB
	TnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GpkvarFao9xnhdPrUrIjsc4E7XD7HEXml2UoyzHvXEM=;
	b=n9GeFn69whh2nA0cYG3iUuGkZj88ucTd20q8AzXLK9pqgXXPmSD2oZU3KbEu8NV0yV
	2yPVPzHd2pgb0KUbqUF2SMBN280H/2EzDGepxEWMtZ5VsOkBK06CGkwSDTAuLbOIbWhL
	KuqMOUquHcCxYaf8wSSP3OSbjAiX66yVHSqvDY0o4qla6uUGJKDX3wiMlKflFlcyPedH
	PigYxxKBFz8Q+NVPeFKIvXaZ0OZGcEgdi59Q4XSIHIbKzPLtpOUMUP4yGmX6Gv4Qg8rt
	zECe9do+vytA38RDXn3d+7k27su0WGmHpME+F5kUUVHGz0pMhpKlZotk1DbDj4rCKhBI
	DB+A==
X-Gm-Message-State: APjAAAWxTawkXG0/zaEBpcnt2vmUXVgK+/bRCDlBShh502T/AtRLtOpH
	t8hZqGWBZAlbNMgJiVcQ6ZrjsOGYxTev8lhXDVmYabOWL64=
X-Google-Smtp-Source: APXvYqxPzDpLbP/GQBZsiSg43fb+9S4MEdk8mGdgxOKYSKDK9oV6kUXczH0qujBuvO05xfOM4BhNcoDZIrEU0h1n/7k=
X-Received: by 2002:a24:c987:: with SMTP id h129mr14281212itg.74.1560265151160;
	Tue, 11 Jun 2019 07:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
	<20190611142607.18038-2-quentin.schulz@streamunlimited.com>
	<CAJTo0Lb2E-yTtJaWE5ezF-jTNpVXKyWD0i5xhJY8rrnzxfrjhw@mail.gmail.com>
	<20190611145216.2766qintxmm3pkwr@qschulz>
	<CAJTo0LYkbNbMKo89fxeabCNm9MsZsK-kYqUy0JQu1+n7HAQ7hQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYkbNbMKo89fxeabCNm9MsZsK-kYqUy0JQu1+n7HAQ7hQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2019 15:59:00 +0100
Message-ID: <CAJTo0La7ArVX793-KYQwsBPN59198i+xA5Qk9at8ZZ9_ktY2sQ@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Adrian Bunk <bunk@stusta.de>, andriy.danylovskyy@streamunlimited.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] selftests: add tests for INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 11 Jun 2019 14:59:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jun 2019 at 15:55, Burton, Ross <ross.burton@intel.com> wrote:
> Either is fine.  Note that in the broken case - where the recipe isn't
> skipped - the test goes ahead and compiles stuff.  Can you also try
> using --dry-run to see if that results in the same test behaviour, but
> without attempting compilation.

FWIW:

-        result = bitbake(pn, ignore_status=True)
+        result = bitbake("%s --dry-run" % pn, ignore_status=True)

Still results in the nonspdx case failing as expected without the fix,
but without any compilation attempted.

Ross

