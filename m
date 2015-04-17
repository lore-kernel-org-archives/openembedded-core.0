Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC4D605D2
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 07:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3H7FqrR028776; Fri, 17 Apr 2015 08:15:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o-4mKHwtfZtM; Fri, 17 Apr 2015 08:15:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3H7FdYL028770
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Apr 2015 08:15:50 +0100
Message-ID: <1429254936.6976.191.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Apr 2015 08:15:36 +0100
In-Reply-To: <CAMKF1soYC_BnMGv4Su5Z+6v1oFKpYCfRWvFxdnPXp9i04BAHHQ@mail.gmail.com>
References: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
	<CA+chaQfLz-OgjHwce6yoeCQXgMwKEJnuo3ZBThSS=yK7hAXc5Q@mail.gmail.com>
	<CAJ86T=VMoW-hX-Y6xPy835Hfn4W3Wqbn_s+TCYWfHZ42Oc368w@mail.gmail.com>
	<20150415100850.GA2338@jama>
	<CAJ86T=UwLFJ5LOAg48Z2jM973JyWc68EiEER9tADc+7qQdnDWQ@mail.gmail.com>
	<CAMKF1soYC_BnMGv4Su5Z+6v1oFKpYCfRWvFxdnPXp9i04BAHHQ@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE Core mailing list <Openembedded-core@lists.openembedded.org>
Subject: Re: autom4te segfault in Dumper.so when configuring intltool
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
X-List-Received-Date: Fri, 17 Apr 2015 07:15:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-04-16 at 22:09 -0400, Khem Raj wrote:
> On Wed, Apr 15, 2015 at 5:37 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > Hiding OE sysroot perl when configuring intltool and using only host
> > perl does also prevent the segfault.
> >
> > I'm not sure what the correct fix is though. Perhaps have the
> > autoconf-native scripts run host perl via a wrapper which removes any
> > reference to OE sysroot perl from the PATH?
> 
> Not sure why Richard suggested that but may be his intention was to
> build automake-native early enough since perl takes a bit of time to
> build and it would serialize the build but we dont know unless we
> measure, may be there are enough native tools to build to keep
> processors spinning while its building perl-native
> in theory correct fix is to add dependency on perl native for autoconf
> native and do the necessary surgeries (if required to use perl-native)

autoconf-native is near enough one of the primary pieces of the
dependency chain. Having it depend on perl-native is a very very bad
idea, if its possible at all. It might be "correct" in principle but in
practise its not workable.

Cheers,

Richard




