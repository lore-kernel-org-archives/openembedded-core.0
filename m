Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ADC82601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 15:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u22FNTYV024949; Wed, 2 Mar 2016 15:23:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Alk7Q-06FUGy; Wed,  2 Mar 2016 15:23:29 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u22FNPCE024945
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Mar 2016 15:23:26 GMT
Message-ID: <1456932205.25131.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Date: Wed, 02 Mar 2016 15:23:25 +0000
In-Reply-To: <CAMKF1sqNKzREAVcpQQry9preJf0Jnj6U245CcTE-vpubQ9jJ1w@mail.gmail.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
	<89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
	<56D5A3B1.8080008@linux.intel.com>
	<CAMKF1sqDVjNH_XLhbY+86BdFx9vZZpaw8j-XNDTM67st=LWW=Q@mail.gmail.com>
	<56D6F62C.2020000@linux.intel.com>
	<CAMKF1sqNKzREAVcpQQry9preJf0Jnj6U245CcTE-vpubQ9jJ1w@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Wed, 02 Mar 2016 15:23:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-02 at 06:30 -0800, Khem Raj wrote:
> On Wed, Mar 2, 2016 at 6:18 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > his probably could be however OE-Core supports musl and poky
> > > -tiny
> > > defaults to it. It will be good to test
> > > changes for it when changing OE-Core at the least bitbake -cpatch
> > > <recipe>
> > 
> > 
> > Yes, but that's a job for autobuilder,
> 
> There is a musl job on autobuilder. Not sure if its run daily. Ross ?

Its run manually at the moment. We've been working to get to the point
where its reliable, then we'll add it to the list of build tests we
run. I think we're now at that point actually.

Beth: Should we enable musl and no-x11 by default?

Cheers,

Richard

