Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D07426025E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 11:41:43 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 02 Oct 2017 04:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,469,1500966000"; d="scan'208";a="158331084"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 04:41:43 -0700
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
References: <1506920927-1938-1-git-send-email-liu.ming50@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e2c0777f-af1f-d7d9-ebe3-816f4d6059a2@linux.intel.com>
Date: Mon, 2 Oct 2017 14:37:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506920927-1938-1-git-send-email-liu.ming50@gmail.com>
Subject: Re: [PATCH] libsolv: fix a kernel-devsrc installation issue
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
X-List-Received-Date: Mon, 02 Oct 2017 11:41:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/02/2017 08:08 AM, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> This patch aims to fix a kernel-devsrc rpm installation failure on
> target, I had sent the patch to libsolv upstream, but its maintainers
> rejected it with the reason:
> ...
> we probably want to sync these values with RPM code...
> ...
> 
> I am not a rpm expert, would somebody please comment on this? Is this a
> issue also should be addressed in rpm?

Note that they did not reject the pull request, but merely commented on 
it; it is still open.

What the upstream probably meant is that rpm could also be defining 
these values somewhere, and so instead of just re-defining them blindly 
to arbitrary values in libsolv, you should take them from rpm header 
files, or otherwise figure out how the header limits are handled in rpm.

Alex

