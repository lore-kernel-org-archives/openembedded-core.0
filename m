Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 523CC607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 13:59:44 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id wo10so1645338obc.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=SzXLGU3+YRSWcxYGypzzs7Zn+/L+t92mb9nBVNHg3fo=;
	b=dP/CdQIhu/IGVlO2GtIHpdqEXMPMM6L3Ya1yHxkULVxBWjGDRRfRt+B573qyCx3g5h
	pvNUqc0fkQRuXNn5uX5Aw8Ecb9Y2dHHf5Y/un7mKlrN5g+3tVEBpl1XL9DY0Gnm3r7lB
	f2MJN4oPT3N6f/ZCtzXwthqX4j7RnYZj0x5V3nbe9MScq+Z1pGA1m4B0ttXymbDO5Rup
	IfS4UWfupvBCakREltA4tPp8P8ZnOGoXxh/Vti9VLuu4RiwwmbyVHdTyBeVfOKkRkPG9
	jkaYtRQ5JU6pxXV8diNaABrZMyNV9avZUaJnjrOkUrImhEVgHdfQYic7w5+5ikff/tnw
	jkYw==
MIME-Version: 1.0
X-Received: by 10.60.43.226 with SMTP id z2mr6294894oel.76.1372946384523; Thu,
	04 Jul 2013 06:59:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Thu, 4 Jul 2013 06:59:44 -0700 (PDT)
In-Reply-To: <1511482.DTA2BPqVAC@helios>
References: <1372871077-6363-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAP9ODKrXD9MzMTdqXTWNFiShCPv9TsRXFPcP9AEwQcSPuQjmCQ@mail.gmail.com>
	<1511482.DTA2BPqVAC@helios>
Date: Thu, 4 Jul 2013 10:59:44 -0300
X-Google-Sender-Auth: czW1buWpr-wIEwqT1UU6LNF6ztQ
Message-ID: <CAP9ODKraFbANk_TBJf0riyPq+NY9kSCjK8a-3Ur54W1o-OHhAA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: disable qmeegographicssystemhelper
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
X-List-Received-Date: Thu, 04 Jul 2013 13:59:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 4, 2013 at 10:20 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 04 July 2013 10:10:52 Otavio Salvador wrote:
>> On Wed, Jul 3, 2013 at 2:04 PM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > We don't want this enabled just because we have EGL and OpenGL ES 2.0
>> > enabled.
>> >
>> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>
>> Agreed; maybe this could be considered for dylan as well?
>
> Sounds reasonable to me; once it's merged to master I will include it in my
> queue for dylan.
>
> To be honest it would be nice if it were fixed properly upstream; building it
> based on the conditional given seems wrong.

I fully agree but until it is fixed (if it is ever fixed) your patch
seems the way to go! :-)

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

