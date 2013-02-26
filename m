Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UASfq-00047K-DX
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:07:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2013 13:49:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="290886190"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.55])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2013 13:50:37 -0800
Message-ID: <512D2E2E.20503@linux.intel.com>
Date: Tue, 26 Feb 2013 13:50:38 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<e62df3d50df79849ea916095fd028b688b75df52.1361862860.git.liezhi.yang@windriver.com>
	<CAHUNapS=YynAbkmtj3NGha9vu2V_k1bDqW1gtPPe586N=shkUw@mail.gmail.com>
In-Reply-To: <CAHUNapS=YynAbkmtj3NGha9vu2V_k1bDqW1gtPPe586N=shkUw@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] mkdebugfs.sh: several fixes
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
X-List-Received-Date: Tue, 26 Feb 2013 22:07:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/26/2013 09:43 AM, Trevor Woerner wrote:
> On Tue, Feb 26, 2013 at 4:24 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Fix mkdebugfs.sh:
>>
>>          *)
>>              echo "Unknown file $FILE" 1>&2
>>              ;;
>>          esac
> 
> I know this doesn't come from your work, but since you're making
> changes, I think it would make for a better error message if the above
> said something along the lines of:
> 
>     echo "Unknown/unhandled file type '$(stat -c "%F" $FILE)' file:$FILE"
> 

That's fine. Also, there is no need to send my script first and then
patch it. It was a 5 minute hack, so just modify and include as a single
patch.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


