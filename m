Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B137571F1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 23:23:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0KNNIOo027592
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 20 Jan 2015 15:23:19 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 20 Jan 2015 15:23:18 -0800
Message-ID: <54BEE365.7050809@windriver.com>
Date: Wed, 21 Jan 2015 07:23:17 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
References: <cover.1421651378.git.liezhi.yang@windriver.com>
	<bc679bdfe35b8c0740f66a5e5f03d8ac69c59309.1421651378.git.liezhi.yang@windriver.com>
	<CADkTA4MRQ+GaDCxQNiS91=qRT4QVAk0cvupzf8TBRaHnwwXgvg@mail.gmail.com>
	<CAJTo0LazYTzaTiszo9++cgNmJca9S0G0jO7-omsqKqrS_4x4+g@mail.gmail.com>
In-Reply-To: <CAJTo0LazYTzaTiszo9++cgNmJca9S0G0jO7-omsqKqrS_4x4+g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] perf: fix for rebuilding
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
X-List-Received-Date: Tue, 20 Jan 2015 23:23:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/21/2015 01:00 AM, Burton, Ross wrote:
>
> On 20 January 2015 at 16:01, Bruce Ashfield <bruce.ashfield@gmail.com
> <mailto:bruce.ashfield@gmail.com>> wrote:
>
>     The kernel source is no longer in this location .. so at a minimum the header
>     needs to be updated to log the work-shared directory .. and better, make sure
>     that this is still happening with the latest master changes.
>
>
> As I understand it the bug is stale .d files being used to add dependencies,
> which refer to stale paths instead of being re-generated.  This is why we
> encourage S!=B with deletion of B when starting builds.

Yes, you are right, sounds good, I will update the patch about 2 hours later.

// Robert

>
> Ross

