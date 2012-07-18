Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrQrR-0006aZ-HY
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 11:48:01 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 02:36:40 -0700
Received: by qabj34 with SMTP id j34so767609qab.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 02:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=IoGsmsrJDB3TAX67Kx8zxpvGAn7GOpaWI3aRi/KWBrs=;
	b=lTCAs32JCfelWQcWEc3q20Z5rPE1m6Tqufc9KwXNswamYqqeXu1MLVKs5aaQbDOC1m
	SnWdF0HNiv4StCGV/eVMdyt+oJ3Zn4XxQYmh7pMlgZk40VUbbs0deB34P1PPsmRJ0u/J
	PmKzj7aLkJd5BEcE/S9lOcvqn9TVB9MDiAxVkgZsFEfuP3WKsjNvBhCkc3NfKAkiurtx
	PbluRLgQM8PvAELZfm1nQwGsmoLnUD0uMjsYxlNsV2JklrE1qZab3cM+Fv4M4iQYPQKi
	JVvyW4uRZz9Z+825Hmup1EFJSZTcsan237KTd6VRXZHYDEEd1b8jyt59RWYyEJTzpuIw
	BS/A==
Received: by 10.224.185.148 with SMTP id co20mr4899686qab.4.1342604199031;
	Wed, 18 Jul 2012 02:36:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Wed, 18 Jul 2012 02:36:18 -0700 (PDT)
In-Reply-To: <5005DFF1.3050304@linux.intel.com>
References: <5005DFF1.3050304@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2012 10:36:18 +0100
Message-ID: <CAJTo0LbcvU3NEndt7EC47142ghBu-p=OgUOfkJs94JWYPeM=OQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkrfrm1atJM25+hZemymmOtDU5l1ZmeIHckIke+X+0raxSj8qsioq2FaFMsK2i9gS9fTT4W
Cc: "yocto-builds@yoctoproject.org" <yocto-builds@yoctoproject.org>
Subject: Re: Master Failures
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
X-List-Received-Date: Wed, 18 Jul 2012 09:48:02 -0000
Content-Type: text/plain; charset=UTF-8

On 17 July 2012 22:58, Saul Wold <sgw@linux.intel.com> wrote:
> First seems to be missing pkgdata/runtime files, followed by a failed
> dependency by libglib-2.0-utils on the native python (from the native
> sysroot).

To keep track of these issues I've filed:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2784
"license.bbclass failing on autobuilder"
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2785 "Bad Python
dependency pulled in by glib"

I expect #2785 to be resolved soon as Martin has a patch already.

I've also started using the whiteboard to tag bugs that break the
autobuilder with "(autobuilder)" to make it easier to find the set of
bugs that are breaking the builds.  If there's an existing precedent
let me know, but I couldn't see one.

Ross


