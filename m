Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1196E901
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 09:32:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s149WI4d023555; Tue, 4 Feb 2014 09:32:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8trETT3VQceQ; Tue,  4 Feb 2014 09:32:18 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s149WCpH023544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 4 Feb 2014 09:32:13 GMT
Message-ID: <1391506325.22620.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Tue, 04 Feb 2014 09:32:05 +0000
In-Reply-To: <52F0ABC7.1010908@linaro.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
	<1390312633.874.84.camel@ted> <52DE7E17.2090301@linaro.org>
	<1390316993.874.85.camel@ted> <52F0ABC7.1010908@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 04 Feb 2014 09:32:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-02-04 at 09:58 +0100, Koen Kooi wrote:
> On 01/21/2014 04:09 PM, Richard Purdie wrote:
> > On Tue, 2014-01-21 at 15:03 +0100, Koen Kooi wrote:
> >> On 01/21/2014 02:57 PM, Richard Purdie wrote:
> >>> On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
> > I'm ok with it in principle but I'd like to see known build issues fixed
> > before it goes in since red autobuilders cause me enough grief
> > already ;-).
> 
> What's the status on this? I know a fix went into meta-intel (albeit it 
> in a legally questionable way, but that's their problem) and the other 
> affected layers have received patches for it.

The last test build I ran:

http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/10/steps/BuildImages_1/logs/stdio

still shows an error in the fsl-arm layer which I suspect is from this.
I was hoping that could get fixed before it merges, its very much still
in the queue though.

I won't wait forever, equally, maintaining the green builds is proving
to consume a lot of my time and if I can avoid adding more failures, I'd
prefer to do so.

Cheers,

Richard









