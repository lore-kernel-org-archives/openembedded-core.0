Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SWRdm-0000UE-Tw
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 14:23:11 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4LCCw3b019849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 May 2012 14:12:59 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1SWRU5-0002Ft-Ql; Mon, 21 May 2012 14:13:09 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
	<4FB3F434.2040703@opendreambox.org>
	<lymx55fs0d.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA00DC.4000709@opendreambox.org>
	<lyliklevtz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA1416.3050102@opendreambox.org>
	<lyd35xeqw9.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA2BAD.5070709@opendreambox.org>
	<401C0B52-7177-4259-AABB-63F942E77EBF@dominion.thruhere.net>
Date: Mon, 21 May 2012 14:13:09 +0200
In-Reply-To: <401C0B52-7177-4259-AABB-63F942E77EBF@dominion.thruhere.net>
	(Koen Kooi's message of "Mon, 21 May 2012 14:06:48 +0200")
Message-ID: <lytxz9d962.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.76
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi-systemd: drop postrm, use prerm instead
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
X-List-Received-Date: Mon, 21 May 2012 12:23:11 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <koen@dominion.thruhere.net> writes:

>> Considering that in the meantime my similar patch [1] to systemd.bbclass
>> got merged into meta-oe by Koen, who initially was against it, I guess
>> this patch can finally get merged now, too.
>
> Crap, I missed the $D part, that's going to get reverted

I think we can keep it when we enhance the systemctl script
(systemd-systemctl-native) to ignore 'stop/start'.  This will simplify
the install scripts because the

| if [ -z "$D" ]; then
|    systemctl stop ...
| fi

block can be replaced by a simple 'systemctl stop ...'



Enrico


