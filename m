Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QwMpZ-0007Qs-SJ
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:25:58 +0200
Received: by gxk3 with SMTP id 3so1233738gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 16:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=sTVe/E6ASM8H/7AgNuD6gtA2W3RQjxHNyDA1ZVes8wc=;
	b=QohG9QKAqwyQdAV/ve+t9rc0193TgPYnagTr4Xc9zSVb4nqPw3jM0WPdqm5wWcN0SF
	b2BAQChT8Mu7S99wubQ+/TQdAaMMRXDR7Q59RkbTS5YiBwMrTO0nO6PbqHHjNq9j9kpf
	/OQtzq4r8TC/AxFbcEYowVBdV64sRQ2CersI8=
MIME-Version: 1.0
Received: by 10.100.193.20 with SMTP id q20mr5374305anf.91.1314228070558; Wed,
	24 Aug 2011 16:21:10 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Wed, 24 Aug 2011 16:21:10 -0700 (PDT)
In-Reply-To: <1314227326.5939.149.camel@rex>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
	<1314227326.5939.149.camel@rex>
Date: Wed, 24 Aug 2011 19:21:10 -0400
Message-ID: <CADkTA4Pvsk1jE+QXcRvLC4bSwH15XYkr=D_ZRR_5MOxLcFzBJg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: dvhart@linux.intel.com, saul.wold@intel.com
Subject: Re: [PATCH 0/4] linux-yocto: consolidated kernel pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 23:25:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 7:08 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Hi Bruce,
>
> On Wed, 2011-08-24 at 16:50 -0400, Bruce Ashfield wrote:
>> Here's a consolidated kernel pull request that fixes a series
>> of bugs that have been around for a while and fixes some of the
>> remaining issues from the -rt work that completed last week.
>>
>> Darren: I also updated the -rt source revs and recipe with some
>> streamlining that builds on top of changse that merged last week.
>>
>> The patches have the details of the bugs and fixes.
>>
>> cc: Darren Hart <dvhart@linux.intel.com>
>>
>> The following changes since commit f852199ff598069bbecad4146f13377753df1=
648:
>>
>> =A0 linux-yocto: update meta SRCREVs for beagleboard config changes (201=
1-08-24 16:29:22 -0400)
>>
>> are available in the git repository at:
>> =A0 git://git.pokylinux.org/poky-contrib kernel-oe
>> =A0 http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel-=
oe
>>
>> Bruce Ashfield (4):
>> =A0 kern-tools: allow flexible branch points
>> =A0 linux-yocto-rt: update qemuppc support and streamline variables
>> =A0 linux-yocto: update machines and default configuration
>> =A0 linux-yocto/2.6.37: apmd + get time of day fixes
>
> I took the first two of these. The other two didn't apply and I didn't
> feel happy taking them. I tried to look at the git tree above and I
> couldn't see the patches there...

Really ? That strange .. how could they not apply, they were stacked
and pushed on top of an up to date master. Which part rejected ?

I'll re-push and see what's up.

Bruce

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


