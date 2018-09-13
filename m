Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6857796F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 15:49:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8DFmWED003282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Sep 2018 08:48:58 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 13 Sep 2018 08:48:38 -0700
To: "Hongzhi, Song" <hongzhi.song@windriver.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>, Richard
	Purdie <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1523948623-176242-1-git-send-email-hongzhi.song@windriver.com>
	<8f1e2332-a625-7720-c5dc-0f0e6d9a5d27@windriver.com>
	<14818289-63c3-8bdf-00fa-1dbd73449053@windriver.com>
	<87690252-b0e8-5b82-e56f-98dad4dd3658@windriver.com>
	<81f661d8-1abd-a6c8-b70d-f83037a4aa61@windriver.com>
	<d967e85a-6fe3-daa0-e28b-0a461c50cbd6@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6708e033-c637-4749-672d-329d2c549919@windriver.com>
Date: Thu, 13 Sep 2018 11:48:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d967e85a-6fe3-daa0-e28b-0a461c50cbd6@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH v3] udev-extraconf: Add systemd-mount to udev-extraconf/mount.sh
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
X-List-Received-Date: Thu, 13 Sep 2018 15:49:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/24/2018 09:26 PM, Hongzhi, Song wrote:
> ping..

This commit is still in patchworks:
    https://patchwork.openembedded.org/patch/150168/

and still applies on master:
325af0f4a8 (origin/master, origin/HEAD)
            python3: fix openssl 1.1.1 changes
and on master-next at:
ed2d91a72e (origin/master-next)
            oeqa/selftest/recipetool: fix non-determinism in cmake test

It's an M3 Medium+ bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12644

We've applied it locally and
it passed a verification test.

-- 
# Randy MacLeod
# Wind River Linux

