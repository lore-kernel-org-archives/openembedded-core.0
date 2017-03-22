Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 859F272F0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 00:00:04 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id l37so137402726wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 17:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XTUmqnbic9vcyIPuUyOIAOKENkpdInjOcvBFd31R8k0=;
	b=Ef40+ILqnmztrfG0af1+HV+KUPn3I7CzlRQ8TOSlkFcLTMPXwM5UxYuLyqMGIPZSxL
	lb0nD7THPWxfxVHPbsYi16r2ytnWRQeEPr2WnZGkNEa1+EvTJMnIzYuHtFmqdQG6CytQ
	qw/Hu3mHIXKwhvyK0DdFEScQMiTK6tuQJOoV6kKWofqDrwsX59Yz+GtrK31rZW9+pZVL
	mDgQxCmHp0ZU6zRiNSOi/+r4XGdDg9FkRJs3qG1IBjb6N1HD8Uvman6puoILlAYqZE9W
	LKCuPiVBHNvAg+zmxnnWgVIxLaXZbW1br5sdHYeqM3rjbCY1/cxMrHDLeaaMlHrLAbj+
	56hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XTUmqnbic9vcyIPuUyOIAOKENkpdInjOcvBFd31R8k0=;
	b=uiDzH1g4X7ilr5iExERndgEYGmeqZJQHXw9fDo8n9nIwl0VGtUSuOFdXstMKp7XTuA
	RaRsULkwbAaSEKzLKD2mN5GcCbRxYXVDcCRb6SZPOQWg49r1b9D3tcVk7ctg2rD+crbl
	TCaUztNaHCP/ROkGVibM2jjcl99I5uN+GrsDmaJtD/LAgS6W0EGInDEIHYoLdhHDg0Un
	YXdlBOTwtlSP5ivKLt+AmAuorI2zSEDoRD/CA6NDJT696C2t5RkjBeeJ5fN/ZZYR1ziz
	ejignR0KWOrPdCikz2N2aIROPujf+eVkpxePobRLPO7zVVhW+S7NcH/fuqtBRDBD8c5b
	w/lQ==
X-Gm-Message-State: AFeK/H08919yYjXXVUYuO/H3yG0Ev/09se955EjphhM1WIbLnRP0+o0wTTuREmYJHz03zCazlPdNnmndafecAA==
X-Received: by 10.223.139.196 with SMTP id w4mr39281482wra.172.1490227205214; 
	Wed, 22 Mar 2017 17:00:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 22 Mar 2017 16:59:34 -0700 (PDT)
In-Reply-To: <CAJ86T=XbcuU0-oWQ4z_t8--HCyQYUKx8P7qzO6rkGcH7C6MN2w@mail.gmail.com>
References: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
	<CAMKF1sq0b7U2wZo=65ox=KZ+JAq1oScfxpzCdiQRT3iC_Y5hNw@mail.gmail.com>
	<CAJ86T=XbcuU0-oWQ4z_t8--HCyQYUKx8P7qzO6rkGcH7C6MN2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Mar 2017 16:59:34 -0700
Message-ID: <CAMKF1sp5Q+Vcr0x1HwtFZRoDiWFo8wDHq1XJjoAE3mxBz=RYZQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Using MACHINE_FEATURES in a native recipe
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
X-List-Received-Date: Thu, 23 Mar 2017 00:00:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 4:00 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Mar 22, 2017 at 2:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Mar 22, 2017 at 2:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> Currently native.bbclass clears MACHINEOVERRIDES but leaves
>>> MACHINE_FEATURES alone. Is that an oversight? Or is there ever a
>>> legitimate reason for a native recipe to have a dependency on
>>> MACHINE_FEATURES?
>>
>> MACHINE_FEATURES is specific to target only.
>
> Right, the question is really whether we should try to enforce that or not.
>

we are better off to nullify it for native case. Worth a pull request :)

