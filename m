Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 73466600EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 11:16:54 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id w63so10676113oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=VCD59lYgvzbaHQDrqw6feF4QKA9VhyrvoUM2YDLxepk=;
	b=APadueUJGeYicclazS6A7hhTwa4TcPHQjmP0TY6b32bghRcZeohUd67LvpMa8Xu1rS
	80B5GKT9mwAYpK1fKNzdodiWp/8gK7i8tf1Y6Xrzil066+Kwa8A/ClgJkMRL/OqTsnDz
	oBSasBOPVmV4FxLob3OcY46nYOsaI9XnJbQ8eOqGOaKaO/ABcPUTc0VMn+whGdDtEJcW
	rMTwKVME5YeYpDNXf+AY5w5eQKb/wJkCCKwOY4TY9EKLxkG3GZPHw6A+SbfQRQk1g2Tz
	inpTZ3hsRQqzqdRKn7xtE0NQqhpkdKcslwVRCyVM/z1QCEcPKxuX0MSdpcOLRkpCZABi
	myJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=VCD59lYgvzbaHQDrqw6feF4QKA9VhyrvoUM2YDLxepk=;
	b=AdV265LgAuHsadg02XoX11P0feq3LbfggUIMuFN1g4jSGfqr/qNVK4tmV1Fr5PtyfS
	heI95C3jY5mAQy1j0qZOOzYD+e3TasXOiClSPi0u99dC5mfyrwZo9+wQwlOqAlx01E/7
	2piZ6ZYmKZj4zhL5+BtntqJfxWwh4uX5PbZf0Iiayr1lRsC0QlJPlq97m6tekH4mPxQq
	8akb8X2w25pWDOXWHSEbr9/h7EkBY5oE6NIeAKgsWqk/+4aOUQsWH7oVHF+mx1xqiDlf
	9H35F2T4CiVDgo/s8D6vAOGBQHtCb+YHvjyU+wp9k4Zyl0+yW0hsnUFV8op4ljS1ixOf
	M8xQ==
X-Gm-Message-State: AKaTC00hvU8rGRJhBz5zor7zaVX03Supp7FYnRq5IMlyMERCsZcyr6pHncoYij9vVjLTIlbO
X-Received: by 10.202.78.76 with SMTP id c73mr1290713oib.65.1479899815818;
	Wed, 23 Nov 2016 03:16:55 -0800 (PST)
Received: from pohly-mobl1 (p57A56BE1.dip0.t-ipconnect.de. [87.165.107.225])
	by smtp.gmail.com with ESMTPSA id
	e184sm10351098oig.7.2016.11.23.03.16.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 03:16:54 -0800 (PST)
Message-ID: <1479899811.31880.37.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 23 Nov 2016 12:16:51 +0100
In-Reply-To: <e1b37a8090d9fe6d93d6f68301d5c89a45a93b37.1479871728.git.liezhi.yang@windriver.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<e1b37a8090d9fe6d93d6f68301d5c89a45a93b37.1479871728.git.liezhi.yang@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Wed, 23 Nov 2016 11:16:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-11-22 at 23:49 -0800, Robert Yang wrote:
> [YOCTO #10710]
> 
> Otherwise, we can't login as root when debug-tweaks is not in
> IMAGE_FEATURES, and there is no other users to login by default, so
> there is no way to login.

Wait a second, are you really suggesting that OE-core should have a
default root password in its default configuration?

That's very bad practice and I'm against doing it this way. Having a
default password is one of the common vulnerabilities in actual devices
on the market today. OE-core should make it hard to make that mistake,
not actively introduce it.

So if you think that having a root password set (instead of empty), then
at least make it an opt-in behavior that explicitly has to be selected.
Make it an image feature so that images with and without default
password can be build in the same build configuration. Changing
base-passwd doesn't achieve that.

Even then I'm still wondering what the benefit of a well-known password
compared to no password is. Both are equally insecure, so someone who
wants to allow logins might as well go with "empty password".

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




