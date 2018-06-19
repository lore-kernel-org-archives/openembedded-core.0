Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EB2037554F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 15:13:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5JFDDvB019802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 19 Jun 2018 16:13:14 +0100
Message-ID: <7878cafe90bb5d01e33569bd05ed8c08719c2ad9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 16:13:13 +0100
In-Reply-To: <1529328356-10653-1-git-send-email-akuster808@gmail.com>
References: <1529328356-10653-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [V5][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Tue, 19 Jun 2018 15:13:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-06-18 at 06:25 -0700, Armin Kuster wrote:
> LIC_FILES_CHKSUM changed do to updated year
> 
> removed:
> dont-test-on-host.patch, no longer implemented
> drop use-python3-and-fix-install-lib-path.patch, they added the
> ability to pass in lib dir loctions
> drop bind-confgen-build-unix.o-once.patch, fix included in update
> 
> Refresh other patches:
> add python3 flag for PACKAGECONFIG to pull in python
> add new config option --with-eddsa=
> 
> [v2]
> Remove python3 in default PACKACKECONFIG
> include https://patchwork.openembedded.org/patch/148257/
> Because of the newly added dependency on meta-python, the python(3)
> packageconfig is no longer "default-on".
> 
> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
> 
> [v3]
> Made formating and spelling changes per Martin
> 
> [v4]
> Minor typo fixes
> cleanup python3 support

Something in -next is causing dhcp to fail to compile:

http://errors.yoctoproject.org/Errors/Details/180628/
http://errors.yoctoproject.org/Errors/Details/180624/
http://errors.yoctoproject.org/Errors/Details/180635/
http://errors.yoctoproject.org/Errors/Details/180619/

probably the bind upgrade...

Cheers,

Richard

