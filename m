Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1S8Vdu-0001qj-7l
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 12:48:22 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id q2GB9Z3V009043
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Mar 2012 12:09:37 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Fri, 16 Mar 2012 12:09:35 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <CAD=xvPu1b2ntY+b46G3N43tUHLrEneo8Y1UzwjKY2GMFBC=kgQ@mail.gmail.com>
	<CAD=xvPuGXzvLm8p2kOKeDycZQqAZ_cbMn0dfNE9tWf8ewP34Sw@mail.gmail.com>
Date: Fri, 16 Mar 2012 12:09:35 +0100
In-Reply-To: <CAD=xvPuGXzvLm8p2kOKeDycZQqAZ_cbMn0dfNE9tWf8ewP34Sw@mail.gmail.com>
	(VIJAY KUMAR's message of "Fri, 16 Mar 2012 15:33:42 +0530")
Message-ID: <ly3998reds.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: VIJAY KUMAR <vijaykumar.pulluri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ERROR during bitbake
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
X-List-Received-Date: Fri, 16 Mar 2012 11:48:22 -0000
Content-Type: text/plain; charset=us-ascii

VIJAY KUMAR <vijaykumar.pulluri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

> I am trying to build openjdk-6 for my imx53sabre board.
> During my journey, I got sticked here to get out of error.
>
> | chmod -w grove_inst.cxx
> | chmod: grove_inst.cxx: new permissions are r-xr-xrwx, not r-xr-xr-x

chmod -### operations are broken because they take umask into account
and result might differ from the expected one hence.

You will have to patch the buildsystem to do 'chmod a-w' instead of
'chmod -w'.


Enrico


