Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Spl0q-0000uI-Fs
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 20:54:48 +0200
Received: by eaal1 with SMTP id l1so1049757eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 11:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kTmpclPIfCUT/wDZlGmyKEjEWbi6NMBq4pCKABnBW0Y=;
	b=Bg46YiKWRPhcuxFVbMn3wsBijwDwQQNqEkTuZWcYXx1BU7wOgjp6kHDWos4QPdm7gw
	TXvwrZ8NTZErN1aGaKKwqf7bIX2uAyFgFSaFgayueeVjTXWgXgK935denRCvUWqym1Tg
	xfsictsTgp9m7ptd+qLZkjUmBmj+Ea64n/s4ei2BodPgRAQ1TfSphdBl/SmaJC1eIhXf
	5U8Yjw/kUK0khi0EsOm7Ttlu48M6zS/2nEd+o5fipVoibzzVH6fDZn6YGGqGNld/vmFw
	ZFELJ+yIob4RQ9Pi9w4HI4YBDBam0DMvRhC/ZI39lVh7sQ/nZJsHSstpPvsxeruUk6m4
	A5Aw==
Received: by 10.14.97.16 with SMTP id s16mr548466eef.117.1342205014059; Fri,
	13 Jul 2012 11:43:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 13 Jul 2012 11:43:03 -0700 (PDT)
In-Reply-To: <1342177287-4348-1-git-send-email-ross.burton@intel.com>
References: <1342177287-4348-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Jul 2012 11:43:03 -0700
Message-ID: <CAMKF1sp8BmWiuBeG1RmbkruMT=Za9=99o3D=DoBdsVp6PQptcw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add GNUmakefile to the list of possible makefile names
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
X-List-Received-Date: Fri, 13 Jul 2012 18:54:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 13, 2012 at 4:01 AM, Ross Burton <ross.burton@intel.com> wrote:
>
> +       if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
>                 oe_runmake || die "make failed"
>         else
>                 bbnote "nothing to compile"

may be convert it into case .. esac ? while you  are at it


