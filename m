Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QchWd-0002FY-9B
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 19:29:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p61HPLFQ022595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 10:25:21 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 1 Jul 2011 10:25:20 -0700
Message-ID: <4E0E02FF.4040304@windriver.com>
Date: Fri, 1 Jul 2011 12:25:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>	<201106301633.48933.paul.eggleton@linux.intel.com>	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>	<201106301659.54941.paul.eggleton@linux.intel.com>	<1309537504.20015.531.camel@rex>	<1309540367.20015.534.camel@rex>
	<4E0E00FA.1060508@gmail.com>
In-Reply-To: <4E0E00FA.1060508@gmail.com>
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Fri, 01 Jul 2011 17:29:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/1/11 12:16 PM, Khem Raj wrote:
> On 07/01/2011 10:12 AM, Richard Purdie wrote:
>> gcc-4.6.0+svnr175150, non dev contains .so, gcc, /work/i586-poky-linux/gcc-4.6.0+svnr175150-r4/packages-split/gcc/usr/libexec/gcc/i586-poky-linux/4.6.1/liblto_plugin.so
>>>
> 
> This should be packages with gcc itself. May be adding to FILES will get 
> rid of this warning

The warning above indicates that it -is- being packaged in the 'gcc' package.
The check verified that no files of the name .so exit and they are not symlinks:

    if not name.endswith("-dev") and not name.endswith("-dbg") and
path.endswith(".so") and os.path.islink(path):

In this case, I believe that the file is likely supposed to be there.  Is there
a way to selectively disable insane checks on a per-recipe basis when we know
they are wrong?

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



