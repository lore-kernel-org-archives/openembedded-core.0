Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id A4F6360D67
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 23:14:08 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id c41so1736327yho.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 May 2014 16:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=tFmVHCqV/BhlnLNsNh7SWG+MI7m17JAwr/bWGUGbyss=;
	b=tjiX3Mxvq2nPs8XsaW7e7MxhNxNlZv/aj3iTQgwhtkUWq8YJB/GtNBP/RfbMqHOJ/K
	1sse40GhT9DOIn2YIwfu+/N10JlMlsV0RXBT6EN2VVtHTes+hBK1pRtUQL/ZJey202co
	ekK/m4qFTqQ7w9giRm2ParWbqu1JavtqdFvSrBNkrPTc8MCLdQ5/N30EzsR4Zw5PMF5k
	KylopSU+k2v36kF2AkJ7DQl5DSXKcpfe5F4vqnvhQZjwp4MyRtxKIhUitnoVE394GInP
	IPgG63ysN4ATRhFpi819DK32UkbDLILjZ94W0IcaRhlYecQo0TkrtsNgB2hHEMyReswb
	Jv+A==
MIME-Version: 1.0
X-Received: by 10.236.101.51 with SMTP id a39mr35888907yhg.78.1399158850031;
	Sat, 03 May 2014 16:14:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.132 with HTTP; Sat, 3 May 2014 16:14:09 -0700 (PDT)
In-Reply-To: <5365734E.5090604@ti.com>
References: <1399156743-14903-1-git-send-email-joelf@ti.com>
	<CAP9ODKqbWSBmOm=A47aypdT53eeRMZQ27_8BsoaoHGHoVu-50Q@mail.gmail.com>
	<5365734E.5090604@ti.com>
Date: Sat, 3 May 2014 20:14:09 -0300
X-Google-Sender-Auth: yUxNMzjz5LGFITXeaQpJBHOCQfU
Message-ID: <CAP9ODKrO5dHUrynj9UyQxXbkGbgoHFbq2aW54Z+g8SWr13h2tg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Joel Fernandes <joelf@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Sat, 03 May 2014 23:14:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 3, 2014 at 7:53 PM, Joel Fernandes <joelf@ti.com> wrote:
> On 05/03/2014 05:44 PM, Otavio Salvador wrote:
>> On Sat, May 3, 2014 at 7:39 PM, Joel Fernandes <joelf@ti.com> wrote:
>>> In poky with systemd enabled, vt102 is selected for getty
>>> causing user to experience a very crappy terminal. Default
>>> TERM to linux.
>>>
>>> Signed-off-by: Joel Fernandes <joelf@ti.com>
>>
>> Don't bump PR, this is not needed in this case.
>>
>
> OK, will the package still update for folks?

Yes, if you use PRServer it will.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

