Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Uc4cP-0006C9-KF
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 04:05:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4E1lJrm028562
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2013 18:47:19 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 May 2013 18:47:19 -0700
Message-ID: <519197A0.2010201@windriver.com>
Date: Tue, 14 May 2013 09:47:12 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1366963971.git.liezhi.yang@windriver.com>
	<4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
	<CAJTo0LbU2=iEOpnw3GRSntQQyH73RaJ++zdzye2s1zvsgEznSQ@mail.gmail.com>
	<517B30A4.5050405@windriver.com>
	<CAJTo0LYzafv3Eb3QtbVT+jbRkfPN2_vUxh0bsS0WZ9bJc8-NaQ@mail.gmail.com>
	<CAP9ODKrOs_bqf0g5Aw3WhJ3ZVoNM2aqMCoQzWZ+8e9LX7cwscg@mail.gmail.com>
	<CAJTo0La+3k4HPZzXuV8gqKUSGhk3+=jHXnpa516Ge7KSAi9waA@mail.gmail.com>
In-Reply-To: <CAJTo0La+3k4HPZzXuV8gqKUSGhk3+=jHXnpa516Ge7KSAi9waA@mail.gmail.com>
Cc: Patches, Otavio Salvador <otavio@ossystems.com.br>,
	the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
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
X-List-Received-Date: Tue, 14 May 2013 02:05:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


OK, got it, I will file a new patch sooner.

// Robert

On 05/13/2013 11:28 PM, Burton, Ross wrote:
> On 13 May 2013 16:23, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> We may need to have a mechanism to specific build dependencies for
>> native depending on host version/distribution.
>
> The situation is that Suse splits the expat parser into a separate
> package for some reason, so the "fix" is to actually install the whole
> Python core library by installing python-xml if it isn't already
> pulled in.  We could add a sanity test that the python available is a
> full python and not missing the expat parser (suse without python-xml)
> or isn't python-minimal (ubuntu).
>
> Ross
>
>


