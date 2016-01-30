Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7540977217
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 10:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0UAsq2u007311; Sat, 30 Jan 2016 10:54:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id szn2Do4nUyV3; Sat, 30 Jan 2016 10:54:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0UAsomG007306
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 30 Jan 2016 10:54:51 GMT
Message-ID: <1454151290.10340.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Sat, 30 Jan 2016 10:54:50 +0000
In-Reply-To: <1454117651.22677.6.camel@ranerica-desk01>
References: <1453029405.27999.16.camel@linuxfoundation.org>
	<1454117651.22677.6.camel@ranerica-desk01>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootimg/image: Enhance bootimg to respect RM_OLD_IMAGE
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
X-List-Received-Date: Sat, 30 Jan 2016 10:54:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-29 at 17:34 -0800, Ricardo Neri wrote:
> [Resending from an email subscribed to the oe list...]
> On Sun, 2016-01-17 at 11:16 +0000, Richard Purdie wrote:
> > @@ -294,7 +286,10 @@ python do_bootimg() {
> >          bb.build.exec_func('build_efi_cfg', d)
> >      bb.build.exec_func('build_hddimg', d)
> >      bb.build.exec_func('build_iso', d)
> > +    bb.build.exec_func('create_symlinks', d)
> When I try to use bootimg.bbclass I get the following warning:
> 
> WARNING: Function create_symlinks doesn't exist
> 
> This is because create_symlinks is defined in image.bbclass but
> bootimg.bbclass does not inherit from it. Should it be the case? Or
> the
> definiton of create_symlinks should be moved to a separate file?

I guess the key question is whether anyone is using bootimg.bbclass
without using image.bbclass, or whether that is even
possible/practical?

Was this an existing setup that broke?

Cheers,

Richard

