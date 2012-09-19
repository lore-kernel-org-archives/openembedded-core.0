Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TEKh4-0007VY-Gm
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 15:51:58 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Sep 2012 06:39:12 -0700
Received: by obblz20 with SMTP id lz20so1066911obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 06:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TDBs6OBSkzlMR+c7VBnbZDIALuWTLjoB9ab+FG5qNkc=;
	b=SzLG3uLgGeaJ/O3W0auXyzTfq5V1dus9NcS7pQmJ7QhkbcRk7nE1hPjM88fIPNiODz
	rKiX+5H9JJlBK7t4Q5UfC5gevmqVihSJD1VcLF4eOh5kIENBzK8UACL85gGfpKkzxnpF
	ojif8GV5x6H/qnicOVJ1UBSn/kPY5Wt5h/0fGVsovD2tjI5kTd/Pp85ZAPhjbii49BKW
	OkJfhCbFwghaYelFv0T/7/3PuFIjJJt92vR6cN5ywaMA4RVhms+YWFsltROpeCFXhEwJ
	w1mCkvPsDNALmLZot+lek7g0eAC2GAYOJCGR5cddVIoEXRNJKkRQNBSN29oUQg2U1vuL
	e5qA==
Received: by 10.60.12.106 with SMTP id x10mr2868798oeb.103.1348061951731; Wed,
	19 Sep 2012 06:39:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 19 Sep 2012 06:38:51 -0700 (PDT)
In-Reply-To: <CAMKF1soiz=RjQEGd+bGidaMJKCVcja6wvUJeyyFfaUuPsXUUqg@mail.gmail.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<e12955c6d49bceb6c271574551b5feb76c51fa3b.1348052899.git.laurentiu.palcu@intel.com>
	<CAMKF1soiz=RjQEGd+bGidaMJKCVcja6wvUJeyyFfaUuPsXUUqg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2012 14:38:51 +0100
Message-ID: <CAJTo0Lb6QFTJkc0RKmvi5SKxpaGJo3db01ssScsiSsfMTjwGgg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQlu28FZWqbV9aS17F90d4z6hjecv1TrPh0MBhDZ8xFjtgfpvvX8VmwLYGzrhmNTM0tq6x5B
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 4/7] gtk-icon-cache: run the icon generation at rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 13:51:58 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2012 14:28, Khem Raj <raj.khem@gmail.com> wrote:
> Do you really need bash for this script to run ? if so then can it be
> written so that it works on posixly shells.

#! /bin/bash and no dependency on bash...  probably should make that
sh-compliant.

Ross


