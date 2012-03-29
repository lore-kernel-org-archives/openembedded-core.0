Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SDMyj-0001HD-G3
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 23:33:57 +0200
Received: by qafl39 with SMTP id l39so18070qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CRbnjKBinqr2qnEJ6gjE5pcJ10dHASpdGsQf7s6VIG8=;
	b=CwzWF0Dl9S+9BBA3Zgv9vtiiG8kYRCyuFumWgvitn8QLZalcfV8BgrWcY2ozPLQDVE
	0KV4p4sm092KlQlmnIzwkZdnuTq+86JlAgj5xLQmy1J/z6zdPGKstgjG50mAtr4S34yl
	ont6z6vPPPZaSrrs5i2jR4UdEB7a6i89PMyQe4E2Gr3pfFFfFWkqa8xKIpLqoTMW6XEP
	QBpdaTh7ufXhwUm+TBioKkAeDT8mb93sls+YrAEXELDUFmLrtkK+xIXtHjxBC4qGI9xO
	U2BpDcSVxCybXi8+u9np7rVd7zy/GBTPNBa29knp05fa+6NS5MGrIOwVslZwdfLSycY7
	kjvw==
MIME-Version: 1.0
Received: by 10.224.180.14 with SMTP id bs14mr2403425qab.54.1333056293210;
	Thu, 29 Mar 2012 14:24:53 -0700 (PDT)
Received: by 10.229.158.4 with HTTP; Thu, 29 Mar 2012 14:24:53 -0700 (PDT)
In-Reply-To: <20120329135727.16cc3f61@wrlaptop>
References: <CAGDS+nnR4it2-C0FM1CeJBSakt9HmVizKQSO1wkc5EqxQKh22Q@mail.gmail.com>
	<4F74AC6F.5040009@windriver.com>
	<CAGDS+nnEOMQs+OXtchFWq-Jr+zVxhGd4KTtaK3PBS4JYJVGG-g@mail.gmail.com>
	<20120329135727.16cc3f61@wrlaptop>
Date: Thu, 29 Mar 2012 14:24:53 -0700
Message-ID: <CAGDS+nmoSrTLmqp0TxHgioNjH1gAnx1roYiyAW7mxo0i8G41JQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pseudo failing with cc1: error: unrecognized command line option '-m32'
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
X-List-Received-Date: Thu, 29 Mar 2012 21:33:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 29, 2012 at 11:57 AM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> On Thu, 29 Mar 2012 11:53:23 -0700
> Steve Sakoman <sakoman@gmail.com> wrote:
>
>> Clearly not something a sane person would do . . .
>
> Now that is a persuasive argument in favor of making it work if I've
> ever heard one!
>
> I'm doing too many things right now to fix this, but if you want to try
> to fix it, I'd be interested in seeing patches.

I did a simple patch to omit the -m option on arm.

The package now builds without error -- haven't run tested it yet . . .

Steve


