Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 892796010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 15:16:13 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id y189so2095885qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+RukimzxImhLp5UeF71bXABqpWGEdJkF8FbNeb+qUaY=;
	b=t/HK/u8/sfSau0QtODPPL61UXOrBfBkzt2FspdBnHNwfBGOMpyMKnrpX6M7xbpU14n
	awLBlsENqHBgsAyuoGBYWl/iQ07cV2BMl/LzQQsx9k9mrbG4rfbGamQs+r3iuDPqZ5ng
	/ci52Vhuy1m77yYCiI/ZOtCPEuGcqifgEk+fcWHPNTr5kQOHF65vtlwLTU0//CRi0AVp
	LGOhlA2voxUbF7kjsp9YJtFNC/03IPpe0WTWPXlzvZQ/aN961xYLvBpnUCLwRCG5iimX
	qhxIyzyT4jiEf55bEUs2Yt2sOHpBGYhDSzpevwVbAdtTeoJryciKjsfltMGc7pPI3D+f
	KnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+RukimzxImhLp5UeF71bXABqpWGEdJkF8FbNeb+qUaY=;
	b=SE+AbR54xLQw04paf4DYNwodP4ctYnJl7bKVNMOvrADD6/rbDjExrKEfQmZt7N8IED
	4WxogOD1O2qqe6DP8Xftft3QXcX9hu5bn5LsV9s+qgwNygjntKemEewUf2tgBc1paVEk
	kO35xPsmO+yZVOKiMRB6umAMu0qIS6BUt25LyjiLftcT4aPQ9W4mKbjKwEfBLx2ukaUW
	RuBSralFwj9q7Vm+AMIVEXDT1Do8nkwMUo9XGyyeQR3usAlE7cKhAPU/7AwS36XiwlcM
	F0LoRokY+FtV3eKbwUMfHPdzCFVKjaB2i/FFWRexdQdHM8vW/ol14BXVWyCnColpdlYH
	Mh0A==
X-Gm-Message-State: APjAAAWzpCZuwwWZAzn9o5TqtEVOTdjEq+fO7QOjbsUVhilX9ucka8Ug
	d23YXlX0Tcze2cqThsO6ET0=
X-Google-Smtp-Source: APXvYqxcFy7jbLaNCf9NAe79Clmnesx4gpe0MR1dz5xD7Ry8UKY+HeEJn6oqsVmD5Oky8QNz6J2xpA==
X-Received: by 2002:a37:5784:: with SMTP id l126mr3354075qkb.373.1572016574309;
	Fri, 25 Oct 2019 08:16:14 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id t4sm1161612qtq.49.2019.10.25.08.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 08:16:13 -0700 (PDT)
Date: Fri, 25 Oct 2019 11:16:10 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191025151610.GA12316@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3>
	<20191025134458.GA22739@linux-uys3>
	<1e316ec4-e809-b66d-7a6f-53b0cc6fd1d5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1e316ec4-e809-b66d-7a6f-53b0cc6fd1d5@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 15:16:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2019-10-25 @ 07:37:34 AM, akuster808 wrote:
> 
> 
> On 10/25/19 6:44 AM, Trevor Woerner wrote:
> > On Fri 2019-10-25 @ 09:22:04 AM, Trevor Woerner wrote:
> >> On Thu 2019-10-24 @ 04:05:10 PM, Khem Raj wrote:
> >>> perhaps you need to add -pthread to LDFLAGS
> >> I'll set up a test build.
> > Yes, adding the following line fixes it:
> >
> > 	LDFLAGS_append_class-native = " -lpthread"
> >
> > (unless there's a distro-override way of doing it...?)
> 
> is someone going to send a patch?

Does this break on hosts where it had previously worked?
Is there a better (host-specific) way of doing this?

