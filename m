Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3BF7458A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 07:42:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9O7f4NC029779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Oct 2018 00:41:56 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 24 Oct 2018 00:41:26 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <376c502d-5d87-3a9b-3f4e-6b6854379a51@windriver.com>
Date: Wed, 24 Oct 2018 15:47:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.218]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: About uninative-tarball update
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
X-List-Received-Date: Wed, 24 Oct 2018 07:42:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

We recently got the following warning when building on ubuntu 18.10.

      WARNING: Your host glibc verson (2.28) is newer than that
      in uninative (2.27). Disabling uninative so that sstate is
      not corrupted.

I checked the official uninative tarball on 
http://downloads.yoctoproject.org/releases/uninative/2.2/.
And yes it's using 2.27.

Our glibc has been updated to 2.28. Is there some plan about the 
official uninative-tarball update?

Best Regards,
Chen Qi

