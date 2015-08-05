Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id AD0E17646E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 02:24:23 +0000 (UTC)
Received: by ykoo205 with SMTP id o205so24563538yko.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 19:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=a0CIFYu3zGuU8dgigb7IxMRsAFO5FNqduaCwB78glQk=;
	b=dxoTR8d0jgHQNPtbObbypwZhIYIKrjlXKzqoucZ5tvsA3cvjBBlnh6X2tj2zh8OqO7
	RwlMXYHruzoMLVSPWRUXD6yIqJTcqa+KzCA6fVfJdELPEv2cIZrw8iwIzz2pykklLq0n
	uY+QbYuvCB/5aroVXXNRNPwA0fykKFicnRn1rwFiG0VwKy8jroYdz6LcSuWNbrSW+KCi
	io0yvc7ZZt5xkc0p2dfxBza2bl8Kv8jfRqaYfdX0aTUkxK+IeVkSYQJd/uBMedIAP7L1
	qZUlDrHk6js51/HXlpQjbztEkEMpTn40CAp9FinQt+J9tF7ea9azZOxaYIY7NMQt4F3l
	9CCQ==
MIME-Version: 1.0
X-Received: by 10.129.130.69 with SMTP id s66mr7126030ywf.62.1438741463682;
	Tue, 04 Aug 2015 19:24:23 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Tue, 4 Aug 2015 19:24:23 -0700 (PDT)
In-Reply-To: <CAP9ODKqkATYxqrHme7dJVzg5gSzKOEuG2NJCfksYE+8XE0W=3g@mail.gmail.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
	<55C0F729.5000908@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D471A@ORSMSX109.amr.corp.intel.com>
	<55C110DA.6050404@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D4896@ORSMSX109.amr.corp.intel.com>
	<CAP9ODKqkATYxqrHme7dJVzg5gSzKOEuG2NJCfksYE+8XE0W=3g@mail.gmail.com>
Date: Tue, 4 Aug 2015 23:24:23 -0300
Message-ID: <CADkTA4Oe+COKFAcayZ_HPeuVDKyDTNJ__u4t07FWgpgmc3qGaA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Support for VirtualBox guest additions
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
X-List-Received-Date: Wed, 05 Aug 2015 02:24:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 4, 2015 at 6:31 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
>
> On Tue, Aug 4, 2015 at 6:27 PM, Bystricky, Juro <juro.bystricky@intel.com>
> wrote:
>>
>> The Build Appliance is just one VM that can benefit from VirtualBox guest
>> additions.
>> There are other VM implementations, where a small size is quite important.
>> All I am trying to say is, that we need to be able to recreate the same
>> contents
>> as:
>>
>> apt-get install linux-headers-$(uname -r)
>>
>> I don't have any strong feelings regarding if an already existing recipe
>> needs to be modified
>> or we need a separate recipe.
>
>
> I second this request.

We need to fix devsrc .. we can't create yet another recipe that does exactly
the same thing.

Either strip the functionality from devsrc or fix it.

linux-headers and linux-libc-headers are too closely named .. we need less
confusion here, not more.

Bruce

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

