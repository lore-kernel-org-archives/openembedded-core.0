Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id A07B2700F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 21:49:40 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id c7so21590774itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2017 13:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=RCqkJdQ8wAtnFvnV+IwXtrqjV7iIJaxt674YI9xawCg=;
	b=fcnReBf3qzN5wQ0SIQ4YIZbwOBbULoLkqobSgETNBT8XgULJCUZzRB41q8jOXpeC5d
	KDQKcjL1l6U4w4ZeuFWtCpSgvfiEmC7pk0qnqmQuWqbuon8pi3h0jCU97PHgtKEsZDBR
	jZF1lEvBAiR2ZlKBncDPtuRl/RWexQOFZ67xhZ5w/OtTH7furHaKrKJwob7W1xIBktfJ
	VswM8kTWft79e+VMr64+MlmuO2UHbZbIjNL0qQ7w17O6mLYqD6l3+73uMKHvlmjE+ttE
	latYeB+VKlG2wAPEaqxvf9IYik0IPwz+pkdHJjJNL5O6AxeR1QM21SGCBxYAMTNQ+H+R
	wcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=RCqkJdQ8wAtnFvnV+IwXtrqjV7iIJaxt674YI9xawCg=;
	b=XLMPFFKhoMQaQsyoWXQjHwb1tM1eZo1uE7qd0mw6bWzTjbUAFXnynYkEfjw5lnEQO4
	FOPWRfcfAVeR4E1HnBSk8cA23jyeiYdrGZ6pkjpZWka8A6wMhmO0meZvMGe+HConRmwl
	8NjRU+MzoveMkYaVoNcUNpuiR3mNxRTcnwOVIU5gbYCX+FE8nNRfksfWx/hilj+SQkbU
	hkO0Eoi0I9oT/5YbqUguLi+vYSYbZVhW+mXxrXffwYd513i6yFD5FwgpKk0oD2NIJsNp
	0ML+S07TzbhkeO4gtxT7v2DYhuOpCPnT8UDwtBEGknV+ZzG9bMVKdZwKgOGr3u3HADLD
	jmbg==
X-Gm-Message-State: AIkVDXL8Ky5Rb7KrKYjXnGwb6IePbGtYKRXKfjjoJdlvTGmnJQS54C4Q+73QgsqS8p0VPgUl
X-Received: by 10.36.252.65 with SMTP id b62mr2715538ith.38.1486158580362;
	Fri, 03 Feb 2017 13:49:40 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E712.dip0.t-ipconnect.de. [93.232.231.18])
	by smtp.gmail.com with ESMTPSA id a4sm3287674ioa.43.2017.02.03.13.49.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Feb 2017 13:49:38 -0800 (PST)
Message-ID: <1486158576.14889.104.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 03 Feb 2017 22:49:36 +0100
In-Reply-To: <alpine.LFD.2.20.1702031623390.12084@localhost.localdomain>
References: <alpine.LFD.2.20.1702030641310.2549@localhost.localdomain>
	<1486131492.14144.70.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1702031414250.9747@localhost.localdomain>
	<1486156855.14889.103.camel@intel.com>
	<alpine.LFD.2.20.1702031623390.12084@localhost.localdomain>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: whatever happened to a proposal for "read-only" sstate?
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
X-List-Received-Date: Fri, 03 Feb 2017 21:49:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-02-03 at 16:24 -0500, Robert P. J. Day wrote:
> On Fri, 3 Feb 2017, Patrick Ohly wrote:
> 
> > On Fri, 2017-02-03 at 14:14 -0500, Robert P. J. Day wrote:
> > >   is there a command that will tell you how much shared state info a
> > > given build would be able to take advantage of?
> >
> > INHERIT += "buildstats-summary" in local.conf will print that
> > information after a build is done.
> 
>   but not before? ok, that will do for now.

It might do that also for a "bitbake --dry-run", but I am not sure, and
my build directory is currently busy, so I can't test it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




