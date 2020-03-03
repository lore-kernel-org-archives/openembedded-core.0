Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com
	[209.85.161.43])
	by mail.openembedded.org (Postfix) with ESMTP id BC4CE60691
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 15:57:36 +0000 (UTC)
Received: by mail-yw1-f43.google.com with SMTP id g206so1927385ywb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zNNUNnLxWAcEQP36CVGX4APbwIgLTmNcdYAlcZwxrNE=;
	b=c+1POhJfUWFZwoGGZvxEVQNIG2RPR0oezSX6wVoDUPOiTOfT6qIsGV1Ya9hlUlzUop
	Xaivd46j/KWdS/k1/22aRYiQFbQPHzuaTQ7b3yVxPTXqPx1lWEhlOzMreC9MVYa520Qc
	sDSJJRsbWQ8GL2OtrW6g+nXlnXdbT43L93TwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zNNUNnLxWAcEQP36CVGX4APbwIgLTmNcdYAlcZwxrNE=;
	b=pZdVP9zzWkjBA1vQ2uJ/rFad4Iab6BU/HmlfXWusK06sYHl+LJeVm6t4uxuFfaST5i
	QG0YLhqH6G5KyYmspdapNnAe5tLpUmascaie6vTnzFN6z4XZTj7HJfVBFmPGMbYPcjsF
	eNO5qUlWLqQRa7DC4T6lG/Uzpk19g/QBJu/QT10Y02+2TU4v6Zmwygywh4DpYLk9W9RQ
	+R+9NtrY4Z6bSVMh7qYv/lZpo52EzIT1nMR0qnaoE+brOlwm+KqEj/18EhgwWSpqTC3N
	SKgnUCjuMfhEa3QMh5xXZL7n0C+VIVPZGrq2ZXHhhZUNJTMvQlvc9aks66eN4ZoC4fxU
	v2tA==
X-Gm-Message-State: ANhLgQ2GZ6ND7LZK3WjF/+m+OAMqkWlWPJ/KJOqnGRykm5vrRBq3IeDW
	ANLKJGshzVhXtYcxxpEMrxgiSA==
X-Google-Smtp-Source: ADFU+vtvDg8hF7Z1X5fgUDflCPEOjCKXVm7Qyk+3DJ/9fUvhc+zaZoZKnfEkTtL73RnHEfmFKeyDWw==
X-Received: by 2002:a25:c7c1:: with SMTP id w184mr4351591ybe.334.1583251057238;
	Tue, 03 Mar 2020 07:57:37 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id
	i66sm9608248ywa.74.2020.03.03.07.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Mar 2020 07:57:36 -0800 (PST)
Date: Tue, 3 Mar 2020 10:57:33 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200303155733.GF18302@bill-the-cat>
References: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
	<52350a7bd080413c9dbc6e1783f14e2c@XBOX03.axis.com>
	<CANx9H-Ci4Rsw3WDkYdwzw1AYeZMhiHrZWkiTkHp7WG1j5hhFUQ@mail.gmail.com>
	<c2e7a031d09edec6cb85fedf49b9afc3f55ac821.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <c2e7a031d09edec6cb85fedf49b9afc3f55ac821.camel@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to cleanly centralize a zillion BBCLASSEXTEND += "nativesdk" settings?
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
X-List-Received-Date: Tue, 03 Mar 2020 15:57:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2020 at 02:38:29PM +0000, Richard Purdie wrote:
> On Tue, 2020-03-03 at 06:25 -0800, Tim Orling wrote:
> > 
> > 
> > On Tue, Mar 3, 2020 at 4:32 AM Peter Kjellerstedt <
> > peter.kjellerstedt@axis.com> wrote:
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> > > <openembedded-core-
> > > > bounces@lists.openembedded.org> On Behalf Of 
> > > rpjday@crashcourse.ca
> > > > Sent: den 2 mars 2020 13:41
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: [OE-core] how to cleanly centralize a zillion
> > > BBCLASSEXTEND +=
> > > > "nativesdk" settings?
> > > > 
> > > > layer i'm currently perusing has many, many bbappend files, of
> > > which
> > > > quite a number are nothing more than the single line:
> > > > 
> > > >    BBCLASSEXTEND += "nativesdk"
> > > > 
> > > > literally, at least a hundred append files are like that. so
> > > rather
> > > > than clutter up the layer with all those trivial .bbappend files,
> > > > can one cram all that into a single .conf file? as i read it, can
> > > i
> > > > do something like:
> > > > 
> > > >    BBCLASSEXTEND_append_pn-pkg1 = " nativesdk"
> > > >    BBCLASSEXTEND_append_pn-pkg2 = " nativesdk"
> > > >    ... and on and on ...
> > > > 
> > > > and toss all that into a distro.conf file or something?
> > > > 
> > > >    and even if that works, is it considered good coding style?
> > > > 
> > > > rday
> > > 
> > > Sounds perfectly fine. We do something similar, but in our case we
> > > need 
> > > to add "native" to BBCLASSEXTEND for a whole bunch of recipes.
> > > 
> > 
> > Should patches be sent to add native and nativesdk? Drop the
> > technical debt by upstreaming...
> 
> I'm torn on this since adding these does have performance impact. We've
> talked about adding them as defaults but it does increase parsing time
> and so on...

Just how much does it increase parsing time?  For any use case with a
fairly deep SDK you end up with the case in question here.

-- 
Tom

