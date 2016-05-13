Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 18D8060762;
	Fri, 13 May 2016 17:24:04 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 190so141146742iow.1;
	Fri, 13 May 2016 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AYJ0FBGoj/hPYLaXeXzScmmmtc74HLnkhLJcZqWGK+c=;
	b=aDsP7EYz6Em72+U5AaHlfs/wheY+kcQd7r/G2HfTQ27nWsMxxKnQxdQsnj+36W0peY
	hQPftCyGdlmH3lueEeQILx1zW7BlBpqmVfXmQMP9tb/uU/C/MwtcRkDOxMJb7lslSAvr
	91Kr7rkOmc4lZ5OfPlKSO2PqLnBzMcIe9RzUb8HGIK83es2d8J4pe70T/z1fVVMeUuyi
	YL0q79Ihoy0M0xDIpsCKHbmULFYOzDiHQ9V8iALMrubjPmZFMn3aIK6VL8hw52xRN7Rs
	VguWzCuxPkQTfUAWyjJ/9Hn5V7AV2jnb2iDSME+O5eFBHEk3O57PuKCrMK1x0L9ijHFb
	ITJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AYJ0FBGoj/hPYLaXeXzScmmmtc74HLnkhLJcZqWGK+c=;
	b=nNWUo6s4Yc2qiYZAR2SA9ffaxaD8oKsFm1HLrdPzU/8YjUpsjG3LNEsMq0tI/QerAd
	/yG1jf+T9TVFGKEH74iTvS3fqUeux9J4PnTzoBX3VSnSfPukMHN8Y2hRjOQfMeChSoVI
	YLiDgJrdBW4DrmrnEv6goZ5+NEJ5TTiiShdHFfJW2NvVNiOYKjKV7D90LvG6abSg7dWM
	SVnAFadZkTTLKVH9ET+5//ukocjlppLh7jhmHvORNH8/Ka6+KfiyQexHUXVRIZUQf75r
	MgZFx1uKaG6Qtlvta5duIR+Uf/Gvvx2MF0CTTGy6LwVvMaM8BQ642DijnEYSdkcA0joq
	/bOg==
X-Gm-Message-State: AOPr4FVJPmNwV/2wuO5+SfWVdHnyY+1+sXh+RbpoV5jxXw6o9KoHTE8cNJTQMLi2DAh9vA==
X-Received: by 10.107.157.203 with SMTP id g194mr14246771ioe.82.1463160245251; 
	Fri, 13 May 2016 10:24:05 -0700 (PDT)
Received: from linux-fl6i (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g34sm4597218ioj.12.2016.05.13.10.24.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 May 2016 10:24:04 -0700 (PDT)
Date: Fri, 13 May 2016 13:24:01 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Message-ID: <20160513172401.GC30983@linux-fl6i>
References: <CA+YB3rZCfCiLQEg5Br78ZQ=6QJQiXnh_pGTr0-XFQZFkwniYLA@mail.gmail.com>
	<20160513135707.GA30983@linux-fl6i>
MIME-Version: 1.0
In-Reply-To: <20160513135707.GA30983@linux-fl6i>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Please help edit OEDAM minutes
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
X-List-Received-Date: Fri, 13 May 2016 17:24:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2016-05-13 @ 09:57:07 AM, Trevor Woerner wrote:
> On Thu 2016-05-12 @ 04:32:01 PM, Jeff Osier-Mixon wrote:
> > I admit defeat. I have been "trying to get to" the OEDAM minutes for a
> > month and I am clearly not getting to it, so I am now getting out of
> > the way. We are crowdsourcing these minutes, because collaborative
> > effort is what we do best.
> > 
> > My raw notes from the meeting are here. If you were present, please
> > help edit, fill in gaps, etc.
> > 
> > https://docs.google.com/document/d/1rPvy-QQkP0Z4a0PGOBkljfzGGzFVWREDz18vZzWyL9s/edit?usp=sharing
> 
> Ok, I'll take a stab at some formatting and stuff.

I've reformatted the notes (hope you like/prefer it?). Also, any place where
comments were recorded and attributed to me I tried to expand them to full
sentences and add the things I remember saying :-)

If everyone took 30 minutes to check/expand on anything attributed to them
that'd be great.

Best regards,
	Trevor

