Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id E749F6AF00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 16:11:35 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id 10so1080822vbe.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 09:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=D61K7MKZx6dIDqYRi+28nYzWVpqYpnc8OK63/7pC58Q=;
	b=RqlSQ01aO+RW85UfZ2Y3npAeqRxiyLoNJQWkTU3HT2xJ8WQQvJzov/3DzFv37eYpw2
	OIxQOl3bdSlr2wbEKB1pbHMWjHsZvM3NVhHlHyiE2rvzARpVp3iXxqXtBrpyyE9rqHJ/
	7ahMpcGXlcm42PB7i/40As0IVpEC7gbDmZua6jSYeO7HA+cMmADZVUM0suJzP8IH/wBJ
	9YQTxDVMA/vhMGGi4rAQ1IB3TU94RkD7zIrvpFJwJDgIfGJ4BdfMwIG5tFJz5WYsfuz1
	+YWclcd1L7lXZQrsemHmzSBLVgTg4kczq9V5zgRg8WGzzXS7mVDgRPbNqUiV2X8bjS/T
	Fy0A==
X-Received: by 10.220.1.9 with SMTP id 9mr3618882vcd.37.1372954296437; Thu, 04
	Jul 2013 09:11:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 4 Jul 2013 09:11:16 -0700 (PDT)
In-Reply-To: <cover.1372950678.git.radu.moisan@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 17:11:16 +0100
Message-ID: <CAJTo0LaQGPWUCjJ5=Lnm5DAhdjsA9rSoM0tx2Dp141UKfq7WcA@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQnql2GHbX4qvSPdiaWLcJv9c+IXo32yTFVwc0EPvssWxOzBqW1iduRYrBfc2DP20jbDaFdh
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 00/10] Package Upgrades
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
X-List-Received-Date: Thu, 04 Jul 2013 16:11:36 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2013 16:13, Radu Moisan <radu.moisan@intel.com> wrote:
> * elfutils: license changed to GPLv3

Humpf.  As elfutils disappearing in a no-GPLv3 build will have
effects, I expect we'll either want to a) hold back on this or b) have
both versions.

Ross

