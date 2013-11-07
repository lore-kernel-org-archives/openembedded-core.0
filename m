Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5766D1FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 15:58:43 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id i4so1212161oah.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 07:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=vQ0+MnF1MQjQnRpkmJapHp7wdX74zmSisR1949npLvo=;
	b=CUKTAmuNf5ZDMgNulsLqOjjZMVwsVJpFaEpIomcP5ti/mf39cL9kVMSgVPLroRTvBq
	152USsQh3CLnBHNGYWvQmFfXLzJ8NyZ9m+X+H1lQF0X4QSKxWbNupiBTxEDYZo6ewvC3
	1mnFs81tamymGoTKaVJpHqIvDwJW77NwKgcdxKTD8+WJQ+1AT9WY8/9cECKxodEgNshS
	rmso+JiprHlQSAw7JrSHAN3S5ofTFLDD1P46vX4JUhmMl/XVMQFLl5sVZP789iBwg/cn
	cH8y0pixbebfa6XTfMUjL09z0oRJdjtr6nmZ+V0gwuI5glDyfOOoMKWG0Bl8azvzNVbx
	47PQ==
MIME-Version: 1.0
X-Received: by 10.60.60.105 with SMTP id g9mr7216584oer.8.1383839924276; Thu,
	07 Nov 2013 07:58:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 7 Nov 2013 07:58:44 -0800 (PST)
In-Reply-To: <1383781353.6271.200.camel@ted>
References: <1383689722.6271.184.camel@ted>
	<CAP9ODKrLg1nb5syAUtM4_ipMKenTe1ejXmVsVrqGifiSpBqYjA@mail.gmail.com>
	<1383781353.6271.200.camel@ted>
Date: Thu, 7 Nov 2013 13:58:44 -0200
X-Google-Sender-Auth: HZ5FPwQH5vpt5HNNNNszYhAB9rk
Message-ID: <CAP9ODKrQ9aEx8VH8qhjuBORaDyGp72a3BXsHTkRosqB53zGOTg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, "Eggleton,
	Paul" <paul.eggleton@intel.com>
Subject: Re: lib/oe/sstatesig: Ensure packagegroups don't continually rebuild
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
X-List-Received-Date: Thu, 07 Nov 2013 15:58:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 6, 2013 at 9:42 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-11-06 at 16:51 -0200, Otavio Salvador wrote:
>> On Tue, Nov 5, 2013 at 8:15 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > packagegroups are allarch and shouldn't change depending on the target
>> > or machine selected. In general they should have good stable namespaces
>> > for their dependencies. As such we can exclude them from rebuilding when
>> > dependency checksums change.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> What about machine-base and core-boot? this may change depending on machine.
>
> Those already get marked as machine specific. I'd not expect
> dependencies to be changing package names there for example so I'm not
> sure this is an issue.

In:

+    def isPackageGroup(fn):
+        inherits = " ".join(dataCache.inherits[fn])
+        return "packagegroup.bbclass" in inherits

We must check PACKAGE_ARCH, no?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

