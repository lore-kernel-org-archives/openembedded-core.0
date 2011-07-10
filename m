Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfpmV-0008FS-Ls for openembedded-core@lists.openembedded.org;
	Sun, 10 Jul 2011 10:54:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6A8oX7x001470
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2011 09:50:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01222-03 for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2011 09:50:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6A8oOhO001464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2011 09:50:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310261708.git.sgw@linux.intel.com>
References: <cover.1310261708.git.sgw@linux.intel.com>
Date: Sun, 10 Jul 2011 09:49:41 +0100
Message-ID: <1310287781.20015.943.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RC2 PATCH 0/2] Patch for meta-toolchain-gmae for RC2 build
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
X-List-Received-Date: Sun, 10 Jul 2011 08:54:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-07-09 at 18:38 -0700, Saul Wold wrote:
> Richard,
> 
> This the libx11 patch is needed to ensure that meta-toolchain-gmae
> built, we missed updating the nativesdk DEPENDS (without xcb enabled).
> 
> The tcmode-default updates binutils to remove the preferred provider warnings.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 4f36a7f698de5056cb38641a7bf12921dba7d962:
> 
>   libx11: enable xcb support (2011-07-08 23:01:54 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (2):
>   libx11: ensure nativesdk uses correct DEPENDS and XCB flags
>   tcmode-default: update binutils version

Merged to master, thanks.

Richard



