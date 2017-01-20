Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id A173A731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:37:14 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id 203so20085908ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gPgAPw3fwNm5zmecA2t3Qx6u3YDGtRVZalE9YEUfbEo=;
	b=ZeqXCooRQQNCMcV7Y5ZApkD0i3YnQ1PC03zDiTPJFERke/zxI5HvXihqtc/IuUcSzc
	NpzxV9t2JH+uD6F1nXSvgEDonNn73aJ4If7bJAYSmqjO8OYYF7TyUzsfT5737ulcRn8Y
	EFNxwJsNZB6COvJt8Am0CVX3jFjMOf/NzuJ9A+6+XYUg/IHkuo5DaUT+1qhgYs6Iv48y
	thfDjJZVMj6pp+qRcXtCntycEjFznR+qjJ5F8K284LZkOQH0CYgPVaB9aHc35kMNJu7i
	hbxO0T5Uukmi0BeC1AK6nxei57dHQx1fIl7iv0IBcg1IeoG2TZRXQtzT6Odud3TfSTED
	06tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gPgAPw3fwNm5zmecA2t3Qx6u3YDGtRVZalE9YEUfbEo=;
	b=eyV1/R6dkzm6kshYuzL2LiFn+7PMv4ggmK+0idLmjPNtvZ1eeiwFrst10oJ85lh33J
	xcP85JLfGDo9sg/IqsBkT2BRdukuLODAsGkJvPFrJesHXYmWmg1HHnOmj0MAX9FH0r+b
	C8owCbwlPZzj+SvPV/+F6IputM3xk37cls+0/KFZ6y2NqgJ4B1cVExjil2NHcxZTA2eG
	yE+s4+zRM478vObCIz+RhzTa7cxYGS7j8qlFY/8sONdC1BXAr2lMHWk2Yz8vae2eULJa
	B/AzS3sxCVzSp3o0utY+EbvB9lqeT2YW0dwHgR1hcxiFyROby98SLi5wM8pTnu2HfZVy
	cD/g==
X-Gm-Message-State: AIkVDXKMh7wtaE0PBxFwqMAKB/V+cYfTKZASHTnPdqcJJ1yKcFMyOP5jSduwIzLV3CoAAj6e
X-Received: by 10.107.10.156 with SMTP id 28mr13446163iok.18.1484919434307;
	Fri, 20 Jan 2017 05:37:14 -0800 (PST)
Received: from pohly-mobl1 (p57A56DD5.dip0.t-ipconnect.de. [87.165.109.213])
	by smtp.gmail.com with ESMTPSA id
	g186sm1347983itb.21.2017.01.20.05.37.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 05:37:13 -0800 (PST)
Message-ID: <1484919430.23233.118.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 20 Jan 2017 14:37:10 +0100
In-Reply-To: <1484846629.23233.83.camel@intel.com>
References: <1483977580-11236-1-git-send-email-ross.burton@intel.com>
	<1484846629.23233.83.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: upgrade to 2.6.2
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
X-List-Received-Date: Fri, 20 Jan 2017 13:37:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-01-19 at 18:23 +0100, Patrick Ohly wrote:
> Perhaps someone with more knowledge about flex can provide some
> guidance?
> 
> Fathi, is that something that you or upstream have come across?

After looking into this some more I've come to the conclusion that this
looks like a bug in flex, so I have filed
https://github.com/westes/flex/issues/164

I also have a workaround for acpica, which I am going to add to V3 of
the UEFI/OVMF patch series.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




