Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SA0r3-00046D-12
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 16:20:09 +0100
Received: by wera1 with SMTP id a1so137222wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 08:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=8rC9WPFRo7XukpkAIEMOMfbF7hz4VIwsRFGXosCY0GI=;
	b=iObB8jwbs8xfztb3FFJn6Ts85M7OxDSP3goFZREGxt49gjY2DX+kS9cmYDSGTdh3y4
	bE6q1mB+ZYQ/nvQc1M/qDZeaNgFOWcoHgEYra1XKwHxo1jNN5i9z4dqjrZr+UE1hT0Kr
	51m78vrcwjHGAPzGvaQKewPkMkPolsGFTFzM8BBOZogwwiweVQTtQ+DXwsXEIjdr0Ma0
	A1damPlWFXvroXwYYRddlh4iQNNJe6GuiYcZHpMfNfGRY5qqYwlF/++rzfUQhJM0PS9O
	tcEdqJcpm33gi5Z9bpD71k1nSEPHHJxOdLGbcel4XiPpuTMhVXgS3byGSBXEShwHlRkm
	GLLw==
Received: by 10.216.138.135 with SMTP id a7mr158101wej.19.1332256276464;
	Tue, 20 Mar 2012 08:11:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm7681468wib.0.2012.03.20.08.11.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 08:11:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F689BD8.4040201@linux.intel.com>
Date: Tue, 20 Mar 2012 16:11:12 +0100
Message-Id: <AE26A546-7EFB-4EB6-B3F1-398A6B291444@dominion.thruhere.net>
References: <1332202974-27977-1-git-send-email-denis@denix.org>
	<4F689BD8.4040201@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlOvndYtbTPcoUOKOfDCssEbcWlvZ1XbIrbyNs4sbihJXagxQJYsXiFTknlBhsSIAzCoMOV
Subject: Re: [PATCH] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 15:20:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 20 mrt. 2012, om 16:01 heeft Darren Hart het volgende geschreven:

> 
> 
> On 03/19/2012 05:22 PM, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>> 
>> Replace dependency on eglibc with virtual/libc
>> Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
>> 
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> Thanks Denys,
> 
> Looking through the rt-tests sources I don't see TARGET_CC_ARCH
> anywhere. Have you confirmed that changes made there make their way into
> the actual build?

TARGET_CC_ARCH is an OE thing, it's is what ends up in $CC.

regards,

Koen


