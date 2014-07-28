Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 6D00370612
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 12:45:54 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s6SCjoA6008273
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 14:45:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1406551553;
	bh=at3PjpH9RxNG+6OJt188vtNZrxRvszLCv4xr1jfG2uc=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=BrBwhkX2Xpu0ft9vWFWLgxxCWJXUzsOubI1+BEu83hGQ2GOaOcwCzc0cezQV/jhVB
	z1qO8XgS8nBsLP3vUYnL9QNTlXAoScm1DLuz40XSM2CBZJmI5goTeIbngLj7mvg+OE
	80CVS0DnNcmPDHt4WsJo8JOro96iGLSxpf2WZuxQ=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s6SCjg6H031790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 14:45:44 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XBkJC-0002DI-AY
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jul 2014 14:45:42 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1406545281.git.Qi.Chen@windriver.com>
	<9ab915dae8dcffb3702a16bbd29ea51d5c776dfb.1406545281.git.Qi.Chen@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 28 Jul 2014 14:45:42 +0200
In-Reply-To: <9ab915dae8dcffb3702a16bbd29ea51d5c776dfb.1406545281.git.Qi.Chen@windriver.com>
	(Chen Qi's message of "Mon, 28 Jul 2014 19:02:24 +0800")
Message-ID: <lyiomhveh5.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH V2 1/1] systemd: upgrade to 215
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
X-List-Received-Date: Mon, 28 Jul 2014 12:45:56 -0000
Content-Type: text/plain

Chen Qi <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> The files under /usr/lib/sysusers.d/ are also added to CONFFILES.

Are CONFFILES outside of /etc really allowed? Admin can override them in
/etc/sysusers.d when he wants.



Enrico

