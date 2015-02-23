Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B6E69706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 22:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1NMXNZ7001468; Mon, 23 Feb 2015 22:33:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8KOPysns8q6n; Mon, 23 Feb 2015 22:33:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1NMXBhs001458
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Feb 2015 22:33:22 GMT
Message-ID: <1424730791.26813.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 23 Feb 2015 22:33:11 +0000
In-Reply-To: <CAP9ODKrUdLOyxr8NtGYMPMrmK0vY68VR3y483_nyCMJ8DhLOdw@mail.gmail.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
	<dbb562e543729b016d4a31ceaf08da3abb24f267.1424709353.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqa+7EZ_4hw=_-XOgQMyxeiSRRMAcXrGVpKwXLcLLrNPw@mail.gmail.com>
	<5866784.j6W0KFP0Zl@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKp4QG0iSUzUU8ZaAkKjsg34zo8FwHiXZkD-XoA_su1hpA@mail.gmail.com>
	<1424714778.26813.1.camel@linuxfoundation.org>
	<CAP9ODKrUdLOyxr8NtGYMPMrmK0vY68VR3y483_nyCMJ8DhLOdw@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] populate_sdk_ext: add extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 22:33:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-02-23 at 15:11 -0300, Otavio Salvador wrote:
> On Mon, Feb 23, 2015 at 3:06 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2015-02-23 at 15:00 -0300, Otavio Salvador wrote:
> >> On Mon, Feb 23, 2015 at 2:54 PM, Paul Eggleton
> > This code adds in an alternative SDK format and it drives that using a
> > different task target. Right now its hard for people to see where things
> > are going, this puts it in easy reach whilst allowing the current SDK to
> > continue to work too.
> >
> > I think a choice of two different task targets here makes sense to drive
> > this configuration rather than SDKIMAGE_FEATURES and I agree with Paul
> > that adding it the other way would be complex, error prone and
> > confusing.
> 
> Well so why we don't add populate_sdk+dev-pkgs+dbg-pkgs.
> 
> Sorry ... it is clear that people wish this feature (and I also do)
> and appreciate the hard work Paul has put on this (yes this is indeed
> a good amount of work) but the extra task does not seem to fit how the
> system is designed.
> 
> The SDKIMAGE_FEATURES[1] is described as:
> 
> 
> Equivalent to IMAGE_FEATURES. However, this variable applies to the
> SDK generated from an image using the following command:
> 
>      $ bitbake -c populate_sdk imagename
> 
> and it makes a lot of sense to have a 'extended' or 'devtool' or
> another name for this feature.

I see this as that SDKIMAGE_FEATURES controls the content of the SDK,
not the actual construction of it so I'm afraid I don't agree.

Cheers,

Richard





