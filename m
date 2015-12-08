Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19D8760110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 243FA180A2;
	Tue,  8 Dec 2015 09:51:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id veQzOJK+Z-RY; Tue,  8 Dec 2015 09:51:07 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 78E9018094;
	Tue,  8 Dec 2015 09:51:07 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 545B7151B;
	Tue,  8 Dec 2015 09:51:07 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 4547215B;
	Tue,  8 Dec 2015 09:51:07 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 42A11341C2;
	Tue,  8 Dec 2015 09:51:07 +0100 (CET)
Received: from [10.92.161.3] (10.92.161.3) by xmail2.se.axis.com (10.0.5.74)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 8 Dec 2015 09:51:07 +0100
To: Christopher Larson <clarson@kergoth.com>
References: <1449484744-7362-1-git-send-email-fabrice.coulon@axis.com>
	<CABcZANmnKsvaQBykUSZP2_Qsy4oW7v5WwRzF_4vpUbMxkezKPQ@mail.gmail.com>
From: Fabrice Coulon <fabrice.coulon@axis.com>
Message-ID: <566699E2.2030300@axis.com>
Date: Tue, 8 Dec 2015 09:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CABcZANmnKsvaQBykUSZP2_Qsy4oW7v5WwRzF_4vpUbMxkezKPQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd_base: Make perform_groupmems work with native
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
X-List-Received-Date: Tue, 08 Dec 2015 08:51:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/07/2015 04:30 PM, Christopher Larson wrote:
>
> On Mon, Dec 7, 2015 at 3:39 AM, Fabrice Coulon 
> <fabrice.coulon@axis.com <mailto:fabrice.coulon@axis.com>> wrote:
>
>     I have a problem when using useradd_base.bbclass together with native.
>     ${sysconfdir} is BUILDDIR/tmp/sysroots/x86_64-linux/etc for native,
>     and ${sysconfdir} is "/etc" for target.
>
>     rootdir is BUILDDIR/tmp/sysroots/x86_64-linux for native, so,
>     $rootdir${sysconfdir} is not correct for native.
>
>     The solution for me was to replace instances of $rootdir${sysconfdir}
>     with $rootdir/etc under perform_groupmems.
>
>     Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com
>     <mailto:fabrice.coulon@axis.com>>
>
>
> Hardcoding a path is *not* an appropriate fix.

I agree that hardcoding a path is not OK but maybe you should not see 
this as a fix but more like a question/discussion.

The problem is that "/etc" is hardcoded in 13 other places in 
meta/classes/useradd_base.bbclass.

Do you know how to solve this so that it will work well for native?

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


