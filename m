Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SrWCU-0000ax-77
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 17:30:06 +0200
Received: by yenl13 with SMTP id l13so1554199yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 08:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=pbzN6GxmL41s1aD3xek0bDp5XG0cj1ffgb3QkWhFr8I=;
	b=f/hv9AFcZL7k5Y8RqR4tVxrGLH/q41W3JbE9RDpuCBDL2tekTX+CCUC0TK87BwJHOE
	naKRzT0nnog5Fn08droN7rjvWpDNL0a94PuMwVOhahz4SpBiRhzmap7iuO56HHaJAjTd
	80KH/cLW64dhuoaKHCHhFK8rb+ki5zekMzB+GIkE1mGQ7PVvjmFN4mCc/TFRQ2cWdosq
	Rg0ncFGmzcQd/v7WiUm10zwFrckLgAk6Y0xWcGJuN+OfCBYNNmQlN9okhUMcKcorxRii
	mjzuSbVjg4EzUzvp4rCfbm+wu+dAhNcaO1gqD5LI7xpWgRCq9EK19vQn9x9MACbxVUcR
	yWug==
MIME-Version: 1.0
Received: by 10.42.148.196 with SMTP id s4mr670712icv.19.1342624724772; Wed,
	18 Jul 2012 08:18:44 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Wed, 18 Jul 2012 08:18:44 -0700 (PDT)
In-Reply-To: <CABcZANm5a+VFPwDjaPZFmy4vQtQX=_os+SOycxfuAnqaEzbfnA@mail.gmail.com>
References: <CALbNGRSSusDKWfdEMVH5hY1fA2gpxhLrJ2dTE7SEHx1o7QU+3Q@mail.gmail.com>
	<CABcZANm5a+VFPwDjaPZFmy4vQtQX=_os+SOycxfuAnqaEzbfnA@mail.gmail.com>
Date: Wed, 18 Jul 2012 17:18:44 +0200
Message-ID: <CALbNGRTUacOieZCmTD2g0x=-3Bp-b9aLAg5SZN9gR+hQ0_yz3w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: build crashes immediately at build clean sstate/tmp dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 15:30:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 4:55 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Jul 18, 2012 at 7:53 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> I just updated all repos / deleted all tmp / sstate and get
>>
>> ERROR: Only one copy of bitbake should be run against a build directory
>
> ps -ef|grep bitbake
> --
Aargh - some old processes around - sorry for the noise

Andreas


