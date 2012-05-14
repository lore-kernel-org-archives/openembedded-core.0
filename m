Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SU40b-00054v-7T
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 00:44:53 +0200
Received: by wibhm14 with SMTP id hm14so3376282wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 15:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CRT7Ni00ZwMb6cPoslk2sFMC31MoJ7AOJssyL1tokpY=;
	b=RUWQ+9BtzdvPoTee2vx1CGGZM90wIAZfpkLB8EFx2gmd7dnqNZiurtHrd8qI4lAXiP
	5MgMkGIkCGaBsxv1Yj7N7h3A5vSr/QztlOEvjM8JyXQxdHbp+tdpaHvp+OEsmdwGpW+S
	FKu6bP1rB3Q5RtQ9buG/ooL0k3BTF7iiDcsNTR6iHsAlrCHvfBSCyiYo16GGSbrCa+0a
	HIoQEvhHQp3LmfGeCVs7YlsJXHY61qP2snnEKlcwDRai9uayiQGZFFKz+tZmRLF7KCzo
	NVa2/nDW/xm5gMxMbuu6sdMNtmhMlzKy1ekD+L+tDHOJdz8G4vtwgT396iLiBLwbpfND
	zTRg==
Received: by 10.180.100.2 with SMTP id eu2mr24073834wib.1.1337034893936; Mon,
	14 May 2012 15:34:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.63.175 with HTTP; Mon, 14 May 2012 15:34:23 -0700 (PDT)
In-Reply-To: <4FB17E33.5000408@windriver.com>
References: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1spai-R74dMQZ00FooWwXmyLEdsN0HaPn_SArNPT1=Pa8g@mail.gmail.com>
	<4FB17E33.5000408@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 May 2012 15:34:23 -0700
Message-ID: <CAMKF1spzwiFRCzePVWDx8v+MJjd5HcsW=SQhphjFfuN+mcKe9Q@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] RFC - CCACHE_DIR to not impact sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2012 22:44:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 14, 2012 at 2:50 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
>
> Regardless of the state of the CCACHE_DIR the .o will be the same.

and .o are part of checksum right ?


