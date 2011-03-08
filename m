Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Px201-0008EE-Ob for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 19:51:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28Indsp023186
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Mar 2011 18:49:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22665-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2011 18:49:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28InV7Y023180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Mar 2011 18:49:34 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1299145156-32150-1-git-send-email-Martin.Jansa@gmail.com>
References: <1299145156-32150-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 08 Mar 2011 10:49:28 -0800
Message-ID: <1299610168.602.95.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] sanity.bbclass: some multilib systems have symlink /lib -> /lib64
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
X-List-Received-Date: Tue, 08 Mar 2011 18:51:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 10:39 +0100, Martin Jansa wrote:
> * ie gentoo has /lib -> /lib64
> * old test assumed only /lib64 -> /lib
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/sanity.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 13940f8..433313b 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -211,7 +211,7 @@ def check_sanity(e):
>      nolibs = data.getVar('NO32LIBS', e.data, True)
>      if not nolibs:
>          lib32path = '/lib'
> -        if os.path.exists('/lib64') and os.path.islink('/lib64'):
> +        if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
>             lib32path = '/lib32'
>  
>          if os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('/usr/include/gnu/stubs-32.h'):

Merged to master, thanks.

Richard



