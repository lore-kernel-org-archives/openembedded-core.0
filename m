Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id F28B96BCA1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 14:02:58 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id oz10so3209428veb.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 07:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MdFOrIouJK94wxmbPB8g1AiYmBqBC+RtIDv43Pl93W4=;
	b=W4warz0w7UvCr63c6TBvKkI8GgkP5SmbnTptO+aIFmSmKeywB+a78O5muEVMYqmtzO
	ONf5cacn76x01qaSqXoN0UtaqUWx83K2YDonrgzLcinr+yzgDr+OPrZalLYWF393K61E
	pFq6ML86q3EO5Z9fEan6U9R0FIBmypIGy0+nAUr4A+r1vXaJCx6rikrh3n7G7OzkH6VR
	ewJxks61++Va1nWmuJAw0FGpukPGo3DKk69oPuWuKIx6AMvEYG9xDNwrfn3IQFPCWoJL
	vdjeR1uJwmPgZal2FyC5xoJ6z+Ck9kaUA4El8VrVNFw6ZfuwLCIbAqY4Mn5ktucdfLzB
	D3pQ==
X-Gm-Message-State: ALoCoQlh1k0CzwlQUubS88+5WBl5Ntlol5P90+TYZx4ZWfVRvWugDUHHHJyBQ5JwoIWqLa0X3KCm
X-Received: by 10.220.16.73 with SMTP id n9mr1871565vca.24.1378130579540; Mon,
	02 Sep 2013 07:02:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 2 Sep 2013 07:02:39 -0700 (PDT)
In-Reply-To: <e6abe1f4e6a41cf4ac4070971b6ec1757d79b9ab.1377792006.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<e6abe1f4e6a41cf4ac4070971b6ec1757d79b9ab.1377792006.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Sep 2013 15:02:39 +0100
Message-ID: <CAJTo0LbU5XC59qQ6mn5s161z4d3mvb+tdyjc5GNj-9-SFkNxSg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 06/20] libmatchbox: Add PACKAGECONFIG for png
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
X-List-Received-Date: Mon, 02 Sep 2013 14:02:59 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2013 17:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> +PACKAGECONFIG ??= "png"

For completeness consider adding "jpeg", although I doubt anyone
actually uses the JPEG support...

Ross

