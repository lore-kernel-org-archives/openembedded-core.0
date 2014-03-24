Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 194926E9D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 08:15:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2O8FUbS008694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Mar 2014 01:15:30 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 24 Mar 2014 01:15:30 -0700
Message-ID: <532FE99A.7070200@windriver.com>
Date: Mon, 24 Mar 2014 16:15:22 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1395646642.git.hongxu.jia@windriver.com>
	<9c06686dc4ccc2576bd8a171ed685ab00eecf84c.1395646642.git.hongxu.jia@windriver.com>
	<CAJTo0LZEQzZYt+G=3OyzKLdceXeKZ2dHD2gDOVEJBD+yhiAc6g@mail.gmail.com>
In-Reply-To: <CAJTo0LZEQzZYt+G=3OyzKLdceXeKZ2dHD2gDOVEJBD+yhiAc6g@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsoup-2.4: upgrade to 2.45.92
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
X-List-Received-Date: Mon, 24 Mar 2014 08:15:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2014 04:09 PM, Burton, Ross wrote:
> On 24 March 2014 07:40, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> There was a error about mips-gcc optimization while building
>> libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled, the 2.45.92
>> have fixed this issue.
> .92 means "beta release" in GNOME versioning, so not only is this a
> new upstream release (when we've frozen) but it's also not a stable
> release.  Please backport the patch instead of upgrading.

OK, I will backport to 2.45.3

//Hongxu

>
> Ross


