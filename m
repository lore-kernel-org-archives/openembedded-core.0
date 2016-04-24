Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 46910605FF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 23:17:14 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id c3so1767468igl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 16:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vmZBPTi4zsO5764fjnq+FWIfRGLMVrVcjXI2i7h9BnU=;
	b=xI8OASe+lwhm1FqmwY989S2z47muVWuAGqCVeKQ6+vOow2oz8ZuGobwwrj6Q5WJSfc
	Ki3TwuVboItBt62KBnT+QUPnKKcw5gVgDtIIEGWfYa1zPboi7TSQ7oyB6L5wDUVwY6RO
	UOmhtiDpwiYUUKrxaSSk0mRGqVa5cQIA3q4ZQ/g5Fab2Ejf0DCiYoJy0athpKNVpaHe8
	1+mMqSj6MmN0TPsfSNdlJvS404NSt/Uf6SfPoopanBwTef1Sx1s7nWugdDV7AuaUSV3d
	2rbkJE2MFs2TYGjACDRJV0uG0/Bw/pAM24TUOhOmEmjXv1JKbNUqao0lFkdSa1caQR6W
	/XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vmZBPTi4zsO5764fjnq+FWIfRGLMVrVcjXI2i7h9BnU=;
	b=YnUhv901QQYytfDB+7diE7YnQWH3pMsFMeVITQf+dfU/g3h992n9Jwpm/wSeQwY7wg
	g7tjPsrhtCQcRH+HKjPb7mUShTamWT4wsNOUYWP/FAjR4wIl7oFu1rvgPAEw3QLOXxKS
	gXjfhsF7fEIw4enCIMkeAUUSrDmv1V2oiqW0FC/jmSo207UjGbwkNEDMN2W7ilLzdzW3
	im/33pRtdFG0fOyIswQxnZziP41c5c/kdFW/oSFCwyHTz6c84phXHWaQZJDwXoe3HOMS
	8xrrknqoH4t9gNUg8XLBcHQTkfeJ+hWIVJ9nq8hVZcXOkiXUT5NJLv1J5bw+hCA3PKcf
	siog==
X-Gm-Message-State: AOPr4FUj7Qr2T5nzLxdLJgJ/Xp2/xJa0GA5OM208HipDzxlcP75gfI9lPmw7VUbEz7Gczw==
X-Received: by 10.50.9.202 with SMTP id c10mr9443345igb.46.1461539835688;
	Sun, 24 Apr 2016 16:17:15 -0700 (PDT)
Received: from linux-yxv0 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id jk7sm7678682igb.3.2016.04.24.16.17.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Apr 2016 16:17:14 -0700 (PDT)
Date: Sun, 24 Apr 2016 19:17:08 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160424231708.GA7573@linux-yxv0>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E570F86EE@fmsmsx111.amr.corp.intel.com>
	<20160422170410.GB23308@linux-yxv0>
	<CAJTo0LYnK-sd+d1bkJN39AhkAN0t+42Nonm38Qyy3BXm1nLYdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYnK-sd+d1bkJN39AhkAN0t+42Nonm38Qyy3BXm1nLYdw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW17
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
X-List-Received-Date: Sun, 24 Apr 2016 23:17:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2016-04-22 @ 08:29:19 PM, Burton, Ross wrote:
> On 22 April 2016 at 18:04, Trevor Woerner <twoerner@gmail.com> wrote:
> >
> > Have the eSDK and CROPS projects been announced publicly? Are they
> available
> > for us to "play with"?
> 
> 
> eSDK is the "extensible SDK', or what appears when you do bitbake image -c
> populate_sdk_ext.  This should be in the manual already, the tl;dr is that
> its an SDK you can manipulate after installation.

Thanks for the update.

> CROPS is docker magic to do builds on Windows/Mac.  Todor did a
> presentation at ELC: http:
> //events.linuxfoundation.org/sites/events/files/slides/Todor_Minchev_CROPS_ELC_2016.pdf
> <http://events.linuxfoundation.org/sites/events/files/slides/Todor_Minchev_CROPS_ELC_2016.pdf>

I was *very* excited to learn about CROPS at ELC, which is why I was wondering
if it was available to experiment with somewhere?

