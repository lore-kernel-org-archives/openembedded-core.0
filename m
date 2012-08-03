Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxFxL-000097-CN
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 13:22:11 +0200
Received: by eaad12 with SMTP id d12so147472eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 04:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=78wpBkj5gdEea7X1FL1nPMVm/AkO3UI8OOfc7OeFHTY=;
	b=gjqgRCffuLIBiVQwHev8P+CTK7EAcZvUjxkLJpXeDaTWZY4CN2WVlUVTLnCZJMuRCK
	OmBPCUmNYing515Q3rtubCzjZsqMctOk62W2aSW++viGoVejFXRR+DnzDEBOlPdkWipI
	rrZz8hZdF/518cuRyPCXLoRSyo/P6mWQQYdp1gsnXgxBZ0p9E3rhLnSH3LefvdMdYmLk
	WFgsIy6zcalj4BfNEyR+FAK2nnuzGdLJi1uF8+Eia3vqvI+3q9mhtDGyHm4iAe+JnqAD
	mFt5kucpMqkJoMy+yuCwOD8nmsxzgudz05+YK1s2jBZWu//rB4MyD0SiTUnmuVJJE32g
	o9jg==
Received: by 10.14.175.7 with SMTP id y7mr1632374eel.29.1343992230910; Fri, 03
	Aug 2012 04:10:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Fri, 3 Aug 2012 04:10:00 -0700 (PDT)
In-Reply-To: <cover.1343811985.git.liezhi.yang@windriver.com>
References: <cover.1343811985.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Aug 2012 04:10:00 -0700
Message-ID: <CAMKF1srwmN9_-p5ae6999wdZGfpfXLseCnwegnQxa7ckAVOcLw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] createrepo 0.4.11: create wrapper for python script
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
X-List-Received-Date: Fri, 03 Aug 2012 11:22:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 1, 2012 at 2:14 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> This is used for fixing the rpm-createsolvedb.py error:
>
> 'import site' failed; use -v for traceback
> Traceback (most recent call last):
> File "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/scripts/rpm-createsolvedb.py", line 14, in
> import sys, os
> ImportError: No module named os
>

this series has problem I think now bitbake meta-toolchain fails for me

run.populate_sdk_image.6792: line 610: rpm-createsolvedb.py: command not found

did you try bitbake meta-toolchain target from scratch with this change ?



> // Robert
>
> The following changes since commit 4f31d21bcb1c8c744e9abb33248715afe4a40af0:
>
>   lib/oe/lsb.py: Map unknown distributions to 'Unknown' (2012-07-31 08:02:11 +0100)
>
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib robert/createrepo
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/createrepo
>
> Robert Yang (2):
>   createrepo 0.4.11: add rpm-createsolvedb.py
>   createrepo 0.4.11: create wrapper for python script
>
>  meta/classes/rootfs_rpm.bbclass                    |    2 +-
>  .../createrepo/createrepo}/rpm-createsolvedb.py    |    0
>  .../createrepo/createrepo_0.4.11.bb                |   17 ++++++++++++++++-
>  3 files changed, 17 insertions(+), 2 deletions(-)
>  rename {scripts => meta/recipes-support/createrepo/createrepo}/rpm-createsolvedb.py (100%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


