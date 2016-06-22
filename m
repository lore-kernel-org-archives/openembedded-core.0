Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBD1608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 18:24:27 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id u64so73450368vkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FutbgwB2wffWpt+Buu+0i00Ue2lS2zp3UA9cnDuS3zo=;
	b=InItvODVq8fmnlFylhrjbL5dDw3CGrsUX2rZVmEt8Hp7HAtEkBdPUBcmhYedpBuGJc
	G7l7kUWv7cRjin42BIPk1YZ+MW+Ibkvk+91isT1s9TkpvtMfObsSb3AD/3mibhZ6jjc9
	bmN7jAeg5s8Kfn1bH2ClfnSyDSXPTKv4tktmRmei1DJ2L+7okU6VNkv2Ec2vzlq4iAjJ
	i1Xshhx/xTVQOGriQMEl+0OSF1uwqM9shickwh7SUe029Tpo0QWrp1Ans8l6Qky2TfWH
	WCo6I2uU12e1DPCF1MqeDz0Vzi6R8o2PHYzrHGhJos8q2+WE2boZdVr8aBDTXNfBGV1I
	iNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FutbgwB2wffWpt+Buu+0i00Ue2lS2zp3UA9cnDuS3zo=;
	b=d8H+DAG7bSSA23mQ17K/D7ThpKTwDBEqUCaW1ebJ5Tu8YEZnqQnctG7u5Mos9YqSW0
	YD2ARz+YXcC/kVyqsN5DbsTa7+kuLK7F6r8yB4enjhHcHK8mD9bFy6MO5AHBy39amqJp
	x6mxn1r+/TJeKOg/9Pw1N1L59YDjsZcLF5Y3tS+VFtxwMqgxsN6IMjHoLAs+3GnM/CtH
	o26zQ0fwCwOvbVzvYLM6ZhowkZ8AiKVFJ02oQ2Dw0I85Fzm08+xQ48N6gmvtgA9k21WX
	9We1HOHRGh7AB+lr4gasjvER4TOXy7vUIXKCofFzoWmEZ1bFvjfbQfkzZo096PgwWOfa
	8v0Q==
X-Gm-Message-State: ALyK8tKJbYZgFHwRQ6i2cDWBFtnlJJ4b5MHqhWf3Ddq6WDV7bM8mcqPKF0iUWgWPeritIE6Jcl69zUYoryyEYw==
X-Received: by 10.31.56.216 with SMTP id f207mr13046257vka.135.1466619867863; 
	Wed, 22 Jun 2016 11:24:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.3.72 with HTTP; Wed, 22 Jun 2016 11:24:27 -0700 (PDT)
In-Reply-To: <e12014df714d835b217acfbfbcfc1b5d1b4408db.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
	<cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
	<e12014df714d835b217acfbfbcfc1b5d1b4408db.1465891164.git.jussi.kukkonen@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 22 Jun 2016 20:24:27 +0200
Message-ID: <CALbNGRRsxRZompgFMb+EtLdSXdnCZbUgXFmuf8WC8rztncox5w@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 10/30] vte: Upgrade to 0.44.1
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
X-List-Received-Date: Wed, 22 Jun 2016 18:24:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 14, 2016 at 10:14 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> * License change LGPL 2.0 -> LGPL 2.1+
> * vte-termcap is no more
> * API break: current version seems to be parallel installable
Could we move vte to meta-oe to avoid further world blacklisting?

Andreas

