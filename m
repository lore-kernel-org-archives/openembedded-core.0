Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 160A873E36
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 12:17:56 +0000 (UTC)
Received: by igcqs7 with SMTP id qs7so31103699igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ciuhDBcmgaBqWAV1pOSJeR4INYlLi4yl+ubBIjXUPZY=;
	b=Rur6+MHy31vbE2IZxtei/m9qz9DUVADVhdf++TX92t6Z3p6ZLeMedCSSGE3MwWdSyX
	zJxXLGrMbOAmR3P9YO3bVf2gtKaBZr8V+J6q8GAciWzfocNhKcKnZCG4FX+xg7QvuRFm
	989LbbZnePt+XWQ5EUTL2NIzQkV8Uz4Et4lIDy3hyUgvCeuj59XZimkVQlMz3RiUeES3
	kIVNiABY5yE1VWFudk30BMyt7DAn/gUxz8rlvz5W/BHe8D1g/jxqJEorcopK4G4z5UAm
	hfK2t5Qc6XtuQK/boEiP8g88cT+B2Q9rxwKhlXgN6PO4bILQTa74ZwlbnGfvnoeuh7R/
	VTzw==
MIME-Version: 1.0
X-Received: by 10.42.206.5 with SMTP id fs5mr16640656icb.19.1436271477154;
	Tue, 07 Jul 2015 05:17:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.36.218.7 with HTTP; Tue, 7 Jul 2015 05:17:57 -0700 (PDT)
In-Reply-To: <CAJTo0Lb1Nth4VGocNqTDWFnrzO4_FGFbeg6Akk7ZmSvFLPP6Ew@mail.gmail.com>
References: <alpine.LFD.2.11.1502190508290.29947@localhost>
	<CAF3SDA6sUY=4cg-pihtftzTNDREm5cKMS7MqQp4DJ9M81ez5UQ@mail.gmail.com>
	<87vbdwy88m.fsf@weregild.amer.corp.natinst.com>
	<CAJTo0Lb1Nth4VGocNqTDWFnrzO4_FGFbeg6Akk7ZmSvFLPP6Ew@mail.gmail.com>
Date: Tue, 7 Jul 2015 09:17:57 -0300
X-Google-Sender-Auth: ub8JrFCRBBIMt2YHUH-GzI9238Y
Message-ID: <CAP9ODKpctCYLujwOt9FyCit1qrpn8p_=CdM5g6Ov4zkVJSEOeA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	"Daniel." <danielhilst@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross-localedef-native_2.20.bb: fix for gcc5
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
X-List-Received-Date: Tue, 07 Jul 2015 12:17:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 7, 2015 at 5:29 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 7 July 2015 at 03:54, Richard Tollerton <rich.tollerton@ni.com> wrote:
>>
>> The build of cross-localedef-native is observed to fail under gcc5 hosts
>> with multiple definition errors, e.g.:
>
>
> Is this patch intended for fido?  Master doesn't have 2.20 anymore (2.21)
> and I believe that works with gcc5 hosts.

I would prefer to upgrade to 2.21, if this is tthe case.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

