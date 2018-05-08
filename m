Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1F00274AD2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 07:40:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w487e714029807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 8 May 2018 08:40:08 +0100
Message-ID: <1525765207.3857.101.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 May 2018 08:40:07 +0100
In-Reply-To: <CAJ86T=VK+Um4wa6F2EVzQTNiwa8LC1nhTEQrLqH2GBuSzCkbWw@mail.gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VK+Um4wa6F2EVzQTNiwa8LC1nhTEQrLqH2GBuSzCkbWw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [daisy][PATCH 0/6] SRC_URI updates and minor build fixes
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
X-List-Received-Date: Tue, 08 May 2018 07:40:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-05-07 at 18:22 -0700, Andre McCurdy wrote:
> On Tue, Mar 20, 2018 at 7:42 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > 
> > Daisy has now (long since) left upstream maintenance and entered
> > into
> > community support. As a member of a community which still actively
> > develops against this version of OE, I would like to propose the
> > following updates.
> Ping.
> 
> Are these kind of updates OK? Or are there objections to the
> community
> trying to support historical releases? There are many millions of
> devices in the field that I know of which are still being actively
> developed and maintained on top of OE 1.6.

We've discussed "long term" branches for a while. I suggest that we
collect together people who are will to maintain such things and let
them push to a namespace in poky-contrib initially, perhaps in other
repos eventually where we collect these things together.

Perhaps poky-contrib extended-life/daisy? 

If there is common agreement, a group of people could collaborate on
such a branch too...

Cheers,

Richard

