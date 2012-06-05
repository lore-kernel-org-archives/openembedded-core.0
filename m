Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sbqkh-00046u-Fl
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 12:12:39 +0200
Received: by ghbz2 with SMTP id z2so5007310ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2012 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dw958b6J8RTp1e88WQCPkVUIcr3/maoWIdxLv5fYek8=;
	b=EdRkPPbdGWQunCbk4YKB07LuKTDQ+BcICTg2EpXhF6KJ8MaqLpcIe5xF5FnMZ7bkyo
	7KH4LeiTRbk+AYN6gNNoc2u9PCcVwfEvMNkKd2NI0YgRaq7TftI6fjSvslPSYDmo3lxM
	u4ahVNwAVZB61cp+QNg7tyleXvI+t4MaMl1mY7wkzhXSyjHN65lGlGRK21PJW0gdWFD4
	J9naZvCiZSfI5kvEVtr4KadH4F2KcAgJlE9nKXDE2RL3R1dna/8N+SUVgbkZZyb6Wl4e
	MkdWavOd9+zhoascN7OJrupZB52qZwrUEhYOi1LbSkIj7O8tiPG6qThXprsARen6bz8y
	nlPA==
MIME-Version: 1.0
Received: by 10.50.203.98 with SMTP id kp2mr1702248igc.42.1338890533023; Tue,
	05 Jun 2012 03:02:13 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Tue, 5 Jun 2012 03:02:12 -0700 (PDT)
In-Reply-To: <1338850420.28421.84.camel@elmorro>
References: <CALbNGRQ_9XmHOQyPZUoT4rUKmjzH_vxBidYp_eJ0vsLAZNe1rw@mail.gmail.com>
	<1338819642.28421.26.camel@elmorro>
	<CALbNGRTsiiOGGhP+b=G85w-enK+LsDbY4Qp-8w6U3w=R9Z=GHA@mail.gmail.com>
	<1338850420.28421.84.camel@elmorro>
Date: Tue, 5 Jun 2012 12:02:12 +0200
Message-ID: <CALbNGRTsOURbty9gYneckW=RCKCc=3NEed5uPev-iXM8DrhEBQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemtap build fails
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
X-List-Received-Date: Tue, 05 Jun 2012 10:12:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 5, 2012 at 12:53 AM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> Hmm, ok, but anyway my patch also does --disable-server which is the
> thing that uses nss. =A0In any case, I don't see the error...
>
> Tom
>
I think I see the failure because I have nss from meta-chromium around

Andreas


