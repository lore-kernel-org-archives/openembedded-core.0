Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SS9ct-0003bN-BS
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:20:31 +0200
Received: (qmail 24742 invoked by uid 1003); 9 May 2012 16:10:37 -0000
Received: from unknown (HELO ?192.168.1.102?)
	(philip@opensdr.com@71.171.22.246)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 May 2012 16:10:37 -0000
Message-ID: <4FAA96FC.30707@balister.org>
Date: Wed, 09 May 2012 12:10:36 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>	<056CEBF9-AB73-43AB-ABFF-C511347BB8B3@dominion.thruhere.net>
	<CAF6bG8eTT0OPwLdJR1C=Acb+fx0oD4GLmRTwt5qX8Kq5m8Ckpg@mail.gmail.com>
In-Reply-To: <CAF6bG8eTT0OPwLdJR1C=Acb+fx0oD4GLmRTwt5qX8Kq5m8Ckpg@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
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
X-List-Received-Date: Wed, 09 May 2012 16:20:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/09/2012 10:07 AM, Marko Lindqvist wrote:
> On 9 May 2012 16:58, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>> Op 9 mei 2012, om 15:46 heeft Jason Wessel het volgende geschreven:
>>
>>> External distributions based on the oe-core will typically include
>>> bitbake in the top level directory.
>>
>> Really?
> 
>  Don't know about distributions, but when I first tried
> 
>> . openembedded-core/oe-init-build-env
>> bitbake core-image-minimal
> 
>  it complained that bitbake was not there, so it seems to be some sort
> of default of openembedded-core.

Seriously, putting bitbake inside the oe-core checkout is silly.

I guess I need to send my patch to oe-core I use to stop the locatoin
being hardcoded by the script that comes with oe-core.

Philip


