Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DC4F371638
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 13:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4DNadD019142; Tue, 4 Nov 2014 13:23:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ykFP98vWQtuJ; Tue,  4 Nov 2014 13:23:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4DNWah019139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 4 Nov 2014 13:23:33 GMT
Message-ID: <1415107447.23396.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 04 Nov 2014 13:24:07 +0000
In-Reply-To: <CAP9ODKpQmRo-yXMMURRDU8QpSo1fA4vx+wcXFXuBaT=hOgTC_A@mail.gmail.com>
References: <1415100396.23396.17.camel@ted> <5458C1A5.7060800@mlbassoc.com>
	<CAP9ODKpQmRo-yXMMURRDU8QpSo1fA4vx+wcXFXuBaT=hOgTC_A@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf/base.bbclass: Drop PRINC support
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
X-List-Received-Date: Tue, 04 Nov 2014 13:24:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-11-04 at 10:12 -0200, Otavio Salvador wrote:
> On Tue, Nov 4, 2014 at 10:08 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> > Won't this just silently make use of PRINC a no-op?  What about
> > the users that had their head in the sand for the last few months
> > but still expect PRINC to have some effect (and maybe don't use
> > PR server)?  I would think escalating this to an error would make
> > more sense (and follow other warnings that are now errors).
> 
> I agree with Gary, move this to ERROR now and drop in 1.9.

Its been printing warnings since May 2013. I tried to merge this 6
months ago, I was told to wait another release, by you:

http://lists.openembedded.org/pipermail/openembedded-core/2014-March/090169.html

Now I need to keep the patch for another 6 months. This really is taking
too long IMO. I may well get bored and just drop the patch (and forget
any other ideas about trying to cleanup things).

Cheers,

Richard



