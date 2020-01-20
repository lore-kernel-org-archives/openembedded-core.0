Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E16B17FCDF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 18:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 00KIJdAD029089
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 20 Jan 2020 10:19:39 -0800 (PST)
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 20 Jan 2020 10:19:39 -0800
References: <875zh6f6vm.fsf@windriver.com>
	<CANNYZj-nAT1oWq9nyPSGYWk1pVg1Q00rnMX08FmiEhXr2n-+ZA@mail.gmail.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
In-Reply-To: <CANNYZj-nAT1oWq9nyPSGYWk1pVg1Q00rnMX08FmiEhXr2n-+ZA@mail.gmail.com>
Date: Mon, 20 Jan 2020 13:19:31 -0500
Message-ID: <87muaic7nw.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: skip unit tests to avoid Makefile errors
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
X-List-Received-Date: Mon, 20 Jan 2020 18:19:40 -0000
Content-Type: text/plain


> I think I have a better patch for this:
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=c2fc852501414b06e6587d97d3bc944a4650906e
>
> Rather than hardcode upstream-specific targets, my patch uses a variable that upstream uses to skip the tests.

Sounds good, your patch should be merged instead. I do not see that there is already a patch available.

    Matthew

