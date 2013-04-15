Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1URhDe-0005lr-IT
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:05:14 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3FAlVE8002621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 15 Apr 2013 12:47:32 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1URgwd-0005hC-0G; Mon, 15 Apr 2013 12:47:31 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 15 Apr 2013 12:47:30 +0200
In-Reply-To: <CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	(Ross Burton's message of "Mon, 15 Apr 2013 10:59:10 +0100")
Message-ID: <lyppxw135p.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.9
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: "Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 11:05:14 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

>> When using busybox mount the filesystem won't get remounted as 'rw'
>> and bootup will fail.
>>
>> This fixes the regression seen after switching from 'danny' to 'dylan'.
>
> I was going to say that I've never noticed this and have been running
> busybox's mount, but on reading the hddimg boot scripts I see it
> mounts / as read-write before switching the root.

This might break systemd's fsck'ing of /.


> Does busybox produce any useful errors as to why it's not working?

busybox's mount just does not read /etc/fstab for 'mount -o remount'.
Code is difficult to read but seems it reads mtab only and applies
options given on cmdline.



Enrico


