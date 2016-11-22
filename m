Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id B2FFC719F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 12:01:52 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMC1qqN030072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 13:01:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1479816112;
	bh=Ja5D3APrtLzdMwd/3GbvHY2XsYLXNGdd8zIoYyL90wY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Sender;
	b=dfONJduh/MJpJp8sSWzJc2S7Ujsdvy1sV7AXYBvJVUllf+HtTFV07ETY1IwGPQBT8
	Y/lj5kxnCEjSmqL48+uSSTMmQoXygaou5lb8L6436NY8S3BYYHyFi3WhoeENotsz+J
	yct53JbzViyd9Ll5+g3kdjVgmnNEu10CfCXIrtMo=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMC1eAn019672 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 22 Nov 2016 13:01:41 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 370C78BD02F;
	Tue, 22 Nov 2016 13:01:39 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMC1dPa019667
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 22 Nov 2016 13:01:39 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1c99la-0007Sd-Vh; Tue, 22 Nov 2016 13:01:39 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
	<CAJTo0Lb9cJk5Qos0CLkvvrW0QCecVY-0io9rnp1rkHfCZpQrdg@mail.gmail.com>
Date: Tue, 22 Nov 2016 13:01:38 +0100
In-Reply-To: <CAJTo0Lb9cJk5Qos0CLkvvrW0QCecVY-0io9rnp1rkHfCZpQrdg@mail.gmail.com>
	(Ross Burton's message of "Tue, 22 Nov 2016 11:42:32 +0000")
Message-ID: <lyoa17n2ot.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -2.8
X-Spam-Level: --
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: removed broken compiler check
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
X-List-Received-Date: Tue, 22 Nov 2016 12:01:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Burton, Ross" <ross.burton@intel.com> writes:

>> Is there a reason check_app_exists() wasn=E2=80=99t fixed to handle syml=
inks
>> instead?
>
> Agreed, the check should handle splitting the argument and links, instead
> of removing a key sanity check.

Is this check really so useful? gcc + g++ are elementary tools which can
be expected.

The check is just broken and there is no workaround (except crafting
'conf/sanity_info' manually).


Enrico

