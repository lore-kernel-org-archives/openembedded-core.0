Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rkz1F-0000AN-4a
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 15:19:14 +0100
Received: by wgbdt11 with SMTP id dt11so757301wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 06:11:42 -0800 (PST)
Received: by 10.180.96.72 with SMTP id dq8mr42307792wib.10.1326291102081;
	Wed, 11 Jan 2012 06:11:42 -0800 (PST)
Received: from [128.224.170.207] ([89.121.200.106])
	by mx.google.com with ESMTPS id g12sm2827275wiw.10.2012.01.11.06.11.41
	(version=SSLv3 cipher=OTHER); Wed, 11 Jan 2012 06:11:41 -0800 (PST)
Message-ID: <4F0D989D.4080907@gherzan.ro>
Date: Wed, 11 Jan 2012 16:11:41 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1326285902-31525-1-git-send-email-andrei@gherzan.ro>
	<1356479.bsRlACIzx0@helios>
In-Reply-To: <1356479.bsRlACIzx0@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] license.py: remove duplicate '&' or '|' from LICENSE
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
X-List-Received-Date: Wed, 11 Jan 2012 14:19:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 03:56 PM, Paul Eggleton wrote:
> On Wednesday 11 January 2012 14:45:02 Andrei Gherzan wrote:
>> Some upstream layers (ex: meta-oe) use '&&' or '||' syntax in LICENSE
>> variable. Because of my last commit, these bbfiles are failing as LICENSE
>> is tested with oe.license where '&&' and '||' are the bug source.
>> The fix is to replace multiple characters of '&' or '|' with a single one.
> Sorry to be a pain but could we not just fix those layers to use the accepted
> syntax? Doing so should be just a one-line find/sed command.
>
> Cheers,
> Paul
>
That'd be a solution as well but because those files were accepted this 
way until now i thought that this is an accepted syntax. More, this 
would scale and give a little freedom to the developers especially for 
those that are coming from "C" part or the world. (smile)

ag


