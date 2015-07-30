Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0961776398
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:09:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6U799KN027610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 00:09:09 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 00:08:50 -0700
Message-ID: <55B9CD93.1000902@windriver.com>
Date: Thu, 30 Jul 2015 15:09:07 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Olof Johansson <olof.johansson@axis.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
References: <cover.1438161068.git.liezhi.yang@windriver.com>	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>	<55B8A89A.6050406@windriver.com>
	<1438170429-sup-8609@axis.com>	<CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
	<1438239812-sup-93@axis.com>
In-Reply-To: <1438239812-sup-93@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Thu, 30 Jul 2015 07:09:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/30/2015 03:04 PM, Olof Johansson wrote:
> Excerpts from Otavio Salvador's message of 2015-07-29 18:27:32 +0200:
>> It allows for people to add local mirrors for example and even remap
>> fetching without touching the recipes. It is a good addition IMO.
>
> Can't you use PREMIRRORS for that?
>

PREMIRRORS is for all the recipes/protocols ? I think that another benefit
is we can uniform github's SRC_URI ?

// Robert

