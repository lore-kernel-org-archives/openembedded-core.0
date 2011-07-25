Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QlLzO-0002So-C9
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:18:34 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p6PEEKWt005774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 16:14:21 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Mon, 25 Jul 2011 16:14:20 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<586cbf5404ff76795c3d967266e7338b01e47c8b.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311602747.30326.224.camel@phil-desktop>
Date: Mon, 25 Jul 2011 16:14:19 +0200
In-Reply-To: <1311602747.30326.224.camel@phil-desktop> (Phil Blundell's
	message of "Mon, 25 Jul 2011 15:05:46 +0100")
Message-ID: <ly7h76jvlw.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.9
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH 5/5] package.bbclass: fixup_perms - symlink bug fix
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
X-List-Received-Date: Mon, 25 Jul 2011 14:18:34 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <philb-mXXj517/zsQ@public.gmane.org> writes:

>> We don't want to change the owner/mode of symlinks, as this may
>> affect the target of the link.  Also broken links will fail as well.
>
> This seems like it will cause links themselves to end up getting shipped
> under the UID/GID that was used for building

there should be used 'os.lchown()' instead of 'os.chown()' in fix_perms()
and the 'os.chmod()' call must be omitted for links.



Enrico


