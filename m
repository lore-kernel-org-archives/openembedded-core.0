Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6B670F90
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Aug 2014 11:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7NB4Ymm015704; Sat, 23 Aug 2014 12:04:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tQFdYVitW_Zu; Sat, 23 Aug 2014 12:04:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7NB4WhT015700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 23 Aug 2014 12:04:34 +0100
Message-ID: <1408791873.5457.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Sat, 23 Aug 2014 12:04:33 +0100
In-Reply-To: <CABcZAN=cp3NHtPMQymoFFUhsoEXCtFUBtnx1ynmRmp+N=cX11w@mail.gmail.com>
References: <1408653988.1669.116.camel@ted>
	<CABcZAN=cp3NHtPMQymoFFUhsoEXCtFUBtnx1ynmRmp+N=cX11w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/package_manager: Add utils function for multiprocess execution
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
X-List-Received-Date: Sat, 23 Aug 2014 11:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-21 at 17:57 -0700, Christopher Larson wrote:

> On Thu, Aug 21, 2014 at 1:46 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         Our usage of multitprocessing is problematic. In particular,
>         there is a bug
>         in python 2.7 multiprocessing where signals are not handled
>         until command
>         completion instead of immediately.
>  
> This looks good, but the subject is misleading, in my opinion:
> "lib/oe/package_manager: Add utils function for multiprocess
> execution". It should probably either mention both utils and
> package_manager, or be split into two commits.

Good point, I tweaked before merging, thanks. It was the (bad) result of
rearranging a few commits.

Cheers,

Richard



