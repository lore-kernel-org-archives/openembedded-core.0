Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.309.1599844382240666090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 10:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=fT5udujU;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1045)
	id 7844820716FE; Fri, 11 Sep 2020 10:13:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7844820716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1599844381;
	bh=LQBLqKG41yKJjWb7+6TInJBi85IObSlUSAm7gFQBz/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fT5udujUw9s9tPc1Ms5VzV7LvetAZkDJ6eyzRTVURSeu6aVNpeW9hJMHELWcrDatJ
	 BF8nBgnwI7mmdK0wqjzs1T1pLtNvCFaw7M8lb6onVUrMOp0cAI5bTeFqWYseGQzG/R
	 3LTlfDq4M6P6f2eXiHK4hHr4e0XbVe7Br4g+zB2A=
Date: Fri, 11 Sep 2020 10:13:01 -0700
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
Message-ID: <20200911171301.GA14636@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1599821817-27585-1-git-send-email-pemorrow@linux.microsoft.com>
 <CAAnfSTu-0GDByMD3-H1OewWzMGisha8nJ4dGGZTYcR-J2y0jXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTu-0GDByMD3-H1OewWzMGisha8nJ4dGGZTYcR-J2y0jXQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2020 at 12:47:44PM +0100, Ross Burton wrote:
> > +python () {
> > +    # Change the default compression algorithm if requested.
> > +    comp_default = d.getVar('SQUASHFS_TOOLS_COMP_DEFAULT')
> > +    if comp_default != None:
> > +        d.appendVar('EXTRA_OEMAKE', ' COMP_DEFAULT=%s' % comp_default)
> > +}
> > +
> 
> This is overcomplicated.  Just do:
> 
> SQUASHFS_TOOLS_COMP_DEFAULT ?= "gzip"
> EXTRA_OEMAKE += "COMP_DEFAULT=${SQUASHFS_TOOLS_COMP_DEFAULT}"
> 
> This way the default is documented in the recipe, and we can change
> the default easily too.

ACK. V2 coming.

Thanks,
Peter.

> 
> Ross
