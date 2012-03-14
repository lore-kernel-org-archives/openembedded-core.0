Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7oD9-0005og-92 for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:25:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDH6rt007941
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:17:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06829-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:17:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDGu0B007934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:16:57 GMT
Message-ID: <1331731015.18586.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 13:16:55 +0000
In-Reply-To: <D9D7124626ED1E43963D86B2657D5CCD02EB625C@FRSNPREXC1.usr.ingenico.loc>
References: <D9D7124626ED1E43963D86B2657D5CCD02EB625C@FRSNPREXC1.usr.ingenico.loc>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gettext_0.18.1.1.bb (PR r7 => r8)
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
X-List-Received-Date: Wed, 14 Mar 2012 13:25:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-13 at 16:00 +0100, Matthieu CRAPET wrote:
> Greetings,
>  
> Updated my openembedded-core git repository.
> Rebuilt world for my custom distro (compiling for a BeagleBoard).
>  
> I've got an error on gettext. 
>  
> .../build/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-neon-ing-linux-gnueabi/gcc/arm-ing-linux-gnueabi/4.6.4/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
> /usr/lib/libtinfo.so: file not recognized: File format not recognized
> collect2: ld returned 1 exit status
>  
> Reintroducing --with-libncurses-prefix line solves the issue.
>
> Am I missing somthing here?

We've reverted the patch that caused this problem.

Cheers,

Richard




