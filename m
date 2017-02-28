Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3BFBF7300E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 12:27:58 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 90so8151341ios.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 04:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=ZkWDNyK6n8jNEIEbb/wdaESideZ8oVZ+rT/o++nwXmE=;
	b=DqVgeXXMF61OUmqoTepa5pBmZXMQW40teDXWWe2WQActApXnAuOU+0wdcIGVPv9TCZ
	W3jCU3yW4pnew0KXIvgaGOBdPgS5rRv/7szHJ6vtIH1OMkdupIhg6su72847i2QQLxoy
	H876REiC3soiaIuvegAe+whUBUI+ujDrqmBaNhAnVvM5STo4jFVZFgDMxuSQv9/nc9v9
	Js6cZs2nmaaddhgPZEKJavgrOufOZubWsOR4bCOpLoVWdGQvSkAbp4Ra6WJB07SZMJ1l
	Rykd3/TmUj4Z4Op/eAGeX6Jy7IC/zM3gMc/Nl5Xi4zmGBup48VuGjR/cZGXHQ36L44dT
	9YwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ZkWDNyK6n8jNEIEbb/wdaESideZ8oVZ+rT/o++nwXmE=;
	b=g1lbvoOQu/OUp/glGZRlPi49vYUhd1F1ku5fCs8PaMvrOw2u/t023lJkPfuSPzWXp/
	LAbRucj6YliEWmgwPH1bLxCxT6Cqy4lpi18z0FHNipwO877+6/fhOW9fjF3uGjA/Uj20
	sL95Loxfw3iSmjgRixVZ2UDqr8zq6o9KIZPqtEHdSS8XI4LQDUVWcu4nqdHeno7TpajP
	F7Z98bSJOA9lwzoHmXLiW1t6jkRwAZd1pDwlg+xnfanCiafz5yzOPdYAPv60t+CKGviv
	3WpsU0Z4xHE5a+nOlk1I1ceoyejPT/pj75HAK1fQmeI2Wj3IsyRV2yp4YdponSM9qH73
	VwZw==
X-Gm-Message-State: AMke39l9Kzazjq+ykS7mBhKlEK/sOK2MG2J+nyioUPTe3rf0pBaWuowchH2mjq//MUzjv2/m
X-Received: by 10.107.10.159 with SMTP id 31mr1604661iok.94.1488284879860;
	Tue, 28 Feb 2017 04:27:59 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D654.dip0.t-ipconnect.de. [93.232.214.84])
	by smtp.gmail.com with ESMTPSA id
	r184sm3846027ita.14.2017.02.28.04.27.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 04:27:58 -0800 (PST)
Message-ID: <1488284875.7785.41.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 28 Feb 2017 13:27:55 +0100
In-Reply-To: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
References: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to *securely* do a remote install of an OE image?
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
X-List-Received-Date: Tue, 28 Feb 2017 12:27:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-28 at 05:28 -0500, Robert P. J. Day wrote:
>   my immediate reaction was to use SSH keys, where the
> newly-installed system would require SSH logins, and would have to
> match the corresponding private key.

That would also be my preferred approach.

>   as an alternative, perhaps don't worry about such a situation, but
> when the authorized user logs in for what is *supposed* to be the
> first time, it will be flagged that someone else has already logged in
> earlier, and a warning will be printed, "Previous login to root
> detected, you have been compromised, please re-install!"

Or, along the same lines, set an empty root password and force the user
to set a password on the first login. There are ways to do that with
PAM, but I don't have anything at hand.

>   i'm sure there are plenty of ways of doing this, anyone have any
> pointers?

For ssh keys, there's rootfsdebugfiles.bbclass. In local.conf:

INHERIT += "rootfsdebugfiles"
ROOTFS_DEBUG_FILES += "/home/pohly/.ssh/id_rsa.pub ${IMAGE_ROOTFS}/home/root/.ssh/authorized_keys ;"

This copies my id_rsa.pub into authorized_keys and thus let's me log
into images that I create via ssh.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




