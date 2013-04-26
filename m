Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UVkFZ-0000vX-GJ
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 17:07:52 +0200
Received: by mail-ob0-f182.google.com with SMTP id dn14so3590020obc.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=WijTwBbD8thEdPY+cnPA/f3MARBn4njQnag7u/aztL8=;
	b=kYqheh4wOQOfvWezIadI0+LGmGa6Gh4zmNTiYW8Ks2RzdZJ5zcdh6Raxo7VJcBq73h
	d53D36FD/feTd4MrAEN663M8SrzAikWdShu9hU4idaM/JH6jgrtqxeHWk+i1cToefT4/
	h9SnohJ67DRma6cMwPfhOBV6DXtZQn6IuP+19YNqS+jMlTtB+Pnkr7uS1l2+AnAucOZg
	W5z/trc/1Jfp++ASLBoVnTDm+LCHpKibOrnmp3v0xyYAV0ZXYR9651spKfwL0wy+QPYm
	MjGO2K66smc1oAJawf46x0VNocaxT4HajqWTxuBiIsrylHA2G6uyAqiF4dIft3/8PzjU
	/KEA==
MIME-Version: 1.0
X-Received: by 10.182.220.161 with SMTP id px1mr18141480obc.42.1366987804108; 
	Fri, 26 Apr 2013 07:50:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Fri, 26 Apr 2013 07:50:03 -0700 (PDT)
In-Reply-To: <1366987306.14512.117.camel@phil-desktop.brightsign>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
	<517933DC.9080809@windriver.com>
	<1366984657.14512.108.camel@phil-desktop.brightsign>
	<517A8C41.20202@windriver.com>
	<1366986469.14512.116.camel@phil-desktop.brightsign>
	<517A91BA.7030200@windriver.com>
	<1366987306.14512.117.camel@phil-desktop.brightsign>
Date: Fri, 26 Apr 2013 11:50:04 -0300
X-Google-Sender-Auth: q873iiC9Cp9-pJ9O9Y2ctIRUmWk
Message-ID: <CAP9ODKrbTjSOw4k3bpVD3eVFDfHARKzcfft5rMoznwfTCir8OA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Fri, 26 Apr 2013 15:07:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 26, 2013 at 11:41 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Fri, 2013-04-26 at 09:39 -0500, Mark Hatle wrote:
>> On 4/26/13 9:27 AM, Phil Blundell wrote:
>> > On Fri, 2013-04-26 at 09:16 -0500, Mark Hatle wrote:
>> >> The alternative of course is to crease special -dbg packages for the two
>> >> conflicting items.  I.e. foo-dbg, foo-sulogin-dbg, bar-dbg and bar-sulogin-dbg...
>> >
>> > Yeah, indeed, that's what I suggested in my original email.  At the time
>> > I thought that would be hard to arrange (in the general case), but
>> > having given it some further consideration perhaps it isn't all that bad
>> > after all.
>>
>> I certainly wouldn't be against an enhancement that tries to match up the
>> binaries to their debug and create suitably named -dbg packages.  The only
>> tricky part is what to do with the associated sources?  Since those are not
>> arranged according to binaries, but generally for the whole recipe.
>
> The sources can stay where they are, in ${PN}-dbg.  There won't be any
> conflict there because the installed files are already namespaced by
> recipe.

Maybe add a ${PN}-source with it? So any -dbg could rdepends on it?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


