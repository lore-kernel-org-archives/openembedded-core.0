Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SeTIt-0002nU-0r
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:46:47 +0200
Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by mga14.intel.com with ESMTP/TLS/RC4-MD5; 12 Jun 2012 08:36:11 -0700
Received: by vcbfk26 with SMTP id fk26so2675024vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 08:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=uptv2nHy/UiWT0T1iBZgn5yfHG6p7EnbNil++BIEg+w=;
	b=Q5pNWavkCTEd91BAXWoIHoKYCK9qFpzD08jTSguA7hknci09oBk78ToG4+cvNqgKAU
	riiFBCn47bTnekSSOOX30E2LACkqpIkLrDTlcGCx3CuBf/t0ApFleqo1qWlifF7DoQZW
	KGHICHxAMcgPzvU4dwSEjJ6PRR+B8xdC87TQYJcfYJjvXJRO3YRprFPNnCAb/WlTpdJl
	BFl6Wk9HAxQe8OnWD662188ndbDG8LikSIe9/wmmxeUsaYO5R+FIWbXpmW1BXEnYR7wC
	L5xieWJfMcl3djRiCEc8qV+IoDx3ezs8zC9Y3TKWTh2BR8w/GIMeppuzyPmXmq5jPBRo
	b8Zw==
Received: by 10.220.157.14 with SMTP id z14mr14962135vcw.73.1339515367565;
	Tue, 12 Jun 2012 08:36:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.169.200 with HTTP; Tue, 12 Jun 2012 08:35:47 -0700 (PDT)
In-Reply-To: <2704914.5qldZ3P3Ag@helios>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
	<CAMZjud3vpBnst6PWtSq-io+5CPZZdCCM7whOOSWbi9YCzbE7sQ@mail.gmail.com>
	<2704914.5qldZ3P3Ag@helios>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 12 Jun 2012 18:35:47 +0300
Message-ID: <CAMZjud2bgwedLs+V5GKeb5GH=5vgCXgFPUdAP19s1uLn-fCceA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnPWYmcvKGDJKxkSw2PiOGOgmfQjKryEqU4yuVT+joXY3Z3Tkm5m4MD5mlfWuHYA/h3fvg6
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Tue, 12 Jun 2012 15:46:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Tue, Jun 12, 2012 at 6:25 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 12 June 2012 18:13:35 Marinescu, Bogdan A wrote:
>> On Tue, Jun 12, 2012 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > You have to build it on uclibc to see if you can drop this patch or not.
>>
>> Thanks for your reply. I built with uclibc and the build succeeded.
>> Not sure how to test it though. Is there a 'standard' image that I can
>> build in order to test? I tried core-image-lsb, but it fails with an
>> error.
>
> Any core-image-* would do e.g. core-image-minimal, and you could just use
> CORE_IMAGE_EXTRA_INSTALL += "strace" in your local.conf to have strace
> installed in the image by default for the purpose of doing this test.

Thank you. I've tried that, but I keep getting this error:

ERROR: QA Issue: package libiconv contains bad RPATH
$ORIGIN/../lib:/ssd/build/tmp/work/i586-poky-linux-uclibc/libiconv-1.14-r1/image/usr/lib
in file /ssd/build/tmp/work/i586-poky-linux-uclibc/libiconv-1.14-r1/packages-split/libiconv/usr/bin/iconv

Is this a known issue?

Thanks,
Bogdan

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


