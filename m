Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 939366AC1E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Apr 2015 08:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3I81FjW018966; Sat, 18 Apr 2015 09:01:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6sRb7QjMPnqH; Sat, 18 Apr 2015 09:01:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3I811jg018962
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 18 Apr 2015 09:01:13 +0100
Message-ID: <1429344061.6976.209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Chatre, Reinette" <reinette.chatre@intel.com>
Date: Sat, 18 Apr 2015 09:01:01 +0100
In-Reply-To: <0D818C7A2259ED42912C1E04120FDE26710A76BB@ORSMSX111.amr.corp.intel.com>
References: <0D818C7A2259ED42912C1E04120FDE26710A76BB@ORSMSX111.amr.corp.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: dpkg:do_patch failure with today's updates to dizzy branch
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
X-List-Received-Date: Sat, 18 Apr 2015 08:01:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-04-17 at 23:05 +0000, Chatre, Reinette wrote:
> Today there was an update to the dizzy branch that includes the patch below:
>
> [...]
>
> Unfortunately the patch introduced by this commit does not apply cleanly to the version of dpkg that can be found in dizzy release. It seems that the patch was generated against dpkg version 1.17.21 while dizzy uses version 1.17.4. The build fails with:
> 
> NOTE: Applying patch 'tar-error-code.patch' (../meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch)
> ERROR: Command Error: exit status: 1  Output:
> Applying patch tar-error-code.patch
> patching file dpkg-deb/build.c
> Hunk #1 succeeded at 443 (offset 45 lines).
> Hunk #2 FAILED at 493.
> Hunk #3 FAILED at 581.
> 2 out of 3 hunks FAILED -- rejects in file dpkg-deb/build.c
> Patch tar-error-code.patch does not apply (enforce with -f)

There was a mixup with some branches unfortunately but the correct patch
is now on the branch and this should be fixed. Thanks for reporting.

Cheers,

Richard


