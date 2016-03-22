Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A6DDB606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2M9UhV4029019; Tue, 22 Mar 2016 09:30:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GG_jeGrhQwus; Tue, 22 Mar 2016 09:30:43 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2M9UcXV029016
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Mar 2016 09:30:39 GMT
Message-ID: <1458639038.20442.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Li Xin <lixin.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 09:30:38 +0000
In-Reply-To: <1458625715-1813-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1458625715-1813-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning.
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
X-List-Received-Date: Tue, 22 Mar 2016 09:31:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-22 at 08:48 +0300, Li Xin wrote:
> WARNING: QA Issue: gcc-cross-canadian-i586-dbg: found library in
> wrong location:
> /PATH/sysroots/x86_64-oesdk-linux/usr/libexec/i586-oe-linux/gcc/i586
> -oe-linux/5.2.0/.debug/libcc1.so.0.0.0
> 
> This warning is introduced by commit f6e47aa(gcc-target 5.1: fix for
> libcc1)
> 
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 ++
>  1 file changed, 2 insertions(+)

I just tried a "MACHINE=qemux86-64 bitbake gcc-cross-canadian-x86-64"
here and didn't see this warning. How would I get this warning to show
up as I'm not seeing it in my builds?

Cheers,

Richard

