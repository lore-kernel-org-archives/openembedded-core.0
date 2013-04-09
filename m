Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UPVSg-0007LD-VB
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 12:07:39 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 0D47F21303;
	Tue,  9 Apr 2013 11:50:11 +0200 (CEST)
Message-ID: <5163E458.1080709@pseudoterminal.org>
Date: Tue, 09 Apr 2013 11:50:16 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <5162038C.2020706@pseudoterminal.org>
	<51634C0A.5040300@pseudoterminal.org>
	<CAJTo0La+4zFbSu1s8mDQ=oWUEzasRgi9Ufg433qbB=8sbde1gw@mail.gmail.com>
In-Reply-To: <CAJTo0La+4zFbSu1s8mDQ=oWUEzasRgi9Ufg433qbB=8sbde1gw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: gstreamer 1.0 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 10:07:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-09 11:32, Burton, Ross wrote:
> On 9 April 2013 00:00, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>> thinking about this whole issue I began to wonder: why is gstreamer in
>> oe-core and not in meta-multimedia?
>> wouldnt it be easier then to move liborc into meta-multimedia as well?
>> Or is gstreamer considered an essential component for many installations,
>> thus justifying its presence in oe-core?
> Yes, it's common enough, and I'd support moving liborc to oe-core in 1.5.
>
> There's always a grey area for oe-core verses meta-something, but
> there's no point in oe-core just consisting of gcc and libc.
>
> Ross

Okay, sounds good. But just liborc? Or yasm as well? yasm is crucial for 
ffmpeg and libav.

Carlos


