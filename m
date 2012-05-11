Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SSdUK-0005pV-Ch
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 02:13:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4B03isi006674
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 17:03:44 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 10 May 2012 17:03:44 -0700
Date: Thu, 10 May 2012 19:03:41 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120510190341.0edbf19f@wrlaptop>
In-Reply-To: <8c6c132129d83dca4e5b88a642126901c32a78de.1336691544.git.mark.hatle@windriver.com>
References: <cover.1336691544.git.mark.hatle@windriver.com>
	<8c6c132129d83dca4e5b88a642126901c32a78de.1336691544.git.mark.hatle@windriver.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] sstate.bbclass: Improve sstate_installpkg performance
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
X-List-Received-Date: Fri, 11 May 2012 00:13:40 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 10 May 2012 18:13:38 -0500
Mark Hatle <mark.hatle@windriver.com> wrote:

> +	sstate_hardcode_cmd = "sed -e 's:^:%s:g' %s | xargs %s" %
> (sstateinst, fixmefn, sstate_sed_cmd)

How confident are we that the file names can never have whitespace in
them?

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


