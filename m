Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 465AD71AD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 07:10:16 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id m27so2950652iti.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 23:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=1+6RrzBTFhkYeqVqIJueBX/ixCy92oofdVwcy7TZEFE=;
	b=DN6yHDGPRcix+1Rl5qqnaUzq3LRltZPfv1cWwgs+7fg4JY5vyAOax1tU7bei8NPkdm
	7QPiQcB7XZGSKjk0os4O1/WCaKoUkKJK6mu6VGoa+zmaxetn5MUj+ynBHOZVRff4JDub
	l6Z/C7AgaDBrGCmhQExka1MAFN91vpkC8Z38TFCmP8rpmBOhhFmYiBwM+lVe+rAjkZph
	24sjLYvCNk8uQOEcuVJ75DPF+1LfrmnpMBZOykMxIdjKbbqjw88VChCDdBbK4OAUQ0Ct
	RV9PSFPCo9/bNTHS3nTF7nKjcSqr94+U6tuJ7e8bfl+BxCvOQuZ04GV6gmDz9hBDV4+4
	P7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=1+6RrzBTFhkYeqVqIJueBX/ixCy92oofdVwcy7TZEFE=;
	b=b7WnTbbo496lr0ocxBNew3dhxC7j3DqTROpPeWsZNLmhbgmz3kBrrPWcTGjVMydwU4
	C8ZFwkozJBINWzFJYp/KKtQszwAM9yw2Rn13wT5/6AYGcEH9lDBzaJdCnEDqHix6OYta
	DL/DHNb4m7M+0N+xk4Q5LmbR2hgoY0p8bMnaOyVUgo/1IF0KkGOuS8QPHzesJWHnWX04
	oK3m7zSVdx49E4MZqyuB0L9o5n3SmOj+T9xjIO/+fa6+7MEsw0rSsWlQNcogSDzoCzao
	ujDgGR4aqZJHOe+r9JydFFir4wuuany/ZbV1Mv66owj5tEdePdfsUKIRcOFIjT0GVu/C
	A4Pg==
X-Gm-Message-State: AFeK/H1YdtkGOWU41upnluN4S5SECk95cFF0wfw5CZt9tUaO+L50VXPs8Bikxhf8D4zLV8lb
X-Received: by 10.36.138.129 with SMTP id v123mr741213itd.108.1489129818094;
	Thu, 09 Mar 2017 23:10:18 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DCF9.dip0.t-ipconnect.de. [93.232.220.249])
	by smtp.gmail.com with ESMTPSA id
	r10sm4055991iod.33.2017.03.09.23.10.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Mar 2017 23:10:17 -0800 (PST)
Message-ID: <1489129813.7785.380.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Denys Zagorui <denys.zagorui@gmail.com>
Date: Fri, 10 Mar 2017 08:10:13 +0100
In-Reply-To: <1489092518-25721-1-git-send-email-denys.zagorui@gmail.com>
References: <1489092518-25721-1-git-send-email-denys.zagorui@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gzip: add ptest
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
X-List-Received-Date: Fri, 10 Mar 2017 07:10:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-03-09 at 22:48 +0200, Denys Zagorui wrote:
> tests don't work with 'diff' and 'less' utils from busybox

I don't think that depending on diff and less is the right solution for
that problem, because then enabling testing will change the system that
is meant to be tested.

For example, suppose that the real system only has busybox and busybox
diff needs to work. That version of diff cannot be tested anymore with
IMAGE_FEATURES += "ptest-pkgs" because that will pull in gzip-ptest,
which then overrides the busybox diff.

Perhaps the tests can be fixed to work also with busybox, or the tests
can detect busybox and skip the part that depends on real diff and less?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




