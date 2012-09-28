Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1THZTp-0007fS-9M
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 14:15:41 +0200
Received: by pbbro12 with SMTP id ro12so5108109pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=4LFxz516wIhC9gCfqp+fgfzCCq8meh9RMRxLk5xxk9M=;
	b=pG+2ZYwUu7MHdd6sGfdeo2oJhtY6ygSyT13fg0u7CvQpUD3gqeg6Zy2cH8quc+zo93
	O5wnYxVzp0C709gMmLgCgUEprVcnWy1UKnH22VOOQiIjwVQgyk9yhaJx1020IPHs6ZUe
	bib3OTNwrhk2w2C1sKWaFceeGxKCG6f84dkwIPIKAJpFs14G4ITPbidj4pYyWLPxevEg
	pk0t1bgt6M8JkcdvLAPQmJZ75bJGsQkBJGHeug6pIdcBCl9itqWj/nCte7K+K9Ycowh3
	VLfloNqxsb4yeEjahmNK+mRPhS9FxIs9nBE+JJYV/Z1t8IRicoJjJDd5UV0I08IIMoC6
	d+tQ==
MIME-Version: 1.0
Received: by 10.68.218.226 with SMTP id pj2mr19998588pbc.33.1348833767500;
	Fri, 28 Sep 2012 05:02:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Fri, 28 Sep 2012 05:02:47 -0700 (PDT)
In-Reply-To: <CA+chaQdL+UTXrMsUJkzrEbpqMSxdQ3v7uCycumO9aUqmm9cnkg@mail.gmail.com>
References: <20120927142926.CA9C5103AC@opal>
	<20120927153419.GD3454@jama.jama.net>
	<20120927175531.GF3454@jama.jama.net>
	<CAP9ODKr0nC2WbN=gCieWRnf4=-9SiiB6NUiubVrTxnnvbAaGtg@mail.gmail.com>
	<5064D5FF.2050409@windriver.com>
	<CA+chaQdL+UTXrMsUJkzrEbpqMSxdQ3v7uCycumO9aUqmm9cnkg@mail.gmail.com>
Date: Fri, 28 Sep 2012 09:02:47 -0300
X-Google-Sender-Auth: -5sjpl3Jy-ba33uvpt5GhDdq-pI
Message-ID: <CAP9ODKpKzc2T7MpMckyTabvuAkAe1ABCyZLKSz0=z83gJjAh1Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Martin Jansa : xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Fri, 28 Sep 2012 12:15:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 27, 2012 at 7:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Sep 28, 2012 at 12:41 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Just an FYI -- Martin Jansa found a problem with the implement of the
>> package version comparison.
>>
>> In deb and ipk, they do not support '<' or '>', instead it's '<<' and '>>'.
>> (Odd, historical reasons apparently).
>>
>> While RPM doesn't have any idea what '<<' or '>>' is.
>>
>> Talking with RP and others it seems like the best approach is to implement a
>> conversion, in the deb and ipk packaging classes, to convert '<' and '>' to
>> the '<<' and '>>' equivalents.  As well as add a sanity check that nobody is
>> using '<<' or '>>'.
>>
>> I'm in the process of doing that now.
>>
>> --Mark
>
> There is still some problem in opkg, now when I'm testing << with opkg
> which should work as LESS (and < as LESS_EQUAL), it still shows <= in
> opkg status and behaves like <=. So there is probably some bug in opkg
> still hidden :/

Yes; it seems the right fix is in opkg.

Using RCONFLICTS with << also fails to me as said yestarday on IRC.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


