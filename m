Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2515B609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 08:52:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t088pv4o025519
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 8 Jan 2015 00:51:57 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 00:51:57 -0800
Message-ID: <54AE4520.6020603@windriver.com>
Date: Thu, 8 Jan 2015 16:51:44 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
References: <cover.1417759913.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1417759913.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH V2 0/1] fix archiver missing tasks between do_unpack and do_patch
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
X-List-Received-Date: Thu, 08 Jan 2015 08:52:11 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2014 02:16 PM, Hongxu Jia wrote:
> Changed in V2:
> As Richard Purdie suggested, use 'BB_TASKDEPDATA' to instead
> of bitbake internal variable '_task_deps'.

Ping

//Hongxu


> //Hongxu
>
>
> The following changes since commit b8631416f12b8a904ce3deb036f9d5ce632937b0:
>
>    package_regex.inc: Update REGEX'es in order to find upstream versions correctly (2014-11-28 14:03:02 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-archiver
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-archiver
>
> Hongxu Jia (1):
>    archiver: execute the probable tasks between do_unpack and do_patch
>
>   meta/classes/archiver.bbclass | 119 +++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 112 insertions(+), 7 deletions(-)
>


