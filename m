Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1Tsr9A-0000tV-CT
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 09:36:32 +0100
Received: from [192.168.101.47] (afplatform.bmw-carit.intra [192.168.101.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 0A0374003E;
	Wed,  9 Jan 2013 08:43:08 +0100 (CET)
Message-ID: <50ED287D.6030507@oss.bmw-carit.de>
Date: Wed, 09 Jan 2013 09:21:17 +0100
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<CAJTo0LavddUVfHnF2qVGgE9U2Vb7NtbL_B3M5PPtHNV6V6D8qg@mail.gmail.com>
	<50D1B088.3000009@oss.bmw-carit.de>
	<CAJTo0La4ou6_1NvgRo0rqHNEDqmAFH29qFbg_N1Wfv8L1uUa=Q@mail.gmail.com>
	<CAJTo0LYieHXLYPCUuAkScUhrxsnQm4XyPfVX17uwnAPfmw24oQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYieHXLYPCUuAkScUhrxsnQm4XyPfVX17uwnAPfmw24oQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Jan 2013 08:36:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/2012 12:34 PM, Burton, Ross wrote:
> Not sure how I failed to notice this, but there's a setuptools.bbclass
> in oe-core:
>
> inherit distutils
>
> DEPENDS += "python-setuptools-native"
>
> DISTUTILS_INSTALL_ARGS = "--root=${D} \
>      --single-version-externally-managed \
>      --prefix=${prefix} \
>      --install-lib=${PYTHON_SITEPACKAGES_DIR} \
>      --install-data=${datadir}"
>
> Yeah, that.  I'll fix python-mako and this should be suitable for you too.
>
> Ross
Hi Ross,

the setuptools class does great work. Writing recipes and installing 
python packages now works like a charm.
As you probably noticed as well, to add a package, one must add recipes 
for the transitive closure of all required packages defined in the 
setup.py file with the lines install_requires=[.*] and setup_requires=[.*].

The previous patches are now completely obsolete.

Lukas



