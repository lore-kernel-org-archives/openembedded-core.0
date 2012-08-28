Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mark.Asselstine@windriver.com>) id 1T6MIL-0000b5-AS
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 15:57:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7SDjFip006180
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Aug 2012 06:45:15 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 28 Aug 2012 06:45:14 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Aug 2012 09:45:27 -0400
Message-ID: <3613253.MfUkZynff3@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic; KDE/4.8.4; x86_64; ; )
In-Reply-To: <7BBED272-9097-4D7D-AA92-F371C06F4F47@dominion.thruhere.net>
References: <1346081069-4741-1-git-send-email-mark.asselstine@windriver.com>
	<7BBED272-9097-4D7D-AA92-F371C06F4F47@dominion.thruhere.net>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: allow for more flexibility related to hostname
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
X-List-Received-Date: Tue, 28 Aug 2012 13:57:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On August 28, 2012 08:47:33 Koen Kooi wrote:
> Op 27 aug. 2012, om 17:24 heeft Mark Asselstine 
<mark.asselstine@windriver.com> het volgende geschreven:
> > Current logic used to create the /etc/hostname file is fairly
> > restrictive and doesn't allow for easy customization since the
> > variable 'hostname' is local to the base-files recipe.
> 
> hostname_pn-basefiles_someotheroverride = "foo"

Point taken. Do you object to the attempt at making it less obscure however?

Any thoughts about the second part to this, not creating the /etc/hostname 
file? Without being able to avoid the creation of /etc/hostname the 
initscripts 'init.d/hostname.sh' will set the hostname overwriting what is set 
by the kernel cmdline or dhcp.

Thanks for the feedback,
Mark


