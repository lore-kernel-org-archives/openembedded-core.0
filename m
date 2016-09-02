Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id BC4E67325A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 12:43:31 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u82ChPuV013422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2016 14:43:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1472820206;
	bh=P8rPevg5AZVRpLVdFv9c6YJEdXbOzdR1qW0G3P5IVm0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=JtOLuym6ROsgbKWvCdn0ZPXJD550VyIDGCTL23vswzfYwfy59ZfQVeYG2HIUH3hqn
	7e/6OyLiF/wQhmCIiYd4fo8Gm54G8Jo1t42lukvglhsuKWa6HQUOIHCogNW1T10OpR
	ROgzyu+yhD1rZ3o/jSlk0V03c6CHB63cjGhA+8DU=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u82Ch4dm019976 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 2 Sep 2016 14:43:05 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 91047CE8DDB;
	Fri, 2 Sep 2016 14:42:40 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u82Ch33k019973
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 2 Sep 2016 14:43:03 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1bfnoF-00012j-BF; Fri, 02 Sep 2016 14:43:03 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1472662673.29583.90.camel@linuxfoundation.org>
	<ly60qgxzp3.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LafVEqcVF02+naw8JvbzF2fi2y+Ws=OH0+=OgAyDNSt1A@mail.gmail.com>
Date: Fri, 02 Sep 2016 14:43:03 +0200
In-Reply-To: <CAJTo0LafVEqcVF02+naw8JvbzF2fi2y+Ws=OH0+=OgAyDNSt1A@mail.gmail.com>
	(Ross Burton's message of "Fri, 2 Sep 2016 12:56:40 +0100")
Message-ID: <ly1t12xyjs.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.8
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Replacement for tslib?
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
X-List-Received-Date: Fri, 02 Sep 2016 12:43:33 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> tslib is still available in meta-oe,

really?  In fef7b1feb79c7b43623760e2cdf4e68bd0dbd526, a

| find -name '*tslib*'

returns only xf86-input-tslib, but not plain tslib.


Enrico

