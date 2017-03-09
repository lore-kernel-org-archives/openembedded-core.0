Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5C31071CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 17:18:08 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g6so32670567ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 09:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=9VXpKHe3caIVvVKrAcs1x3Ifkq1dF7Fljmn9c6ezDWE=;
	b=xK4Vy6m7Vq5DbWtlHQgbh0nlhp08LPo1kK6hhjVaHgb2B21OsgHEc+jkF26QmGIDwa
	QlROaZn1gK9JplE6ADJRkLLWZiFweQemsWMosXsh8TdkCDyp5fKu+bRV/07B6SssS6X9
	+09ROrsfr6jWZdSi4uHVL5/zaJI36gE/RYOB8iy2M4Y5woOGa9bo+ne48yGgPHxlm5n3
	tWuBa1a6KCdrs6VzS8tI2kYmBkmPqLyDkVsXHF85wr2zodvklt4Sr2obrgbDln1nDMW0
	jEXluDdEtR4HhsCZhMBEarGMxV39ka4EUlP9mUgef0AwL502+dGAMlxcefcD+cGLIKbC
	l6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=9VXpKHe3caIVvVKrAcs1x3Ifkq1dF7Fljmn9c6ezDWE=;
	b=kXpD4mR69/EmhavoOaPzNQp1Cdhrv8S3I4gp1y3TONirnQMy3yZ9CpMj4z7U33OnCP
	56JDDeDYjI/BRidXJLyoe/pxJG0KnX3Q4E2+uDcVYtLcUKbs++zxhhb2uW7mszN4I2yN
	0pCcqvaQHGhlXdjlcFylGnWhvkRc2lpTsXu9jyixwKLz6Otk8DQb+QCq1CVuMpHrCJ35
	5C8aqrOv6Ra4KrJj53bGr4yvfYsm0e74+tY1Bv+4SUc6Zsi5WH63Kmxie/vRcCYsovb+
	eHpLO6yMrFyq0Kfjcy7XOfXQI8Msh8dcA23Mk3n0cBVoq0kjy13KajpTqOBiHMbkcqSb
	HpSw==
X-Gm-Message-State: AMke39nAPb+V4KKEkq05hJfcBtlEepBkJHKn0KQNkCjsCA4nxm+cpJCAcgvJMoCss0fgsZS8
X-Received: by 10.107.17.199 with SMTP id 68mr12294938ior.127.1489079890079;
	Thu, 09 Mar 2017 09:18:10 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D47C.dip0.t-ipconnect.de. [93.232.212.124])
	by smtp.gmail.com with ESMTPSA id y7sm9372552itc.27.2017.03.09.09.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Mar 2017 09:18:07 -0800 (PST)
Message-ID: <1489079885.7785.371.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?Jos=E9?= Bollo <jobol@nonadev.net>
Date: Thu, 09 Mar 2017 18:18:05 +0100
In-Reply-To: <20170309174815.056bc5a2@d-jobol.iot.bzh>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: =?ISO-8859-1?Q?Jos=E9?= Bollo <jose.bollo@iot.bzh>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Thu, 09 Mar 2017 17:18:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-09 at 17:48 +0100, José Bollo wrote:
> On Thu, 09 Mar 2017 17:07:54 +0100
> Patrick Ohly <patrick.ohly@intel.com> wrote:
> > Can't you reorder and rebase the patches so that this
> > 0001-useradd.c-create-parent-directories-when-necessary.patch applies
> > on top of the patch which was submitted upstream?
> 
> I agree that it would be better to reorder. Better but less
> conservative because an existing patch must be upgraded.

If upstream merges the proposed patch, then rebasing will be inevitable
at some point, so we might as well do the cleaner solution now, even if
the diff becomes larger.

> > "devtool modify shadow-native" might be useful for that. "git rebase
> > -i" in workspace/sources/shadow-native", then finish with "devtool
> > update-recipe shadow-native". I haven't tried whether "update-recipe"
> > handles re-ordering patches. If it doesn't, just fix it manually.
> 
> I'll do and propose the new version soon.

Thanks!

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




