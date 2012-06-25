Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1SjExV-0005bY-0b
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 21:28:25 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1SjEmy-0001DC-JX from wade_farnsworth@mentor.com ;
	Mon, 25 Jun 2012 12:17:32 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 25 Jun 2012 12:17:32 -0700
Received: from [172.30.2.78] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 25 Jun 2012 12:17:31 -0700
Message-ID: <4FE8B928.1000808@mentor.com>
Date: Mon, 25 Jun 2012 12:16:56 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4FE37C14.6060301@mentor.com> <4FE89BFA.9080406@linux.intel.com>
In-Reply-To: <4FE89BFA.9080406@linux.intel.com>
X-OriginalArrivalTime: 25 Jun 2012 19:17:32.0128 (UTC)
	FILETIME=[2B613600:01CD5307]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemtap: update to version 1.8
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
X-List-Received-Date: Mon, 25 Jun 2012 19:28:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Saul Wold wrote:
> On 06/21/2012 12:55 PM, Wade Farnsworth wrote:
>> Update the systemtap recipes to the recently released version 1.8. 
>> Remove a
>> couple of patches whose changes are already present in the new version.
>>
>> Signed-off-by: Wade Farnsworth<wade_farnsworth@mentor.com>
>> ---
>> ...prun-configure.ac-support-without-nss-for.patch | 50 
>> --------------------
>> .../systemtap_fix_for_automake_1.12.patch | 23 ---------
>> meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
>> meta/recipes-kernel/systemtap/systemtap_git.inc | 6 +--
>> 4 files changed, 3 insertions(+), 78 deletions(-)
>> delete mode 100644 
>> meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch 
>>
>> delete mode 100644 
>> meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch 
>>
>>
> Wade,
> 
> This patch is not applying cleanly with git am on the lastest master, 
> would you check it and possibly re-base/re-send.
> 
> Thanks
> Sau!
> 
> 

Hi Saul,

It looks like the umlaut characters in the deleted patches are being munged by my
mailer.  As a workaround, I've set up a github repo containing my change.  Do you mind
pulling this directly?

Thanks,

Wade


The following changes since commit f4b5afe46ff018570c1949653eb6995428827f6f:
  Richard Purdie (1):
        sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change

are available in the git repository at:

  https://github.com/wfarnsworth/oe-core.git stap

Wade Farnsworth (1):
      systemtap: update to version 1.8

 ...prun-configure.ac-support-without-nss-for.patch |   50 --------------------
 .../systemtap_fix_for_automake_1.12.patch          |   23 ---------
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    6 +--
 4 files changed, 3 insertions(+), 78 deletions(-)






