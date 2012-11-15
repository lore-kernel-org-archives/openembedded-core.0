Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYwjo-0006Kd-AN
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 11:32:00 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 15 Nov 2012 02:18:01 -0800
Received: by mail-ia0-f197.google.com with SMTP id j38so2788133iad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 02:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=VIGb4cJaxlU6ZTxwZgbGL8StnAvv3UMszxBKA1qOchQ=;
	b=SPusyb/UN7VTVcJu8G6Oq6OsrxqB0tfgQj6yOkgLWfGufFJ1328UOZ0klUAXHeepxe
	CCBHbUtSeZAHUPcLR4ykU0zjndrYlXWJaVD0VirKt2zWPn2KlNpebun2F8tBiLLQcbMm
	UraCOukig5iuNRcuuCi86GkuOQbaLvpkoqZB1hEXZCd4IlPEDeOAx2S60TrciRSxQxUg
	4yb9YJnwEJUUD/v9E7hGAPCrGpVGAgGVCwGys+eJ7SzA5MZvYadjWjlXmB4eBHAEeBJb
	MG+yLhE/6HHxhiMGPYQLyaBy4RuJX/FadQn3mUgEnQtrclVGsxS4QEdW3ujv9ifsAiQM
	o1nQ==
Received: by 10.182.157.44 with SMTP id wj12mr463170obb.41.1352974680235;
	Thu, 15 Nov 2012 02:18:00 -0800 (PST)
Received: by 10.182.157.44 with SMTP id wj12mr463165obb.41.1352974680096; Thu,
	15 Nov 2012 02:18:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Thu, 15 Nov 2012 02:17:39 -0800 (PST)
In-Reply-To: <50A3FE54.4050408@mlbassoc.com>
References: <50A3DDD7.9080205@mlbassoc.com>
	<076154C344324301A35470B01A4BF3A3@intel.com>
	<50A3FE54.4050408@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2012 10:17:39 +0000
Message-ID: <CAJTo0Lai-jFbnQsjS_vkXN2XvZyuKJsLvZ0f+tmxOmdBdWqhtg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Gm-Message-State: ALoCoQktLGXoE+iHoQ0POhry7GYdLdeABdJL2B9YT6bIuOk1mDPJN8fh+zQ6vTmcQdU7R9U/86hSRbJmJrToSBcmA3xpde2RxBE2T3gf/bSo9JoJrZHqTcgktMzIMxF4gbI71CMRl8d/lMONM0ZK8qwxxkC43k3RZ2UaHko9ik8vvS+KNmOfnpEO6UBovdHuGY+2uHEkjdSV
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Can't build qt4-x11-free
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
X-List-Received-Date: Thu, 15 Nov 2012 10:32:00 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2012 20:25, Gary Thomas <gary@mlbassoc.com> wrote:
> That said, I pulled from Poky/Yocto master on Monday, Nov 12, but the
> important change
> says it was committed on Nov 6.  How did I miss this?  I know that the
> Poky/Yocto tree
> is a little removed (in time) from OE-core, but how I can I tell when
> changes actually
> hit the tree (just for the next time...)

One of the irritations of git is that as far as I know you can easily
see the commit date (when those changes were committed to a tree), and
as the commit goes from for example a branch in oe-core-contrib to
oe-core to Poky, the commit date doesn't change, but you can't easily
tell when a commit was integrated into a particular branch.

Ross


