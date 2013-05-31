Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 21F4B61AD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 07:08:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4V7C4TT030108; Fri, 31 May 2013 08:12:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dvf-3nbl-blV; Fri, 31 May 2013 08:12:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4V7CPei030128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 31 May 2013 08:12:27 +0100
Message-ID: <1369984072.14887.338.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 31 May 2013 08:07:52 +0100
In-Reply-To: <51A83FDB.4010309@linux.intel.com>
References: <cover.1369970703.git.bruce.ashfield@windriver.com>
	<51A83FDB.4010309@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2013 07:08:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-31 at 15:14 +0900, Saul Wold wrote:
> On 05/31/2013 12:28 PM, Bruce Ashfield wrote:
> > Richard/Saul,
> >
> > While I continue to battle with gcc 4.8, I've got a collection of other fixes
> > that don't need to wait. Here's part of those pending changes.
> >
> >   - Remove the yocto 3.2 kernel, early in the Yocto 1.5 cycle as promised
> 
> Did I miss a request to remove the .bbappend from meta-yocto-bsp?  There 
> seems to be a 3.2 bbappend still.

In the interests of getting roughly caught up with patches, I've added a
patch to delete this as well...

Cheers,

Richard


