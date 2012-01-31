Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rs8FF-0005zo-NY
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 08:35:13 +0100
Received: by lahc1 with SMTP id c1so2611786lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 23:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ajYPJCOU8KOBj/h0CZyNtobIXpwuJQCxIAqswfVFDLM=;
	b=p1PUcW4+ZCUm7Cfdo590vqqHLazMYEKzF92mhC+LxGXyFyQM/BhLkzyc0H9WISPALb
	E+iJMZXm7ybn5PWIO+Az5OcxySr4DzQgLBVYM10sveJAdTAQJNSHPixV1SnFrxmzo7XT
	6RlXCRQaAI9/ptE8kUsHf697JBzWVS/FCBtz4=
Received: by 10.152.122.38 with SMTP id lp6mr10529034lab.13.1327994839248;
	Mon, 30 Jan 2012 23:27:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 23:26:49 -0800 (PST)
In-Reply-To: <1327987091.24970.38.camel@elmorro>
References: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
	<d7e2e04d416b8ea8339b1bcc40af3043feb908b7.1327638861.git.raj.khem@gmail.com>
	<4F275CE2.4090801@linux.intel.com>
	<CAMKF1so+zagwZL5e4cSLu9XPaPDng4X9UnzSBVggnz656y3amA@mail.gmail.com>
	<1327987091.24970.38.camel@elmorro>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 23:26:49 -0800
Message-ID: <CAMKF1sp5UkNp_7fFmnUx-mBzbn7S5D_UHxQMR7DfcYQge2YVLw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 31 Jan 2012 07:35:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2012 at 9:18 PM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> On Mon, 2012-01-30 at 20:19 -0800, Khem Raj wrote:
>> On Mon, Jan 30, 2012 at 7:15 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> > This patch is going to require some coordination with meta-yocto and
>> > possibly other layers that currently have .bbappends on the task-core-tools.
>> >
>> > It may be as simple as moving the dependency into this new -profile.bb task
>> > file.
>> >
>> > I am going to hold this one for now.
>>
>> Are there other layers than meta-intel and meta-yocto that needs it.
>> Please speak up. Can I request meta-yocto and meta-intel maintainers to please
>> coordinate fixing the respective layers. Fix is that if you have been appending
>
> I've created a meta-intel branch ready to be pulled in when this is:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/log/?h=tzanussi/task-core-tools-rename

thanks Tom. meta-yocto maintainer needs to fix
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/recipes-core/tasks/task-core-tools.bbappend

>
> Tom
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


