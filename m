Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id BBAAB6BD0F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 13:42:08 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id h16so1359625oag.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 05:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=FkGrtB0nnevf3cKJDaLxvyUXZo+MRi5SEL5i1g61hH8=;
	b=QlxCByQZ3bJpeuB49RN/+N5iSghwODsuLEMUsLzS62pWq+rNk2ioi6HSr1CzFd2osO
	k3lj5o+AkWZCtlDTDiQzh1juFPvmOMkQOmKMhwqkZCMB4Mvxtn5Yk4jTHZC76eiSZTVE
	gRJwYhYmVrla3JEXQSk3L9vvf1AF1/c/sUbaDyT/wtNPP4HzrwuQ5Q2FFELXtDmqaX76
	E96+yg6lmwdmS8ozlQBTWgWJ3/4/LBk4maAPadAucv8JNlVpqxYgANNylnpv+fCQqiap
	1wyf3kt4N4iYJ9EAti2JvB33CNjtUcyDRUZ4guSxSUz8LT9l8WAjhEStQaDJ5aBC8Pjw
	nC/g==
MIME-Version: 1.0
X-Received: by 10.182.70.5 with SMTP id i5mr10821866obu.8.1385127727932; Fri,
	22 Nov 2013 05:42:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 22 Nov 2013 05:42:07 -0800 (PST)
In-Reply-To: <1385061961-4697-1-git-send-email-mark.hatle@windriver.com>
References: <1385061961-4697-1-git-send-email-mark.hatle@windriver.com>
Date: Fri, 22 Nov 2013 11:42:07 -0200
X-Google-Sender-Auth: mDNKuuawgqPL5AMS-kHpU4ZaVtU
Message-ID: <CAP9ODKry-KUYhXeKqn7iefb=rchCN9Xiu-GyFwj6A_eXtxD42g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image-prelink.bbclass: use the pseudo env var PSEUDO_ALLOW_FSYNC for prelink
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
X-List-Received-Date: Fri, 22 Nov 2013 13:42:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 21, 2013 at 5:26 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> (Note: this patch is sent for YP compliance, I don't believe it is
>  applicable to general oe-core.)
>
> This would actually emit fsync calls, which may fix the do_rootfs failure
> on older systems like CentOS 5.x or SuSE 11.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

There're a Yocto bug about this issue, no?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

