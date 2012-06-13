Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SeoKa-0001dl-4d
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 16:13:56 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 13 Jun 2012 07:03:19 -0700
Received: by qabj40 with SMTP id j40so1346299qab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 07:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=EdhpdX3dIARsw9w8OlPn/NtOlV0TeSg98PAjQLRjLkY=;
	b=ogWPRGWQUvUCu00bRnsY14a0TiNNX2M4xPll4C5Qukp9hZrvEURZCwC9JxILdJ6WIX
	+2O+jiIGkqEKAws/hjJsccFHd9mCoN3PhZUb0fb402p2ZnpTSrNiKXurnpXWM4BcO7DQ
	Pa5EwthyBfh3n/T7KaK7Y24uhsnW50uZVD3NiODy8jU1iIibc1t9GmlSdw+SldJcQbPj
	nTe/cHo0V6R6CV1CYZkRMkgDclRMEXVeQE6ITaCYv6uST98N6dCRitRRECmdo/vfdzuT
	sDfL9PqfxyG6jPIpHzzCNxgJEMv8x9hsS9Dga08SnusdczhM5XDyfqEFrlloYdQCJ7R5
	sPYg==
Received: by 10.224.217.67 with SMTP id hl3mr26666909qab.75.1339596196865;
	Wed, 13 Jun 2012 07:03:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.251.142 with HTTP; Wed, 13 Jun 2012 07:02:47 -0700 (PDT)
In-Reply-To: <1339593545-14046-1-git-send-email-sbabic@denx.de>
References: <1339593545-14046-1-git-send-email-sbabic@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2012 15:02:47 +0100
Message-ID: <CAJTo0LYQQXZKoK8N9g0msxQAcg_c2sc0n4-hAgKCJJYzj4vuag@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmMZeDVfZGNy9zHvfi92fWKOyekDotjDs80U43+JEKHpzSvC1i4sypD24LE3JoZ+IP2aDqq
Subject: Re: [PATCH] Added recipe for libconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 14:13:56 -0000
Content-Type: text/plain; charset=UTF-8

On 13 June 2012 14:19, Stefano Babic <sbabic@denx.de> wrote:
> libconfig can be used to parse a configuration file
> in a structured language, but still compact and more
> suitable for embedded devices compared to XML.

Is there a package that's actually going to use this in oe-core?

Ross


