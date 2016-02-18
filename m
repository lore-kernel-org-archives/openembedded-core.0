Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 92B1F6E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 10:05:08 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id y8so10063910igp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ug31ShB5lZDd5Fe1Hbm1ViYLFJiA+ObJaw39Cu99Y3A=;
	b=cuKdRRPRuDZicOJPvy52tghrGAYEwoG0eNmFan1Ag2jW6ID7swgMFjrlEpqUcKcrjH
	kTb9ndOWUKV8H+LZ+vfWzGOEmp638/BY9TEDQYHV2hPuDsssQONlnAcnt+tYyCatVkDY
	+GdlM1st1rIpfhUWBbvWQ4QFYC1M6jMyCZTeVaLMxRjnZ0/SY5776ey0g9w7L+2ROzrX
	4N0VCgyqTvx8Lm9S1+2i4dDC4vt+x9BemfRy9NEE8XCWF32783i+x7246iOHhXPvHDYz
	IIOLelTnQ6FJiJiVkMcGmpDK2fB26BHQgElERJ8TqO20e1u5sAseEOvWkqrS5gopn17j
	E+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ug31ShB5lZDd5Fe1Hbm1ViYLFJiA+ObJaw39Cu99Y3A=;
	b=a1GZvNyz8vD1ai5crmFj3HnJ6pTWq1v5V7FBtbgOumW8oNiRZIFG8y5Sy0IMK9gqTB
	IPqD6Gtu3dImEGp2r+RY8MXb75lOK3uHebavqG6VGXzV+YNHZjFRWLhjbBkuSXS/j3G9
	PHUxUULvF4O9NStQksZfEUIe72wzhGL4y5wu9AxdVoWjCg0PIQG6GprnADjsmXKcs4pA
	9VEM+WmjAGQJ2mfK9B6XOsDyf1gYZHgLvoJRW8ZnfmxoYdZqCGRgkhss/311/EXhJYza
	FftctCMvmuAZ/2YiD2gLpnr4v+r4eiBPCk9r580z31r55L71Acs2OSxh4Ct227ekig1A
	CA0g==
X-Gm-Message-State: AG10YOTq2WEixwgLOlDT0x8kxxFkPf320puDPXkkYSizU8Vwni6DX18QmET4sqCSIAbUIUAw241BMhlRcxrgOw==
MIME-Version: 1.0
X-Received: by 10.50.78.227 with SMTP id e3mr2241154igx.64.1455789909901; Thu,
	18 Feb 2016 02:05:09 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Thu, 18 Feb 2016 02:05:09 -0800 (PST)
In-Reply-To: <CAP9ODKryst11Tr3QpuCA87pDYdsezEjTwxpb2HOwcVvi32f+pg@mail.gmail.com>
References: <1455460128.16142.400.camel@linuxfoundation.org>
	<CAP9ODKryst11Tr3QpuCA87pDYdsezEjTwxpb2HOwcVvi32f+pg@mail.gmail.com>
Date: Thu, 18 Feb 2016 11:05:09 +0100
Message-ID: <CALbNGRTcuFWpTEpwu1V=m6U2cz+3RiQNFmyXtaV1sg8wxx91Kg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/distro/include: Add no-static-libs.inc
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
X-List-Received-Date: Thu, 18 Feb 2016 10:05:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 15, 2016 at 2:44 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Sun, Feb 14, 2016 at 12:28 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Maintaining this list in a common location is more desireable than
>> everyone doing it themselves. Poky will switch to using this, OE-Core
>> will need to discuss that as its default.
>
> I support this being enabled by default on OE-Core as well.
>
Does 'support' mean you are taking care for recipes this is will break
throughout our layers?

Andreas

