Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QjfRb-0005ie-3f
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 00:40:43 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qjeqb-00037w-SH from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 15:02:29 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 20 Jul 2011 15:00:15 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 20 Jul 2011 15:02:29 -0700
Message-ID: <4E275071.9080600@mentor.com>
Date: Wed, 20 Jul 2011 15:02:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 20 Jul 2011 22:00:15.0186 (UTC)
	FILETIME=[67C0E320:01CC4728]
Subject: Re: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Wed, 20 Jul 2011 22:40:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/20/2011 02:06 PM, Martin Jansa wrote:
> Fixes for recipes using intltool, distributions not having locales support in libc and distutils fix
> 
> The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
> 
>   lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib (2011-07-20 15:43:43 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/pull
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
> 
> Martin Jansa (10):
>   tcmode-default: set preferred version also for (e)glibc-locale
>   eglibc-package: don't fail without localedef/gconv
>   intltool: inherit perlnative
>   polkit: inherit perlnative
>   shared-mime-info: inherit perlnative
>   xkeyboard-config: inherit perlnative
>   avahi: inherit perlnative
>   vte: inherit perlnative
>   python: save Makefile.sysroot in do_compile
>   python: add patch to fix cross compilation on host with linux-3.0

So, with the long path series I posted most of the perlnative's should
be handled automatically with cpan having fixed up the tool in question.
 I suspect however that we have a few things like intltool that need
perlnative but don't today.

-- 
Tom Rini
Mentor Graphics Corporation


