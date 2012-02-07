Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuuAK-0006Ii-BG
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 00:09:36 +0100
Received: by pbbb4 with SMTP id b4so35427pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 15:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dKFctRujxFklyk2E+fUA6dg5W3eR6g6d4PQodM1FGno=;
	b=ueVpJokiGNU0XhYx/K/QR1BQhRpal8bTYMYLQURJfqhFayEoEWGF8ZXW94wxtPlx8h
	GdbaGFpb6k8HvoUIhhbod3OvL+x072Ybxj3f411AeIGhBqOWCXxRu7/dXurDlplCqg2r
	Vyy6Wm59+VhuoEX+kS7sNIxwgDB5ST+HOY9fo=
Received: by 10.68.227.132 with SMTP id sa4mr62589153pbc.64.1328655692915;
	Tue, 07 Feb 2012 15:01:32 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-142-235.lightspeed.sntcca.sbcglobal.net. [99.57.142.235])
	by mx.google.com with ESMTPS id i10sm228071pbg.10.2012.02.07.15.01.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 15:01:31 -0800 (PST)
Date: Tue, 7 Feb 2012 15:01:19 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120207230119.GE13125@sakrah.homelinux.org>
References: <1328646568-25721-1-git-send-email-andrei@gherzan.ro>
	<4F318D77.5020901@linux.intel.com>
	<CAP9ODKpZwQHyAsYeR-BRTChgrb68xi8enrn_RoajXX4mBU7TJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpZwQHyAsYeR-BRTChgrb68xi8enrn_RoajXX4mBU7TJQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Tue, 07 Feb 2012 23:09:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/02/12 18:54), Otavio Salvador wrote:
> On Tue, Feb 7, 2012 at 18:45, Saul Wold <sgw@linux.intel.com> wrote:
> 
> > We are trying to address warning that come from the build, so can you
> > please address the packaging issues and the location of libcrypto as it's
> > in /usr/lib while dhclient is in /sbin and may not have /usr yet (see prior
> > discussions about / and /usr boundry issues.)
> >
> 
> What would be the fix for it? move dhclient onto /usr/sbin?

or move libcrypto into /lib its really not that pretty


