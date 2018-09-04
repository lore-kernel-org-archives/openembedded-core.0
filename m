Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A0E6074E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 20:35:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w84KZZAB029103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 4 Sep 2018 21:35:36 +0100
Message-ID: <a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Tue, 04 Sep 2018 21:35:35 +0100
In-Reply-To: <CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Tue, 04 Sep 2018 20:35:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-04 at 21:12 +0200, Martin Jansa wrote:
> On Tue, Aug 28, 2018 at 12:23 PM Alexander Kanavin <alex.kanavin@gmai
> l.com> wrote:
> > From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > 
> > I believe the time has come to do this: openssl 1.0 upstream
> > support stops at the end
> > of 2019, and we do not want a situation where a supported YP
> > release contains an
> > unsupported version of a critical security component.
> > 
> > Openssl 1.0 can still be utilized by depending on 'openssl10'
> > recipe.
> 
> This still isn't true for most recipes, as long as there is something
> depending on openssl in the dependency tree, it will
> cause do_prepare_recipe_sysroot failures like last time
> 
> ERROR: The file /usr/lib/libssl.so is installed by both openssl10 and
> openssl, aborting
> DEBUG: Python function extend_recipe_sysroot finished
> DEBUG: Python function do_prepare_recipe_sysroot finished
> ERROR: Function failed: extend_recipe_sysroot
> 
> From 15 failures caused by openssl-1.1 detected in my builds, just
> changing DEPENDS from openssl to openssl10 didn't help in any case.

That isn't good news. Do you have an idea of which components are in
the dependency chains and if any of them are common? It'd also be
useful to understand which ones are breaking...

Cheers,

Richard

