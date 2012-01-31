Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rs5Ju-0004Uh-5N
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:27:50 +0100
Received: by lahc1 with SMTP id c1so2559899lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 20:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=c7l04RAGRnAXVqzRyAIB+q0+IJoOwkp5aLkdav/tVVc=;
	b=j0bV6F6ob/odI9853epDLBpMjdRHcnzybzm6eg8dk+kObMoYJy1bX0HRye/n2Ciya0
	OkJjFCjRSLN8tfusheOg4Owx+2sr3V/185gbl7BgJ9ikdXs/41VhxZVBHWJVeOIPTGix
	s7TE20cV9OtPZ9S6yiEL+tABvaiu6CC5sgZCw=
Received: by 10.112.101.34 with SMTP id fd2mr5151064lbb.16.1327983596237; Mon,
	30 Jan 2012 20:19:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 20:19:26 -0800 (PST)
In-Reply-To: <4F275CE2.4090801@linux.intel.com>
References: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
	<d7e2e04d416b8ea8339b1bcc40af3043feb908b7.1327638861.git.raj.khem@gmail.com>
	<4F275CE2.4090801@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 20:19:26 -0800
Message-ID: <CAMKF1so+zagwZL5e4cSLu9XPaPDng4X9UnzSBVggnz656y3amA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] task-core-tools: Divide it into 3 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2012 04:27:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2012 at 7:15 PM, Saul Wold <sgw@linux.intel.com> wrote:
> This patch is going to require some coordination with meta-yocto and
> possibly other layers that currently have .bbappends on the task-core-tools.
>
> It may be as simple as moving the dependency into this new -profile.bb task
> file.
>
> I am going to hold this one for now.

Are there other layers than meta-intel and meta-yocto that needs it.
Please speak up. Can I request meta-yocto and meta-intel maintainers to please
coordinate fixing the respective layers. Fix is that if you have been appending
to profile tools then move those respective bbappends to now append to
taks-core-tools-profile.bb. If you need help let me know.


Thanks

-Khem


