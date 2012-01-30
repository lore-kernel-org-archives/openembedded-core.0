Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rrnym-0002Kg-HC
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 10:56:52 +0100
Received: by werc1 with SMTP id c1so3202069wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 01:49:00 -0800 (PST)
Received: by 10.216.138.75 with SMTP id z53mr878296wei.25.1327916940334;
	Mon, 30 Jan 2012 01:49:00 -0800 (PST)
Received: from [128.224.170.202] ([89.121.200.106])
	by mx.google.com with ESMTPS id fv6sm50645693wib.8.2012.01.30.01.48.59
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 01:48:59 -0800 (PST)
Message-ID: <4F26678A.1050803@gherzan.ro>
Date: Mon, 30 Jan 2012 11:48:58 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F25501F.9000606@emagii.com>
	<CAMKF1so1dzbo3_YN-pJqn-axFAUazqkdKgFU+CUh3dSbWgYF2Q@mail.gmail.com>
In-Reply-To: <CAMKF1so1dzbo3_YN-pJqn-axFAUazqkdKgFU+CUh3dSbWgYF2Q@mail.gmail.com>
Subject: Re: bitbake -c clean <package> fails
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
X-List-Received-Date: Mon, 30 Jan 2012 09:56:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2012 07:35 PM, Khem Raj wrote:
> On Sun, Jan 29, 2012 at 5:56 AM, Ulf Samuelsson
> <openembedded-core@emagii.com>  wrote:
>> First I attempted to just remove the source tarball from the downloads
>> directory.
>> No download, but build completed.
> if you want a fresh fetch.
> you can just do bitbake -ccleanall module-init-tools
> that will remove the sstate as well as the sources
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Clean it's just a "clean". As in "make clean". So after a clean you will 
typically have configure, compile etc.
"cleanall" = remove unpacked + remove source. So after a clean you will 
tipically have fetch.


