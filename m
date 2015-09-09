Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id CE63C7669F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 14:11:02 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so100401850igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=NZz2jmcWvJxCM2jTNTG6blbXBCjQxZHq++KVzGPdVlY=;
	b=fhw6qb9hvyDXZ2PtKycH7AJ32b9NdNoS+9UhDo/AyphHlG800Nb6+BXtGI0ThchXgP
	igv8X1wgCibowdG2SSjW/HWsB7LMIaP9upxBcvzuR6r7Ch57S413l/gTUc7EDlN56CN2
	jnjfr89BuSgBT34iiutBPmeWjzNB7DlzejuoNtGEvZNjS/LLz305QA9JM/Rht0HcAPQB
	aZjjzKiGRh7MazAmhLpu35IBAITBskIfTDEnqHfHEAZkfGmtf+a9g1fkbw0YESBU5M6a
	YEXpkiNUYEjRxnDx7vdg0G5CeCXa3Ky5TuSSgwjsun+J2ilJKp0cv70pCAZJsquC79Ne
	AWTw==
X-Gm-Message-State: ALoCoQmfYUPSrnt5f2+XKW+SMZjbXGtUJrUd451nBA5w3gmjTVCEytc9z0fr/SvUKKH+gyAi/i87
X-Received: by 10.50.26.66 with SMTP id j2mr49991838igg.42.1441807862346;
	Wed, 09 Sep 2015 07:11:02 -0700 (PDT)
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com.
	[209.85.213.179]) by smtp.gmail.com with ESMTPSA id
	i198sm4623247ioe.14.2015.09.09.07.11.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Sep 2015 07:11:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igxx6 with SMTP id x6so14989929igx.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:11:00 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.225.66 with SMTP id ri2mr18622580igc.5.1441807860700;
	Wed, 09 Sep 2015 07:11:00 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 9 Sep 2015 07:11:00 -0700 (PDT)
In-Reply-To: <4a5139926b1242f1d409bba1bf4e5f7d3a84ba09.1441803055.git.patrick.ohly@intel.com>
References: <cover.1441803055.git.patrick.ohly@intel.com>
	<e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
	<4a5139926b1242f1d409bba1bf4e5f7d3a84ba09.1441803055.git.patrick.ohly@intel.com>
Date: Wed, 9 Sep 2015 11:11:00 -0300
Message-ID: <CAP9ODKrwq8ji4jaftvZ7J_KHRk0xdg5bQQ+pENUWRSvQYSEO8w@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] initramfs-framework: support ro boot parameter
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
X-List-Received-Date: Wed, 09 Sep 2015 14:11:02 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 10:10 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Default is to mount the rootfs read/write. "ro" can be used to turn
> that into read-only, which is useful on systems where userspace does
> an fsck before remounting read-write.
>
> Giving both "ro" and "rw" will still mount read-only regardless of the
> order, because the ordering information is not preserved by the
> initramfs-framework's boot param support.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

