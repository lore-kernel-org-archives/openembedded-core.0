Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA8E87D40E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 13:12:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s5so3495180wrw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=GdRdESASlVoQksxkqjZNs3TdgzYPm+BX2sQR3grbbAQ=;
	b=ZQOzuoTg03glrUtZydvF1NwLOIInT7BAdCwstl05jWhN2Bf5LHMxB/9CQBcGngFwvu
	NseAof8MzguEbepF+/UGvQJ8IrbUdBN5mO/gAvyPfRz1tK/DLeKGPnB63Mhk1hYA/oRH
	jUWNaeJ3Tu7J+rRDJqMMJ6jT1PhdEBjHph4ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=GdRdESASlVoQksxkqjZNs3TdgzYPm+BX2sQR3grbbAQ=;
	b=n6olE95Ta5WQ1K4lvbSv+qYbxeNlcnQUaVrNxNF9XYrx3eixtm/9iiCY1nbSdTbG22
	ASvLyWM9KMRwyXOYonbFO+0odWpMeOcuHU1iWSMkGnAFCQvVQYlwkRhngUkdkm+MVJtI
	C/2B0IQKxvMd2Zk6aUwA8wDKujtghRgJ+nGE5Z+W18td77t0JtsJB5Vm9XnOqbMjnxW7
	nEFQSlFgDCs/CQYmDlziS6P+2xgsuQhNXQuP+v4Ot31q3MjOxTnNT2il6g7piMowTN5d
	UyqldLJke5kLXeyrxMigoKd1pfofoT8GrhGLbND7G+3BJbgXilFGZJeKdJzJeP+ieaKn
	IOwA==
X-Gm-Message-State: APjAAAXEeJxyxzApnrBPsDMcmHpHlHGSVzluASERlhgb74/ydI+UDbj1
	x79YfITpyQRF7j55cSR8heLxxg==
X-Google-Smtp-Source: APXvYqxDps2VMnw9VT4eyfOmFbvhlaIUTuLvUFkP5h2wISMX4qiBYOQg6RcofwhNTsKN5WUYpkvorg==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr7903005wrj.102.1573477970482; 
	Mon, 11 Nov 2019 05:12:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t13sm14373035wrr.88.2019.11.11.05.12.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 05:12:49 -0800 (PST)
Message-ID: <63e30a3a07cd78e89c54637ad9893e8a1aec9f84.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>
Date: Mon, 11 Nov 2019 13:12:47 +0000
In-Reply-To: <20191111104209.GB28797@localhost>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
	<717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
	<be45a323-4379-8a13-71c6-21f98e3a0af4@gmail.com>
	<afa8eed45a5acefa38a89e82e5a833f387963a8f.camel@linuxfoundation.org>
	<20191111104209.GB28797@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Mon, 11 Nov 2019 13:12:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-11 at 12:42 +0200, Adrian Bunk wrote:
> On Thu, Nov 07, 2019 at 04:32:35PM +0000, Richard Purdie wrote:
> > On Thu, 2019-11-07 at 07:55 -0800, akuster808 wrote:
> > ...
> > > Are you taking the other patches also submitted for sumo ?
> > 
> > I am worried about what the bigger picture for this looks like but
> > we
> > could try testing them. I think the TSC needs to discuss this.
> 
> How were community supported branches supposed to work?
> 
> All branches from 2.1 (sic) are documented as supported in the wiki.

That was changed recently and I kind of wish we'd waited until we'd
followed through with a consistent plan which covers the spectrum of
EOL/community/stable/LTS.

As I've said in a few places, the TSC really needs to figure this out
and its complicated by the LTS discussions. Those discussions are
happening but aren't simple.

Cheers,

Richard


