Return-Path: <takondra@cisco.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Mar 2019 23:33:36 UTC
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA146C13D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1127; q=dns/txt; s=iport;
	t=1553297617; x=1554507217;
	h=mime-version:content-transfer-encoding:to:from:
	in-reply-to:cc:references:message-id:subject:date;
	bh=fulvtYDTzcsxi+4cv+oOxqyk7R1DkZqSMm8scEIzumA=;
	b=H6xpUJrKOhCpDuNcEEJMDDS7srXzQ8oC18fJMsKI1FjuCGk8yHZvVkMz
	3vqXqeGs6C/ubfqN7hmSIh5wamYtgIIh/9Ne64h9jjiozzz/DmkFIT+i4
	xKWxGYsSvlan4X8irKDux4kTl14O9KItw5nDyQ32bm8tTZ+t5ooJTlW1n 0=;
X-IronPort-AV: E=Sophos;i="5.60,256,1549929600"; d="scan'208";a="538557249"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	22 Mar 2019 23:26:30 +0000
Received: from localhost ([10.156.154.76])
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id x2MNQU2g027564; 
	Fri, 22 Mar 2019 23:26:30 GMT
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, rbilovol@cisco.com
From: Taras Kondratiuk <takondra@cisco.com>
In-Reply-To: <CAJTo0Lb=O0kLdbv9qYZLVXnfNd5Np=4HY8d7ASXSM5TiE33Ayg@mail.gmail.com>
References: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
	<CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
	<f347f66c-0a6d-9f49-98f2-a66f735a653e@cisco.com>
	<CAJTo0Lb=O0kLdbv9qYZLVXnfNd5Np=4HY8d7ASXSM5TiE33Ayg@mail.gmail.com>
Message-ID: <155329719078.6500.854973581146180677@takondra-t460s>
User-Agent: alot/0.6
Date: Fri, 22 Mar 2019 16:26:30 -0700
X-Outbound-SMTP-Client: 10.156.154.76, [10.156.154.76]
X-Outbound-Node: alln-core-2.cisco.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why openembedded-core mailing list is now author of some patches?
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
X-List-Received-Date: Fri, 22 Mar 2019 23:33:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Quoting Burton, Ross (2018-10-12 07:04:38)
> On Fri, 12 Oct 2018 at 15:03, Ruslan Bilovol <rbilovol@cisco.com> wrote:
> > > This is basically due to SPF, and people sending email from
> > > non-authoritive hosts.  Concrete example: Richard Purdie's mail comes
> > > from a machine which the linuxfoundation.org SPF records doesn't
> > > recognise as an authorised sender.
> >
> > Hmm.. I've just sent an email from rbilovol@cisco.com to another Gmail
> > address, and Gmail says SPF checks passed:
> >   SPF:  PASS with IP 173.38.203.51
> >   DKIM: 'PASS' with domain cisco.com
> >   DMARC:        'PASS'
> >
> > Does it mean oe-core mailing list's software is incorrectly configured,
> > or there is something else missing on @cisco.com side?
> =

> CCing yet more people, specifically Michael Halstead who admins the
> machines and actually knows what he is talking about (unlike me).

The issue seems to be still there. It doesn't seem to be cisco.com
specific. I see actia.fr and globallogic.com too:
https://patchwork.openembedded.org/patch/159446/
https://patchwork.openembedded.org/patch/157540/

