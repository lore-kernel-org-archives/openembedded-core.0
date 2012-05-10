Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSdAz-0005FM-LV
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 01:53:41 +0200
Received: by eekd49 with SMTP id d49so549687eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 16:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=fCHyulO6l0MBfwQE2VGqrWIoeXvQKdVT3VOQE336YlY=;
	b=vnDI0rG9QiuFYuu3328lTe2jTPI3GSTkFoco+YeCSTJqneL0DsNI8ho0s2PmYzcT8w
	7AdzTr7Xp7s4tXEg2CJLZ8sRpni5dppvZR2ChkIrjq6b/1wPPAehj8HR7w/FO+Z5h63x
	0ysplOyzQzoUvuKzypH5MHZJsp/17itnSmxGzD1FWrRcM4q6ec4PGBAPcUjpf5aur5Nr
	V8Ud+FVLar3ax8MM4IudRxdhx8lKYrIMm6CsKRHlGhLhgW2HQz1svhLV33AXM8KnuBNQ
	kjxCNYjPPnMmEFQKkEi5QnPqZxDGZIYvW4JwSzPo/dK98CoPHFbHN7fS4wuIsEuxnovY
	fo0Q==
Received: by 10.213.105.78 with SMTP id s14mr1890150ebo.84.1336693427184; Thu,
	10 May 2012 16:43:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 16:43:17 -0700 (PDT)
In-Reply-To: <CAF6bG8eW08AQnLmPuo7Lq0COGRXLRndatgUgw9m_KQO8RmfcKQ@mail.gmail.com>
References: <CAMKF1srWO69M=MOa4_ar8oO55fkaofzSHj_UAsRaVL+-dzEXNw@mail.gmail.com>
	<1336686231-28111-1-git-send-email-cazfi74@gmail.com>
	<CAF6bG8eW08AQnLmPuo7Lq0COGRXLRndatgUgw9m_KQO8RmfcKQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 16:43:17 -0700
Message-ID: <CAMKF1spmztjcL1JKx_eG-FJSGxC-bS-2WH6vntdf50COqJh3AQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] expat: update to upstream version 2.1.0
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
X-List-Received-Date: Thu, 10 May 2012 23:53:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 4:32 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:
> =C2=A0I see new version ended as new patch to patchwork even though I set
> In-Reply-To header. How does this work correctly?

each patch is tracked separately in patchwork. Ideally the submitter
or whoever is working on patch should remove the old patch as
superceded but we dont use patchwork for applying patches on OE-Core.
Its actively used for meta-oe
for oe-core its just capturing the patches for people to
look through them. The patches are picked from mailing lists or pull reques=
ts.


