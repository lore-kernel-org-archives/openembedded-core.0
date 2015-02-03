Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 67D7E60024
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 13:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t13DL5m4009228; Tue, 3 Feb 2015 13:21:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id S9fdJwfn4PED; Tue,  3 Feb 2015 13:21:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t13DKrWQ009221
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 3 Feb 2015 13:21:04 GMT
Message-ID: <1422969653.22544.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 03 Feb 2015 13:20:53 +0000
In-Reply-To: <CAP9ODKoSBqZTpKczXd3Q4FUfcZFrtN-DVCSMDNisp_fqnykWnw@mail.gmail.com>
References: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAP9ODKrSVAaspV7pv+s-eVuhjf3ptFuO-+qc+johEYQbpGaPFg@mail.gmail.com>
	<54D0C0B1.1090500@kernelconcepts.de>
	<CAJTo0LZxw5LV55fi9QA6X=vgM4UrZ-LtHXqp2KuMEVmGffgNiA@mail.gmail.com>
	<54D0C433.50705@kernelconcepts.de>
	<CAP9ODKorL58Y=bAxv39bz+CFBmJqxbtxtgZbA92=8q8nHL2Mow@mail.gmail.com>
	<CAJTo0Lb+NmyRvMw=CH0TKF-EfCeen3khOut3iSEvsckmrQV8nw@mail.gmail.com>
	<CAP9ODKoSBqZTpKczXd3Q4FUfcZFrtN-DVCSMDNisp_fqnykWnw@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
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
X-List-Received-Date: Tue, 03 Feb 2015 13:21:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-02-03 at 11:02 -0200, Otavio Salvador wrote:
> On Tue, Feb 3, 2015 at 11:00 AM, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > On 3 February 2015 at 12:53, Otavio Salvador <otavio@ossystems.com.br>
> > wrote:
> >>
> >> > last time I checked (some days ago) it was not necessarily fatal. I was
> >> > able to
> >> > build complete image collecting a pile of PR_INC errors. That's what
> >> > confused me...
> >> > I'll check if I still have the log on another machine later.
> >>
> >> Florian has a point here. We should use 'bb.fatal' and abort all build
> >> as soon as possible.
> >
> >
> > Its an error in a specific recipe, so why should that abandon the build
> > immediately?
> 
> It ends changing the content of the recipe and might raise a rebuild
> of several things. Which ends being invalid as PRINC would make an
> error in the end. So why not fail soon and ensure it is act upon it
> ASAP?

It errors during parsing which stops the build going any further. It
doesn't really matter whether its a bb.fatal or bb.error, both would
have the same effect here which is to stop the build at parse time.

It used to be a bb.warn(), people ignored it. Personally I'd like to
drop the thing entirely but people wanted an error so we have that now
for this release. We're not changing it back to a warn().

Cheers,

Richard


