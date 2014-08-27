Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBDD6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:52:56 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id a108so430328qge.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 08:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=buEib3luJ3Zd+guS8l9eYurXCCg2l9dBW6szzpPQcSU=;
	b=I7+sKC89ni3jDaZOIf13R6pWerroMjQcRixAAC2QZyROpp3w/xoAkdfbAMjGMcTqdQ
	1vPeUkS/vAcLMEIHQlHljvux5aSYIqfSf/7XJ7Hw4bbEW7+ESdroNQJ63FofXPvy5St8
	lNXbNVfgKwVSyZNFEX85hXEeoYBnZ/mQjJr9GFg1yE3C+UMAi4Osj6btO78oIynyMhmF
	x7c70c5P79IXgL/uzfZokiZQq/Ns2HievCSpQGYitvdNt7Y5RD4wSosKUqaU3dOE2OAn
	8b44to52WfdcbNw3V5GOAuxoYVNz/bdyG3P/L92jQRb97mpD2HihvWTiJjj5pp2L2bYh
	/RcA==
X-Gm-Message-State: ALoCoQnaxjrALh67WAxLpYNaR3IU5HlzCjwCwjw6WnKccIaaPohCuabQlhE69lyiRSdf5HOSlTsZ
X-Received: by 10.224.166.195 with SMTP id n3mr55104877qay.22.1409154777909;
	Wed, 27 Aug 2014 08:52:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 27 Aug 2014 08:52:37 -0700 (PDT)
In-Reply-To: <1408983725-45864-2-git-send-email-fahad_usman@mentor.com>
References: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
	<1408983725-45864-2-git-send-email-fahad_usman@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Aug 2014 16:52:37 +0100
Message-ID: <CAJTo0LZK3uY+-hZb34ZHWyEumwb1AqWY0Epy45r+eBg7bmwJVA@mail.gmail.com>
To: Fahad Usman <fahad_usman@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] logrotate: add packageconfigs
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
X-List-Received-Date: Wed, 27 Aug 2014 15:52:57 -0000
Content-Type: text/plain; charset=UTF-8

On 25 August 2014 17:22, Fahad Usman <fahad_usman@mentor.com> wrote:
> +    ${@base_contains('PACKAGECONFIG', 'acl', 'WITH_ACL=yes', '', d)} \
> +    ${@base_contains('PACKAGECONFIG', 'selinux', 'WITH_SELINUX=yes', '', d)} \

Should this have WITH_XXX=no for clarity and safety?

Ross

