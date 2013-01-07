Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TsCtg-0004L9-CW
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:37:55 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r07DMbIl013867
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jan 2013 14:22:38 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1TsCey-0001WK-U4
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:22:37 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <20121226113500.4490F1036A@opal>
	<CAGiJk9di7Tt3UW47kqYGK9ekVQV=Uci-vJcT_EvSHQmjhXGozQ@mail.gmail.com>
Date: Mon, 07 Jan 2013 14:22:36 +0100
In-Reply-To: <CAGiJk9di7Tt3UW47kqYGK9ekVQV=Uci-vJcT_EvSHQmjhXGozQ@mail.gmail.com>
	(Samuel Stirtzel's message of "Mon, 7 Jan 2013 13:59:40 +0100")
Message-ID: <lyvcb9t9er.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.75
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [oe-commits] Constantin Musca : libmusicbrainz: upgrade to git SRCREV 0749dd0a35b4a543
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
X-List-Received-Date: Mon, 07 Jan 2013 13:38:12 -0000
Content-Type: text/plain

Samuel Stirtzel <s.stirtzel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
writes:

>> Commit: a9d25a8e6720ceff5cfefa3191026357dd6e0f49
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a9d25a8e6720ceff5cfefa3191026357dd6e0f49
>> ...
>> libmusicbrainz: upgrade to git SRCREV 0749dd0a35b4a543


> this fails tests for build-hosts without libcap2 installed:

ditto for build-hosts without neon-devel (DEPENDS on 'neon-native' does
*not* suffice)


Enrico


