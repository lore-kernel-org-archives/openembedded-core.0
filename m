Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (unknown [209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 31576660CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 16:46:12 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 19so1101755ykq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=EUXM/LMAbbPfmUip+5xzPgTnq+IaPoBaxQcCzAMs9pE=;
	b=lUdWrAxGAKZK0jrexeOD5ZquzULhb36LSqVUPmJSazaoOeyz8TBcTnrnPgamerju1f
	P+tfvy8EgT5mei9bczF0T+WU3RaAwKnzZwiuCgYEE6O4h8YNcNlO0fLMhWhxL5K/bR+5
	zdeoVo2bEcG5pc4tqsU5XJCAD8DSrpxLTukHIaYABNzaloYzgEZ5/eeHItM8cWvOoDLW
	vmjnN3fqW2QkVdn+alLTSykgwxl9qoXqxMH/1VFvVA2JFqEPPn2eMuDljsCaZALBfpkh
	4QTeUj5nFQwfBE6yTC3BcMloFXvihKaS6JlVhrGnAMenZxT+J0MYLTCCTBD4qIcSG9Vu
	n7Ew==
MIME-Version: 1.0
X-Received: by 10.236.230.6 with SMTP id i6mr17097921yhq.14.1400172373051;
	Thu, 15 May 2014 09:46:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Thu, 15 May 2014 09:46:12 -0700 (PDT)
In-Reply-To: <1850820.V8BJsiNnsd@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1400118419.git.rongqing.li@windriver.com>
	<1850820.V8BJsiNnsd@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 15 May 2014 13:46:12 -0300
X-Google-Sender-Auth: zEJPWVh0_G1KdVLNgMXQjYbNABw
Message-ID: <CAP9ODKqvJoOw12gAb=Crxntz=ryvEXA7oF-eiO5HoHrHDhx2DQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/12] forward 12 CVE patches for ffmpeg
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
X-List-Received-Date: Thu, 15 May 2014 16:46:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 15, 2014 at 5:51 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Roy,
>
> On Thursday 15 May 2014 10:03:50 rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> The following changes since commit 58417093d7ce83c8a2f683a356fddc23aaee5e8e:
>>
>>   wic: Extend indirect string connection to support image names and rootfs
>> (2014-05-13 19:35:06 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib roy/ffmpeg-1
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-1
>>
>> Yue Tao (12):
>>   Security Advisory - ffmpeg - CVE-2014-2263
>>   Security Advisory - ffmpeg - CVE-2013-0865
>>   Security Advisory - ffmpeg - CVE-2014-2099
>>   Security Advisory - ffmpeg - CVE-2013-0868
>>   Security Advisory - ffmpeg - CVE-2013-0845
>>   Security Advisory - ffmpeg - CVE-2013-0852
>>   Security Advisory - ffmpeg - CVE-2013-0858
>>   Security Advisory - ffmpeg - CVE-2013-0851
>>   Security Advisory - ffmpeg - CVE-2013-0854
>>   Security Advisory - ffmpeg - CVE-2013-0856
>>   Security Advisory - ffmpeg - CVE-2013-0850
>>   Security Advisory - ffmpeg - CVE-2013-0849
>
> Note that whilst we should apply these patches, they won't actually have any
> effect on unmodified builds because we do not use gst-ffmpeg's internal copy of
> ffmpeg, we use libav instead. So if any of these fixes apply to libav (or if
> there are equivalent fixes) we will need to apply them to libav.

And please rework the commit logs for:

ffmpeg: fix for Security Advisory CVE-2013-0849

or anything similar, per your personal choice. But please put the
recipe name as prefix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

