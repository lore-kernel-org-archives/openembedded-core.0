Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59C0F6AE14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 03:20:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0R3KEnG027815
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Jan 2014 19:20:14 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 26 Jan 2014 19:20:13 -0800
Message-ID: <52E5D069.5040209@windriver.com>
Date: Mon, 27 Jan 2014 11:20:09 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1390360372-10947-1-git-send-email-kai.kang@windriver.com>
	<1390374490.24755.2.camel@e130.pbcl.net>
	<52DF8A1E.9050306@windriver.com>
	<1390678245.24755.51.camel@e130.pbcl.net>
In-Reply-To: <1390678245.24755.51.camel@e130.pbcl.net>
X-Enigmail-Version: 1.6
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc-dbg: provides libc6-dbg
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
X-List-Received-Date: Mon, 27 Jan 2014 03:20:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 2014年01月26日 03:30, Phil Blundell wrote:
> On Wed, 2014-01-22 at 17:06 +0800, Kang Kai wrote:
>> Use glib-dbg does work. But if I use it in a recipe, when uclibc is
>> used, I have to edit the recipe.
> Isn't that still true of "libc6-dbg"?  Worse, it isn't even guaranteed
> that the eglibc-debug package will be named libc6-dbg on all targets; it
> would probably end up as libc6.1-dbg on alpha-linux or ia64-linux for
> example.  Encouraging people to hardcode "libc6" doesn't seem very
> wholesome.

I think this is the way to deal the "RPROVIDES" and please ref to
libc6-dev in eglibc-package.inc:

RPROVIDES_${PN}-dev = "glibc-dev libc6-dev virtual-libc-dev"

Thanks,
Kai

>
> p.
>
>
>


-- 
Regards,
Neil | Kai Kang


