Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id E757678726
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 19:36:48 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 8CCC62E894A;
	Mon, 19 Feb 2018 13:36:49 -0600 (CST)
Date: Mon, 19 Feb 2018 13:36:47 -0600
From: Seebs <seebs@seebs.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180219133647.1dd4b258@seebsdell>
In-Reply-To: <CA+chaQd2-perimm0_Eey85TTniWx9BE5KJMAO69PveyBB9vQEQ@mail.gmail.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
	<CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
	<bb8be581-a074-b05b-86c6-71e1ee19fdfa@linux.intel.com>
	<20180217141701.229759cf@seebsdell>
	<bb1b003e-9bd3-f438-8ae1-637500d970b5@linux.intel.com>
	<20180219115538.5081767b@seebsdell>
	<CA+chaQd2-perimm0_Eey85TTniWx9BE5KJMAO69PveyBB9vQEQ@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Mon, 19 Feb 2018 19:36:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Feb 2018 20:01:31 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> I did quick check for UID/GID issue:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434

Hmm. glibc-locale, in particular, is a really weird case; does it still
do the strange thing with copying the files around through scratch
space to get them from one package to another? (My vague memory from
five years ago is staying vague.)

-s

