Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UB10C-0001Bd-IU
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 11:46:18 +0100
Received: by mail-wg0-f52.google.com with SMTP id 12so1311638wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 02:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:cc:message-id:in-reply-to:references
	:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=mL71IlGKXxcarevhqZDHtFmDGs8Elk/6SkWmTOS3Vww=;
	b=U6OL544cKssmYpaIL5r++Urty0MQdhthWGaho7dTJChn7YzE9+HPDCrwLGCGwyEzZ/
	8RGulIVJHhJiYu8jL142kuY/pFOft+gVFI8jaGxO1Z5kU1bZwXUf4fykEv7HoyPCiSlN
	mTRQ861UNjpXuiG665gubxe1CAx2+hX078RbhD/xBv5StqyYPF4Zj6P3UtxFn0Ii4SNs
	0iXJMc7fyaX2wN9Q1Y6TBZn6PEwfjmXL1Z4mhc3F5oMi0gqsEuJcrRu58WovrNfUUqRE
	sMLAJLh/3twnWh8o4XYv96RsxvYEBhxOHOWD4wU05tGSd0esEPOLUiHmp5ZfqO6RX8eO
	Be2w==
X-Received: by 10.180.109.82 with SMTP id hq18mr9625735wib.0.1362047394279;
	Thu, 28 Feb 2013 02:29:54 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id n2sm32443076wiy.6.2013.02.28.02.29.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 02:29:53 -0800 (PST)
Date: Thu, 28 Feb 2013 10:29:51 +0000
From: Ross Burton <ross.burton@intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Message-ID: <2374776677EC48E48A48439BC769A2F9@intel.com>
In-Reply-To: <CAGiJk9cKru6BD3oQmfb+J1WE-f3-K+pvbdi2HkjKS3-3_4=ciw@mail.gmail.com>
References: <CAGiJk9drhuVo1AfCsHEc3jbevtzaYcONQwHQ2qfE=HuJjUCbSw@mail.gmail.com>
	<CAJTo0Lbnt78ssmdTmTh2CoFfDMHq_SpoV9qYEX+2kPod4EW9Jg@mail.gmail.com>
	<1361990771.1809.16.camel@rrMBP>
	<CAGiJk9cKru6BD3oQmfb+J1WE-f3-K+pvbdi2HkjKS3-3_4=ciw@mail.gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkDbHEv2UxxJ+0DjEnOcUkHSLjdLFdTVHhbcJQdYAxtvFplSti34vYVYBTCsVj1pK52ZmeJ
Cc: Koen Kooi <koen@dominion.thruhere.net>, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: gst-plugins-bad and EXTRA_OECONF
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 10:46:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday, 28 February 2013 at 07:20, Samuel Stirtzel wrote:
> Seems like I missed the missing "--disable-sdl",
> should I send a patch that adds libsdl to the DEPENDS of this
> .bbappend? Or would you prefer a "--disable-sdl" here?
> 
> This issue was a bit irritating, since I built the same image for some
> time now and suddenly it breaks without any changes in the related .bb
> or .bbappend...


This is why I've had reworking the GStreamer plugin configuration on my todo list for a while.  Something along the lines of massive use of PACKAGECONFIG should make this sort of problem disappear.

Ross


