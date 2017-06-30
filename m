Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E08EB78277
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:58:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u23so8159039wma.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=CtFzzH6FZibCsE8/U0qTo1BCjhqj8hQjkaUdZSqRV6M=;
	b=X/Y8dRZYCHm0b2LfChPppmwcZ6GOa55Edy3mgmy2eK5WtI5V4ZWMOgPKj2Nf8ewmS1
	yNu9oJyC/cdOmuuZSt96fKmkj4EuU3KFIf83jEK/FmjgT2L/FKeieRJ9ucN50XQsV9uo
	/lv9lWayN8TueLi8mAIttaN5V0SaVOZ5hotSQiRL1eBzNvhJqiRi6ZaXYeNYwvPOdbF+
	/OHossYgMJkx1E9Ogs81ZP73cXN8PpnucVo/Mox9TEQBWXM3dITHmLn51FZC8z7dUUEL
	4I3aw+Nc4Ri5vfZNonSZ4ooc3xZPej3/uSlH462pGgBfBPvy7McPb6CpQxhnItmG/vIg
	S5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=CtFzzH6FZibCsE8/U0qTo1BCjhqj8hQjkaUdZSqRV6M=;
	b=bBQR6evaF4ge8ClHSl6qDkfoOcVC8nNsWI80gt/edsOHQf0Uz0aOE/X3W/mvoM+Kg6
	4ZWvJnE2CFFtftYPi3exdByh7HeVJD2U29KWReK/LqQpNhef5piUVfCYKHQJuLc1blgi
	/wtavrUJsXnTXvYW/Z4JBILORHRfow3r6CgYqI6lNI6GN1UO7wBrbZllnyfpoSo0PMpM
	xqsVmzKpAsDiK1bF30Gz83/RCAq/r9yoUj1W2U/hvZh5REVi3YCBHhUPfEPGyQ6KtnwE
	B1Aftomp67aPqAliBFEyOeW+LBA1wytN3plktbLaaUWfOQhhwfLNqL0KOG0sF7DnMJX+
	dm9g==
X-Gm-Message-State: AKS2vOwtEJUV1X38Xmg6yitxfAzAhIAfPlyxa5GQi7JOJXqS2TyMSqlW
	t7LcJ6MHUpPKvJgBnJw=
X-Received: by 10.28.194.137 with SMTP id s131mr5686645wmf.111.1498831109652; 
	Fri, 30 Jun 2017 06:58:29 -0700 (PDT)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com.
	[209.85.128.179])
	by smtp.gmail.com with ESMTPSA id 35sm5921881wrp.63.2017.06.30.06.58.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:58:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f179.google.com with SMTP id r103so204945443wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:58:28 -0700 (PDT)
X-Received: by 10.223.163.197 with SMTP id m5mr25596744wrb.128.1498831108083; 
	Fri, 30 Jun 2017 06:58:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Fri, 30 Jun 2017 06:58:27 -0700 (PDT)
In-Reply-To: <1498828593.5259.7.camel@intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
	<20170628073121.GA11425@linux.intel.com>
	<CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
	<20170629083942.GA14649@linux.intel.com>
	<20170630083717.GA788@linux.intel.com>
	<1498813333.5259.4.camel@intel.com>
	<20170630122330.GA17125@linux.intel.com>
	<1498828593.5259.7.camel@intel.com>
Date: Fri, 30 Jun 2017 10:58:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoatZVRF2Jv3MAeDMsQwejNwp=XaoFgPuYQ85MysAYmTA@mail.gmail.com>
Message-ID: <CAP9ODKoatZVRF2Jv3MAeDMsQwejNwp=XaoFgPuYQ85MysAYmTA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Fri, 30 Jun 2017 13:58:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 30, 2017 at 10:16 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Fri, 2017-06-30 at 15:23 +0300, Ed Bartosh wrote:
>> On Fri, Jun 30, 2017 at 11:02:13AM +0200, Patrick Ohly wrote:
>> > On Fri, 2017-06-30 at 11:37 +0300, Ed Bartosh wrote:
>> > > > I'm not sure I understand this. If you don't want fstab to be
>> > > changed
>> > > > you should not specify mount points in .wks
>> > > > There is only one reason to have mount points in .wks: to make wic
>> > > to
>> > > > change /etc/fstab, which you apparently don't want. So, don't
>> > > specify
>> > > > mount points and you'll have what you want.
>> > > >
>> > > > Having additional option for this looks redundand to me.
>> > >
>> > > After thinking a bit more about it I'd propose to have global wic
>> > > option
>> > > to avoid rootfs content changes. Not just fstab updates, but any
>> > > changes. For now this option (--no-rootfs-update ?) should prevent
>> > > creating
>> > > images if either mount points are specified or --exclude-path is used
>> > > in .wks
>> >
>> > Why does --exclude-path conflict with --no-rootfs-update? Is that a
>> > conceptual problem or an implementation problem?
>> >
>>
>> I thought that removing directories from original rootfs is a
>> modification.
>
> But it's not actually removed from the original roofs directory, right?
> For me, "not modified" refers to that and the files in it.

My problem is with the fstab change. If I explicitly ask wic to drop
something I know it is doing it so it is under my control.

Adding --no-fstab-change solves in an elegant way my problem.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

