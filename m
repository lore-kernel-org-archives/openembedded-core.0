Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D59CF60670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 18:58:59 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so85045183wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 10:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=4xzLbEsPH8q3PLJUOfOR7TfrKDmoA4iYbqBHIQj0Ua8=;
	b=iAAoMvIwxQriZs/JUT1rHYdqbXLJd5VhoNmx8/TorIaCkE3NDqngO0pNak8N56siYu
	j9nGMZf5RTukXr1YnDRoQ2NM1YZ9anGduzg0BxIWDj8d0AKYGCzUWirBbLlJijIqF+mG
	Jg4yNBFuxTYuPDPne1R64uwW8xBZTbPoiUrsMELXGp1DIqZCOwUEEh0/d63Fk09hclxl
	oPGEXJSc2kQrRlkm8M56K3mu5xolGKkve9Ehsvpez05mibIA8CtRHel1Vxw9xEPHY9df
	O4scwjrcdWJSF7FUtllD3UqRM1VRFoJ7w/NSjoarsqTDYMsGoSi2/lwML0L4QqA1zPeO
	fzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=4xzLbEsPH8q3PLJUOfOR7TfrKDmoA4iYbqBHIQj0Ua8=;
	b=L8eMN8ULHzXFIVD1bDKQcEXPKBhpGj8OMw2vmgS5U+HeMWamDTc1zBRPRH8UoQTBAU
	PO2WDwNl/idNNF9PjIdF707DUyY7OwZ+FbcV0XMYZyF+6M7PPug65me8EokePz9pzpkZ
	qianQtJ3WYj1znmDArOfSBT9cmcpw+z470ItSNNTT6MPNKKCZg3HZ4jByWspaUn00gp5
	cGhGAoq7FXklkya2MQdEyt0y1QB8uxs4gPukj0w9X/BXa+9TGSBB4TJayanBsOphbUas
	svbjTuFMmv6CnEYzeogHc2VNX8pYzPCH2dMrp4f4gjdzVLvChumN5bht8yJN5DKrp/Cq
	2NEQ==
X-Gm-Message-State: ALoCoQk/Si6dwz6kVdxpk0eVb6KMi1bZzE9wV9kWcRfrz4A8ZffhWiuK26a+lOHtAf0/BZPkHzqa
X-Received: by 10.194.238.231 with SMTP id vn7mr12605492wjc.109.1448045939749; 
	Fri, 20 Nov 2015 10:58:59 -0800 (PST)
Received: from blackadder.local (94.197.120.87.threembb.co.uk. [94.197.120.87])
	by smtp.gmail.com with ESMTPSA id jh4sm768331wjb.33.2015.11.20.10.58.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Nov 2015 10:58:58 -0800 (PST)
Message-ID: <564F3ADB.7040000@intel.com>
Date: Fri, 20 Nov 2015 15:23:07 +0000
From: Ross Burton <ross.burton@intel.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
	<0a2bdfd48b566acec7f05734758da7811980a0bb.1447455202.git.chris_larson@mentor.com>
	<CAJTo0LZYFwj9+5XOS6ewLTKwiWoBd7+YY+uXoCe0V4M7YwYRvg@mail.gmail.com>
	<CABcZAN=HG8AJCjWHWTwWGs4vswnEL=SRF81fZz5r+iE+iQZ76g@mail.gmail.com>
In-Reply-To: <CABcZAN=HG8AJCjWHWTwWGs4vswnEL=SRF81fZz5r+iE+iQZ76g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 6/6] psplash: add systemd support
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
X-List-Received-Date: Fri, 20 Nov 2015 18:59:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2015 02:03, Christopher Larson wrote:
> Interesting, is psplash configured in our test environment? Either way,
> worst case we can drop this commit for now and can revisit it. I'm
> heading out of town tomorrow until December 1st, so likely will be
> limited in what I can do to address any issues that crop up during that
> period. Thanks.

It should be working - at least the sysvinit images work absolutely fine 
and show the splash.  I'll add giving this a go locally to my list of 
things to do.

Ross

