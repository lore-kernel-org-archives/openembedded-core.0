Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D9A306AC69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 16:12:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6NGCnt6003485; Wed, 23 Jul 2014 17:12:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3ZGwNxqY20hz; Wed, 23 Jul 2014 17:12:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6NGCgJn003130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 23 Jul 2014 17:12:43 +0100
Message-ID: <1406131962.22985.127.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 23 Jul 2014 17:12:42 +0100
In-Reply-To: <alpine.LFD.2.11.1407222018550.25203@localhost>
References: <alpine.LFD.2.11.1407222018550.25203@localhost>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: if a layer doesn't provide any conf/ or classes/ files, any need for BBPATH?
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
X-List-Received-Date: Wed, 23 Jul 2014 16:13:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-07-22 at 20:21 -0400, Robert P. J. Day wrote:
>   i just noticed that the meta-oe/meta-filesystems layer provides no
> (additional) conf/ files or classes/ files. so in a case like that, is
> there any need to add that layer info to BBPATH in its layer.conf
> file?
> 
>   conversely, if a layer contains no .bb or .bbappend files, does it
> need to be included in BBFILES?

It doesn't need to, no. Convention is to leave it around to make it easy
to add them later since it doesn't hurt much either.

Cheers,

Richard


