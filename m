Received: from mail-vb0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFCJd-0004ip-Lh
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:39:38 +0100
Received: by mail-vb0-f50.google.com with SMTP id ft2so1962138vbb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 16:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=92AW6iJP2pULJ2gPF9ZsreCSC6alRtRjUgxWpOGOrdk=;
	b=adT9YrIoOZlgrc70RAGc2l854WPmN3wYIDWNBt4vKYNx2Sng6+qwfj/ckMz3u+803t
	lVkzRraZNfhMJTqCIqm9SDABvUcZr6C/s83I6MruXFSlhrcDFeDnT/zYVJaSQPnvWJ25
	5rXC/zEmvtz8CeHpNJEvJPcneMRWvrm2hyjdoeR8rvFy01Wt1PQHSu6HE2b4QK8TZZof
	wayEma/mONCnZ+ZfP+f96g8zZNzVFu5uBYILTVpjim/oOmcTCFSqJw7eATYokpT6YcKf
	QvtcBvZ31/d8fsQCmjAtlPdFSMkr8o3pEJjEjmWxLbNA+yw/VjxcK/qwOE5tgYwFX7Ih
	04+w==
X-Received: by 10.58.198.79 with SMTP id ja15mr5866593vec.15.1363044178860;
	Mon, 11 Mar 2013 16:22:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Mon, 11 Mar 2013 16:22:38 -0700 (PDT)
In-Reply-To: <8D545500-9892-4FC1-B4DF-825AD4219165@gmail.com>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
	<8f815c617b69812e749a5a197a3903fe8daaf645.1362873102.git.raj.khem@gmail.com>
	<1C3733EF-6163-4090-949C-5B73BBE02DEB@dominion.thruhere.net>
	<8D545500-9892-4FC1-B4DF-825AD4219165@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Mar 2013 16:22:38 -0700
Message-ID: <CAJTo0LaRSwn-AtsZLpYUaLN-fRVZLXF8PakVwg6qbew_+s+hcg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQmpmz7OF90CdKcZbT7od/O0hlh3NsqJogaZyL9Y3HCP7OEikZKwDPnqrQMYu1WTQ0ukNIck
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] systemd: Package hwdb data
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
X-List-Received-Date: Mon, 11 Mar 2013 23:39:42 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2013 16:03, Khem Raj <raj.khem@gmail.com> wrote:
>> And aren't you missing a RRECOMMENDS?
>
> I think Ross already has this taken care of so this patch might be moot.

I have a slightly more worked out version but it's untested, so feel
free to continue your series as I won't be able to test it this week.

Ross


