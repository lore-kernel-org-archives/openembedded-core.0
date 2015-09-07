Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id EB5D876DF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:08:26 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so86467638wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 05:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ikd5U/J8DluGwVRDvFb+FMQbEuLztPrLy/QHT0KkntU=;
	b=AASRT5+5DBzvugeUKFDNeJ6MQlh9M7wBwXQT8bkH5wAuF4GE7vm6NzclPgjIUScc0J
	vZm+cT2VCJoZ0L+eK+PWoZEB89Df/6Xw9gdZ2aU+g+Bll7Fu1xzgmf2rY51Bq2MdRJHM
	hKi6TyTlW7WOBX2j7+n29yN8oHa6no0uTB032gM6KfKmmD/plEOl2LdQMVvuDr9zhRR0
	opHP+G8MeNqj56TMX0hSih7xz3br9kJ+KTI9FNdRRDVq9pbnLYXZnM1ciuVxyz9eNmBO
	khkuuSMFFFskl58zr6Z5+eps5Bg654F0LMz65vP6D/dWBoGOQjKiifkduo2cR8HfpihW
	oHEg==
X-Gm-Message-State: ALoCoQnYsLbpj6KyHGenMZbO8BkoWaKu9VB+SKJ2Q/EhIS40FumQewKcK2egnMcmzMdEMzAxvCTe
X-Received: by 10.180.105.196 with SMTP id go4mr30346169wib.36.1441627706304; 
	Mon, 07 Sep 2015 05:08:26 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	wo2sm19738525wjb.2.2015.09.07.05.08.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Sep 2015 05:08:25 -0700 (PDT)
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>, pb@pbcl.net
References: <55E949A4.9050805@dresearch-fe.de> <55EAD217.3010806@topic.nl>
	<55ED383E.6070005@dresearch-fe.de>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <55ED7E38.8050201@dresearch-fe.de>
Date: Mon, 7 Sep 2015 14:08:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55ED383E.6070005@dresearch-fe.de>
Subject: Re: "sub" machine types?
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
X-List-Received-Date: Mon, 07 Sep 2015 12:08:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 07.09.2015 09:09, Steffen Sledz wrote:
> On 05.09.2015 13:29, Mike Looijmans wrote:
>> ... and I think the u-boot recipe recently learned to have multiple targets, so you can build multiple bootloaders for a single machine too.
> 
> That sounds great. Can someone give a pointer to some documentation or examples for that?

Is it correct to just replace the UBOOT_MACHINE item in the machine config with something like this?

UBOOT_CONFIG ??= "sub1 sub2 sub3"
UBOOT_CONFIG[sub1] = "mymachine_sub1_config"
UBOOT_CONFIG[sub2] = "mymachine_sub2_config"
UBOOT_CONFIG[sub3] = "mymachine_sub3_config"

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

