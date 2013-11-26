Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 871FF6D750
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 11:50:15 +0000 (UTC)
Message-ID: <52948AF5.90709@communistcode.co.uk>
Date: Tue, 26 Nov 2013 11:50:13 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1384587416.git.Qi.Chen@windriver.com>
	<5292BE1C.2080803@windriver.com>
In-Reply-To: <5292BE1C.2080803@windriver.com>
Subject: Re: [PATCH 0/1] shadow-native: allow for setting password in clear text
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2013 11:50:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 25/11/13 03:03, ChenQi wrote:
> ping
> 
> On 11/16/2013 03:37 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The following changes since commit
>> ea92671d9823e3667d6ced7ac2af20f991da404d:
>>
>>    bitbake: cooker: replace "w" file opening mode with "a" mode
>> (2013-11-12 17:01:37 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib ChenQi/cleartext-password
>>   
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cleartext-password
>>
>>
>> Chen Qi (1):
>>    shadow-native: allow for setting password in clear text
>>
>>   .../allow-for-setting-password-in-clear-text.patch |  208
>> ++++++++++++++++++++
>>   meta/recipes-extended/shadow/shadow.inc            |    1 +
>>   2 files changed, 209 insertions(+)
>>   create mode 100644
>> meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
>>
>>

Could you provide a short example for how this is to be used? An
additional patch to user-add in meta-skeleton perhaps?

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

