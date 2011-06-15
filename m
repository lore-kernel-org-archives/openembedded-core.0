Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QWg7B-0002Dt-CZ
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 04:45:57 +0200
Received: from mail-pv0-f180.google.com ([74.125.83.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Jun 2011 19:41:17 -0700
Received: by pvc21 with SMTP id 21so2846032pvc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 19:41:16 -0700 (PDT)
Received: by 10.142.55.5 with SMTP id d5mr1210655wfa.128.1308105676670;
	Tue, 14 Jun 2011 19:41:16 -0700 (PDT)
Received: from [10.6.18.226] (c-71-193-189-117.hsd1.wa.comcast.net
	[71.193.189.117])
	by mx.google.com with ESMTPS id w24sm584723wfd.5.2011.06.14.19.41.15
	(version=SSLv3 cipher=OTHER); Tue, 14 Jun 2011 19:41:16 -0700 (PDT)
Message-ID: <4DF81BCA.1030602@intel.com>
Date: Tue, 14 Jun 2011 19:41:14 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <cover.1308000501.git.sgw@linux.intel.com>	<f1001141de7bf605c79b8ae9b44160e4cda9e736.1308000501.git.sgw@linux.intel.com>	<59F3EB02-7EFE-4E50-AD6E-A953952FEA6B@dominion.thruhere.net>
	<4DF71647.7000703@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB699650124B3@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB699650124B3@shsmsx502.ccr.corp.intel.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autoconf/automake: Bump PR to resolve perl-native issue
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
X-List-Received-Date: Wed, 15 Jun 2011 02:45:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2011 07:33 PM, Cui, Dexuan wrote:
> Saul Wold wrote:
>> On 06/14/2011 12:48 AM, Koen Kooi wrote:
>>> To be clear: does the PR bump fix the issues or was there a fix
>>> earlier that lacked a PR bump?
>>>
>> The fix was earlier and lacked the PR bump to these recipes.
> Sorry for the issue and thanks Saul for the fix!
> I knew the issue but I was not clear I should have bumped the PRs.
> I thought autoconf/aumake-native themselves didn't change... I'll be more careful.
>
> Thanks,
> -- Dexuan
It turns out that glib-2.0-native might also need a bump, not sure what 
else is lurking out there.


Sau!


