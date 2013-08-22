Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id A913760896
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 09:47:05 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cy12so1274513veb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 02:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=36hdHfDaJQLdLM0OPuCq/sxszbQ2pQMPWEOdRT1kT+k=;
	b=cZnRi0I+72LuVmDb3NzAVlDCCxC10jlAxmFjK2hq+29ncUkMHwFkYOW1JEh/OQPW5O
	gbtQ/DM/ZNUgNJSUEkzEvwihEqMP+x8rlU297roo8DckHqZB2skSuf65hHeZ5ZK4AI2H
	XmYtXMxcny7UdLvxAWw5b7+6zCQogf/f8279+0AqRR7o1xfiwOQariDBK/Pe2e791oTW
	1x/+4e9/jCi4H9/o5/qHmkPu+OuFR/dx5Z4lyaX29f/J8goqLoyf5G4PRL4aVDUsG3v+
	fnUyl32VTeHgUIdCZlN25EotQk5zE8ZunfPcKs0WQLGA01RFZdBO4OwQ2upGIUGvtOVO
	z38A==
X-Gm-Message-State: ALoCoQl7qtmEwi2koOscn+HhTtm/IzQxF5bEpvJ46eJYdqPNvlurJDSaF1veIUoa0fDJmOijnQ04
X-Received: by 10.52.23.113 with SMTP id l17mr2940725vdf.23.1377164825979;
	Thu, 22 Aug 2013 02:47:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 22 Aug 2013 02:46:45 -0700 (PDT)
In-Reply-To: <1377125231-23508-1-git-send-email-pab@pabigot.com>
References: <1377125231-23508-1-git-send-email-pab@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Aug 2013 10:46:45 +0100
Message-ID: <CAJTo0LZZBDBEi6L-9KtsE6hA8aosUGsak8_YFduWoVz1LYhrRg@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][for-dylan] bluez4: fix network Connect parameter validation
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
X-List-Received-Date: Thu, 22 Aug 2013 09:47:06 -0000
Content-Type: text/plain; charset=UTF-8

On 21 August 2013 23:47, Peter A. Bigot <pab@pabigot.com> wrote:
> The incorrect validation prevents connection to the NAP service on another
> device.

Is this intended for master as well as dylan?

Ross

