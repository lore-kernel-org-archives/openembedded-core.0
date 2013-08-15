Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id D483B62176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 02:39:26 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id uz19so260147obc.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 19:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Iy+uvKwHcnh46LHJXkcLcNnToD6ZOHJRuxL7plepxBY=;
	b=rZ9uUJBSar0r0mRHnjFysortnELyiwn5VPADNrFz/qAM07KQqVyPYocj8G30VbiCrS
	3zurIMVytDotk+rIHvWAj50JErwSjZkXBeY7Ny0Wh9T7hpoEwHUtaNX4fs/ZEOF3s1iy
	lrpvuxQYM3caVgbWlvG9Wq4v66PKfvLvT5xIT4OzqAisWaiP3KS/qpEPBHW84sO0yVPj
	I87tW9P4lmqg3qn9YYWRScuisdEscq1oDHT4oj9eFbfbTo+QI3NeIyg5B5+4f4qIwuSN
	1NKw9UCxgqHkggaFoGnEEjiMsTIGyMSQwv74zZ/S0vyVBEY5DAJJPE9CXZCXZ0b+K+eI
	eO8w==
MIME-Version: 1.0
X-Received: by 10.60.97.1 with SMTP id dw1mr12167039oeb.1.1376534367216; Wed,
	14 Aug 2013 19:39:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 14 Aug 2013 19:39:26 -0700 (PDT)
In-Reply-To: <520B915E.2080506@topic.nl>
References: <1376401955-5676-1-git-send-email-otavio@ossystems.com.br>
	<520B915E.2080506@topic.nl>
Date: Wed, 14 Aug 2013 23:39:26 -0300
X-Google-Sender-Auth: WBcR7EBsrRZh8-gIRWomZjX4cMw
Message-ID: <CAP9ODKod7r7gnwkS1rGNdv3_x9N47gfj+rrv8320n2-L1TT64Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] linux-dtb: Use kernel build system to generate the dtb files
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
X-List-Received-Date: Thu, 15 Aug 2013 02:39:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 14, 2013 at 11:17 AM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
>
> On 08/13/2013 03:52 PM, Otavio Salvador wrote:
>>
>> As the Linux kernel, unconditionally, builds the dtc application and
>> it is the compatible version with the DeviceTree files shipped within
>> the kernel it is better to use it and the kernel build system to
>> generate the dtb files.
>>
>> Some DeviceTree files rely on CPP and kernel headers to be able to
>> generate the dtb binary contents and it is harder to replicate it
>> outside of Linux kernel build system so we /use/ it.
>>
>> To comply with these assumptions we need to use the dtb file when
>> calling 'make' instead of pointing to the DeviceTree source file; the
>> code has been made backward compatible but it is advised to move to
>> the new definition to avoid warnings as:
>>
>> ,----[ Original definition ]
>> | KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/imx6q-sabresd.dts"
>> `----
>>
>> Becomes:
>>
>> ,----[ New definition ]
>> | KERNEL_DEVICETREE = "imx6q-sabresd.dtb"
>> `----
>
>
> I currently have a "bbappend" that adds a DTB file from outside the kernel
> (listing driver configuration that is implemented in the FPGA part of the
> SOC). The DTB file /include/s files from the kernel (that is, it gets
> everything from the standard files and adds a single device).
>
> How would I go about adding this after this change?

Apply a patch?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

