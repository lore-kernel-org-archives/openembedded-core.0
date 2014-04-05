Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 14DF76A9C4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 09:39:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s359daGO010915; Sat, 5 Apr 2014 10:39:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wNaPDW7mWfhl; Sat,  5 Apr 2014 10:39:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s359dWF9010912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 5 Apr 2014 10:39:33 +0100
Message-ID: <1396690767.13862.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jate S <jatedev@gmail.com>
Date: Sat, 05 Apr 2014 10:39:27 +0100
In-Reply-To: <CAPphmgb9DTJ+K010b0CaqZM-_DCiOtWj7mhVPzMvArHczbyKLg@mail.gmail.com>
References: <CAPphmgb9DTJ+K010b0CaqZM-_DCiOtWj7mhVPzMvArHczbyKLg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] samba: remove talloc from DEPENDS
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
X-List-Received-Date: Sat, 05 Apr 2014 09:39:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-04 at 16:37 -0400, Jate S wrote:
> I've only tried this out on dora. There are no other changes, so I
> think it should work for newer branches.
> ----
> samba: remove talloc from DEPENDS
> 
> Samba has a DEPENDS on talloc, but the recipe runs configure
> "--without-libtalloc".
> 
> The dependency tree causes a rebuild when using a PREMIRROR sstate
> cache. Removing talloc from DEPENDS fixes the problem.
> 
> Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> 
> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-conn
> index 7391bbf..42979c8 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc

This is a meta-oe change so it needs to go to openembedded-devel (as per
the README).

Cheers,

Richard


