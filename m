Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TCXMk-00058g-VN
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 16:59:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Sep 2012 07:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="192790785"
Received: from costin-desktop (HELO [10.237.105.66]) ([10.237.105.66])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 07:46:41 -0700
Message-ID: <5053367F.3010504@intel.com>
Date: Fri, 14 Sep 2012 16:51:59 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <1347628321-25057-1-git-send-email-constantinx.musca@intel.com>
	<lyd31ou1px.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyd31ou1px.fsf@ensc-virt.intern.sigma-chemnitz.de>
Cc: Constantin Musca
	<public-constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@plane.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] patch.bbclass: increase security
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
X-List-Received-Date: Fri, 14 Sep 2012 14:59:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2012 05:18 PM, Enrico Scholz wrote:
>
> Constantin Musca
> <constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
>
>> +    process_tmpdir = tempfile.mkdtemp(prefix=str(os.getpid()))
> fwiw, prefix is usually something which identifies the origin of the
> tempfile.  getpid() does not make much sense here; it might be better to
> use something like 'bitbake-patch' or so.
>
>
>>       if os.path.exists(process_tmpdir):
> this will trigger everytime becuase 'mkdtemp()' creates the directory.
>
>> +        bb.utils.remove(process_tmpdir, True)
> this lowers the just gained security... :(
>
>
>>       os.makedirs(process_tmpdir)
> not needed
>
>
> ---> a plain
>
>   |     process_tmpdir = tempfile.mkdtemp()
>   |     os.environ['TMPDIR'] = process_tmpdir
>
> suffices (add a custom prefix when you really want it).
>
>
>
> Enrico
Is it ok now ? ([PATCH v2] patch.bbclass: increase security)


Constantin



