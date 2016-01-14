Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id CDB0A731E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:16:07 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id u188so365405379wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nvHjBsT/ZxdLFeDxKJMiGO3hTm3o98oLB7BFNndo/HA=;
	b=IRhXRLKj1wjiOkT40zJLolzuGZwHBYdgZ2QYdW254b5hwwpZXQ7TJxAIPA17wNi/Ge
	HJBRwckQg9MImZpJJ/NXiwoaFLsIOgiFyyk+Prgp2Ox3Bx0KsGyGrwXDS3O01L1ILddY
	B5EA404Uy5RhGjRfgymhBryGCbDaU3knYoyPE+PgL1pa3XRmDRLMn0Y07CuAQaWWIWuA
	i+uWAk+OJc3mCfmXxcHga0M5bpdWHaX5gGZhjPHDZz3kH24jfJdVNzVpEDrhwn9B+wdI
	BdVLXvE+PvaeyjIg46Lx+km9MLjv3e6nsDuUoEF5xmQV+HgZ70eHY+AJ3b+S+OgZc7sR
	4NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nvHjBsT/ZxdLFeDxKJMiGO3hTm3o98oLB7BFNndo/HA=;
	b=Cgt+ItzUhaYKl0IKUEWe+w9c7eoBpseFoOUixkpkDTkvZ7pms0tvz9NwOTsWhVvAFx
	Ap8Ky7GJNTAUZYttgMUKDXd9g+fVgA5zRRYfUMUfs2JlN1/IMm/DsmvPCP1tHWCPjWD+
	OYC/6twcz9BHHe/zy/619wj/NCqLawdB4mxRO1zcRUTkDastY6GZ2lpx1YshIwybRt1T
	vC+bm9gQjSJdeBxcp2rYAwuIm5hQzSsfK/9CSywP3vTQOhWrwB7G+DTQAan/FPywAlkA
	pHrLbGq5c+IHxTcYjBqbMdhvYl5U0fJuSi/mRh934+cF8cMiLbeeReSSUjxfXCtMblYT
	2UAg==
X-Gm-Message-State: ALoCoQnbn9uwLFC1ehx+a5lWfXF6hIlyOEiIortYcF3SKGQuytfSO1788UoT8vZqmoXucSDPM2o/ikkjHF7mhu7aOCsD1bEcZQ==
MIME-Version: 1.0
X-Received: by 10.28.98.133 with SMTP id w127mr6943434wmb.4.1452806167659;
	Thu, 14 Jan 2016 13:16:07 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 14 Jan 2016 13:16:07 -0800 (PST)
In-Reply-To: <F80AC6C0-500C-42FD-B35F-F9F53FF4F446@gmail.com>
References: <1450746422-10755-1-git-send-email-armccurdy@gmail.com>
	<F80AC6C0-500C-42FD-B35F-F9F53FF4F446@gmail.com>
Date: Thu, 14 Jan 2016 13:16:07 -0800
Message-ID: <CAJ86T=UsB=E=mGyJK8xZ1K6HFkQniJFbf5n23x9xibjznC-upg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: enable bfd linker workaround for all arm targets
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
X-List-Received-Date: Thu, 14 Jan 2016 21:16:08 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On Thu, Jan 14, 2016 at 10:25 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Andre
>
> I have a fix for this issue in binutils
>
> can you try it out if it works for you ?
>
> https://github.com/kraj/openembedded-core/commit/0e35ad5a35262cfb7a6249ce158f76d1399d6cb4

I cherry picked 5803c581 from your master branch.

It does indeed seem to fix the errors previously seen with the gold linker.

>> On Dec 21, 2015, at 5:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Although the gold linker problems with DirectFB have only so far been
>> observed with armv7a, they could potentially affect future arm targets
>> too. Since there's no particular downside to using the bfd linker for
>> DirectFB, apply the workaround to all arm targets.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-graphics/directfb/directfb.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
>> index b905ab0..603aba3 100644
>> --- a/meta/recipes-graphics/directfb/directfb.inc
>> +++ b/meta/recipes-graphics/directfb/directfb.inc
>> @@ -23,7 +23,7 @@ S = "${WORKDIR}/DirectFB-${PV}"
>> LDFLAGS_append =" -lts -lm"
>>
>> # Workaround for linking issues seen with armv7a + gold
>> -LDFLAGS_append_armv7a = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
>> +LDFLAGS_append_arm = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
>>
>> BINCONFIG = "${bindir}/directfb-config"
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

