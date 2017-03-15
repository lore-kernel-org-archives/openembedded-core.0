Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id CEF1073043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 07:24:38 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id m27so61018354iti.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=jnDKWxyvZUzX0Sq5KAwYZi/8Tvxlc0qZDZsn7DNh/w4=;
	b=Zt/crspT9gOuxjXmS9gM+3gR+rqoSG4X6IDWjW0fmThRL8ExXAR3vY8xP8U2pAvBm7
	paqYseSWmapDza1XoyJPzpmnBpEnIlOcF5CAATPJrPia+WoKQ2+nt5ho7ki4m1QB1sW3
	jrPPEwW/YnhZz0HM+TzQvbtaEUdNXQ9KGSIDabXT2Wb0jd5+6uwgQ2UVwWhbpa4z0jO4
	shpBYeJOGxQcPryBT7LdPIpllE/NxDxJliBk+FLTPA6NjKZxXgE8kQWNWpwZP2GrlX9J
	kVbmAPjHNK54zAJwsjewno3F3j0lNlFfyKOKe7fvwzSGsGQ/zc5qyBm4T8L8bwuHBHPx
	IMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=jnDKWxyvZUzX0Sq5KAwYZi/8Tvxlc0qZDZsn7DNh/w4=;
	b=Iu7sdZqOoVK4uNA2CVdYORcv0NnuAQFKf94im+/xv2jWsCKk/JTFsjONkKosNbIWa4
	ZbFvlnqJjBoewzu6ew884+dvmQKVGByko/WzrDPBeOlY8RDShBTqne9roz6oFWmlknGb
	BiyUznYU8rVlYb5zHX4rpE/HLqMmEplLd3ePFhHGfu1ApaL9WkVO3RJe0oleTkgHQnFP
	un/0DG1kd7mSLQtoGimsj+YCh3DrW2JtJ42jj/s4I83li7jW61B7xAeH1BsMfh8rQ4xG
	f3xq8wKEsvOiCj4ubjRzx5CvlWLEkDoIrHJW8MhKo3QYjYbsynbByeIdRHQCYwLUZp5n
	SWFg==
X-Gm-Message-State: AFeK/H2E5PwsK53BS2IKDb2P9BjOuQ/CPYozaSAmhhWQU8oiiiucTAA/858c0alV+0Gz5mgZ
X-Received: by 10.36.91.67 with SMTP id g64mr3804884itb.20.1489562679506;
	Wed, 15 Mar 2017 00:24:39 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCEB.dip0.t-ipconnect.de. [93.232.220.235])
	by smtp.gmail.com with ESMTPSA id
	w75sm1163353itc.21.2017.03.15.00.24.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 00:24:38 -0700 (PDT)
Message-ID: <1489562674.6396.89.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Wed, 15 Mar 2017 08:24:34 +0100
In-Reply-To: <20170314180644.GA22000@linux.intel.com>
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
	<20170308105729.GA22401@linux.intel.com>
	<7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
	<20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
	<20170314171147.GA28498@linux.intel.com>
	<1489513785.6396.83.camel@intel.com>
	<20170314180644.GA22000@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Wed, 15 Mar 2017 07:24:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-03-14 at 20:06 +0200, Ed Bartosh wrote:
> On Tue, Mar 14, 2017 at 06:49:45PM +0100, Patrick Ohly wrote:
> > 
> > > It's not a big deal to run wic sequentially to produce multiple images,
> > > but it will create more problems than it solves I believe. It will be slower and
> > > will make a mess in image naming in deploy directory.
> > 
> > I personally would prefer to support generating more than one wic image
> > per image recipe. The different output files could be distinguished with
> > an additional suffix (".efi.wic", ".live.wiC", etc.) where the suffix is
> > either specified by the WKS file or the configuration where the WKS file
> > is selected - the latter might be a bit more flexible.
> >
> 
> From my point of view ths would be against the current design of oe
> image building susbsystem. It would be also more complex and slower
> unless we'll find a way to dynamically generate multiple image creation
> tasks per one recipe and run them in parallel. In this case it will be
> even more complex.

That's a good point. However, directly sharing the content of the build
directory from different recipes is also against the OE design and
requires special attention, for example to suppressing the do_rootfs
task in one recipe and preventing do_rm_work in the other.

Either way, something that works out of the box might be useful.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




