Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TjZN5-0006Rd-RQ
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 18:48:37 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Dec 2012 09:33:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,282,1355126400"; d="scan'208";a="264085548"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.3])
	by fmsmga002.fm.intel.com with ESMTP; 14 Dec 2012 09:33:46 -0800
Message-ID: <50CB62FA.7090702@linux.intel.com>
Date: Fri, 14 Dec 2012 09:33:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1355505665.32519.29.camel@ted>
In-Reply-To: <1355505665.32519.29.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/patch: Use force option when creating symlinks to patches
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
X-List-Received-Date: Fri, 14 Dec 2012 17:48:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2012 09:21 AM, Richard Purdie wrote:
> Under the scenario where you have an existing source tree and you then
> change one of the patches, maybe to be architecture or machine specific,
> then rebuild, the build will fail since the symlink already exists
> but should now point at a different file.
>
> The easiest fix is to tell the system to remove and recreate the link
> which is done with the force option.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Acked-by: Saul Wold <sgw@linux.intel.com>

> ---
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index bc86bb5..7ab74fa 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -278,7 +278,7 @@ class QuiltTree(PatchSet):
>           if not self.initialized:
>               self.InitFromDir()
>           PatchSet.Import(self, patch, force)
> -        oe.path.symlink(patch["file"], self._quiltpatchpath(patch["file"]))
> +        oe.path.symlink(patch["file"], self._quiltpatchpath(patch["file"]), force=True)
>           f = open(os.path.join(self.dir, "patches","series"), "a");
>           f.write(os.path.basename(patch["file"]) + " -p" + patch["strippath"]+"\n")
>           f.close()
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


