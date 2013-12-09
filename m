Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 0373C6DD26
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 11:20:13 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rB9BK9GW011437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Dec 2013 12:20:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1386588011;
	bh=WjTCwJcje1pqsWRA4FLRev5rJyDxIGneM7zpXj81LQg=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=iTFf4GCE6pi9WQUL29Y/2DDV7nX671fdHV+ejJAje/vCGEX6aX7lQk5b5BTdgE6Ys
	i45dDmN/QWXxshkHTy2EPgrLO3K/alZUFYtipXG33qrUFIS4QZSXwLazJutyWc59KB
	J/zn/rvX4g6gmHoVdx8KbQf7nhFifO6F++FxpTlQ=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rB9BK0kf031720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Dec 2013 12:20:02 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1Vpysa-0008El-QI
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Dec 2013 12:20:00 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1384242441-27215-1-git-send-email-rongqing.li@windriver.com>
	<528C7216.9040501@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 09 Dec 2013 12:20:00 +0100
In-Reply-To: <528C7216.9040501@windriver.com> (Rongqing Li's message of "Wed, 
	20 Nov 2013 16:25:58 +0800")
Message-ID: <lywqjes23j.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -3.9
X-Spam-Level: ---
X-Spam-Tests: AWL,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [PATCH v8] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Mon, 09 Dec 2013 11:20:16 -0000
Content-Type: text/plain

Rongqing Li <rongqing.li-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
writes:

>> +echo "CONNMAND_OPTS=$EXTRA_PARAM">/run/connmand/connmand.env
>>
>> ++EnvironmentFile=-@LOCALSTATEDIR@/run/connmand/connmand.env

These paths are inconsistent; I would remove @LOCALSTATEDIR@ from the
service file.


Enrico

