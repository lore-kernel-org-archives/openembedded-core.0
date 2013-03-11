Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7W8-0008Fw-Ee
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:32:13 +0100
Received: by mail-vb0-f53.google.com with SMTP id fj18so1770907vbb.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=bbzenWPXidRIrZlO2KUEQK/KZPIE63wXPQYC1V8sFnE=;
	b=Gt+eb5Ns/GrLi+gfz0sa+aT0xDgFWl4uc0ZMAVgShwzEkq+Q0jz+TY3Ujnnbwje7jV
	xqKbvO26T2O9IfCh0yvexPiYlVUt0uexYAtDb/C4p2o1043tXFc2WokYwCCg1W08R0RA
	cBC69OTq/pesUjqjG37rN9Br4REm3UEX2nf4/bq/7PK11fKkLzXEiOg/Hu7RIsihygZm
	aFEB6YcqqxxUaLvlGdITpjEUyDboWYIDrDKb+NGUYTdc85395y61AIjdf56E2vgZltoa
	E/Cok8QdvDxxYZ1lXC+/fTcl8l0OC4HEx08BRoTSWpYojtdVxKnl8guVZ4qKUlYRk0ck
	PAog==
X-Received: by 10.52.67.105 with SMTP id m9mr4583281vdt.128.1363025733638;
	Mon, 11 Mar 2013 11:15:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.213.2 with HTTP; Mon, 11 Mar 2013 11:15:13 -0700 (PDT)
In-Reply-To: <1C3733EF-6163-4090-949C-5B73BBE02DEB@dominion.thruhere.net>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
	<8f815c617b69812e749a5a197a3903fe8daaf645.1362873102.git.raj.khem@gmail.com>
	<1C3733EF-6163-4090-949C-5B73BBE02DEB@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Mar 2013 11:15:13 -0700
Message-ID: <CAJTo0La30wR3sLJfc+7QckZdqXzugAJctZJHVDEbXQosKuuVKg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkvxqiw32HRk0FiVxkGMpKuyAZEmU6hrFAa3zK5Hpajl2N3vgIqioREv4AwvH5nnbiKVfl9
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 11 Mar 2013 18:32:18 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2013 07:00, Koen Kooi <koen@dominion.thruhere.net> wrote:
> It's a udev hwdb, so calling it systemd-hwdb would be very misleading. And aren't you missing a RRECOMMENDS?

postinsts to run udevadm --update would be useful too (I've got these
changes in my branch too, but this network is trying to stop me do any
git pushes).

Ross


