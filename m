Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 194AC60111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 23:54:05 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7VNs2Yv017644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2016 01:54:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1472687643;
	bh=qsA0/3Jx6ejHFXMdcHXQe2ISZcMR/Bcv7uPO0cpkY20=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=BwSeXXoD6F3Fxe+js1u7CzIKe1jDiSMV/HvWu3j2gnck+DhiZJzQyYOtiF4jQz1Qp
	CiiKPGOg0j3hhbYRJLGZPVZLO7/JkNPQOW67FPg/DryZvJ2NInBbBhQwJu1uVgERKS
	DUPe20ROiR4ZVLq/baS4u20r5BJzDsb+RcnNzyEY=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7VNrkwf015423 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Thu, 1 Sep 2016 01:53:46 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 3A353D807B6;
	Thu, 1 Sep 2016 01:53:23 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7VNrjL6015420
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 1 Sep 2016 01:53:45 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1bfFKC-0001AD-VF; Thu, 01 Sep 2016 01:53:45 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1472662673.29583.90.camel@linuxfoundation.org>
Date: Thu, 01 Sep 2016 01:53:44 +0200
In-Reply-To: <1472662673.29583.90.camel@linuxfoundation.org> (Richard Purdie's
	message of "Wed, 31 Aug 2016 17:57:53 +0100")
Message-ID: <ly60qgxzp3.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.6
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 31 Aug 2016 23:54:06 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> tslib is more or less mandatory for resistive touchscreens but it was
>> removed some days ago.  This breaks e.g. meta-qt5 layer which depends 
>> on it.
>> 
>> Is this removal really final (which would be really bad, because
>> resistive touchscreens are used e.g. in industrial environments)?
> [...]
> Are you sure the kernel interfaces that xinput is using don't work for
> qt4/qt5?

I am not aware of any way how /dev/input/eventX values can be calibrated
within the kernel.

Most capacitive touchscreens are doing this calibration in hardware
so that values correspond 1:1 to screen coordinates.  But resistive
touchscreens return usually only the raw 10-12 bit ADC values in
ABS_X/Y.



Enrico

