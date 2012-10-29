Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TSsuo-0004OM-Ku
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 18:14:18 +0100
Received: by mail-ie0-f175.google.com with SMTP id c13so6907023ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=deUULhS2St9i+dDnOkJjXa3zGZBrdiDf9gl+/VI2Cnw=;
	b=HLMM+RYjsYUH5ZMlv8hEnKCptK36YeNIeAP6rpHeIcrRSKDbz91wW9JO6PHgsuI4vn
	m6Zj44lJu90E8s04HfiZK1tBbBnlfoFHV6qd/9g2XizCGK/2S85OTj6QU99qW4roB8ek
	QUXBWeLUsxzHQRFfPI16yruJGS6D9LraajtUMNL/an4WAv6ANeFvUPiDb+yBbdfS/fOD
	7Bhcb0sTHNvoIAp8uokf2zXv26dLAoA7RwGo9KtZQeRDm5LUkT+3VMY6i2sBLd6FkDZg
	GSahge12EK6KBPGO418VtSCm+ytn1kWWsKsYd+H+nNRHjC/NTzxXFFwhlJZ2dTk9YwqO
	SR3A==
MIME-Version: 1.0
Received: by 10.50.152.132 with SMTP id uy4mr10137806igb.3.1351530043879; Mon,
	29 Oct 2012 10:00:43 -0700 (PDT)
Received: by 10.64.24.175 with HTTP; Mon, 29 Oct 2012 10:00:43 -0700 (PDT)
In-Reply-To: <1351527382.2828.21.camel@ted>
References: <CAF6bG8f111en-1a6ppqRVCjgg9Gn7Ywac4tJe+f9KoL4VCdu0Q@mail.gmail.com>
	<1351527382.2828.21.camel@ted>
Date: Mon, 29 Oct 2012 19:00:43 +0200
Message-ID: <CAF6bG8eAfzOTSe+R0LoxVfXugKhgQ7pRjwVWHdHCb4FVHxDRtw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: shadow-native build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 17:14:18 -0000
Content-Type: text/plain; charset=UTF-8

On 29 October 2012 18:16, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-10-29 at 18:14 +0200, Marko Lindqvist wrote:
>> shadow-native do_configure fails with:
>> cp: cannot stat
>> '.../tmp-eglibc/sysroots/x86_64-linux/usr/share/gettext/config.rpath':
>> No such file or directory
>
> Is this master and did you upgrade recently?

 Yes and earlier today

> Does "bitbake gettext-minimal-native -c clean" help?

 Seems so, thank you.


 - ML


