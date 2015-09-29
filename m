Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A4E9A76710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TEnYUK010826; Tue, 29 Sep 2015 15:51:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oppbuPYJoGvQ; Tue, 29 Sep 2015 15:51:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TEolY6010878
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Sep 2015 15:50:58 +0100
Message-ID: <1443538247.5162.43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Sep 2015 15:50:47 +0100
In-Reply-To: <CAJTo0Lb3_VLJdSJbDzYuAQiBy4o-soxu_oMco8FEpYWqBx8sww@mail.gmail.com>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
	<560A8690.1050809@collabora.co.uk>
	<CAJTo0Lb3_VLJdSJbDzYuAQiBy4o-soxu_oMco8FEpYWqBx8sww@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Andrew Shadura <andrew.shadura@collabora.co.uk>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] dbus: merge .bb and .inc
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
X-List-Received-Date: Tue, 29 Sep 2015 14:51:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-29 at 15:41 +0100, Burton, Ross wrote:
> On 29 September 2015 at 13:39, Andrew Shadura
> <andrew.shadura@collabora.co.uk> wrote:
>         There hasn't been anything on this for two weeks already, has
>         anyone
>         considered merging these patches?
>
> Sorry but they didn't quite make the M3 deadline (well, the patches
> did, but reviewing didn't as we were heads down trying to fix the
> build).  If you can rebase and resend when master re-opens (when 2.0
> is released) that would be much appreciated.

Just to add that what would help is a little bit more explanation about
what happened in the patches. It looks like dbus-glib isn't needed for
example but the commit message doesn't mention why?

Cheers,

Richard



