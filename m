Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CEF166F9CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 09:25:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2L9POlI005808; Fri, 21 Mar 2014 09:25:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z0CEDjKCoyAN; Fri, 21 Mar 2014 09:25:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2L9PKdg005803
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 21 Mar 2014 09:25:22 GMT
Message-ID: <1395393914.27611.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 21 Mar 2014 09:25:14 +0000
In-Reply-To: <ab237fe9780e3dd19b5583258f5996fa26de5b61.1395328478.git.paul.eggleton@linux.intel.com>
References: <cover.1395328478.git.paul.eggleton@linux.intel.com>
	<ab237fe9780e3dd19b5583258f5996fa26de5b61.1395328478.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] classes/kernel: move module postinst commands to kernel-base
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
X-List-Received-Date: Fri, 21 Mar 2014 09:25:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-20 at 15:15 +0000, Paul Eggleton wrote:
> Since kernel-base is the package that contains the files that depmod
> needs to run, we should be running depmod from the kernel-base
> postinstall rather than kernel-image.
> 
> Fixes [YOCTO #5392].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

I think this might have triggered:

http://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/105/steps/BuildImages_3/logs/stdio

Cheers,

Richard


