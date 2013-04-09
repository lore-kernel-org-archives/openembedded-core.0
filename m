Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UPWjx-0006PJ-Jz
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 13:29:32 +0200
Message-ID: <5163F789.6050700@communistcode.co.uk>
Date: Tue, 09 Apr 2013 12:12:09 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAHu+ux0pWKar5pRvsdqkPXq2E2A4+oBRmMqO8W7=h-iX2iKh9w@mail.gmail.com>
In-Reply-To: <CAHu+ux0pWKar5pRvsdqkPXq2E2A4+oBRmMqO8W7=h-iX2iKh9w@mail.gmail.com>
Subject: Re: Achiving My OE environment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 11:29:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/13 11:16, David Hirst wrote:
> I am trying to achive (svn or tar ball) my whole oe_layersetup 
> directory structure.
> However I seem to have problems when I check it out or untar it on a 
> different machine.
> It does not seems to build correctly. I set up the paths to the build 
> tools and use /conf/setenv
> to set up other paths.
> It seems impossible to build everything correctly without going 
> through a comlete installation of the oe-layersetup form the git clone 
> and setup script. Does anyone have experiance with this? and have some 
> advice?
> Thanks
> -- 
> David Hirst
> hirst689@gmail.com <mailto:hirst689@gmail.com>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

To ensure a fully compatible archive, I do final builds in a virtual 
machine and then backup that virtual machine once the build is complete. 
This is also a good way to ensure that your layers and everything don't 
have local modifications.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



