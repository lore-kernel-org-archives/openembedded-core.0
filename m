Received: from mail-vb0-f48.google.com ([209.85.212.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UHuuX-0004vp-0D
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 12:41:01 +0100
Received: by mail-vb0-f48.google.com with SMTP id fc21so221827vbb.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 04:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=/Npsz5S1MZtSByp3omUBE6r+PepBdnYe4n1ibTmssVI=;
	b=cJB6K2kl/ORvkFBsL04SElfbLHXUzl9xSC7uNU0pvn/K2JUoX2P7k1sa9VKFPMwYgZ
	8Nf3F4fvHsdfvu36iINz0xfFiGlXIRdn+cOLx3NQanwA56bhOP0Jya40ZkiVqh2FTBHb
	FXK6vYY2x/uu/abWxUhshSzp8BN/tMwE+D9vjHMcEpJDJW7IGfcSDdMY4Sb9tKrSgjp3
	TjF8/GnnZA+lfZpBKmyT3Sh2tfUKGKRIrerWZIeKA1e7Ugy8RkzNoBtmpqPN8zn1LBl5
	B/XKUJAUPXDNRV0tsnTgUC/Bt/emecp7pqgO5ID1Q8FhThgdqJfsAMfU4MwReAfKR6nB
	fSUw==
X-Received: by 10.52.65.147 with SMTP id x19mr1589572vds.27.1363692247194;
	Tue, 19 Mar 2013 04:24:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Tue, 19 Mar 2013 04:23:47 -0700 (PDT)
In-Reply-To: <ly620wucp5.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1363031776.git.ross.burton@intel.com>
	<4ad7ea263a05fb3c1960623760340549a20c849c.1363031776.git.ross.burton@intel.com>
	<ly620wucp5.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Mar 2013 11:23:47 +0000
Message-ID: <CAJTo0Lb7tbVpCn4-hGfs8KOKKp8LQW2p2grnGvmLfNUG9bR0eg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQmy6wYP66ZbPdByXIdJbTx8WBGXNDcmeUFWQ+GzHceX1kXy7EVezacvy7me9AATOQG8b0GN
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] systemd: allow postinsts to run without systemd being present
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
X-List-Received-Date: Tue, 19 Mar 2013 11:41:01 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2013 10:36, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
>> +if which systemctl >/dev/null; then
>
> check with the shell builtin 'type $prog' is more portable and does not
> require the external 'which' program.

Tried that (type -p systemctl), and failed on the host.  Really not
sure why to be honest.

Ross


