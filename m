Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A98016E752
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 03:02:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S32NLv001546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 20:02:24 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 27 Mar 2014 20:02:23 -0700
Message-ID: <5334E63E.7010900@windriver.com>
Date: Fri, 28 Mar 2014 11:02:22 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
	<8acc674de6bd8eda29c0ff56773030698490aafa.1395906476.git.liezhi.yang@windriver.com>
	<CAMKF1sqdUwN_E4__SCGpwSmxqEKjfYY4Gk+gaySGbn4=82xAZg@mail.gmail.com>
In-Reply-To: <CAMKF1sqdUwN_E4__SCGpwSmxqEKjfYY4Gk+gaySGbn4=82xAZg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gummiboot: use objcopy from the env
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
X-List-Received-Date: Fri, 28 Mar 2014 03:02:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/28/2014 08:49 AM, Khem Raj wrote:
> On Thu, Mar 27, 2014 at 1:11 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> ++OBJCOPY ?= objcopy
>
> if it is a automake file you could also try
>
> OBJCOPY = @OBJCOPY@
>
> instead of above weak assignment.
>

Hello Khem,

I had tried that before, but it didn't work since the configure didn't
check objcopy or there was no AC_SUBST([OBJCOPY])

// Robert

>

