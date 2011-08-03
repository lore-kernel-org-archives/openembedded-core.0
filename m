Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qoefi-0002U0-2W for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 18:51:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GlWXo027649
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:47:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27367-04 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 17:47:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GlNns027643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:47:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312324397-1923-1-git-send-email-galak@kernel.crashing.org>
References: <1312324397-1923-1-git-send-email-galak@kernel.crashing.org>
Date: Wed, 03 Aug 2011 17:47:05 +0100
Message-ID: <1312390025.2344.699.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] gcc: Fix setting of GLIBC_DYNAMIC_LINKER
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
X-List-Received-Date: Wed, 03 Aug 2011 16:51:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 17:33 -0500, Kumar Gala wrote:
> The sed regex in do_configure_prepend was producing the following result:
> 
>  #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "/lib64/ld-linux-x86-64.so.2"
> 
> instead of removing the leading "/lib" or "/lib64".
> 
> Now we have it do:
> 
>  #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> 
> Additionally, with the regex fixed the manipulation of SYSTEMLIBS_DIR
> needs to be removed.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Merged to master, thanks.

Richard



