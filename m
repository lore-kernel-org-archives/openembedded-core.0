Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 06F7677FF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 20:42:00 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id m84so22636394ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=iocHfPU3K8WXMuP2K67pCi3eJHcV8nsIKiW5sbFYrEE=;
	b=UBPiyKfjIXpP0jp32pL8FUARrpt1Lv/xQEIGaNuljeHJRPYL49xINIth63UA5aE0MN
	i9TUAQGWEiFonpqktCvEBVY3NEtrFd6N7LqQpbNwZcJ17r4oqnOXAtSibdB/yRH6XDHH
	Ps2qBi8qo8oGqqslmlqGBJb5JMuw8ghUOAnv0cRSSMXqgPFl7vfbPoEmbABmtu8cRX6+
	n0p9igqF3I26i5p7GalaMQrAhmM0Pzq9yQIoxTv6Y9oFwBLXUhwuioXmBTQzOoaza/54
	Nr9bUuuXXhWIwYx7+76zz7Fr6AiLzh55EL26HFfx5fPL19bPqVxATNICRzWmoL2P5JEl
	u6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=iocHfPU3K8WXMuP2K67pCi3eJHcV8nsIKiW5sbFYrEE=;
	b=Bt9pPU9/zmOoqq9vHeV7rdqaj1y7/hNZX4tzqzxpHhFdjLUlY6uZgKZtDGAnaUk0wB
	TVJ0EMweBaMKujavyEf/K+gUL0BGm1WaeUzstSqwCH7S2n99jp337r3s+xecwzuOmeUo
	3fPxdnj17fxA24KO5gxizPJEs74on+qXH5GSiniwx5wEJtQoyseIPJ7lpoQ7osf4dqfe
	Gsemd4JEmFQSx9rToF1hbEx6CG1gO8gjoOV4AY8h76YTbCmWOC9uJf9v9RZX+rYkIIiM
	1dYOguPvWhCLevot6yp/gKIlAntO6xjPf7GiTHLDgdkqTsP/hNvqxDGvo+Q9JtzByhl7
	OJtw==
X-Gm-Message-State: AKS2vOw6wsodgk9MG6VlhJmyHuHh6o9GMBDqULKoOnW9sy80vRJwunbF
	MYwxJ8H8QQ8UIuEY
X-Received: by 10.36.222.194 with SMTP id d185mr4361586itg.111.1498596122015; 
	Tue, 27 Jun 2017 13:42:02 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id b6sm139668ioj.31.2017.06.27.13.42.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 13:42:01 -0700 (PDT)
Message-ID: <1498596118.7464.80.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Tue, 27 Jun 2017 22:41:58 +0200
In-Reply-To: <20170627202512.32631-1-anibal.limon@linux.intel.com>
References: <20170627202512.32631-1-anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 1/2] oeqa/selftest/{context, case}: Handle KeyboardInterrupt/SIGINT and SIGTERM
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
X-List-Received-Date: Tue, 27 Jun 2017 20:42:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-27 at 15:25 -0500, Aníbal Limón wrote:
> In order to avoid corrupt local.conf and bblayers.conf adds
> signal handler for SIGTERM and use try/finally (KeyboardIntrrupt) block
> to restore previously backuped configuration.

Looks good to me now, with one minor nitpick which I should have noticed
earlier: the second patch fixes a problem introduced by the first one
(right?), so when applied in this order, bisecting gets broken. I think
they should be merged the other way around to avoid that (calling the
parent's setUpClass was fine before, it just wasn't required).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




