Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4437771E16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:27:00 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id x75so19393601itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=lQPzhSMwT7MR8hfkn14j52hR0+PdqCj3s9tpxtVVWYo=;
	b=pOYuAkXPJY2J44FbkrAxsjDhG+tVUsX4171HxT3iNjMwwsoz2Vr6YNkJ/RPGrzVfdS
	1ZzjQKo3FkqANVekaAgQWf/pDMqYpSpGuMUPUueOlk6wYaZlZrvBWkVo5DhvF+AMvadn
	lMC/ttkyptDuthxORwnov05QZYwIrpCUk5Q3PISvAsdlJNm13L1+IE5Xt+JP602ESrPe
	jadUaLO7TP7oM58NoxGjAy+z94SrJ7nRnBE1txcmOc59D9tUs5bFGXeUuup5d2Y+SBxF
	kdtlxUN9f+B95AZog6+niPxXzguCssaUE5DFjXjl+lx7bdoFSm04S53i9MuXKfTAzgzA
	4jnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=lQPzhSMwT7MR8hfkn14j52hR0+PdqCj3s9tpxtVVWYo=;
	b=EK/kvAXZCS3bMe+EJ7U3jioDQxdNlILWPyw+QscBIVWpQTqxMM+yxKJFAwBTWtN83Y
	Onq+16dzMDV+hmZCUvByNcykjNXQFIHNlc0oZRKtaImfOJbvLP6ijygn6ZEb0CeTyqRY
	XDc7IVlJN+p3IPfDeSIDS06TCWUyrFeQ1+7agobcz+2ExZDaySwGjuvJ2EhJMNMjE9rF
	IMtXtu0/UZSTHEvOHUmcDshodqbFub4sVyTnAIcW9JH7GcrmP+M+bP88d0O6Dip1YISf
	uAUk+1+7d9wmKh0fjDgxmGxV7z9LBEFppEz8ay4IvfXCuzXRVTo9jiNEQa+SaizDNtgZ
	6E3A==
X-Gm-Message-State: AMke39lsqhMJ5CUSXPkIuv7MfdG02ZHJz2MzvCngvbwc+Uj73q0dhFpaDLww3zJFAIAMNv0/
X-Received: by 10.107.128.68 with SMTP id b65mr1427476iod.113.1487240820346;
	Thu, 16 Feb 2017 02:27:00 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C6B9.dip0.t-ipconnect.de. [93.232.198.185])
	by smtp.gmail.com with ESMTPSA id
	n134sm3058600itg.19.2017.02.16.02.26.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 02:26:57 -0800 (PST)
Message-ID: <1487240814.13854.449.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Feb 2017 11:26:54 +0100
In-Reply-To: <CA+chaQebkND=ipbVvDGAJo=o79SsucECyyNgaaMRYyiOuVqZ2g@mail.gmail.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
	<CA+chaQebkND=ipbVvDGAJo=o79SsucECyyNgaaMRYyiOuVqZ2g@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Thu, 16 Feb 2017 10:27:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-15 at 19:32 +0100, Martin Jansa wrote:
> Are all changes necessary for this to work already in master?

Yes.

> Yesterday I've noticed that rm_work for some components which are
> early in the dependency (like qtbase) are executed relatively late
> (together with do_package_qa).

Could do_rm_work run before do_package_qa? rm_work.bbclass doesn't know
that, and therefore schedules do_rm_work after do_package_qa.

If yes, then adding a list of tasks that can be ignored would be
trivial. This can be a variable, so a recipe can even add their own
ones, if necessary.

> So I've tried very naive way to find out if the rm_work tasks are
> executed sooner or not just by comparing Task IDs in build of the same
> image built from scratch (without sstate) with Dizzy, Morty and
> current master.

Interesting, I hadn't thought of testing it like that.

> If we dismiss the strange case in rm_work.tasks.master.qemux86 then it
> seems to perform at least as good as old completion BB_SCHEDULER.
> 
> 
> But I wanted to ask if there is something else we can do or you were
> planing to do, because IIRC you shared some longer analysis of what
> could be improved here and I'm not sure if you managed to implement it
> all.

The other ideas that I mentioned at some point didn't pan out as
intended. In particular allowing do_rm_work tasks to run when the normal
task limit was reached didn't have a big effect and the implementation
was a hack, so I dropped that.

> It feels to me that rm_work has high priority, but still it's
> "blocked" by e.g. do_package_qa which gets executed late and then
> immediately followed by rm_work.

That should be easy to change, perhaps like this (untested):

RM_WORK_TASKS_WHITELIST = "do_build do_package_qa"

        deps = set(bb.build.preceedtask('do_build', True, d))
	whitelist = d.getVar('RM_WORK_TASKS_WHITELIST').split()
        deps.difference_update(whitelist)
        # In practice, addtask() here merely updates the dependencies.
        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)


-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




