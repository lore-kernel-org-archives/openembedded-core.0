Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id BD8E260687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:40:36 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id b10so7130415vea.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 03:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=nB3vqdYH3cativJ2awVdZFVUKj092zqbxcWmeIGL1jQ=;
	b=eSVQdKvhFg627WWiZCAgydzWJLopCv2bUULPDsTYqUpwa3ytmoaeVIXUrFalWd7NRR
	d1msXoPceciYscoGKHZQ4/RMPIeq4prkcRfvZuuaFthyEHdf3zUMEqddYsQiYdsNO4+u
	ffqWfTQdmp63ln4eb8zDeMrs/H0FTwclfO9aax50uMj+uQ+P0iRE6weB8bS/KkwC5Y3Y
	NoX6Psf3lc9yoT6+9bj/WiIvquoCAKxNdYwpFTQAi/K3hdLLYSQg+SR6Zn1NzdDWvHbd
	wKkvvXVmsKUlI9+o5ivZlLON4rHpc0GTpJdoDH4H+TuzPFIKtwy0SY0PWCe06aFgjyt3
	kpVA==
X-Received: by 10.58.118.70 with SMTP id kk6mr21309082veb.1.1373539237364;
	Thu, 11 Jul 2013 03:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 03:40:17 -0700 (PDT)
In-Reply-To: <a546f2c5f8ecec522cb8087015359f433fb5c998.1373443071.git.hongxu.jia@windriver.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<a546f2c5f8ecec522cb8087015359f433fb5c998.1373443071.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 11:40:17 +0100
Message-ID: <CAJTo0LZTHz5hE8jx+6qNtePXj-LcMpsXEJ3zbwN4jS9npDHpLg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQmMvOSB/Xrv1HWdQpkv/CkFP6lk/zM1bnR4ZQFqYORiiork6euOLfkp29RUNJnNoBQ4lAs6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Thu, 11 Jul 2013 10:40:37 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2013 09:03, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Network Security Services (NSS) is a set of libraries designed to support
> cross-platform development of security-enabled client and server applications.
> Applications built with NSS can support SSL v2 and v3, TLS, PKCS 5, PKCS 7,
> PKCS 11, PKCS 12, S/MIME, X.509 v3 certificates, and other security standards.

What's the rationale for putting this into oe-core instead of updating
the recipe in meta-browser?

Ross

