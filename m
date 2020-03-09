Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFFC60B3D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 11:41:14 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r15so5599399wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 04:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8FJGQVSfvAzsS4Z7cKKIADB1RPR7/1JHJSJo8Jvhduc=;
	b=AVd6oBqeBHjb3kFI/fQjqPx0tgtnmPjhLeOMiZqfKj7qcMAMfrHwTM2umg8LGTW11q
	tpjRMVP0FY3O+mhPrgWJrrGqWRzHXr0AzQ4ovRUrsg2nly+jK38/XYk/Lx/VTGCocmja
	LdME6p4pk6gHUA7xCoSryCWNX9FZck4iJ6lyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8FJGQVSfvAzsS4Z7cKKIADB1RPR7/1JHJSJo8Jvhduc=;
	b=qOJsxpdOiOFzOQ/t1sIPdLmmBbLI09L7hxnvo0KH8Py93eMmWt6XTvB5QxBflCtPQ1
	vTwV1cVkBy9xjWp1Plvd4LZuxTBdUw9Z90FKgshUkBUWVdHFam49RocrZIOH32n/Gzc3
	lqLokmWEUdsZ+ller2uk1mvm7A5Z7FoXZNmMDdJ4owGo0x/lg40CZy1lD1vpafVx08bz
	PAy8VVYKPcKBTcowWOyfqt7HRoNeIBTblKN0ur4nNsn80Fad0U/D5pBdiV9QhGDODWLj
	CRQv7yKHp2B+TMAAHNiCQwbKzHAFmD6106V8jyFSMuf0FfALSmqudIAkq6H8PcynR3QI
	+nNw==
X-Gm-Message-State: ANhLgQ1kkYPvvq2D5gIz3iUYp3LPkHikZ/0creLEGY155SyRwNHCXvX5
	YdVmuk8S6BlLXN3u59K2vNsZWQ==
X-Google-Smtp-Source: ADFU+vusPbmqinWpLc2zuq3jWlKk3ts3611iYRee1OiZQxOG6L7Ignr5oJwRxF1MzjYqSnmRik/Ewg==
X-Received: by 2002:a5d:6591:: with SMTP id q17mr2566686wru.22.1583754075683; 
	Mon, 09 Mar 2020 04:41:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c8sm52226857wru.7.2020.03.09.04.41.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 04:41:15 -0700 (PDT)
Message-ID: <d6099f127ccb2211996119988c9da3f95c66becb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>
Date: Mon, 09 Mar 2020 11:41:13 +0000
In-Reply-To: <20200309105240.GA2477@localhost>
References: <f4e3d6a5a638b669dc742fddb14d652f06715d04.camel@linuxfoundation.org>
	<20200309105240.GA2477@localhost>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] buildtools-extended-tarball wrapping builds
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
X-List-Received-Date: Mon, 09 Mar 2020 11:41:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-09 at 12:52 +0200, Adrian Bunk wrote:
> On Sat, Mar 07, 2020 at 04:17:28PM +0000, Richard Purdie wrote:
> > ...
> > This does mean we could drop gcc 4.8/4.9 support if we wanted to
> > and
> > rely on the tarball support for centos7/debian8.
> > ...
> 
> Debian 8
> - will have LTS support ending at the end of June, and
> - ships Python 3.4, which is no longer supported by bitbake.
> 
> 3 months ago Yocto master stopped working on Debian 8,
> and as expected noone complained.

We still have one debian8 autobuilder worker:

https://autobuilder.yoctoproject.org/typhoon/#/workers/9

and with buildtools tarball it works 'fine'.

Cheers,

Richard


