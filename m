Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDE11608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 17:06:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4QH6CGT029001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 26 May 2016 10:06:12 -0700
Received: from server.local (128.224.20.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 May 2016 10:06:12 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1464276666.git.bruce.ashfield@windriver.com>
	<CAJTo0LYrq-TnfMbD-1_u-F56Xiq7pW-SRQv++Vo4-OzHcb355Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <7a490625-a393-ac7a-b6eb-1558d7ae961f@windriver.com>
Date: Thu, 26 May 2016 13:06:11 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYrq-TnfMbD-1_u-F56Xiq7pW-SRQv++Vo4-OzHcb355Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Tom Zanussi <tom.zanussi@intel.com>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 0/2] linux-yocto: intel staging and bxt backports
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
X-List-Received-Date: Thu, 26 May 2016 17:06:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-26 12:34 PM, Burton, Ross wrote:
>
> On 26 May 2016 at 16:36, Bruce Ashfield <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     We have a couple of patches to integrate broxton backports, and to
>     create some intel staging branches.
>
>
> With qemux86-64:
>
> WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0
> do_patch: After meta data application, the kernel tree branch is
> standard/intel.
> WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0
> do_patch: The SRC_URI specified branch standard/base.
> WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
> WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0
> do_patch: The branch will be forced to standard/base, but this means the
> board meta data
> WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0
> do_patch: (.scc files) do not match the SRC_URI specification.
> WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0 do_patch:
> WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0
> do_patch: The meta data and branch standard/base should be inspected to
> ensure the proper
> WARNING: linux-yocto-4.4.11+gitAUTOINC+1465ac389f_53e84104c5-r0
> do_patch: kernel is being built.

I'm going over some options with Tom, I'll follow up with a patch
to stack on top that removes the warnings. We are still building the
right thing, but the sanity checks are clearly working :D

Bruce

>
> Ross


