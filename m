Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 370C772043;
	Fri,  7 Nov 2014 15:59:14 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id x19so5414037ier.2
	for <multiple recipients>; Fri, 07 Nov 2014 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7U8183ddlAZNkv7VGEn3b64yd9He7O3RI+Qr+8+/r70=;
	b=GgJL6zj7YJJQBg+rdNb+QMPlm031zsSZVFPoDoXfzQvaCtZQmMKWUoxQ//KPOnaiP1
	qS6yqMkR7lv5SNOuvTj/YmevRdaPlNihNSs9vur2U92qg/k5cd5+GN5htv3CghKNt0pf
	BSsSN5ASk2nIX43mw8Kvqj5ghdM4QeAmq+Vjf+653USMsBozQZ6KN5MKIEL6T8QzPHEf
	g1vmcI8pATLBPwxjy0Pjdtv+agxjFozK7ZQVLpd6yNSkmRTQogNHS22tv21AnAaafWLY
	yQJgbWRb/Af948HykgoiDV3bj1Js/fsl4svrDMgUhMzMr2DqsH+bgSEJJ66iCEubPw/z
	AcUw==
X-Received: by 10.50.138.76 with SMTP id qo12mr4916657igb.13.1415375955700;
	Fri, 07 Nov 2014 07:59:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Fri, 7 Nov 2014 07:58:45 -0800 (PST)
In-Reply-To: <CAMKF1sqUOM=FrvXkhoEkFpxMd0=GZ4deAoJnKDdCQkhesRuc0g@mail.gmail.com>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
	<CAMKF1sqUOM=FrvXkhoEkFpxMd0=GZ4deAoJnKDdCQkhesRuc0g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Nov 2014 07:58:45 -0800
Message-ID: <CAMKF1so1Bv-1EuDHGhLOmQ_XBhm38i-vu=m3fERN4ztgw573pQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 15:59:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 7, 2014 at 7:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Nov 6, 2014 at 9:42 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Hi,
>>
>> So I think it's fair to say that neither GCC nor LLVM are going away anytime
>> soon, both having their respective niches.  Because of this I'm wondering if
>> we should be adding LLVM to oe-core (taking the meta-oe recipes).  GCC will
>> still be the cross-compiler used but LLVM will be available out of the box,
>> for example the Gallium LLVM-based Mesa drivers can be enabled without
>> requiring meta-oe.
>>
>> Anyone have thoughts/comments/objections?
>
> I think it is a good thing to move it to oe-core.

I have been creating copies of it in meta-clang where I was trying to
get clang based
cross compiler working.

>
>>
>> Ross
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

