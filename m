Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QJrne-0008Sj-VB
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 20:36:51 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QJrky-0006hN-Nj from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 11:34:04 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 10 May 2011 11:34:01 -0700
Received: from [172.30.12.232] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 10 May 2011 11:34:00 -0700
Message-ID: <4DC98507.6070103@mentor.com>
Date: Tue, 10 May 2011 11:33:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>	<4DC8CA7E.4020302@linux.intel.com>	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>	<4DC97D27.9080602@linux.intel.com>
	<20110510181314.GF3673@jama.jama.net>
In-Reply-To: <20110510181314.GF3673@jama.jama.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 10 May 2011 18:34:01.0169 (UTC)
	FILETIME=[D4EF7C10:01CC0F40]
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 18:36:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/10/2011 11:13 AM, Martin Jansa wrote:
> On Tue, May 10, 2011 at 11:00:07AM -0700, Saul Wold wrote:
>> On 05/10/2011 05:53 AM, Otavio Salvador wrote:
>>> On Tue, May 10, 2011 at 02:17, Saul Wold<sgw@linux.intel.com>  wrote:
>>>> Next time, please use the create-pull-request script, which will generate a
>>>> set of patch emails so that we can review this information via email. I will
>>>> make a couple of additional comments below associated with each patch.
>>>
>>> It has a problem to me since it depends on using the contrib repo and
>>> I am using github.
>>> ...
>> Is there a reason you can't use the oe-core-contrib repo and create a 
>> branch there?  Can the script be modified to support github also?
> 
> I'm using slightly modified script for pull requests from gitorious.
> 
> send-pull-request are the same as long as you use git send-email and
> have sendemail.to defined in repo.
> 
> To modify it for github is as simple as this I guess.
> 
> $ diff -uNr shr-core/openembedded-core/scripts/create-pull-request ~/bin/meta-efl-create-pull-request 
> --- shr-core/openembedded-core/scripts/create-pull-request 2011-04-04 09:35:47.973626385 +0200
> +++ /OE/bin/meta-efl-create-pull-request        2011-05-10 13:33:20.349688815 +0200
> @@ -2,9 +2,11 @@
>  ODIR=pull-$$
>  RELATIVE_TO="master"
>  COMMIT_ID="HEAD"
> -PULL_URL="git://git.openembedded.org/openembedded-core-contrib"
> -WEB_URL_PREFIX="http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h="
> -PREFIX="PATCH"
> +#PULL_URL="git://git.openembedded.org/meta-openembedded-contrib"
> +#WEB_URL_PREFIX="http://git.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h="
> +PULL_URL="git://gitorious.org/shr/meta-openembedded.git"
> +WEB_URL_PREFIX="http://gitorious.org/shr/meta-openembedded/commits/"
> +PREFIX="meta-efl][PATCH"
>  
>  usage() {
>  CMD=$(basename $0)

Hmmm.  I'm going to take a stab at making this a create-pull-request
option...

-- 
Tom Rini
Mentor Graphics Corporation


