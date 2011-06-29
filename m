Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qc3uK-0003Fp-Cg
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 01:10:56 +0200
Received: (qmail invoked by alias); 29 Jun 2011 23:00:33 -0000
Received: from p5B0A22BD.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.34.189]
	by mail.gmx.net (mp009) with SMTP; 30 Jun 2011 01:00:33 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19Grv10ZBBGJnv/VfR4UgemVBxUozCjfulLVaLejf
	gnz9kWxpfzSksU
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 01:02:16 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201106300102.16411.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: How to reuse code in oe-core environment
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
X-List-Received-Date: Wed, 29 Jun 2011 23:10:56 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I am playing around with oe-core try to find a way of reusing code for multiple 
recipes. In oe I did create foo.inc with

foo() {
	# code to reuse
}

and called foo from several recipes. In oe-core the run.* scripts are much more 
stripped of unnecessary.  All the code included by 'require' seems to miss, so 
the function foo() will not be found. 

My searches for examples did not lead to a hook so what is the suggested 
solution for reusing code for multiple recipes in oe-core?

regards

Andreas


