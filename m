Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UalM2-00013p-GN
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 13:19:21 +0200
Received: by mail-vc0-f178.google.com with SMTP id id13so255567vcb.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 04:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=iZ+p7f0s/5PeW+yAifzccSd3Vb81T2f++jhKq7ztexk=;
	b=ZEbdd8PzwKPCWtmYoUotMCm5hoh2j1kjpkX06psyfP4vxJdfQf3MWU72iCdKzYEnep
	FAUK5EuhtY4IbzohVgXX7Vp39nmn/HCeGK+GbiUzeD5HxF39/2vPHNtxIGp9RdUo4pkc
	3eHCLTPCdhGjo4lhr9A30/1cJdTkXADMivcJH0qHk4aouTVFBlTwguNkQOqPVDeQmQE1
	ARaDTaHEnoVNN/KBL3VED27eXu86MDtA82dhhSRUBxeQw3jjCoT6Lb8dlu9nsi0Oc6mY
	5u0XzxhJAtiowbsRD1O8zByxtq8It5UGkN4u9EhNiZkbiME9RlI+gaQ3tUwDYSTE+tbH
	/gFA==
X-Received: by 10.220.155.8 with SMTP id q8mr10597720vcw.42.1368183669107;
	Fri, 10 May 2013 04:01:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 10 May 2013 04:00:49 -0700 (PDT)
In-Reply-To: <1368183027.24706.6.camel@phil-desktop.brightsign>
References: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20130510102041.GA12329@jama.dyndns-home.com>
	<1368181932.11129.11.camel@ted>
	<1368182760.24706.3.camel@phil-desktop.brightsign>
	<1368183027.24706.6.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 May 2013 12:00:49 +0100
Message-ID: <CAJTo0LYgAzXW4PEt_KucpDG7Uk5rpXJEDzWPGTgA7X3jZkU-yQ@mail.gmail.com>
To: Phil Blundell <philb@brightsign.biz>
X-Gm-Message-State: ALoCoQk2lh6PsYxlh3+R1/0gLfQYwS0OFYfOkaQerBap4++t7k1Iik3jDv/TOo8SA0JLucaULkCo
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: updated to 2.5.37
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
X-List-Received-Date: Fri, 10 May 2013 11:19:32 -0000
X-List-Received-Date: Fri, 10 May 2013 11:19:32 -0000
Content-Type: text/plain; charset=UTF-8

On 10 May 2013 11:50, Phil Blundell <philb@brightsign.biz> wrote:
> Or you could replace the shell wrapper that create_wrapper() currently
> generates with either a compiled binary or a Python script.  That would
> allow you to execl("/path/foo.real", "foo", ...), which I don't think
> you can do in shell but which would avoid this whole class of problem.

Bash can do that, but it's not POSIX. :/

Ross


