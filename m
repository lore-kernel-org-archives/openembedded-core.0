Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id DB00375F24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 12:34:35 +0000 (UTC)
Received: by igvi1 with SMTP id i1so34074393igv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 05:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=KWUBgZe2POYXGhibG2hFCG/YEYG1TzkuQlrnnlcm99g=;
	b=iOCpn9m8E8AL01mR0vfVYPROeZJwqJKZVciVgPNAmobnBrJ4A9Th9w+CEJkcPux7qP
	5BA9qfR3PoVlx8ROrmgT935rauaYrpjoQlJtQBp/IusHGxVKPjBOBq/USNanrMAZxrtw
	YoofifHvTkefxBzxCKnUFuvXsSXzsOQuTocP9JmaxgFgjnEPYKMy/NcWuhXI8o9fDkxn
	VuFqCBUBNeMXafBM8pCtI0jP47qkTzKJ2DTkDaZeV1s/UcU9aFfS6oub9OLNv4GZuzj4
	6poS1sE/tjG3317IdVG4YdGVW1OtEEMaPEyJ6v0xYV/osRLtBPb/AXYEux51XK18Ladi
	Go7g==
X-Gm-Message-State: ALoCoQlh46QSr7IkK2WO2+I8I2M/OwPHY3ybg5Shm4ywcNosDU5YiKIBTelvHOUzZSu4OSwbvua3
X-Received: by 10.107.167.2 with SMTP id q2mr20346959ioe.109.1437136475526;
	Fri, 17 Jul 2015 05:34:35 -0700 (PDT)
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com.
	[209.85.223.178])
	by smtp.gmail.com with ESMTPSA id ns7sm3677178igb.0.2015.07.17.05.34.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jul 2015 05:34:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ietj16 with SMTP id j16so76022955iet.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 05:34:33 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.4.6 with SMTP id 6mr17741513ioe.49.1437136473373; Fri,
	17 Jul 2015 05:34:33 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 17 Jul 2015 05:34:33 -0700 (PDT)
In-Reply-To: <CAJTo0LbRHRc-5cP1_XUT_VfEmt6AAPcdt37DyfiV=r7=rn1Y-Q@mail.gmail.com>
References: <1436928233-11337-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbRHRc-5cP1_XUT_VfEmt6AAPcdt37DyfiV=r7=rn1Y-Q@mail.gmail.com>
Date: Fri, 17 Jul 2015 09:34:33 -0300
Message-ID: <CAP9ODKpv5S4b-8MWGLU422fVhzM=w1hTAiiKorTMr+z9T1BBbQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2015.07 release
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
X-List-Received-Date: Fri, 17 Jul 2015 12:34:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 17, 2015 at 8:42 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Otavio,
>
> On 15 July 2015 at 03:43, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> -LIC_FILES_CHKSUM =
>> "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
>> +LIC_FILES_CHKSUM =
>> "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
>
>
> Remember to explain why the license checksums have changed.

I sent a v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

