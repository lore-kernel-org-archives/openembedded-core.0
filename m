Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R8KoD-0001bg-AJ
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 01:42:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8QNaY2e026903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Sep 2011 16:36:34 -0700 (PDT)
Received: from Macintosh-5.local (128.224.18.66) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 26 Sep 2011 16:36:34 -0700
Message-ID: <4E810C79.5030801@windriver.com>
Date: Mon, 26 Sep 2011 19:36:25 -0400
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4E810529.2000708@linux.intel.com>
In-Reply-To: <4E810529.2000708@linux.intel.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: RPM and libmagic
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
X-List-Received-Date: Mon, 26 Sep 2011 23:42:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/26/11 7:05 PM, Saul Wold wrote:
> 
> Mark,
> 
> I recently found a problem with RPM and libmagic, specificly the rpmdeps 
> command as it's used in package.bbclass. The issue being that it was not 
> finding the correct magic.mgc file.  I notice that we wrap the other RPM 
> commands, but not rpmdeps.

That is likely a bug.

> Additionally, as I have discovered the wrappers that we have in place 
> currently does not define a MAGIC environment variable to correct the 
> location.

Is the proper variable "MAGIC" or is it's something else?

> I know rpm and friends are an important part of OE packaging, so I 
> wanted to check with you first about the correct location to set this, 
> if we should use the MAGIC or pass a --define '%_rpmfc_magic_path ...' 
> on the command line.

I believe the intention is to pass the _rpmfs_magic_path..  that patch can be
made up of other potential dynamic results.  If the wrapper is building up
_librpm (something like that), then we can use:

%_rpmfc_magic_path %{_rpmlib}/../../share/magic

Note about is ramblings, not actual code.. ;)

> Please advise, I know you are traveling, and I can implement the change 
> once we figure out the correct approach.

Thanks..  if you need to call me +1-612-669-2612.

> Thanks
> 



