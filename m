Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMKaO-00013J-UE for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:45:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HDgJMI016848
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:42:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16467-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:42:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HDgCpY016842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:42:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Date: Tue, 17 May 2011 14:42:10 +0100
Message-ID: <1305639730.3424.231.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/14] 16-May-2011 Consolidated Pull Request
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
X-List-Received-Date: Tue, 17 May 2011 13:45:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 14:43 -0700, Saul Wold wrote:
> This contains the Kernel updates, Upstream-Status updates along with
> some changes from Nitin, Khem, Tom and myself.
> 
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: sgw/stage
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

I took most of this except:

Yu Ke (2):
  xserver-kdrive: upgrade from 1.7.99.2 to 1.10.1

which I've commented on. xcalibrate needs to be reinstated short term
and we either need to use a different calibration app or patch xtscal to
use XI2 longer term.

> Khem Raj (3):
>   e2fsprogs_1.41.14.bb: Package libraries into separate packages

> Tom Rini (2):
>   openssh: Don't use ${libdir}exec

I added PR bumps to these...

Cheers,

Richard




