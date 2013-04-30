Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UX7A4-0007JH-Nu
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:47:54 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz10so236930vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=XIY4oxSQwwj0dsE3kdyb7+R/q0/anUtA7MmNu1UweBE=;
	b=I0NO6J/XGuqTzdz6a1pSp+oM83+Nzs2sjMoLA47xfdFOXc1SHFif18CqDiCwY3YxH9
	Fk8GG++sRIRK7VHYdEs+EZFo8Bk4dmmeFhe1G/v/JIEbxCekhURmuJmnHdvw9wN30j4A
	N9uZXTHCwORwDU9b2HS+5rGEMZNAoc9RQ0iLY8ex7VexdedCO3Oay8PyuEobAq2Vv1ng
	4/IzS4b18XiFRVs+3mJ4PqVql4au15NfvgFwcOP9Ur63d+SEgIMDRsCoGjJF3oMJ5D3V
	UjiijTl8PF8Qzk/4Yp7yCP2Zf27/2vHer1uPaIdSLhd5A1EzDueOCROBK5MxF6CZWQ4l
	7MPA==
X-Received: by 10.220.78.131 with SMTP id l3mr2651494vck.54.1367314190007;
	Tue, 30 Apr 2013 02:29:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 30 Apr 2013 02:29:29 -0700 (PDT)
In-Reply-To: <ABE1F3FA-9C6C-4B22-88CB-860E6311BD13@dominion.thruhere.net>
References: <CALbNGRRndfF8dvQhtnSgzcE-72KGOP4tb5BQx_Z-205Dr2prGw@mail.gmail.com>
	<ABE1F3FA-9C6C-4B22-88CB-860E6311BD13@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Apr 2013 10:29:29 +0100
Message-ID: <CAJTo0LYL=ZkYEiGvot9xzDcsvFpAOZhecakt3ekYejqis1rqQA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnZv/KS+2Tad7ky9lDtxM7dyYAwu8nBRkMK2eXMf/Ue/Qwe4wOilN821h2eOafCA86lKbUB
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: udev-extraconf conflicts
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
X-List-Received-Date: Tue, 30 Apr 2013 09:47:59 -0000
Content-Type: text/plain; charset=UTF-8

On 30 April 2013 10:11, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Indeed, it's fun to see the flurry of patches trying to fix things up for 'xuser'. I'm fond of the saying "If you find yourself in a hole, stop digging".

Agreed, anything that involves *more* knowledge of xuser beyond the X
startup script is Very Bad Indeed.

Ross


