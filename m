Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8cN-0008PH-IL
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:41:31 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:30:56 -0700
Received: by lahj13 with SMTP id j13so2475419lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=4Dq0aCp8mzk2XyPa6/wEDCGd8/58J/e5hpwh4Phcb/M=;
	b=bBKufTV3vgOzalkrMSkQ14Gkv2K3a5AkbIP4cNagOG3elB7BA3CRNP/6+rRrYSuT7O
	umRwnTwXcGAutER73SN/mIe1+AwnWunllqYak4r7OplCgrearViYoLlEnAPBpPw4XEPG
	1WjUYYvI2++qvbwDT5ljh5PzMv6bB0oo9Ph7FnPRF/XjnFH5DSMJ1zKNbf01iO5cSk7F
	ktN0xj7FPEJfM/FeKKQEOaxg5b6+G8xGUCK9kmvLl+TTmall5oOrTSKfpHZq1S95i3AF
	MAHPQoyfedZFMb7oYGhu06eI/NkFN3DYUidVs9QR8j+7OPLEaLUesW30CEY9lUGRE7X2
	klsg==
MIME-Version: 1.0
Received: by 10.112.48.169 with SMTP id m9mr3424244lbn.93.1339435854051; Mon,
	11 Jun 2012 10:30:54 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:30:54 -0700 (PDT)
In-Reply-To: <cover.1338603853.git.kergoth@gmail.com>
References: <cover.1338603853.git.kergoth@gmail.com>
Date: Mon, 11 Jun 2012 10:30:54 -0700
Message-ID: <CAPhnLPBLFUh=QoY6KxQwYfzOytuBo-oP+qPMkyPXhXX6foq7xA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlxjzwEQu43z2rFNXXylLzz5y6Rqpbt+8BnCL30HATT1QAyivL9D3hRqVel5HgTPME72/lA
Subject: Re: [PATCH 0/2] First pass of rpcbind improvements
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
X-List-Received-Date: Mon, 11 Jun 2012 17:41:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 7:24 PM, Christopher Larson <kergoth@gmail.com> wrot=
e:
> The following changes since commit e3113827810e98eb1b012f0b280fb917199704=
c1:
>
> =A0webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-0=
5-30 17:37:58 +0100)
>
> are available in the git repository at:
>
> =A0git://github.com/kergoth/oe-core rpcbind-1
>
> for you to fetch changes up to acae76c50ae66d8167038782cc623f5de64e1365:
>
> =A0task-core-basic: drop portmap (2012-06-01 22:02:50 -0400)
>

Merged into OE-Core

Thanks

-b

> ----------------------------------------------------------------
> Christopher Larson (2):
> =A0 =A0 =A0rpcbind: add and use startup script, move binaries
> =A0 =A0 =A0task-core-basic: drop portmap
>
> =A0meta/recipes-extended/rpcbind/rpcbind/init.d =A0 | =A0 85 ++++++++++++=
++++++++++++
> =A0meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb | =A0 18 ++++-
> =A0meta/recipes-extended/tasks/task-core-basic.bb | =A0 =A01 -
> =A03 files changed, 101 insertions(+), 3 deletions(-)
> =A0create mode 100644 meta/recipes-extended/rpcbind/rpcbind/init.d
>
> --
> 1.7.10.3
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


