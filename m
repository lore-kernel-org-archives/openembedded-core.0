Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA326BA1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 17:18:50 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rBDHIlHE023718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 18:18:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1386955130;
	bh=5e3Jtup/a4cCFem6OrEQD/lqJ0JiiMnB8XGZw7RLF/s=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=M8Et+ZD6EVZFf1Nfun/YGLaMxJXZIYLBARnHAWgTUydh4HYpdKsj8qbkEmbveWbcq
	0bEpJc6o2NGzsx+rmZ/TdTUcHKnjnsNYXdjxQ3Bt/Y2mnu5KOMw0WNcz5b0PlbhlnX
	dm4oaQhpRmggqhZwhxYLQltQv7UfminOK94DbLoM=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rBDHIfew024558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 18:18:43 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VrWNp-00079A-15
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Dec 2013 18:18:40 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1386903269.git.Qi.Chen@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 13 Dec 2013 18:18:36 +0100
In-Reply-To: <cover.1386903269.git.Qi.Chen@windriver.com> (Qi's message of
	"Fri, 13 Dec 2013 11:09:01 +0800")
Message-ID: <ly38lw1xg3.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [PATCH 0/2] Change the way of handling CONFFILES
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
X-List-Received-Date: Fri, 13 Dec 2013 17:18:51 -0000
Content-Type: text/plain

<Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> As almost all files under /etc should be considerred as config files,

A lot of projects (especially from the freedesktop edge) are (ab)using
/etc to store non configuration files. E.g. all the dbus confguration or
gconf schemes are not intended to be modified by users.



Enrico

