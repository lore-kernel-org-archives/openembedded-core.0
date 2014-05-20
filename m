Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EA17B65F09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 13:43:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4KDgwW2003708; Tue, 20 May 2014 14:42:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dvIby8q7jLzq; Tue, 20 May 2014 14:42:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4KDgq6w003704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 20 May 2014 14:42:54 +0100
Message-ID: <1400593365.28353.215.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 May 2014 14:42:45 +0100
In-Reply-To: <1400155748-26271-1-git-send-email-Martin.Jansa@gmail.com>
References: <1400155748-26271-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: Fix build with older kernels
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
X-List-Received-Date: Tue, 20 May 2014 13:43:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-05-15 at 14:09 +0200, Martin Jansa wrote:
> * forward port this patch from daisy:
>   commit c11b29ff4f24af0445c3c6a694b8dc2037dcd7e4
>   Author: Tom Zanussi <tom.zanussi@intel.com>
>   Date:   Thu Mar 6 22:26:20 2014 -0600
> 
>     lttng-modules: Fix 3.14 bio tracepoints
> 
> * how is it possible that it's in daisy but not in master?

It looks like we have two versions of lttng-modules and friends. The
patch was applied in master and daisy to 2.4.0 but not to 2.3.3.

Why do we have two versions of the lttng pieces? :( One works on arm and
the other doesn't?

Anyhow, the change was in master and daisy.

Cheers,

Richard



