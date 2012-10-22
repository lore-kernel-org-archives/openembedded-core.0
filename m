Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TQM9x-0005B4-9a
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 19:51:29 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so1287125dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 10:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=D/nbQBmQS1DmWKx4lfa6bySjP0wktQwZKYAoBr0EqY4=;
	b=aPVQOVaTdwYrpO1nV0vLNaRCqM1V7VQGrw2IA8ELS8TtmvV3c4kTYmm+EkjBHPkbjk
	+UWpE2KH0mzeYaSKsJA0tEmRD0vRBUZsTy2b5DH00eQyk671Mdz8xTfBtbJlKLbThKJJ
	F9oopd9RanddoRh+Ig3uGZB3EF+i3Db1sWBB+q/JShDFFRR1+Ysm+M7T5QKLIQER2I1O
	gks+JAl+kZa3aoAp/ZtuPBKrcddYW8Nq/wxEGQ8f/swymytnLycukD0E2OMnELV5l9tw
	pd0YJkEEvRhVuyqtwlideLn5cSHX+rLZXfZoZZ933pr4CRmmJoHVAtZM42Rj/dIpPfCt
	kQXA==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr31514573pbc.130.1350927483626; Mon,
	22 Oct 2012 10:38:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Mon, 22 Oct 2012 10:38:03 -0700 (PDT)
In-Reply-To: <1350927160.3259.343.camel@phil-desktop>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<1350927160.3259.343.camel@phil-desktop>
Date: Mon, 22 Oct 2012 15:38:03 -0200
X-Google-Sender-Auth: qzl4y07FYyU0D8sk1WS6OvaHMJ4
Message-ID: <CAP9ODKojRUw1perOMbT6VCzFsU22SiCMbifboCo7fb58oyzOMw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 22 Oct 2012 17:51:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 22, 2012 at 3:32 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2012-10-22 at 17:35 +0100, Burton, Ross wrote:
>> Rule 3. Only Mesa stages, nothing else
>>
>> Whilst there are multiple GL implementations that offer various
>> subsets of GL, they are all effectively interchangeable.  It's not a
>> massive concern what exact GL is present when building because they've
>> all got the same API.
>
> This is an attractive idea but I'm not sure that the underlying
> assumption is entirely correct.
>
> Different GL libraries will have different vendor extensions and Mesa's
> headers won't necessarily know about them.  If the vendor ships the
> extension bits in a custom header (rather than jamming them into a
> modified glext.h) then this could be worked around by staging the
> headers separately, but you're still left with the problem that Mesa's
> libGL.so might now be missing symbols that are required during
> linking.
>
> Also, even if the APIs were the same, I am slightly nervous about
> relying on all vendor GLs having an identical ABI to Mesa.  I can't
> immediately think of any reason why they shouldn't but, equally, vendors
> have been known to do peculiar things in the past and I wouldn't be
> totally shocked to find that there is some binary libGL out there which
> manages to be ABI-incompatible with Mesa in some or other creative
> fashion.

In this case every package depending on GL packages will be
PACKAGE_ARCH specific; this would be nice if we can share it amoung
boards at least.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


