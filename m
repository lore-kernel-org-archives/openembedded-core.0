Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEF977154
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 21:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u35L57qo023411; Tue, 5 Apr 2016 22:05:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HMDGV5RxwiHF; Tue,  5 Apr 2016 22:05:07 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u35L55vF023408
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 5 Apr 2016 22:05:06 +0100
Message-ID: <1459890305.7348.171.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Apr 2016 22:05:05 +0100
In-Reply-To: <1459878277-9734-1-git-send-email-maxin.john@intel.com>
References: <1459878277-9734-1-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v3] useradd.bbclass: remove user/group created by the package in clean* task
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
X-List-Received-Date: Tue, 05 Apr 2016 21:05:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-04-05 at 20:44 +0300, Maxin B. John wrote:
> At present, if a recipe is built which creates users/groups via
> useradd.bbclass, those users/groups are not removed from sysroot
> when the recipe/package is cleaned using clean/cleansstate/cleanall
> or when a recipe is rebuild and 'unstaged' from the the sysroot.
> 
> The "userdel_sysroot_sstate()" provides that functionality.
> 
> [YOCTO #9262]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/classes/sstate.bbclass  |  6 ++++++
>  meta/classes/useradd.bbclass | 26 ++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)

This patch looks the same as v2? Did you see my second comment?

Cheers,

Richard

