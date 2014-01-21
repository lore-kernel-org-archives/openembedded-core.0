Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F01A3615AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:10:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0LFAiKT020851; Tue, 21 Jan 2014 15:10:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sRmnYni2Uer0; Tue, 21 Jan 2014 15:10:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0LFA0ka020841
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 21 Jan 2014 15:10:02 GMT
Message-ID: <1390316993.874.85.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Tue, 21 Jan 2014 15:09:53 +0000
In-Reply-To: <52DE7E17.2090301@linaro.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
	<1390312633.874.84.camel@ted> <52DE7E17.2090301@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Tue, 21 Jan 2014 15:10:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-21 at 15:03 +0100, Koen Kooi wrote:
> On 01/21/2014 02:57 PM, Richard Purdie wrote:
> > On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
> >> Marks original commit message and variable documentation state that stripping and splitting are independent of eachother, but package.bbclass ANDs the two INHIBIT flags to see which files can be stripped and/or split.
> >>
> >> Original behaviour:
> >>
> >> INHIBIT_PACKAGE_STRIP: no strip, no debug split
> >> INHIBIT_PACAKGE_DEBUG_SPLIT: no strip, no debug split
> >>
> >> Behaviour after this patch:
> >>
> >> INHIBIT_PACKAGE_STRIP: no strip, no debug split
> >> INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split
> >>
> >> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >> ---
> >>   meta/classes/package.bbclass | 3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > FWIW this resulted in a failure on minnow:
> >
> > http://autobuilder.yoctoproject.org/main/builders/minnow/builds/15/steps/BuildImages/logs/stdio
> >
> > So we may have some fixing up to do before this change can be merged...
> 
> I have that QA issue as warning not as error. I guess that's why my 
> builds kept working :)
> 
> Aside from that, what are your thoughts on this patch?

I'm ok with it in principle but I'd like to see known build issues fixed
before it goes in since red autobuilders cause me enough grief
already ;-).

Cheers,

Richard


