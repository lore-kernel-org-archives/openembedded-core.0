Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2B47970F2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 20:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKoZQW021945; Thu, 21 Aug 2014 21:50:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 15ygSy18Wqyu; Thu, 21 Aug 2014 21:50:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKoWRv021942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Aug 2014 21:50:33 +0100
Message-ID: <1408654232.1669.123.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>
Date: Thu, 21 Aug 2014 21:50:32 +0100
In-Reply-To: <53F64823.7070705@gmail.com>
References: <1408316808-13486-1-git-send-email-akuster808@gmail.com>
	<1408606690.1669.103.camel@ted> <53F60350.4010005@gmail.com>
	<CAP9ODKr7T+64hTcNr6-L=c11RxzX_QPXQioeu6hx5LZatTFx4w@mail.gmail.com>
	<53F64823.7070705@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] nettle: update nettle to version 3.0
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
X-List-Received-Date: Thu, 21 Aug 2014 20:50:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-21 at 12:27 -0700, akuster808 wrote:
> 
> On 08/21/2014 09:55 AM, Otavio Salvador wrote:
> > On Thu, Aug 21, 2014 at 11:33 AM, akuster808 <akuster808@gmail.com> wrote:
> >>
> >>
> >> On 08/21/2014 12:38 AM, Richard Purdie wrote:
> >>>
> >>> On Sun, 2014-08-17 at 16:06 -0700, Armin Kuster wrote:
> >>>>
> >>>> With this update, LGPLv3 or GPLv3 where  added to many files.
> >>>> Each supported algorithms govern which license they want.
> >>>> Many are stated as  "ether v2 or v3 or both in parallel".
> >>>> Update license to be v2 or LGPLv3 or GPLv3.
> >>>>
> >>>> The previous verion had one GPLv3 file so the license was incorrect.
> >>>
> >>>
> >>> With this change, "bitbke gnutls" stops working.
> >>>
> >>
> >>   gnutls is targeting to port to nettle 3.0 in gnutls version 3.4.
> >>
> >> what should I do?
> >
> > Revert for now? :)
> 
> Its only in the patch queue from what i can tell. Do I ask for it to be 
> dropped or do send a 'revert' patch for the patch?

It didn't make it into master, so no, nothing to be done.

Cheers,

Richard


