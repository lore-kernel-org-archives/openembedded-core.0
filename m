Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9190275520
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 15:15:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5JFFH4B020225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 19 Jun 2018 16:15:18 +0100
Message-ID: <64f3d2c4cba24e1f16619e38ae7f0a6d279606be.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 16:15:17 +0100
In-Reply-To: <1529381411-5045-6-git-send-email-akuster808@gmail.com>
References: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
	<1529381411-5045-6-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 6/6] nss: update to 3.37.1
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
X-List-Received-Date: Tue, 19 Jun 2018 15:15:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-06-18 at 21:10 -0700, Armin Kuster wrote:
> remove Fix-compilation-for-X32.patch as a solution simular is
> included in update.
> 
> notable changes:
> The TLS 1.3 implementation was updated to Draft 28.
> The CA certificates list was updated to version 2.24.
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>

Failed in -next on qemuarm:
http://errors.yoctoproject.org/Errors/Details/180618/
http://errors.yoctoproject.org/Errors/Details/180669/
http://errors.yoctoproject.org/Errors/Details/180677/

qemuppc:
http://errors.yoctoproject.org/Errors/Details/180623/
http://errors.yoctoproject.org/Errors/Details/180639/
http://errors.yoctoproject.org/Errors/Details/180645/
http://errors.yoctoproject.org/Errors/Details/180644/
http://errors.yoctoproject.org/Errors/Details/180643/

qemumips:
http://errors.yoctoproject.org/Errors/Details/180655/
http://errors.yoctoproject.org/Errors/Details/180670/
http://errors.yoctoproject.org/Errors/Details/180678/

and more, you get the idea...

Cheers,

Richard


