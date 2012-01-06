Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Rj79z-0004pT-0l
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 11:36:33 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id q06AT0sE024921
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 11:29:02 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Fri,  6 Jan 2012 11:29:00 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1325744640.git.sgw@linux.intel.com>
	<04bb0f6bbd41ec9c2234df49130dba2346d9a3bf.1325744640.git.sgw@linux.intel.com>
Date: Fri, 06 Jan 2012 11:29:00 +0100
In-Reply-To: <04bb0f6bbd41ec9c2234df49130dba2346d9a3bf.1325744640.git.sgw@linux.intel.com>
	(Saul Wold's message of "Wed, 4 Jan 2012 22:30:29 -0800")
Message-ID: <lyboqh86qb.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.72 on 62.153.82.30
Subject: Re: [CONSOLIDATED PULL 04/28] ncurses: move libraries to base_libdir
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
X-List-Received-Date: Fri, 06 Jan 2012 10:36:33 -0000
Content-Type: text/plain; charset=us-ascii

Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:

> -		f=${D}${libdir}/$i.so
> +                f=${D}${base_libdir}/$i.so

this breaks builds because 'ld' does not search ${base_libdir}:

| gcc -shared ... -ltermcap
| /usr/bin/ld: cannot find -ltermcap
| ERROR: Task 216 (virtual:native:.../readline/readline_6.2.bb, do_install) failed with exit code '1'
| ERROR: 'virtual:native:.../readline/readline_6.2.bb' failed



Enrico


