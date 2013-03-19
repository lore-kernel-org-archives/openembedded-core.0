Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UHvff-0006jZ-Tr
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 13:29:44 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r2JCCk46027714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 19 Mar 2013 13:12:47 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UHvPK-0005re-6F; Tue, 19 Mar 2013 13:12:46 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
	<4ad7ea263a05fb3c1960623760340549a20c849c.1363031776.git.ross.burton@intel.com>
	<ly620wucp5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbdxA_kSdLQd8Qbr53BRzT8-EamBCbtzgk0hYsdnB_B3Q@mail.gmail.com>
Date: Tue, 19 Mar 2013 13:12:46 +0100
In-Reply-To: <CAJTo0LbdxA_kSdLQd8Qbr53BRzT8-EamBCbtzgk0hYsdnB_B3Q@mail.gmail.com>
	(Ross Burton's message of "Tue, 19 Mar 2013 11:39:53 +0000")
Message-ID: <lyehfby4e9.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.7
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] systemd: allow postinsts to run without systemd being present
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
X-List-Received-Date: Tue, 19 Mar 2013 12:29:45 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

>> Checking for existence of programs in scriplets is a bad hack which
>> might hide real problems and the scriplets are getting more complicated
>> by this.
>>
>> Placing scriplets and related files into separate subpackages is a much
>> cleaner solution.
>
> Sure, but then you're just substituting one ugly hack for bigger
> problems including upgrade 

What is the problem with subpackages and upgrade paths?


Enrico


