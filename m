Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsVjR-0004k0-0c
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 10:44:29 +0100
Received: from mail-vc0-f199.google.com ([209.85.220.199])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 01:29:06 -0800
Received: by mail-vc0-f199.google.com with SMTP id p16so381534vcq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 01:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=sTKuH/wBT5EptDE8otX3/8v/b1YiS3r5fkPNxqCFsrM=;
	b=liFmwxOXZDOMKVcM0dgXfqYTNKbmuX0zuQGsgCC6dSEiEjCZ9QAWm5+bAIjZfNQov3
	FMqTJ/N+SP4Hk5gUpIme5XsVYsLKWB5QKdJFwtOVVsU6qsiLD6u4EVj1JyWH5Xi86xqt
	Bgm5s6MPjOH94O8G96EkZ7wJBO8QUcnL9pDoko+wHBseGuW9fl2Lkgh/AKgJl26FRfhP
	rbmZyMmNJeTpnUn8mhIoF419FCPO4hLFJNRb9KP+xQ9czPXfhgySK/HTwoct9qSFMSQB
	9jbfpRKOpb53zQLSkIT6En/TrPY7DHvTUP0sqz/FHRGX08ej8Lgp06iR1NXees/PHvsK
	v58w==
X-Received: by 10.58.239.162 with SMTP id vt2mr88972865vec.1.1357637345744;
	Tue, 08 Jan 2013 01:29:05 -0800 (PST)
Received: by 10.58.239.162 with SMTP id vt2mr88972862vec.1.1357637345675; Tue,
	08 Jan 2013 01:29:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 01:28:45 -0800 (PST)
In-Reply-To: <1357631895-9535-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1357631895-9535-1-git-send-email-fransmeulenbroeks@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 09:28:45 +0000
Message-ID: <CAJTo0LaMwJtHVdXyugtVPivvT8qNj1smq2fL5yzTw0wrSAv6TQ@mail.gmail.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
X-Gm-Message-State: ALoCoQmgM4DEKpgzWwxWENzkds0ZrnKuSiHQM4q+93Dc/6rBXv5y1LXpHHadqFqa82UyUffLJx85ic9sKdUvD4V44tFLHc7b8PV3MKJCiNKzCNBcilQ7EeKTnuCWpXEWO9lVE2nFYs7JrWmjGNAsvBkmzdqu4oxitDzHSC8jKR2VOlqUvSrKlu7SvkRWUX7yDDD7F2B0EqGL
Cc: Frans Meulenbroeks <frans.meulenbroeks@axon.tv>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] inotify-tools: new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 09:44:30 -0000
Content-Type: text/plain; charset=UTF-8

On 8 January 2013 07:58, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> This patch is provided as is, in the hope that is it useful for someone.
> I have no plans to become the maintainer of this recipe or so.
>
> I was not too sure if this is something for oe-core or better suited for meta-oe
> The patch is against oe-core.
> I've also decided to put it in recipes-extended.
>
> If there is a better layer than oe-core or a better dir than recipes-extended feel free
> to put it in a more appropriate location.
> (and if you do not like it, feel free to ignore)

This should be in meta-oe, please re-submit a patch there.

Ross


