Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5626871C3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 13:59:51 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r78so11528673wme.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 05:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=A71oC90L/3jaT4QLgwXyuGTmq8TEbc+RvQJaJw9TrK0=;
	b=eHeIl1KvcZEl7OVI7hVDCRh+u0GPTMs3X6FhQRon4m19W8bTeOyOijk+pA6b4PD/dM
	xJBzA+UeFh08DvpNGiEIJxK6SSh5vlKXlmwABCXUy+bJxP3LLCrQUXysNrMSxZWxhZCH
	A70zmjQHp93ZbbK8l5RB7BHZ31KmUv1zqwfK2PXFy5WklmOtSCQhcpuoW8NEo2uohAoh
	8jnq/bAo5RxiqHidwDBQhHnvCcCwopy5K+8cDbaY+PDWCzlF4oYImdqOm6mHRhqe1l8J
	FJzktSrs3b6F7pQTPx/i9+1FvHlhSv43ZbwQhIC39dUioxMMe/3N5Z7gkxo5NIp5x2W/
	ehNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A71oC90L/3jaT4QLgwXyuGTmq8TEbc+RvQJaJw9TrK0=;
	b=DPDl046c4UyMlOy53+oBF+vbpm+eKPDxmz+fp1NoabfgjRMYYoBZvINQFqR+8h7twa
	2CBluffqWxBOpn7lCWufHd5rEL4daciw6iEsbu3rbcfs6rUQNjbQ2hfKWlKTY4iev5vb
	HQW4oyOXRfSqwoJvLHLHgPVdUwSu9nuDcRPs1LDY4YP7IXUkTKj3ZhMdFu4AyLOor1ob
	yEaV8pUlzgYqHCFgCV6tcCHEZMVhfddfwpwFuFHbeTIBEAxeNdIHU3M5VmWwDTF2KBM3
	p9On7cH9OqVdXLmLZ9RVxKkvBCZZeNjG6GhO5GZrdhSvz2VgGfEt3IWhM4dOTx9/7KiK
	BJpg==
X-Gm-Message-State: AKGB3mKAa1kWgZW4LmE+aZ9krVmBx3st7BmVkCye2xyejZ4U+/0AbBLI
	y/cENMvoKCb/jJ7sO1Yi27iiVuCE
X-Google-Smtp-Source: ACJfBotLsNld7HEqCIFSYPXlAYO/VW7EEhu3MlfAcd9v+zPTyq8kG0bBm3081ny1VQC/vI0/sTvlpg==
X-Received: by 10.80.192.5 with SMTP id r5mr12610534edb.138.1513259992915;
	Thu, 14 Dec 2017 05:59:52 -0800 (PST)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	a52sm3810459eda.92.2017.12.14.05.59.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 05:59:51 -0800 (PST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <266c426e-ed0c-6fbb-842c-01962b9ef71b@dresearch-fe.de>
Message-ID: <1fb96ec5-b96e-5790-9020-4f4501184e5d@dresearch-fe.de>
Date: Thu, 14 Dec 2017 14:59:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <266c426e-ed0c-6fbb-842c-01962b9ef71b@dresearch-fe.de>
Subject: Re: How to fix file-rdes QA error for /usr/bin/python or /bin/bash?
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
X-List-Received-Date: Thu, 14 Dec 2017 13:59:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

On 14.12.2017 14:34, Steffen Sledz wrote:
> With rocko some builds are rejected because of the following package QA error (formerly it was just a warning).
> 
>  ERROR: foo-1_gitrAUTOINC+2595b80a79-r17 do_package_qa: QA Issue: /..../foo.py contained in package foo requires /usr/bin/python, but no providers found in RDEPENDS_for? [file-rdeps]
> 
> But the recipe still contains an rdep for python in recipe foo_git.bb
> 
>  RDEPENDS_{PN} += " ... python "
> 
> I assume the problem is that /usr/bin/python is not provided by any package but is just a symlink (created via u-a?).
> 
> How can/should this be fixed?


BTW: Same problem with /bin/bash dependencies. :(

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

