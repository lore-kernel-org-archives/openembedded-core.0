Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id B92496BBDE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 14:56:37 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id l15-v6so27181508lja.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 06:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=mKDbWG35u3wO8gutncJXekVmCvmaVOsoquau1S/PdgA=;
	b=D5YDTG8PRPFrlY/JoVTdkgVz67lEyWTkJOqRYKUC8n9B3IMjtVsv+eVj872t2gEMTK
	qZhCHHcT79vIfKi6m071K3VyfVkbBWW8ZhxtjS+UqfkkwVMc30I6bfJG+oxnFDkf8sI/
	kEnd5yn0jGCDE4uSmGbNqvilNXHehdw0nbkgDeqeZYS33hPHT7AZsrLaYgfxjNG9TFCc
	+AoW90PyHfoFhpHXjOAoV8gEIwqo6h45ahBGmt/yN2t3U1w/DNDhvqY/MxNVge3cfVAt
	Pbjp8NTBRlM73kU71XJdVPn3QESng09iGjEp3lWbotdDqgHF3X8wpOyB1vySxYexz7Rv
	a0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mKDbWG35u3wO8gutncJXekVmCvmaVOsoquau1S/PdgA=;
	b=D56ngUihO+AXc5QhCyc85YifzfeQY+Du1Pds7FGJcwUsSdhWtWZCJLHK7XRUsw83cL
	PzeZX7Wxf/aUa2VjCnE8cPUL1hIVMicSopKKST3Mo5a2F1R9zlXaOpTaSy3J8hhsJ0uh
	EzLPBApO9OFyEJ4mCqRieowsOb9oKaKhRkZMkK69iY/8ISdi6ZtsMEBgZM964zSNJ8Qe
	ViorPBpswUIOBCNNhpiDLZeFkmiAvKeEtR6/97xfWSPSVHCPXCklsj1zTedYduHW+Y7I
	WoyhYuvW4PbNTf2skMs3t6ILqR3yTzas6msOFJ5mzjfSKsIHpWRxhXFmu3Rl2+iw3pui
	GyJw==
X-Gm-Message-State: AJcUukdrThUrvjw98AClIKJMBcumSMYJXW7MlS7n/BqIYiOOX4DU5GQc
	LrBAe0Z/n+jlI1LFYnB3banRY8yMZFI=
X-Google-Smtp-Source: ALg8bN7etnXOQ9Hyl0tgAQEWPh/spwiBZrxMmRg1G1ma05drJaBElLYIdcNxSvVLd9VtqRY2CuyfnA==
X-Received: by 2002:a2e:5c07:: with SMTP id
	q7-v6mr26428509ljb.119.1546440997821; 
	Wed, 02 Jan 2019 06:56:37 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	q6sm10055412lfh.52.2019.01.02.06.56.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 06:56:37 -0800 (PST)
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <20181231120559.25470-1-jonas@norrbonn.se>
	<70bb07c3-1898-5a46-c6bf-ae788cfd7181@windriver.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <5bbd5c15-9dc5-7fdd-3bdb-e9b8f4eb6731@norrbonn.se>
Date: Wed, 2 Jan 2019 15:56:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <70bb07c3-1898-5a46-c6bf-ae788cfd7181@windriver.com>
Subject: Re: [PATCH 0/7] systemd patches
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
X-List-Received-Date: Wed, 02 Jan 2019 14:56:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 02/01/2019 08:58, ChenQi wrote:
> Hi Jonas,
> 
> 
> Cleaning up systemd's /etc files while leaving other softwares requiring 
> /etc files is not that pleasant. At a minimum, systemd users who are not 
> aware of this 'stateless' concept would be confused. "Where's my 
> /etc/systemd/system.conf file?!" They would ask.

How about this:

In order to support both the "stateless" variant where /etc/systemd does 
not exist and the current situation where we have only the 
(low-priority) top-level configuration files, we could do this:

i)  Let systemd install its unmodified config files into /etc/systemd
ii)  Provide configuration snippets in /usr/lib/*.conf.d
iii)  Provide the overriding configuration snippet directories in /etc 
with symlinks back up to the toplevel file, making the toplevel file 
relevant again in case somebody is modifying it directly.  i.e.:

/etc/systemd/journald.conf
/etc/systemd/journald.conf.d/00-systemd-conf.conf -> ../journald.conf

The important thing to get right here is to give the user an indication 
that he should actually be putting stuff into the conf.d/ directory... 
if they see that the directory exists they may go read the man page and 
understand how these files are stacked.

Thoughts?

/Jonas


> So I'd suggest using something like 'stateless' DISTRO_FEATURE (just 
> like 'usrmerge') to control each recipe's behavior.
> 
> Best Regards,
> Chen Qi

