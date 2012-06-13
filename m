Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SeofR-00033f-Sg
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 16:35:30 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 13 Jun 2012 07:24:52 -0700
Received: by qabj40 with SMTP id j40so1370430qab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 07:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Gq6kuVwDSUptJkTXZAD3aUKe2MinwHS3Up9kN2Y9Y0E=;
	b=DIfFLQNF1zI5Z8ug3QUeSi+dK/u7qYBvZ44f9Gbsec94yZPaDzMHSPU5lHjsW2sped
	/HApiDitItOeAIfngWHSkePHZT+4f+sU3L8BPaCyj0PaELa3/PQRI2/rxGhu7baYXilt
	Ie0NrZSTeDmdtOpLlbOkdqqywlS9GwG0Po/uG5+9fMV+/J0Pc0UppdEog92mtuILBCqa
	xG/jJwN9klBoAXFMRL+aPA5z8YF1FTecUwblzcDp/MSDqnxzLPdCMu/JOLRd647S/9jm
	m/mm6RP9SaouXGIXXxlGvRwLdhhLL+9mAjE8xDWwbiYrPb2vKXVUb4fenWBNo6jqJqFP
	1Stg==
Received: by 10.224.210.198 with SMTP id gl6mr26917912qab.7.1339597491249;
	Wed, 13 Jun 2012 07:24:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.251.142 with HTTP; Wed, 13 Jun 2012 07:24:30 -0700 (PDT)
In-Reply-To: <4FD8A219.9000100@denx.de>
References: <1339593545-14046-1-git-send-email-sbabic@denx.de>
	<CAJTo0LYQQXZKoK8N9g0msxQAcg_c2sc0n4-hAgKCJJYzj4vuag@mail.gmail.com>
	<4FD8A219.9000100@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2012 15:24:30 +0100
Message-ID: <CAJTo0LbKGqM=pCovegAmZgTz-Q2cKZmZU7qUbYm21KRquydzog@mail.gmail.com>
To: Stefano Babic <sbabic@denx.de>
X-Gm-Message-State: ALoCoQlZggguyz2WI7fjIsYbvhRoqF+ZgCzQZNFy0orrL5HftVtaS3DK48M5HGh4wV4Nvq4wkkv3
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Added recipe for libconfig
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
X-List-Received-Date: Wed, 13 Jun 2012 14:35:32 -0000
Content-Type: text/plain; charset=UTF-8

On 13 June 2012 15:22, Stefano Babic <sbabic@denx.de> wrote:
> no, there is not yet. I add the libconfig to my image and my apllication
> make use of it. However, I see it as a general purpose library, that one
> can decide to add or not to the own rootfs.
>
> Is there some constraints in OE requiring that a lib can be merged only
> if a provided package make use of it ?

Surely meta-oe would be a better place for this then?

Ross


