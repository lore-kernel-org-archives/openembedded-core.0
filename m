Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mark.Asselstine@windriver.com>) id 1T6S9x-0001Ib-7f
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 22:13:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7SK0tHT013716
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Aug 2012 13:00:57 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 28 Aug 2012 13:00:54 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Aug 2012 16:01:07 -0400
Message-ID: <5151998.0QU9eL25sN@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic; KDE/4.8.4; x86_64; ; )
In-Reply-To: <CAJTo0LaA16HKH7MDJ1b=CA-+qvqmMEY47ZsrKd9d_W0z8LBMRw@mail.gmail.com>
References: <1346178028-2036-1-git-send-email-mark.asselstine@windriver.com>
	<14807078.5pTOjMOMpo@yow-masselst-d1>
	<CAJTo0LaA16HKH7MDJ1b=CA-+qvqmMEY47ZsrKd9d_W0z8LBMRw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Tue, 28 Aug 2012 20:13:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On August 28, 2012 20:16:30 Burton, Ross wrote:
> On 28 August 2012 19:53, Mark Asselstine <mark.asselstine@windriver.com> 
wrote:
> > hostname.sh doesn't leave much room for priority
> > 
> > ---snip---
> > if test -f /etc/hostname
> > then
> > 
> >         hostname -F /etc/hostname
> > 
> > fi
> > ---snip---
> > 
> > looking at this you can see my logic, don't create the /etc/hostname file
> > get rid of the overwrite.
> 
> But surely this should be running very early in the boot, and a
> DHCP-assigned name should be running afterwards?

That hasn't been what I have observed, and doesn't cover the command line 
case. If you have an NFS root this would also not be the case as init will be 
run after the network is setup and root mounted.

Mark



> 
> Ross


