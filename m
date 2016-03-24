Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5C160746
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 21:14:36 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p65so2455192wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=y2ITLLnLewKVGl6dA5s5TZXyhhHWScEEsoItRcWXULU=;
	b=AjGTtJx8NdDgWeEC9Gao+tyOJiFNAXht5C9dtUn0F90frxH6z2dFLBnsCO1OwxAw/e
	6Uf5/3nUO4KGrTcGYTE9JCSxSviI/Rp94S4zc+cLGYl3KsFSF3oPH7rqRDBAnGQCo4cg
	Thtf/MDpJP/3A6VE2Vhvua7vE9VSdUPsnO2V+sCkud5URPen5kgAQHqNWoM3Grsc5Ssc
	0BiyiaLAw7yTf80Z2u8iV4TpFPhUwVDz+EPnB1UtdkinZhGOhXxBKAyoVscy+7CKk8Mm
	pugKHX+BooMuo7kEUslikzrNXsQjJyge09SkskwLkiLJiemwZTTkngXZR07NyksWGgMr
	y+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=y2ITLLnLewKVGl6dA5s5TZXyhhHWScEEsoItRcWXULU=;
	b=OQpA+Zub7JjbAJbWvjpP4zQdRJJ9Wzx6tytj46fuvA7S9xEztKD09QgSc7yBnOHGf3
	Dy2UJtVkf53LryZHMaxO9fPVI9EiOIUm6VkN8ngPmjLd+HdQK36SBIE5Xba8FXpC+NVB
	BlbmbZh8eUbB2VWW+xB2TIAiLOt1Cz+UAGk5KxTnDXPJfTAUTzKwysmlYxGP/uMcuScO
	BAWVZ+22Rlx8KOSb7P7joUdX7DzwRBb0CiAKBAmx7dM4WEbEbvXretkXHwtdGjf5Y1kt
	Uno/XqRYxGcYgTmFCEKqnOmrYIbbbsvUgqkU+p1xNE4pnZsrBlaF0xllaKaVRTfKsrwT
	zRZA==
X-Gm-Message-State: AD7BkJKv9tatXN4dnO5sGml4rvDlMzpcd2MxDGoH+4lgHcU6aM0IWljfrgKC/Wf3ovUKvNhg/d6rA0FlHqbsCw==
MIME-Version: 1.0
X-Received: by 10.194.242.202 with SMTP id ws10mr11989455wjc.3.1458854076499; 
	Thu, 24 Mar 2016 14:14:36 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Thu, 24 Mar 2016 14:14:36 -0700 (PDT)
In-Reply-To: <CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
	<CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
Date: Thu, 24 Mar 2016 14:14:36 -0700
Message-ID: <CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Alexander Kanevskiy <kad@kad.name>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 24 Mar 2016 21:14:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 1:45 PM, Alexander Kanevskiy <kad@kad.name> wrote:
> On Thu, Mar 24, 2016 at 10:32 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, Mar 24, 2016 at 1:16 PM, Alexander D. Kanevskiy <kad@kad.name>
>> wrote:
>> > Existing compress framework for producing various compressed versions
>> > of images is powerfull enough to be extended for other uses, e.g. to
>> > convert types of images.
>> >
>> > It is possible to use it also to produce image checksums at the time
>> > of image generation. This commit adds support for all supported
>> > at the moment coreutils hashing algorithms: md5, sha1, sha224,
>> > sha256, sha384 and sha512
>> >
>> > Usage:
>> > IMAGE_FSTYPES_append = " hddimg.sha256sum"
>>
>> I guess a common requirement is for hashes of the compressed images,
>> not only the uncompressed image.
>
> you can easily chain them.
> " hddimg.sha256sum hddimg.xz hddimg.xz.sha256sum"

OK. Great. Didn't realise that was going to work!

> --
> br, Alexander Kanevskiy

