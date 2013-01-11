Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TtbE8-000897-Da
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 10:48:40 +0100
Received: from mail-vc0-f199.google.com ([209.85.220.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Jan 2013 01:33:24 -0800
Received: by mail-vc0-f199.google.com with SMTP id p16so2816400vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 01:33:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=eaAvQq39zHDtk9vkMHyDfWbGDJSXPv22/pz8gaolTlM=;
	b=L+nV4HvMZP1b/aMcrd/GNy9gLEeJfbBE10HsypcFSuzXm5l4mjvndDW2E3deqSu4ri
	40j2uRlwHEZA7ANXdP5gRsL+Z3yb9cC0SZjXD1GQiJlMzcNoC2S8ReFMNExD1Sh4fW65
	rOlFMFJZtwWPDZNRmTpbJE1/JdYO6CRIfXKIGcmJIYUbnpq5XcDDaR1UTxqlfqY4geKQ
	O+CsanGL7AL8x2+vwdccHg5vDmJdqsDT/i5YJKwgeedG2Hx+QLrRnzHDcIKGVahkE+7G
	IzUWQufKk/USOVoQ4dJaCH6FEkJFj36ojGl0+1IZT8WkJqm48bkO9Eund+wQiyURiK49
	zAYQ==
X-Received: by 10.220.155.143 with SMTP id s15mr4811376vcw.35.1357896803400;
	Fri, 11 Jan 2013 01:33:23 -0800 (PST)
Received: by 10.220.155.143 with SMTP id s15mr4811368vcw.35.1357896803242;
	Fri, 11 Jan 2013 01:33:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Fri, 11 Jan 2013 01:33:03 -0800 (PST)
In-Reply-To: <1357862392.4072.3.camel@ted>
References: <1357843361-18125-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LaWTPXh9Ph+LFMK+44t3T+TN-uZXXEwJg7yoOmcUZCL1A@mail.gmail.com>
	<1357862392.4072.3.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jan 2013 09:33:03 +0000
Message-ID: <CAJTo0LaXy-Vs9yVvxdukTvcOKe0kEQV4mE0uVSOG_GJhKXV2gw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnB5MxvYAA8ZIlRO2YRyPQZtdiMRBX8vjskFmQRkGDGrDsydbKAg9UWm+AkAOBCCCKVpQQZ9bIMrExn2p8neAcUgLttLRGRvzPsOZ4lBgqqBxCbDGJRkBfSHLQpXfzrI06VVa5RhxXUVgVw+UiMpy5vaNm5CwfMRfvkw/0phOukBmWNtYQQZ31nfE/IiTaavfBeBRG6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] connman: upgrade to 1.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 09:48:40 -0000
Content-Type: text/plain; charset=UTF-8

On 10 January 2013 23:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Please don't use "qemu", use something like qemuall or allqemu since I
> have some thoughts about how this might interact with the qemu class,
> most involving the word "badly" ;-).

That was my fault, I thought it was neater.  Interaction with classes
didn't come into my mind.  Sorry for the churn Cristian.

Ross


