Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjTH4-0002MY-NM
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 12:17:51 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 03:03:13 -0800
Received: by mail-ia0-f197.google.com with SMTP id x26so7992601iak.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 03:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=gg3vAkWATri64waivpV2f6YQmDgBJA/5LY7HEeSgya4=;
	b=iLQPitNPRlIimRA0loT5BUPwXFp+ew85hGbmPGm+No6c4zczkN/ATNn6QOoXVTnkfm
	o/mVZNM0pf20yQ8h7fB6d3caqU+Mbac7oFRuPD4lbOVrJ771nbR8WEiQOSipcS41CyyZ
	smfZ+kINSEwvmZT/AFvpdprLCNVUetyHzXo/DR1rvSokqCYGcjYA9/u24IWfp3py4m3f
	k8ZyzhdHmruaInx0F5z8lXIPKaJMwIxbyPreOnYP12UwbHrCFyl+dJ6PfDUJ7MPVdNHc
	EWRKhswjGrBylVtyp4qI7e8fI9FEPogEKfPkhbINO12ORt7pGobUTq9QPLHFTiWsrmFW
	3t/Q==
Received: by 10.60.31.131 with SMTP id a3mr4160489oei.93.1355482992152;
	Fri, 14 Dec 2012 03:03:12 -0800 (PST)
Received: by 10.60.31.131 with SMTP id a3mr4160485oei.93.1355482991956; Fri,
	14 Dec 2012 03:03:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Fri, 14 Dec 2012 03:02:51 -0800 (PST)
In-Reply-To: <2ff77d8cdc19c9040f3ede2203700ee91e878e5f.1355479412.git.Qi.Chen@windriver.com>
References: <cover.1355479412.git.Qi.Chen@windriver.com>
	<2ff77d8cdc19c9040f3ede2203700ee91e878e5f.1355479412.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2012 11:02:51 +0000
Message-ID: <CAJTo0LYYv0hTsTTP20x1w2Q7Xg51F_EBbF_ajC-NKinEUfnAaw@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQmn1Kk/7ikgkhkto541jApFfg4Pd08Q4Q3oMEQHn23s9lWz3TGDJVmECCiR4H5aYdYhStdIWqpK/yYWPkOk+8CAYEr+LyGGmbPhAKGShZW1kWr9n48QMkikLsysAB92jVMcvDke0TjqbChM16a7K5SfVlkoNcoUow9eCrOMQ0ry+FByKeAyKVoKiS6RP0aqcL4CK5f6
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] ICU: upgrade to 50.1
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
X-List-Received-Date: Fri, 14 Dec 2012 11:17:51 -0000
Content-Type: text/plain; charset=UTF-8

On 14 December 2012 10:08,  <Qi.Chen@windriver.com> wrote:
> +do_configure_prepend() {
> +    [ -f acinclude.m4 ] || cp aclocal.m4 acinclude.m4

Great to see a version bump that's mostly removing patches and hacks.
Can you add a comment on this prepend to explain what it's doing
(referring to http://bugs.icu-project.org/trac/ticket/9790).

Ross


