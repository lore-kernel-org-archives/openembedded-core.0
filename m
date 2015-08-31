Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id C98D176D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:22:32 +0000 (UTC)
Received: by wicmc4 with SMTP id mc4so92618wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 06:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=5wqyo1JqViYD05k4zzNxGWR4mi+g+VO18RGG9qnoQhc=;
	b=FB9oLDOL+yUZivW3hNBk3lukfKiKpiaBpjYV0Gq0lO8BWPc/apvogD6RNla6GIhdfY
	tuJdaITXpp9FqxX/Eqg15Wud0HQ5huKZA1CzkI0Oss87xqnwlE/J5mfBWDeNU487JRZ/
	RlOv45vjBZzpDQnV8rIcnIg0/CebkyOAeeesi+cJWzRryX3mf4WS5aZOSdb1U7hQt2+Q
	GBez7nwWtvT7HxAlbiFP8T3JxwEqJlE+om5mkZ9YQoEHUQn6i5+amF+dSIOjYepNeyft
	gIQPQeRDMLsSpviT15NaevszBIdF7m+N3e8vtFWNFQqubDjVmJVS85YTgtuptkTcQ1eq
	uOOQ==
X-Gm-Message-State: ALoCoQlqPpz4Gb5T8CENLU4KX47ZQcqL8pexzcyWhkGjH/2f0VbpTMkb3AUWIl6tC4UNQX7coRJO
X-Received: by 10.180.20.80 with SMTP id l16mr21096035wie.55.1441027353003;
	Mon, 31 Aug 2015 06:22:33 -0700 (PDT)
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com.
	[209.85.212.180]) by smtp.gmail.com with ESMTPSA id
	ja8sm22222354wjb.13.2015.08.31.06.22.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 06:22:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by wicfv10 with SMTP id fv10so69979181wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 06:22:32 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.186.41 with SMTP id fh9mr19979604wic.7.1441027352060;
	Mon, 31 Aug 2015 06:22:32 -0700 (PDT)
Received: by 10.28.135.72 with HTTP; Mon, 31 Aug 2015 06:22:31 -0700 (PDT)
In-Reply-To: <1440843517.32588.7.camel@linuxfoundation.org>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
Date: Mon, 31 Aug 2015 10:22:31 -0300
Message-ID: <CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Mon, 31 Aug 2015 13:22:36 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 29, 2015 at 7:18 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2015-08-29 at 10:43 +0200, Martin Jansa wrote:
>> Did you enable thumb in that qemuarm build?
>>
>>
>> It's disabled by default and multiple components are broken when you
>> enable it, see:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>
> I'm going to draw a line here. People are asking that the old version of
> gmp be brought back due license issues, fine. It doesn't mean that all
> the bugs in said old release should be fixed.
>
> If thumb on arm with old gmp is an issue for people, I'd suggest that
> those people figure out which patches are needed and send the patches.
> Asking Jussi to deal with this isn't right/fair though.

I disagree. If it will be merged it ought to support what we are
testing nowadays otherwise the backlog will be kept growing forever...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

