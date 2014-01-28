Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E6ED960CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 12:30:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0SCT1lx024792; Tue, 28 Jan 2014 12:30:41 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f-XsG2MA_Syh; Tue, 28 Jan 2014 12:30:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0SCUXHe024815
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 28 Jan 2014 12:30:35 GMT
Message-ID: <1390912228.24655.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 28 Jan 2014 12:30:28 +0000
In-Reply-To: <CAP9ODKp4T5ouY1y8GqnRVFy1SdA9BajmDxOjMkGR0gFzteGuSQ@mail.gmail.com>
References: <1390459548-21038-1-git-send-email-ming.liu@windriver.com>
	<1390461261.24755.12.camel@e130.pbcl.net>
	<52E0C33B.3090605@windriver.com>
	<CAP9ODKp4T5ouY1y8GqnRVFy1SdA9BajmDxOjMkGR0gFzteGuSQ@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] quilt: add ac_cv_path_BASH to CACHED_CONFIGUREVARS also for native
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
X-List-Received-Date: Tue, 28 Jan 2014 12:30:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-23 at 09:29 -0200, Otavio Salvador wrote:
> On Thu, Jan 23, 2014 at 5:22 AM, Ming Liu <ming.liu@windriver.com> wrote:
> > On 01/23/2014 03:14 PM, Phil Blundell wrote:
> >>
> >> On Thu, 2014-01-23 at 14:45 +0800, Ming Liu wrote:
> >>>
> >>>   +CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
> >>>   -CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
> >>
> >> Why did you change this from ${base_bindir} to a hardcoded path?
> >
> > Because base_bindir would be expanded as '${base_prefix}/bin' for native
> > recipe, then it has to set DEPENDS on bash-native which I think is not what
> > it supposed to be, the change would let it locate bash from host
> > environment.
> 
> I don't think so.
> 
> % git grep base_prefix meta/conf/bitbake.conf
> meta/conf/bitbake.conf:export base_prefix = ""
> meta/conf/bitbake.conf:export base_bindir = "${base_prefix}/bin"

Consider what native.bbclass does to this though. I suspect Ming is
correct here...

Cheers,

Richard


