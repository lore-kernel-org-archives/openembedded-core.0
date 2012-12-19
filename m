Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TlIpW-0007fS-HR
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 13:33:01 +0100
Received: from [192.168.101.56] (afplatform.bmw-carit.intra [192.168.101.56])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 1F1D44006A;
	Wed, 19 Dec 2012 12:41:39 +0100 (CET)
Message-ID: <50D1B088.3000009@oss.bmw-carit.de>
Date: Wed, 19 Dec 2012 13:18:16 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<CAJTo0LavddUVfHnF2qVGgE9U2Vb7NtbL_B3M5PPtHNV6V6D8qg@mail.gmail.com>
In-Reply-To: <CAJTo0LavddUVfHnF2qVGgE9U2Vb7NtbL_B3M5PPtHNV6V6D8qg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] easyinstall: class to create and extend the easyinstall.pth file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 12:33:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/18/2012 03:55 PM, Burton, Ross wrote:
> On 18 December 2012 13:58, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> wrote:
>> When installing python packages that are installed with python's easyinstall,
>> the installation creates easyinstall.pth files. This file must exist in the
>> root filesystem so that python 2.7 can locate and import the installed modules
>> in the host system.
> Is this the logic that where packages get installed as Eggs, so into
> e.g. /usr/lib/python2.7/site-packages/Foo-1.0/ instead of
> ../packages/foo)?  In that case we're basically having to deal with a
> lot of complication.   I've been battling this a bit with python-mako
> and this section of the setuptools document applies to us:
>
> "However, packaging tools that build binary distributions by running
> setup.py install on the command line or as a subprocess will require
> modification to work with setuptools. They should use the
> --single-version-externally-managed option to the install command,
> combined with the standard --root or --record options. See the install
> command documentation below for more details."
>
> http://peak.telecommunity.com/DevCenter/setuptools#what-your-users-should-know
> http://peak.telecommunity.com/DevCenter/setuptools#install-command
I think your solution is a simpler and better one that I did not think of.

> I'm all in favour of a setuptools class, but I think it should follow
> what the documentation says and use --s-v-e-m.   My recent python-mako
> patch to oe-devel uses these options to do a "old-school" install
> which doesn't mean dealing with .pth files, as we're a perfectly good
> package management system already.
I am also in favor of that.

 From your description I could not find the version of python-mako that 
uses the --s-v-e-m option.
Where can I find this version of the file? Maybe I was just looking at 
the wrong repository...

Lukas




