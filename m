Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB55670295
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 01:31:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s691Vl0A005853
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 18:31:47 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 8 Jul 2014 18:31:46 -0700
Message-ID: <53BC9B79.8060708@windriver.com>
Date: Wed, 9 Jul 2014 09:31:37 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
	<CAJTo0Lbsf6fw=rg3mQv7CqJ+Apmxd2X6W=srNf6dNer_5VZqNQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lbsf6fw=rg3mQv7CqJ+Apmxd2X6W=srNf6dNer_5VZqNQ@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] support xmlto
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
X-List-Received-Date: Wed, 09 Jul 2014 01:31:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2014 05:33 AM, Burton, Ross wrote:
> As such this is definitely a two-part series.  Adding xmlto is useful
> and I'm genuinely happy that someone who wasn't me managed to get
> docbook-xsl working;)  as that's the blocker for gtk-doc support too.
> However rnabling xmlto in some recipes globally isn't the right thing
> to do and will introduce noticeable regressions in build time for many
> classes of users for no reason.

Got it, I will send V2 without enable xmlto in some recipes.

//Hongxu

