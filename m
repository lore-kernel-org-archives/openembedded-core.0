Return-Path: <cazfi74@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id DC6666B25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 20:26:43 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id m4so489248qcy.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 13:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=g0PIP6PxFfacqoXDvLB5QlIDNFCD7RIBcanFiY1d4g4=;
	b=SJ13prffTV7ZsOM/XtOshB9lyXaxhb8uAmEBHuZGX4Vb2xMy9ZN/An5lAie+SS7sPe
	ix7TH+vbB99Wiq7uJezIH3E0QXOuMBjMSHgxzku3doYjtxziv+l6zvkJ77w4oxmWFTK6
	rIRnqF6pz3ucCR1uB3XD9R52u/z6dhElLsUC2jW7fWYXPRijII765aArw6qYdJ13MlTk
	oePQWPtpx1K2fpkV1s/GGGy0OP7FkPVg/a8BM1ObPByQ4ki/G8lil0PvVPNW0LjxOwi9
	wEvk6XIsYvW7nArRKdhUxdWP6wvdiaJAUXGp0cTj8v6qxTsjI+1XuIBcJPDR6kUr1u6r
	XJUA==
MIME-Version: 1.0
X-Received: by 10.224.65.3 with SMTP id g3mr6267568qai.42.1377030404202; Tue,
	20 Aug 2013 13:26:44 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Tue, 20 Aug 2013 13:26:44 -0700 (PDT)
In-Reply-To: <11672169.pPNsTrMMam@helios>
References: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
	<11672169.pPNsTrMMam@helios>
Date: Tue, 20 Aug 2013 23:26:44 +0300
Message-ID: <CAF6bG8e=cCDyJGDNebVqaNSJ31PNYCUQ9xPNf_4p+mDVDUMbwA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu-native build regularly failing
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
X-List-Received-Date: Tue, 20 Aug 2013 20:26:45 -0000
Content-Type: text/plain; charset=UTF-8

On 20 August 2013 16:32, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Tuesday 20 August 2013 15:51:21 Marko Lindqvist wrote:
>> Build of qemu-native regularly fails with:
>> |   LINK  sh4-softmmu/qemu-system-sh4
>> |
>> | /usr/lib/x86_64-linux-gnu/libXext.so.6: undefined reference to
>>
>> `_XEatDataWords'
>>
>> | collect2: error: ld returned 1 exit status
>>
>> This might be some dependency missing, as building first some packets
>> (+ more importantly their dependencies) that do not depend on qemu and
>> only then qemu dependant image success.
>
> Do you have something else causing libxext-native to be built by any chance?

 Yes, it seems to be difference between the tree where build fails and
the one where build success that former has no libxext-native built.
Further, I tested just building libxext-native before building
qemu-native, and then the build succeded.


 - ML

