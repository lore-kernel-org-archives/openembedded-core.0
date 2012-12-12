Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TigjJ-0004GR-OG
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 08:27:46 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 23:13:11 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so1757982oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 23:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=2p96G4/LpD5SvBEv/UE8gxo3NlmXq5Vjbu3JxQnivko=;
	b=LvDfy7sY00wEuI6vPsUJ2TELUPApGLiyEeHBJeUH2ZDs4+2EO90R+H5kzOpnszvmpW
	o5CX/ZDjdHNV1n2kjfaiRJ/4+KfqPuDFB//9O+yASpxBYMVq2REZrpF4sVW1Abaztcms
	PTqpeZhrT6OPRoyiQ51Sqz4QAXiHoAchyWKiFYSzc+A1v4kppDwCTUOr/S//gc9dHWVl
	fulHY1PEubf0AMiWU9xMseKD+iSUFT1VLVt3jZ+hGAeF4PFGjtVzhbsPqFhppJvPuEUT
	y2ZyruwyCKD58z7Z8TzDxr8u/p9G6spEL5IOmrf9brtjH9Xe8DxbZ/HCE4x3AffDWqVP
	fg/Q==
Received: by 10.60.31.131 with SMTP id a3mr9651oei.93.1355296390575;
	Tue, 11 Dec 2012 23:13:10 -0800 (PST)
Received: by 10.60.31.131 with SMTP id a3mr9649oei.93.1355296390490; Tue, 11
	Dec 2012 23:13:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 23:12:50 -0800 (PST)
In-Reply-To: <cover.1355287689.git.sgw@linux.intel.com>
References: <cover.1355287689.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Dec 2012 07:12:50 +0000
Message-ID: <CAJTo0LYe837cceQhsGgwxCK9MQ4OcgX9jEJ_O2vWGExKXgLO+g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQm1Kpgg0m9bfDZ0vjt+/7Q3Tdxb2KBcLYDq5h8XR4lqzC0rZXXe/1wKjSNBfCidUheobZfE5BjlDlsiMhc1nyDRda+5wMEV+ea13JfdLM4vb+eATMBAvah4RJZRau69tMJrzxPQm2oxVNWf/Wl/e9xgUrDPxOHa2j1+73UR6XBgzFtOHjU7bZulsM+F1r/IlZjHBt8K
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/13] Various Fixes
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
X-List-Received-Date: Wed, 12 Dec 2012 07:27:46 -0000
Content-Type: text/plain; charset=UTF-8

On 12 December 2012 04:49, Saul Wold <sgw@linux.intel.com> wrote:
> I mostly did a build test of this patch set, there were
> a couple of failures in other patches that I did not include
> notably the consoletools in mips and the libmatchbox from
> Ross seems to have broken matchbox_keyboard.

The matchbox-keyboard failure is caused by the libpng15 migration not
libmatchbox, I recommend dropping the libpng upgrade until we've done
a world build with it.

Ross


