Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC7tz-0001KE-Pc for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:15:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QB6vf1024584
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:06:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20450-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:06:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QB6l7K024578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:06:48 +0100
Message-ID: <1332760007.28414.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 12:06:47 +0100
In-Reply-To: <1332530896-27466-2-git-send-email-gary@mlbassoc.com>
References: <1332530896-27466-1-git-send-email-gary@mlbassoc.com>
	<1332530896-27466-2-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2 v2] python: fix packaging dependencies on minimal systems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 11:15:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 13:28 -0600, Gary Thomas wrote:
> If you install the top-level python package only on a minimal
> system which has no other python packages installed then python
> is not functional at all.  Without any extra packages installed
> this error is seen:
>   # python
>   Traceback (most recent call last):
>     File "/usr/lib/python2.7/site.py", line 64, in <module>
>       import traceback
>   ImportError: No module named traceback
> 
> Installing python-lang only partly fixes the problem as this
> error still exists:
>   # python
>   Traceback (most recent call last):
>     File "/usr/lib/python2.7/site.py", line 569, in <module>
>       main()
>     File "/usr/lib/python2.7/site.py", line 551, in main
>       known_paths = addusersitepackages(known_paths)
>     File "/usr/lib/python2.7/site.py", line 278, in addusersitepackages
>       user_site = getusersitepackages()
>     File "/usr/lib/python2.7/site.py", line 253, in getusersitepackages
>       user_base = getuserbase() # this will also set USER_BASE
>     File "/usr/lib/python2.7/site.py", line 243, in getuserbase
>       USER_BASE = get_config_var('userbase')
>     File "/usr/lib/python2.7/sysconfig.py", line 520, in get_config_var
>       return get_config_vars().get(name)
>     File "/usr/lib/python2.7/sysconfig.py", line 400, in get_config_vars
>       import re
>   ImportError: No module named re
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  .../python/python-2.7-manifest.inc                 |    2 +-
>  meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
>  scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



