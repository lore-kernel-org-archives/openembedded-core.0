Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E828274197
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 07:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t817p8t3005921; Tue, 1 Sep 2015 08:51:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NuoVXLphpSQh; Tue,  1 Sep 2015 08:51:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t817orr2005913
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Sep 2015 08:51:04 +0100
Message-ID: <1441093853.26554.56.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>
Date: Tue, 01 Sep 2015 08:50:53 +0100
In-Reply-To: <cover.1440454290.git.chris_larson@mentor.com>
References: <cover.1440454290.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add checks for "host user contamination"
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
X-List-Received-Date: Tue, 01 Sep 2015 07:51:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-24 at 15:19 -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This adds a QA test, as well as a rootfs_ function for use in
> ROOTFS_POSTPROCESS_COMMAND, to warn/error when paths are owned by the same
> user/group as the user running bitbake. This is useful to catch stuff which is
> written outside of pseudo's control, for example.
> 
> The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:
> 
>   binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)
> 
> are available in the git repository at:
> 
>   git://github.com/kergoth/openembedded-core host-user-contaminated
>   https://github.com/kergoth/openembedded-core/tree/host-user-contaminated
> 
> Christopher Larson (3):
>   insane.bbclass: handle tests which need fakeroot
>   insane.bbclass: add host-user-contaminated test
>   image.bbclass: add rootfs_check_host_user_contaminated

On the autobuilder we found:

http://errors.yoctoproject.org/Errors/Details/16318/

which looks like a race against the packaging code and the creation of
package manager files. Not sure why we don't see this in other cases...

Cheers,

Richard


