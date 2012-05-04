Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQLBU-0002nm-Hs
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 18:16:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 May 2012 09:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96454399"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by AZSMGA002.ch.intel.com with ESMTP; 04 May 2012 09:06:55 -0700
Message-ID: <4FA3FE9F.8050903@linux.intel.com>
Date: Fri, 04 May 2012 09:06:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAF6bG8ekrGh8V3dbkarox=d3sDWvioRxEKUCYXMfK529+CU+mw@mail.gmail.com>
In-Reply-To: <CAF6bG8ekrGh8V3dbkarox=d3sDWvioRxEKUCYXMfK529+CU+mw@mail.gmail.com>
Subject: Re: [Patch] Update dpkg to one available
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
X-List-Received-Date: Fri, 04 May 2012 16:16:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 04:29 AM, Marko Lindqvist wrote:
>   I'm trying to make my first openembedded-core build. That failed due
> to dpkg-1.15.8.5 being not available for download any more.
>
This should be still available on our MIRROR.

>   Attached patch allowed me to get past that point (updating dpkg
> recipe to use latest (1.16.3) dpkg), but as I'm just learning my way
> around, this has not been subject to any real testing.
>
>   - Changes equivalent to dpkg-deb-avoid-fflush.patch seem now to be in
> upstream (probably this exact patch applied)
>   - I just adjusted perllibdir.patch, but I'm not sure if it's needed
> at all any more. It was used to remove unconditional PERL_LIBDIR
> assignment, but now the assignment is conditional in upstream anyway
>

Thanks for creating this update, we would like to take this, but if you
could you please re-format this and send a proper patch to the list, 
best to use either the "git format-patch" with "git send-email or the 
scripts create-pull-request/send-pull-request, also review the commit 
message guidelines at

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks for the patch!

>
>   - ML
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


