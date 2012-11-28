Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TdiLb-0001id-7k
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 15:10:43 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qASDuQBl030004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 14:56:27 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1Tdi7m-0003Zc-Hx
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 14:56:26 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <20121127182306.GE3692@jama.jama.net>
	<50B50A05.9020201@windriver.com> <20121128085726.GA3477@jama.jama.net>
	<1354093560.21863.164.camel@ted> <20121128125301.GB3477@jama.jama.net>
Date: Wed, 28 Nov 2012 14:56:26 +0100
In-Reply-To: <20121128125301.GB3477@jama.jama.net> (Martin Jansa's message of
	"Wed, 28 Nov 2012 13:53:01 +0100")
Message-ID: <lyzk213k6t.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: locale data broken in gstreamer
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
X-List-Received-Date: Wed, 28 Nov 2012 14:10:43 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

> Other option is to include the same hack in our Makefile.in.in
> GETTEXT_PACKAGE = @GETTEXT_PACKAGE@
> if we test that this does not break some other packages.

oe_runconf_prepend() {
    sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' po/Makefile.in.in
}

seems to work too (at least for gst-plugins-good)



Enrico


