Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECF772050
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 11:54:06 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id t59so1279090yho.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=/GBQbhIGqdrMderMZJL6TjZ/JX2zqANYHKZfyoFbC4s=;
	b=t4Wgsg8zdBeQsurc51ZkiwUw35A1f6E8aOJoKxtycWDyAJLEiQMHO4R9raAAjptwK5
	8kZ2vZDSXb6+UBBTOsLCs/hJ5DKegG28szEywC8+X45iJr20/KsIlUffh802uQAzNlJb
	Pv9JK9JELAfb2ElJKM8OFNQPr4fZkHiJpvYPEPutquQnrINNUr8g/J/wZ8ESXxPH2eLT
	GzZeyRpdgdH1o0kJngr3AaFUB6/IW7dY52Pm4cNwwM+8mYkrY11e5SynIC0RWbHYza1F
	eYx1XR2gl65FXX8Us5REDe46rYtd4I7/IZoZOxe8SY5ehaveW1RXdFuPpFGvDroyagJS
	id5A==
MIME-Version: 1.0
X-Received: by 10.236.231.161 with SMTP id l31mr3309266yhq.104.1415274846977; 
	Thu, 06 Nov 2014 03:54:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Thu, 6 Nov 2014 03:54:06 -0800 (PST)
In-Reply-To: <545AAA30.40604@linux.intel.com>
References: <CAP9ODKqZU0SpC_T_jYLExYKYLXQkLyv_7Vy7GW-9uA=_wBjLhQ@mail.gmail.com>
	<545AAA30.40604@linux.intel.com>
Date: Thu, 6 Nov 2014 09:54:06 -0200
X-Google-Sender-Auth: NGHug7_1X01hf7UvH8DuO8Q4pIg
Message-ID: <CAP9ODKqKvLR6QUY5gpvCjKkwWwMsf3Uv30wFZkeDxPAcFSyymA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-daisy] Pseudo backport breaks build in some hosts
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
X-List-Received-Date: Thu, 06 Nov 2014 11:54:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 5, 2014 at 8:52 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 11/05/2014 12:34 PM, Otavio Salvador wrote:
>> In clean hosts the pseudo build is broken. It seems to be lacking the
>> attr dependency which has been added during the Dizzy development
>> cycle but not included when doing the backport for Daisy; I suspect it
>> has not been detected in Yocto Project AB because it should have attr
>> headers available.
>
> We actually just completed a full pass QA cycle on what was to be 1.6.2rc1,
> we found a couple of issues that are being address (like we forgot to bump
> the actual Poky DISTRO_VERSION and the build-appliance rev). Along with a
> couple more CVE patches that have come in.  As you point out it did go
> through a full AB, which has different Linux OS setups.  The fact that this
> was missed, I am not sure.

Well, last two big updates to Daisy has had issues; so I think we need
to improve the process.

One possibility which came to my mind is if you announce you are
intending to merge daisy-next on mailing list and give some days for
'regressions report' before merging.

I am not opposed to minor things go in during the process (or even
direct to daisy) but version bumps and big pulls would be good.

>> We seem to need a better way to test backports as this is the second
>> time backports has included regressions. I think we ought to have a
>> daisy-next (and likely dizzy-next) branches with intended fixes for
>> easy testing outside of Yocto Project AB and get wider exposure for
>> different host setups.
>>
> So I have been pushing my changes to daisy-next prior to them being merged
> into daisy itself.  You are welcome to pull from it, test it and report
> back, just beware that it can be rebased.

Great.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

