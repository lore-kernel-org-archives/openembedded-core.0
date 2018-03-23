Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 2832C788B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:10:43 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NGAiWN030285
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 17:10:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1521821444;
	bh=vThxJDcmC3eJiqCVUYUpl0xkCQ/vT+cjps8zJF1OdaA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=Qs+at2sTKLyxFFHnFibmRPZPtAr6BTtvWOtZuZqWZOaW0DyDebRuC9qj20U6pRIDs
	Iu3uTg59IsB9hIR5PP7xSQw3NGmL//FoozRMyZyJXbNjMUfx+wtUfz5V5vxAxYFoTM
	g3NDQPR1kIyiO35VGEsnwT7FwmAtN2OTprXfltIM=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NGAav4003660 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 23 Mar 2018 17:10:37 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 8832D84FBE4;
	Fri, 23 Mar 2018 17:01:19 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NGAaAF003657
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 23 Mar 2018 17:10:36 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1ezPH1-0002wi-TJ; Fri, 23 Mar 2018 17:10:36 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
Date: Fri, 23 Mar 2018 17:10:35 +0100
In-Reply-To: <CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	(Ross Burton's message of "Fri, 23 Mar 2018 16:05:13 +0000")
Message-ID: <lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.83
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 23 Mar 2018 16:10:44 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

>> do_install() {
>>         install -D -p -m 0644 bar ${D}/bin/bar
>>         install -d -m 0755 ${D}/usr/bin
>>         mv ${D}/bin/bar ${D}/usr/bin/bar
>>         ln -s /usr/bin/bar ${D}/bin/bar
>> }
>>
>> FILES_${PN} = "/bin/* /usr/bin/*"
>> ---
>>
>> WARNING: foo-1.0-r0 do_package_qa: QA Issue: foo: /foo/usr/bin/bar
>> is owned by uid 505, which is the same as the user running
>> bitbake. This may be due to host contamination
>> [host-user-contaminated]
>
> Works for me: install correctly changes owner to root:root as it
> should.

I think, 'mv' is the culprit.  It calls 'renameat2()' directly over
'syscall()':

| $ ltrace mv foo bar
| ...
| syscall(316, 0xffffff9c, 0x7fff1564a341, 0xffffff9c)                                            = 0


Perhaps, 'pseudo' does not catch this?


Enrico

