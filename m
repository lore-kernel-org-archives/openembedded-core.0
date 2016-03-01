Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 04D326612D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2184Xnj028204; Tue, 1 Mar 2016 08:04:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QPP2-CumPYc9; Tue,  1 Mar 2016 08:04:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2184RwH028200
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Mar 2016 08:04:28 GMT
Message-ID: <1456819467.11498.185.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 01 Mar 2016 08:04:27 +0000
In-Reply-To: <20160301004309.GA2559@jama>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
	<CA+chaQfHZPKviheG2NY7miXe9YZir0pszp8qCQbb1kgzPABPDQ@mail.gmail.com>
	<20160301004309.GA2559@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Tue, 01 Mar 2016 08:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-01 at 01:43 +0100, Martin Jansa wrote:
> On Mon, Feb 29, 2016 at 10:30:17PM +0100, Martin Jansa wrote:
> > No special configuration IIRC (will check tomorrow and send whole
> > config.log).
> > 
> > But it failed the same in my minimal chroot env with just oe-core
> > and on
> > Ubuntu jenkins slave doing bitbake world with many layers, here is
> > full log:
> > http://errors.yoctoproject.org/Errors/Details/38149/
> > 
> > and it shows --without-system-readline parameter.
> 
> It's caused by bbappend in meta-qt5
> 
> OE qemux86@ ~/build/oe-core $ cat meta-qt5/recipes
> -devtools/gdb/gdb_%.bbappend
> PACKAGECONFIG ??= "python"
> 
> But on the other hand does this change make more harm than confusing
> error for people who try to build without readline in PACKAGECONFIG?

I mainly wanted to understand what configuration caused this, which we
now understand/ I agree we should probably do something about the
error.

I do wonder what a gdb bbappend is doing in meta-qt5 though. I'd say
that is really "distro" configuration.

Cheers,

Richard



