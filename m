Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8yf-0001Cx-3Y
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:04:33 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:51:06 -0700
Received: by lbbgh12 with SMTP id gh12so2574016lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=4m+apNfXF8nldRl68UQ0Aq0gDyAWh3KqinjkquoRf64=;
	b=hf34WyvVc9ZsPKWgisZmU9HDPYQhU4ZSKAfobzVEq3PbbcEQ0i2jfA7M4zmVhZl6tb
	v+K5ctVOvSUwXK7bdxOnDu1slm39K9SgLOtTLIPxCizYtXMa5/ah0lsR5YlGq80sBeU2
	qgxOrOTTGJEY/QSyK2vJXWehSZMGMyVbedfLyUm+4yJ4R5AuJlQB2YksWj0eNhHmCevT
	hTNDcsk7NeGypZfzdW734jRl1k6RRDtERNfNPPRtqDVbhux/PmJfwqcoKKoeDTWSfT8S
	anKF/nxBV4IYrjm2bbPhvKhEAu4xZTFtCKMub/YsK8wLnA1669ggl58rmOn22VqrjBbZ
	4RzQ==
MIME-Version: 1.0
Received: by 10.152.125.236 with SMTP id mt12mr17948623lab.12.1339437064035;
	Mon, 11 Jun 2012 10:51:04 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:51:04 -0700 (PDT)
In-Reply-To: <cover.1338429495.git.liezhi.yang@windriver.com>
References: <cover.1338429495.git.liezhi.yang@windriver.com>
Date: Mon, 11 Jun 2012 10:51:04 -0700
Message-ID: <CAPhnLPCgTAXwfKcgvffG7Ngc_otSY8d92ncFdzZ6-z1Kaw9mNQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnrOv6+wZmCTwcmE1NZ3T2f4MUfr6rOgYJz+6Z8boC3CHkCvBdzeSLVWb6p4vLMRwySgJd7
Subject: Re: [PATCH 0/1] generate-manifest-2.7.py: replace os.popen with os.unlink
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
X-List-Received-Date: Mon, 11 Jun 2012 18:04:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 1:08 AM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> The following changes since commit 348da93e283b2b8454fd9cde80d4b17378e2a1=
68:
>
> =A0webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-0=
5-30 17:38:02 +0100)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib robert/gen_man_py
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/gen_man=
_py
>
> Robert Yang (1):
> =A0generate-manifest-2.7.py: replace os.popen with os.unlink
>
> =A0scripts/contrib/python/generate-manifest-2.7.py | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Merged into OE-Core

Thanks

-b


--=20
Elizabeth Flanagan
Yocto Project
Build and Release


