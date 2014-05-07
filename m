Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E09F60D8B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 22:21:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s47MLD6F021525; Wed, 7 May 2014 23:21:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1aT9YsdG54_9; Wed,  7 May 2014 23:21:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s47ML8cB021513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 7 May 2014 23:21:09 +0100
Message-ID: <1399501262.31891.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petter =?ISO-8859-1?Q?Mab=E4cker?= <petter@technux.se>
Date: Wed, 07 May 2014 23:21:02 +0100
In-Reply-To: <cover.1399497346.git.petter@technux.se>
References: <cover.1399497346.git.petter@technux.se>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/13] Remove usage of FILESPATH
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
X-List-Received-Date: Wed, 07 May 2014 22:21:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-05-07 at 23:19 +0200, Petter Mabäcker wrote:
> Fixes [YOCTO #4497]
> 
> We extend the search path in a number of recipes by setting FILESPATH,
> which is not really desirable since the manner in which we have done it
> can make the recipe harder to bbappend (and we explicitly advise modifying
> FILESPATH this in the manual). These should be changed to use FILESEXTRAPATHS
> to extend the path instead or use a default FILESPATH (e.g. BP, BPN or files).

Whilst FILESPATH is discouraged, so is putting files into "files"
directories so those changes are not an improvement.

Cheers,

Richard



