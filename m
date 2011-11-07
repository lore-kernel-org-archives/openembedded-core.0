Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNUR5-0006mx-3n
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 20:00:47 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Nov 2011 10:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,471,1315206000"; d="scan'208";a="34148324"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Nov 2011 10:54:32 -0800
Message-ID: <4EB82968.9060708@linux.intel.com>
Date: Mon, 07 Nov 2011 10:54:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320274906-2086-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1320274906-2086-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] python: improve packaging
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
X-List-Received-Date: Mon, 07 Nov 2011 19:00:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 04:01 PM, Martin Jansa wrote:
> * move 2to3 to separate package and include lib2to3 (was in python-misc)
> * fix pattern for python-unittest (was in python-misc because it's in subdirectory now)
> * add pydoc_data to python-pydoc (was in python-misc)
> * add more stuff to smtpd, audio, codecs, ctypes, html, io, json, mime,
>    pickle, stringold, xmlrpc
> * move all FILES_ details from python recipe to manifest generator so it's in one place
> * added manual line break in FILES_${PN}-core, because git send-email
>    doesn't like too long lines
>    $ git send-email -1 dfaae65839f0ab23e5b2ae2a68df0f370bca84d2
>    fatal: /tmp/k8zbDajUNP/0001-python-improve-packaging.patch: 64: patch contains a line longer than 998 characters
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../python/python-2.7-manifest.inc                 |   43 ++++++++++--------
>   meta/recipes-devtools/python/python_2.7.2.bb       |   22 +---------
>   scripts/contrib/python/generate-manifest-2.7.py    |   47 ++++++++++++-------
>   3 files changed, 55 insertions(+), 57 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



