Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB8D71BA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 12:04:09 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2TC49IE006887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 14:04:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1522325049;
	bh=eHP2Dk4Pj6M+TIJ0ozdpPVmCTMBRIkodackwdV9rp5c=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=OzKdcc6mhXAO6RdTqMmGlKnUHz4U8EHfTG6FNtmcEPNERR2BMXq+AxCS3UDOsD9zm
	7GdoW4TUpZqzIP1Ds9j4lMJSVUXjfXqMH43cwaMHCJ8b4ZPPcuonUE9SN91A/+iZn8
	bRRx/w8n/OOYePLN2/UjG4XxYYULQgSameC9RYWc=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2TC42D5013981 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Thu, 29 Mar 2018 14:04:02 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 3CDBCF8EF06;
	Thu, 29 Mar 2018 13:54:36 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2TC40XT013978
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Thu, 29 Mar 2018 14:04:00 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>) id 1f1WHg-0004sL-As
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2018 14:04:00 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
	<CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
	<20180326203209.2da967eb@seebsdell>
	<CAJ86T=VqLZrmyLBYD4ovQc9eNJQx5Rqp8YK+=3hPHgmjqqa55w@mail.gmail.com>
	<20180326210734.165ac038@seebsdell>
	<CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
	<20180326234108.4b52c066@seebsdell>
	<CAJ86T=VtdUAahO+PE2w8BzuPHAJCM1PEyWaYwg4SSGHU6jtm=A@mail.gmail.com>
	<20180327142230.15f1abf9@seebsdell>
	<CAJ86T=V=b2jsSuVEicQbbgrax+8iV7HV0B=cKWDaejLq-Dh2eQ@mail.gmail.com>
	<20180327152026.335b4c2d@seebsdell>
	<CAJ86T=VdHEb4cyB=oSTHytyGc9B0+wN39qOSHWuVR0g6dFTLUg@mail.gmail.com>
	<20180327161010.3e20edac@seebsdell>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 29 Mar 2018 14:04:00 +0200
In-Reply-To: <20180327161010.3e20edac@seebsdell> (Seebs's message of "Tue, 27
	Mar 2018 16:10:10 -0500")
Message-ID: <lyvadfqea7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.82
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.83
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Thu, 29 Mar 2018 12:04:11 -0000
Content-Type: text/plain

Seebs <seebs-59Mtl4G6ZbFeoWH0uzbU5w@public.gmane.org> writes:

> There are weird calling conventions out there. For instance, "pass
> floating point values in registers, but integers on stack", or "pass
> first N arguments in registers", and so on. I don't know if any of
> them are active in stuff Linux supports, but I'm aware that this is an
> area where you can get really strange behaviors.

__builtin_apply() should deal with it.  If you are really paranoid, assume
a huge stack size (e.g. 1024).  But accordingly syscall(2) man-page, there
are to be expected not more than 7 arguments for syscalls.  So, define the
size for known architectures and a fallback of '7 * sizeof(uintmax_t)' or
so.


Enrico

