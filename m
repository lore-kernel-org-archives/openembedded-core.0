Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E17F73C8C;
	Wed,  6 May 2015 15:43:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t46FhLje005017
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 May 2015 08:43:21 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 6 May 2015 08:43:20 -0700
Message-ID: <554A3697.5050208@windriver.com>
Date: Wed, 6 May 2015 11:43:19 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <rongqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, <Mark.Hatle@windriver.com>
References: <1430810046-27021-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1430810046-27021-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 1/1] apt: upgrade to 1.0.9.9
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
X-List-Received-Date: Wed, 06 May 2015 15:43:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-05 03:14 AM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Upgrade to fix the several CVEs: CVE-2014-0488, CVE-2014-0490
> Remove apt-0.9.9.4-CVE-2014-0478.patch, which was backport.
> Romve no-ko-translation.patch, apt-1.0.9.9 has ko translation
s/Romve/Remove/
> Update use-host.patch no-curl.patch db_linking_hack.patch and
> noconfigure.patch
> Not build the test cases since it requires gtest

meta-oe has gtest:
    http://layers.openembedded.org/layerindex/recipe/31721/

Is there any reason not to move it and gmock to oe-core?
It has no dependencies and it's used by:
    llvm, google-protocol buffers, opencv, google-chrome
and probably other packages.

I think Mark mentioned that llvm might move to oe-core as
well so that would be two recipes that benefit from moving gtest.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

