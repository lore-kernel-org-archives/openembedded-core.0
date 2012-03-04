Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S4Ad9-0006Tm-Kh for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 13:33:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q24CP7pc025334
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 12:25:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21524-09 for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2012 12:25:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q24COu75025314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 12:25:00 GMT
Message-ID: <1330863899.6034.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 04 Mar 2012 04:24:59 -0800
In-Reply-To: <cover.1330772078.git.xiaofeng.yan@windriver.com>
References: <cover.1330772078.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3]
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
X-List-Received-Date: Sun, 04 Mar 2012 12:33:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-03 at 18:59 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> LSB report the following information when running lsb  test.
> 
> VSW5TESTSUITE PURPOSE 7
> Assertion XStringToKeysym-7.(A)
> When the string argument is the name of a KeySym in the
> table with the prefix XK_ removed, then a call to
> XStringToKeysym returns that KeySym.
> METH: For each KeySym name in table with code G:
> METH: Call XStringToKeysym to obtain the KeySym defined for that string.
> METH: Verify that XStringToKeysym did not return NoSymbol.
> METH: Verify that the returned string is correct.
> CHECK: XStringToKeysym-7 1, line 130
> CHECK: XStringToKeysym-7 2, line 140
> CHECK: XStringToKeysym-7 3, line 150
> CHECK: XStringToKeysym-7 4, line 160
> CHECK: XStringToKeysym-7 5, line 170
> 
> This is host contamination problem. libx11-1.4.4 hasn't patch
> "makekeys_crosscompile.patch" in libx11-trim-1.4.4 because core-image-lsb-qt3
> use libx11 instead of libx11-trim.
> 
> 
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: xiaofeng/1970
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1970
> 
> Thanks,
>     Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> 
> 
> Xiaofeng Yan (3):
>   libx11-1.4.4: Add patch makekeys_crosscompile.patch
>   libx11-1.4.4: Add patch "makekeys_crosscompile.patch"
>   libx11-trim: Add error information from LSB Test Suite to
>     makekeys_crosscompile.patch

Merged to master, thanks.

Richard



