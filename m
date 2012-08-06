Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyOy4-0002Ww-MR for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 17:11:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76ExuLj028839
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 15:59:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27818-08 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2012 15:59:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76ExnWQ028832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 15:59:50 +0100
Message-ID: <1344265192.9756.170.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 15:59:52 +0100
In-Reply-To: <lyipcwp0co.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyipcwp0co.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: do_rootfs broken due to missing gcc-runtime
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
X-List-Received-Date: Mon, 06 Aug 2012 15:11:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-06 at 16:21 +0200, Enrico Scholz wrote:
> having something in the image which brings gcc-runtime-locale-XX in
> causes do_rootfs to fail with:
> 
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies for gcc-runtime-locale-de:
>  *      gcc-runtime *
>  * opkg_install_cmd: Cannot install package gcc-runtime-locale-de.
> 
> 
> This happens for some time already and I saw a patch[1] on the list
> which fixes it.  Any reason why it has not been applied yet?
>
> [1]  http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/24694

Thanks for the reminder, I merged this.

Cheers,

Richard



