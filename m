Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TR63l-0007pE-1K
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 20:52:09 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so656144iac.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 11:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=QA8WG2gNFdWEXQU0BbRCKbtfWzXOweFQSg5hmAVM978=;
	b=VEfocCxFL+XpOJgGIl4HqdflKH98JJKYOXa0ctwPKFQxl/wst9QlwcIFbPPGt51WLJ
	sidY0IJL1uNukBDbcBUfKlTwfTH8X9pqw28InR7MiJrKaQ+ynhjeShEzmwZvp3l2t2xC
	Kx7SUb/VGEFCxvgkAYMLZ7U2JYVWz4NwJbf1b5qTcqPEX6bhWizhFhxw+dw+QqxVIhqC
	izNwYlGmCYxmtzJcc8XrzYpZyYQecbJOfSDR5ltucWX4H/Phsna0WNfq6gxAd+K+NSUR
	Td66Rsy7H3VxHyWchFQHswRdH3/4iL7L2GYgLXmHw/c3UvATHvgt/MGxE1uEuVVgoLU3
	jrWw==
MIME-Version: 1.0
Received: by 10.50.53.170 with SMTP id c10mr3549273igp.45.1351103920861; Wed,
	24 Oct 2012 11:38:40 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Wed, 24 Oct 2012 11:38:40 -0700 (PDT)
In-Reply-To: <CAJTo0LZ1JTxj6a40eM0RzxRpoY1=DKwLqJiuU7cGjQo_7dYO7w@mail.gmail.com>
References: <CALbNGRSX3AtHywq3RR3OryKbRWaqL=v2TE+xsuNsDQ3O2PY4hg@mail.gmail.com>
	<1351088462.3259.421.camel@phil-desktop>
	<CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
	<1700131.q7Jk2zQzF1@helios>
	<CALbNGRQoX5J5NvPRHc2VAx-D58UvxQmLhunEev09OaxkFwGJKA@mail.gmail.com>
	<CAJTo0LZ1JTxj6a40eM0RzxRpoY1=DKwLqJiuU7cGjQo_7dYO7w@mail.gmail.com>
Date: Wed, 24 Oct 2012 20:38:40 +0200
Message-ID: <CALbNGRRZPd-54hx_rwSC4uV1KWLMdnA=3rp8CNezyLPzMuQs8A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Latest head causes challanges
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
X-List-Received-Date: Wed, 24 Oct 2012 18:52:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 7:01 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 24 October 2012 15:49, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om> wrote:
>> To me this is a log off and go home. Since when do we care for FHS? I
>> thought everything is on it's way to /lib... And I thought on master
>> branch I am safe from strange changes these days...
>
> I'm curious as to why it's such a drastic change for you.  Packages
> that Do The Right Thing will just work when libexecdir is changed, and
> by definition they are binaries that you won't be running yourself.
> So what's the problem?
>
> Ross
My problems were:

* I thought master branch was the one to go into stable release and
did not expect changes like this when I updated. Maybe I missed some
announcement for danny.
* had to stop working because build from scratch was required - hope
tomorrow everything is fine again.

Andreas


