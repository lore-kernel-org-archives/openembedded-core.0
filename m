Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 1117 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Feb 2017 18:08:13 UTC
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id A2F5E6E5FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 18:08:13 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v12HnYxh018996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2017 18:49:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1486057774;
	bh=wea6k3e9FDjts1bJDMXHZ19a8imBqNiZsyXapVTZl4g=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=Snp7of6aWxdeZqkP8bgmmNnLbFxjvFCtpPdabhllmMksFg4pfSmSSqHuMolQZMlpY
	BZSJE+0ZqOCzIausvwRA6jWZaYfh2q1fasL8YFyxvTy5IGyyhqQNkZ6RkXgoawqGdn
	75IT6n7r+HYgU1o4WUA371csgM5/ryuZYIKlGSx4=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v12HnQsW027431 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Thu, 2 Feb 2017 18:49:27 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 50A14CBE6A9;
	Thu, 2 Feb 2017 18:49:21 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v12HnPvE027428
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Thu, 2 Feb 2017 18:49:25 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>) id 1cZLVd-00072y-Jh
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2017 18:49:25 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1486031880.14889.35.camel@intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 02 Feb 2017 18:49:25 +0100
In-Reply-To: <1486031880.14889.35.camel@intel.com> (Patrick Ohly's message of
	"Thu, 02 Feb 2017 11:38:00 +0100")
Message-ID: <lyk298eb4q.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -1.2
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Subject: Re: host-user-contaminated QA check
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
X-List-Received-Date: Thu, 02 Feb 2017 18:08:15 -0000
Content-Type: text/plain

Patrick Ohly <patrick.ohly-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Recently the host-user-contaminated QA check triggered for the trousers
> recipe in meta-security:
>
> WARNING: trousers-0.3.14+gitAUTOINC+4b9a70d578-r0 do_package_qa: QA Issue: trousers: /trousers/etc/tcsd.conf is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
>
> However, that's a false positive in this case. UID 1000 got assigned to
> the "tss" user in the target sysroot during the build, and tcsd.conf is
> correctly and intentionally owned by that user because tcsd checks
> ownership and refuses to start when owned by someone else (including
> root). It just happened that the UID was the same.
>
> This is likely to affect all recipes with files owned by dynamically
> created users, in particular when the host system assigns UIDs from the
> same range as the target system (quick poll: who else has 1000 as his
> UID on his main Linux box? ;-)

Usually, this can not happen.  There is reserved a range for dynamically
created users (standard says 100-499, some distributions use 100-999).

In this case, there is probably some '--system' flag missing when the
'tss' user is created (--> packaging bug).



Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

